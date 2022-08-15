#include "kernel/yosys.h"
#include <algorithm>


USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

struct TMRWorker {
    int copy_amount;
    std::string suffix;
    bool verbose;

    std::string remove_suffix_from_name(std::string name, std::string suffix) {
        size_t position = name.find(suffix);
        if (position != std::string::npos) {
            name.erase(position - 1, suffix.length()+3);
        }
        return name;
    }

    void printMessage(std::string main_string, bool force) {
        if (verbose || force){
            log("%s", main_string.c_str());
        }
    }

    void setVerbose(bool verbose) {
        this->verbose = verbose;
    }

};

struct ReplicationWorker: TMRWorker {
private:
    std::map<std::string, bool> blackbox_map;
    std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> global_wire_map;
    std::vector<Cell*> cells_to_replicate;
    std::vector<Wire*> wires_to_replicate;
    std::vector<std::pair<RTLIL::Cell*, RTLIL::Cell*>> non_leaf_cells_to_fix;

    RTLIL::Design* replicate_design(RTLIL::Design *original_design) {

        blackbox_map = get_blackbox_modules(original_design);
        RTLIL::Design *new_design = new RTLIL::Design;
        for (auto module: original_design->modules()) {
            if (blackbox_map[RTLIL::unescape_id(module->name)]){
                continue;
            }
            for (auto cell: identify_cells_to_replicate(module)) {
                cells_to_replicate.push_back(cell);
            }
            for (auto wire: identify_wires_to_replicate(module, cells_to_replicate)) {
                wires_to_replicate.push_back(wire);
            }
            log("\n");
        }
        for (auto module: original_design->modules()) {
            if (blackbox_map[RTLIL::unescape_id(module->name)]){
                continue;
            }
            for (auto wire: identify_additional_wires_to_replicate(module)) {
                wires_to_replicate.push_back(wire);
            }
        }
        
        for (auto module: original_design->modules()) {
            if (blackbox_map[RTLIL::unescape_id(module->name)]){
                printMessage("Will not replicate inside blackbox module "+ RTLIL::unescape_id(module->name) +  "\n", false);
                RTLIL::Module *new_module = new_design->addModule(module->name);
                module->cloneInto(new_module);
                continue;
            }

            log("Replicating module: %s\n", log_id(module));
            replicate_module(new_design, module, suffix);
            log("\n");
        }

        for (auto pair: non_leaf_cells_to_fix) {
            fix_non_leaf_cell_connections(pair.first->module, pair.first, pair.second, suffix);
        }

        return new_design;
    }

    std::map<std::string, bool> get_blackbox_modules(RTLIL::Design *design) {
        std::map<std::string, bool> blackbox_map;
        for (auto module: design->modules()) {
            if (module->get_bool_attribute("\\blackbox") || module->get_blackbox_attribute()) {
                blackbox_map[RTLIL::unescape_id(module->name)] = true;
            }
            else {
                blackbox_map[RTLIL::unescape_id(module->name)] = false;
            }
        }
        return blackbox_map;
    }

    void replicate_module(RTLIL::Design *new_design, RTLIL::Module *module, std::string suffix) {

        RTLIL::Module *new_module = new_design->addModule(module->name);
        if (module->get_bool_attribute(ID::top)) {
            new_module->set_bool_attribute(ID::top);
        }

        std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> wire_map = replicate_wires(module, new_module, suffix, wires_to_replicate);
        replicate_cells(module, new_module, suffix, cells_to_replicate, wire_map);

        connect_wire_to_wire_connections(module, new_module, wires_to_replicate, wire_map);
    }

    std::vector<Wire*> identify_wires_to_replicate(RTLIL::Module *module, std::vector<Cell*> cells_to_replicate) {
        /* 
        All wires that output from cells that will be replicated, 
        or input to a cell that will be replicated from the cell's 
        parent module will be replicated
        */
        std::vector<Wire*> wires_to_replicate;
        for (auto cell: cells_to_replicate) {
            if (cell->module != module) {
                continue;
            }
            printMessage("Checking wires for cell " + RTLIL::unescape_id(cell->name) + "\n", false);
            for (auto conn: cell->connections()) {
                for (auto bit: conn.second.bits()) {
                    if (bit.wire == nullptr) {
                        continue;
                    }
                    else if (cell->output(conn.first)) { // output of replicated cell
                        wires_to_replicate.push_back(bit.wire);
                        printMessage("\tWire " + RTLIL::unescape_id(bit.wire->name) + "[" + std::to_string(bit.offset) + "] will be replicated\n", false);
                    }
                    else {
                        // printMessage("\tWire " + RTLIL::unescape_id(bit.wire->name) + "[" + std::to_string(bit.offset) + "] may not be replicated\n", false);
                    }
                }
            }
        }
        return wires_to_replicate;
    }

    std::vector<Wire*> identify_additional_wires_to_replicate(RTLIL::Module *module){
        printMessage("Identifying additional wires to replicate in module " + RTLIL::unescape_id(module->name) + "\n", true);
        std::vector<Wire*> additional_wires;
        for (auto cell: module->cells()) {
            std::map<RTLIL::IdString, std::set<RTLIL::Wire*>> outside_port_connections;
            RTLIL::Module* cell_module = module->design->module(cell->type);
            if (cell_module->get_blackbox_attribute()){
                continue;
            }
            // std::cout << "\tchecking cell of type " << log_id(cell->type) << "\n";
            for (auto conn: cell->connections()) {
                for (auto bit: conn.second.bits()) {
                    if (bit.wire == nullptr) {
                        continue;
                    }
                    // std::cout << log_id(conn.first) << " is connected to wire named " << log_id(bit.wire) << "\n";
                    outside_port_connections[conn.first].insert(bit.wire);
                }
            }
            for (auto wire: cell_module->wires()) {
                if (outside_port_connections.find(wire->name) == outside_port_connections.end()) { // wire name is not a port name
                    continue;
                }
                // std::cout << "Wire named " << log_id(wire) << " drives a non leaf port\n";

                bool inside_wire_to_be_replicated = std::find(wires_to_replicate.begin(), wires_to_replicate.end(), wire) != wires_to_replicate.end();
                bool outside_wire_to_be_replicated = false;
                RTLIL:Wire* outer_wire;

                for (auto outside_wire: outside_port_connections[wire->name]) {
                    if (std::find(wires_to_replicate.begin(), wires_to_replicate.end(), outside_wire) != wires_to_replicate.end()) {
                        outside_wire_to_be_replicated = true;
                        outer_wire = outside_wire;
                        break;
                    }
                    outer_wire = outside_wire;
                }

                if (inside_wire_to_be_replicated || outside_wire_to_be_replicated) {
                    // std::cout << "one of them will be replicated\n";
                    if (cell->input(wire->name) && cell->output(wire->name)) {
                        // std::cout << "found an inout port\n";
                        if (!inside_wire_to_be_replicated) {
                            // std::cout << "Now inside wire " << log_id(wire) << " will also be replicated\n";
                            additional_wires.push_back(wire);
                        }
                        else {
                            // std::cout << "Well inside wire " << log_id(wire) << " was already going to be replicated\n";
                            for (auto outer_wire: outside_port_connections[wire->name]) {
                                if (std::find(wires_to_replicate.begin(), wires_to_replicate.end(), outer_wire) == wires_to_replicate.end()) {
                                    // std::cout << "Now inside wire " << log_id(outer_wire) << " will also be replicated\n";
                                    additional_wires.push_back(outer_wire);
                                }
                                else {
                                    // std::cout << "Well inside wire " << log_id(outer_wire) << " was already going to be replicated\n";
                                }
                            }
                        }
                        if (!outside_wire_to_be_replicated) {
                            for (auto outer_wire: outside_port_connections[wire->name]) {
                                // std::cout << "Now outside wire " << log_id(outer_wire) << " will also be replicated\n";
                                additional_wires.push_back(outer_wire);
                            }
                        }
                        else {
                            // std::cout << "Well outside wire " << log_id(outer_wire) << " was already going to be replicated\n";
                            for (auto outer_wire: outside_port_connections[wire->name]) {
                                if (std::find(wires_to_replicate.begin(), wires_to_replicate.end(), outer_wire) == wires_to_replicate.end()) {
                                    // std::cout << "Now outside wire " << log_id(outer_wire) << " will also be replicated\n";
                                    additional_wires.push_back(outer_wire);
                                }
                                else {
                                    // std::cout << "Well outside wire " << log_id(outer_wire) << " was already going to be replicated\n";
                                }
                            }
                        }
                    // }
                    }
                    else if (cell->input(wire->name)) {
                    // std::cout << "but he's an input so we'll handle him later\n";
                    // continue;
                        if (!inside_wire_to_be_replicated) {
                            // std::cout << "Now inside wire " << log_id(wire) << " will also be replicated\n";
                            additional_wires.push_back(wire);
                        }
                        else {
                            // std::cout << "Well inside wire " << log_id(wire) << " was already going to be replicated\n";
                            for (auto outer_wire: outside_port_connections[wire->name]) {
                                if (std::find(wires_to_replicate.begin(), wires_to_replicate.end(), outer_wire) == wires_to_replicate.end()) {
                                    // std::cout << "Now inside wire " << log_id(outer_wire) << " will also be replicated\n";
                                    additional_wires.push_back(outer_wire);
                                }
                                else {
                                    // std::cout << "Well inside wire " << log_id(outer_wire) << " was already going to be replicated\n";
                                }
                            }
                            
                        }
                    }
                    else if (cell->output(wire->name)) {
                        if (!outside_wire_to_be_replicated) {
                            for (auto outer_wire: outside_port_connections[wire->name]) {
                                // std::cout << "Now outside wire " << log_id(outer_wire) << " will also be replicated\n";
                                additional_wires.push_back(outer_wire);
                            }
                        }
                        else {
                            // std::cout << "Well outside wire " << log_id(outer_wire) << " was already going to be replicated\n";
                            for (auto outer_wire: outside_port_connections[wire->name]) {
                                if (std::find(wires_to_replicate.begin(), wires_to_replicate.end(), outer_wire) == wires_to_replicate.end()) {
                                    // std::cout << "Now outside wire " << log_id(outer_wire) << " will also be replicated\n";
                                    additional_wires.push_back(outer_wire);
                                }
                                else {
                                    // std::cout << "Well outside wire " << log_id(outer_wire) << " was already going to be replicated\n";
                                }
                            }
                        }
                    }
                }
                else {
                    // std::cout << "neither " << log_id(wire) << " nor " << log_id(outer_wire) << " will be replicated\n";
                }
            }
        }

        return additional_wires;
    }

    std::vector<Cell*> identify_cells_to_replicate(RTLIL::Module *module) {
        printMessage("Identifying cells to replicate\n", false);
        std::vector<Cell*> cells_to_replicate;
        for (auto cell: module->selected_cells()) {
            RTLIL::Module* cell_module = module->design->module(cell->type);
            if (!cell_module->get_blackbox_attribute()) { // a non leaf cell
                continue;
            }
            cells_to_replicate.push_back(cell);
            printMessage("Cell " + RTLIL::unescape_id(cell->name) + " of type " + RTLIL::unescape_id(cell->type) + " will be replicated\n", false);
        }
        return cells_to_replicate;
    }

    std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> replicate_wires(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix, \
                            std::vector<Wire*> wires_to_replicate) {
        printMessage("Replicating wires...\n", false);
        std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> wire_map;
        for (auto wire: old_module->wires()) {
            if (std::find(std::begin(wires_to_replicate), std::end(wires_to_replicate), wire) == std::end(wires_to_replicate)) {
                printMessage("Wire " + unescape_id(wire->name) + " from module " + unescape_id(wire->module->name) + " is only copied over\n", false);
                RTLIL::Wire *new_wire = new_module->addWire(wire->name, wire);
                wire_map[wire].push_back(new_wire);
                global_wire_map[wire].push_back(new_wire);
                continue;
            }
            for (int i = 0; i < copy_amount; i++) {
                std::string new_name = "\\" + RTLIL::unescape_id(wire->name) + "_" + suffix + "_" + std::to_string(i);
                RTLIL::Wire *new_wire = new_module->addWire(new_name, wire);
                std::string message = "Replicated wire " + RTLIL::unescape_id(wire->name) + " into wire " + \
                                        RTLIL::unescape_id(new_wire->name) + "\n";
                printMessage(message, false);
                wire_map[wire].push_back(new_wire);
                global_wire_map[wire].push_back(new_wire);
            }
            new_module->fixup_ports();
        }
        return wire_map;
    }

    void replicate_cells(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix, std::vector<Cell*> cells_to_replicate, \
                                std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> wire_map) {
        printMessage("Replicating cells in module " + RTLIL::unescape_id(old_module->name) + "\n", false);

        for (auto cell: old_module->cells()) { // copy cells over
            // std::cout << "set to replicate cell " << log_id(cell) << " of type " << RTLIL::unescape_id(cell->type) << "\n";
            if (std::find(std::begin(cells_to_replicate), std::end(cells_to_replicate), cell) == std::end(cells_to_replicate)) {
                // std::cout << "\tbut he was not specified to be replicated\n";
                RTLIL::Module* cell_module = old_module->design->module(cell->type);
                if (cell_module->get_blackbox_attribute()) { 
                    RTLIL::Cell *new_cell = new_module->addCell(cell->name, cell);
                    fix_cell_connections(new_cell, cell, 0, wire_map);    
                    continue;
                }
                RTLIL::Cell *new_cell = new_module->addCell(cell->name, cell);
                new_cell->type = cell->type;
                non_leaf_cells_to_fix.push_back(std::pair<RTLIL::Cell*, RTLIL::Cell*>(new_cell, cell));
                continue;

            }
            std::string cell_type = RTLIL::unescape_id(cell->type);
            std::string cell_name = RTLIL::unescape_id(cell->name);
            if (cell_type.substr(0,1) != "$" || cell_name.substr(0,1) != "$") {
                // std::cout << log_id(cell) << " of cell_type " << cell_type << " made it here\n";
                if (!cell->known()) {
                    log("Unrecognized yosys cell type: %s. Will not replicate.\n", cell_type.c_str());
                    continue;
                }
                else if (blackbox_map[RTLIL::unescape_id(cell->type)]){
                    // it's a primitive, do nothing here and replicate below
                }
                else {
                    // if it's a non_leaf_cell or blackbox, we still need to add it to the new module
                    RTLIL::Cell *new_cell = new_module->addCell(cell->name, cell);
                    new_cell->type = cell->type;
                    non_leaf_cells_to_fix.push_back(std::pair<RTLIL::Cell*, RTLIL::Cell*>(new_cell, cell));
                    continue;
                }
            }
           
            for (int i = 0; i < copy_amount; i++) {
                std::string new_name = RTLIL::unescape_id(cell->name) + "_" + suffix + "_" + std::to_string(i);
                if (new_name.substr(0,1) != "$") {
                    new_name = "\\" + new_name;
                }
                RTLIL::Cell *new_cell = new_module->addCell(new_name, cell);
                std::string message = "Replicated cell" + unescape_id(cell->name) + " into cell " + \
                                        unescape_id(new_cell->name) + "\n";
                printMessage(message, false);
                fix_cell_connections(new_cell, cell, i, wire_map);      
            }
            new_module->fixup_ports();
        }
    }

    void fix_cell_connections(RTLIL::Cell *new_cell, RTLIL::Cell *old_cell, int i, \
                                    std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> wire_map) {
        for (auto conn: old_cell->connections()) {
            bool port_set_already = false;
            // std::cout << "Old Cell " << RTLIL::unescape_id(old_cell->name) << " connections for port " << RTLIL::unescape_id(conn.first) \
                        << " is size " << std::to_string(GetSize(conn.second)) << "\n";
            for (auto bit: conn.second.bits()) {
                if (bit.wire == nullptr) {
                    continue;
                }
                // std::cout << "The wiremap size for that wire key is " << std::to_string(wire_map[bit.wire].size()) << "\n";
                RTLIL::Wire *wire;
                if (wire_map[bit.wire].size() == 1) { // the wire was not replicated
                    wire = wire_map[bit.wire][0];
                }
                else {
                    wire = wire_map[bit.wire][i];
                }

                if (!port_set_already) {
                    RTLIL::SigSpec signal = RTLIL::SigSpec(wire, bit.offset, 1);
                    new_cell->setPort(conn.first, signal);
                    port_set_already = true;
                }
                else {
                    RTLIL::SigSpec signal = new_cell->getPort(conn.first);
                    RTLIL::SigBit temp = RTLIL::SigBit(wire, bit.offset);
                    signal.append(temp);
                    new_cell->setPort(conn.first, signal);
                }
            }
        }
    }

    void connect_wire_to_wire_connections(RTLIL::Module *old_module, RTLIL::Module *new_module, std::vector<Wire*> wires_to_replicate, \
                                            std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> wire_map) {
        printMessage("Connecting wire to wire connections...\n", false);
        for (auto sigsig: old_module->connections()) {
            // std::cout << "another connection to do\n";
            RTLIL::SigSpec sigspec_one = sigsig.first;
            RTLIL::SigSpec sigspec_two = sigsig.second;
            for (int i = 0; i < GetSize(sigspec_one); i++) {
                bool one_replicated = (std::find(std::begin(wires_to_replicate), std::end(wires_to_replicate), sigspec_one[i].wire) != std::end(wires_to_replicate));
                bool two_replicated = (std::find(std::begin(wires_to_replicate), std::end(wires_to_replicate), sigspec_two[i].wire) != std::end(wires_to_replicate));
                if (one_replicated || two_replicated ) {
                    for (int j = 0; j < copy_amount; j++) {
                        RTLIL::SigSpec new_sigspec_one;
                        RTLIL::SigSpec new_sigspec_two;
                        if (sigspec_one[i].wire != nullptr) {
                            // std::cout << "first_wire_name is " << RTLIL::unescape_id(sigspec_one[i].wire->name) << "\n";
                            if (one_replicated) { // get the replicated wire
                                // std::cout << "one is replicated\n";
                                std::string first_wire_name = RTLIL::unescape_id(sigspec_one[i].wire->name);
                                // RTLIL::Wire *replicated_wire_one = new_module->wire("\\" + first_wire_name + "_" + suffix + "_" + std::to_string(j));
                                RTLIL::Wire *replicated_wire_one = wire_map[sigspec_one[i].wire][j];
                                new_sigspec_one = RTLIL::SigSpec(replicated_wire_one, sigspec_one[i].offset, 1);
                            }
                            else { // get the non replicated wire
                                // std::cout << "here for one\n";
                                // RTLIL::Wire *wire_one = new_module->wire(sigspec_one[i].wire->name);
                                RTLIL::Wire *wire_one = wire_map[sigspec_one[i].wire][0];
                                // std::cout << "now next thing\n";
                                new_sigspec_one = RTLIL::SigSpec(wire_one, sigspec_one[i].offset, 1);
                            }
                        }
                        else { // create a sigbit with a null wire.
                            // std::cout << "one is a null wire";
                            new_sigspec_one = RTLIL::SigSpec(sigspec_one[i], 1);
                        }

                        if (sigspec_two[i].wire != nullptr) {
                            // std::cout << "second_wire_name is " << RTLIL::unescape_id(sigspec_two[i].wire->name) << "\n";
                            if (two_replicated){ // get the replicated wire
                                // std::cout << "two is replicated\n";
                                std::string second_wire_name = RTLIL::unescape_id(sigspec_two[i].wire->name);
                                // RTLIL::Wire *replicated_wire_two = new_module->wire("\\" + second_wire_name + "_" + suffix + "_" + std::to_string(j));
                                RTLIL::Wire *replicated_wire_two = wire_map[sigspec_two[i].wire][j];
                                new_sigspec_two = RTLIL::SigSpec(replicated_wire_two, sigspec_two[i].offset, 1);
                                // new_sigspec_two = RTLIL::SigSpec(replicated_wire_two, 0, 1);
                                // std::cout << "next\n";
                            }
                            else { // get the non replicated wire
                                // std::cout << "here for two\n";
                                // RTLIL::Wire *wire_two = new_module->wire(sigspec_two[i].wire->name);
                                RTLIL::Wire *wire_two = wire_map[sigspec_two[i].wire][0];
                                new_sigspec_two = RTLIL::SigSpec(wire_two, sigspec_two[i].offset, 1);
                            }
                        }
                        else { // create a sigbit with a null wire.
                            // std::cout << "two is a null wire";
                            new_sigspec_two = RTLIL::SigSpec(sigspec_two[i], 1);
                        }

                        // std::cout << "connecting now\n";
                        RTLIL::SigSig new_sigsig = std::pair<RTLIL::SigSpec, RTLIL::SigSpec>(new_sigspec_one, new_sigspec_two);
                        new_module->connect(new_sigsig);
                        // std::cout << "connected\n";
                    }
                    // std::cout << "Done here\n";
                }
                else { // get the two non replicated ones and connect them
                    // std::cout << "connecting two non replicated wires\n";
                    RTLIL::SigSpec new_sigspec_one;
                    RTLIL::SigSpec new_sigspec_two;

                    if (sigspec_one[i].wire != nullptr) {
                        // RTLIL::Wire *wire_one = new_module->wire(sigspec_one[i].wire->name);
                        RTLIL::Wire *wire_one = wire_map[sigspec_one[i].wire][0];
                        new_sigspec_one = RTLIL::SigSpec(wire_one, sigspec_one[i].offset, 1);
                    }
                    else { // create a sigbit with a null wire.
                        new_sigspec_one = RTLIL::SigSpec(sigspec_one[i], 1);
                    }

                    if (sigspec_two[i].wire != nullptr) {
                        // RTLIL::Wire *wire_two = new_module->wire(sigspec_two[i].wire->name);
                        RTLIL::Wire *wire_two = wire_map[sigspec_one[i].wire][0];
                        new_sigspec_two = RTLIL::SigSpec(wire_two, sigspec_two[i].offset, 1);
                    }
                    else { // create a sigbit with a null wire.
                        new_sigspec_two = RTLIL::SigSpec(sigspec_two[i], 1);
                    }

                    RTLIL::SigSig new_sigsig = std::pair<RTLIL::SigSpec, RTLIL::SigSpec>(new_sigspec_one, new_sigspec_two);
                    new_module->connect(new_sigsig);
                }
            }
        }
    }

    void fix_non_leaf_cell_connections(RTLIL::Module *new_module, RTLIL::Cell *new_cell, RTLIL::Cell *old_cell, std::string suffix) {
        printMessage("Fixing connections for non leaf cell named " + RTLIL::unescape_id(new_cell->name) + " of type " + \
                    RTLIL::unescape_id(new_cell->type) + "\n", false);

        RTLIL::Module *cell_module = new_module->design->module(new_cell->type);
        if (blackbox_map[RTLIL::unescape_id(cell_module->name)]) {
            printMessage("TODO..." + unescape_id(new_module->name) + " is a blackbox and needs his connections fixed differently.\n", true);
            return; // TODO do something here
        }

        // see what ports are replicated
        std::map<RTLIL::IdString, RTLIL::Wire*> inner_port_map;
        for (auto wire: cell_module->wires()) {
            if (wire->port_input || wire->port_output) {
                inner_port_map.insert(std::pair<RTLIL::IdString, RTLIL::Wire*>(wire->name, wire));
            }
        }

        // make a map of which ports were replicated
        std::map<std::string, int> replicated_ports_map;
        for (auto entry: inner_port_map) {
            std::string plain_port_name = remove_suffix_from_name(RTLIL::unescape_id(entry.first), suffix);
            if (replicated_ports_map.find(plain_port_name) == replicated_ports_map.end()) {
                replicated_ports_map.insert(std::pair<std::string, int>(plain_port_name, 1));
            }
            else {
                replicated_ports_map[plain_port_name]++;
            }
        }

        for (auto &connection: old_cell->connections()) {
            bool unset_already = false;
            std::string id_string = RTLIL::unescape_id(connection.first);
            if (replicated_ports_map[id_string] > 1) { // it was replicated on the inside
                for (int i = 0; i < copy_amount; i++) {
                    RTLIL::SigSpec new_sigspec = RTLIL::SigSpec();
                    for (auto sigbit: connection.second.bits()) {
                        if (sigbit.wire == nullptr) { // create sigbit with null wire
                            RTLIL::SigBit new_sigbit = RTLIL::SigBit(sigbit);
                            new_sigspec.append(new_sigbit);
                            continue;
                        }

                        if (global_wire_map[sigbit.wire].size() > 1) {
                            RTLIL::SigBit new_sigbit = RTLIL::SigBit(global_wire_map[sigbit.wire][i], sigbit.offset);
                            new_sigspec.append(new_sigbit);
                        }
                        else {
                            RTLIL::SigBit new_sigbit = RTLIL::SigBit(global_wire_map[sigbit.wire][0], sigbit.offset);
                            new_sigspec.append(new_sigbit);
                        }
                    }
                    std::string suffix_key = "_" + suffix + "_" + std::to_string(i);
                    std::string new_id_string = "\\" + id_string + suffix_key;
                    if (!unset_already) {
                        new_cell->unsetPort(connection.first);
                        unset_already = true;
                    }
                    new_cell->setPort(new_id_string, new_sigspec);
                }
            }
            else {
                RTLIL::SigSpec new_sigspec = RTLIL::SigSpec();
                for (auto sigbit: connection.second.bits()) {
                    if (sigbit.wire == nullptr) { // create sigbit with null wire
                        RTLIL::SigBit new_sigbit = RTLIL::SigBit(sigbit);
                        new_sigspec.append(new_sigbit);
                        continue;
                    }

                    RTLIL::SigBit new_sigbit = RTLIL::SigBit(global_wire_map[sigbit.wire][0], sigbit.offset);
                    new_sigspec.append(new_sigbit);
                }

                if (!unset_already) {
                    new_cell->unsetPort(connection.first);
                    unset_already = true;
                }
                new_cell->setPort(connection.first, new_sigspec);
            }
        }
        new_module->fixup_ports();
        cell_module->fixup_ports();
    }

public:
    ReplicationWorker(int copy_amount, std::string suffix) {
        this->copy_amount = copy_amount;
        this->suffix = suffix;
    }

    RTLIL::Design* run(RTLIL::Design *original_design) {
        return replicate_design(original_design);
    }

    std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> get_final_wire_map() {
        return global_wire_map;
    }
};

struct InsertVoterWorker: TMRWorker {
    private:
    std::vector<std::string> ff_names;
    bool ff_voters;
    bool reduction_voters;
    std::map<std::string, std::string> type_to_output_port;
    int voter_cnt = 0;
    std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> provided_wire_map;
    std::string ff_attr;

    typedef struct VoterInfo{
        std::string cell_type;
        std::string name;
        std::vector<RTLIL::IdString> output_ports;
        std::vector<RTLIL::IdString> input_ports;
    } VoterInfo;

    VoterInfo voterInfo;

    void initialize_voter_information(RTLIL::Design *design) {
        printMessage("Initializing Voter Information\n", false);
        printMessage("Voter type is " + voterInfo.cell_type + "\n", false);
        RTLIL::Module *voter_module = design->module(RTLIL::escape_id(voterInfo.cell_type));
        if (voter_module == nullptr) {
            std::string errorString = "Specified voter type of " + voterInfo.cell_type + " is unknown to the design\n";
            log_error("%s", errorString.c_str());
            return;
        }
        for (auto wire: voter_module->wires()) {
            if (wire->port_output) {
                voterInfo.output_ports.push_back(wire->name);
            }
            else if (wire->port_input) {
                voterInfo.input_ports.push_back(wire->name);
            }
        }
    }

    RTLIL::Cell* addVoter(RTLIL::Module *module, std::string voter_id) {
        RTLIL::Cell* voter = module->addCell(voter_id, RTLIL::escape_id(voterInfo.cell_type));
        RTLIL::Const val;
        if (voterInfo.input_ports.size() == 4) {
            val = RTLIL::Const("0xFCC0");
        }
        else {
            val = RTLIL::Const("0xE8");
        }
        voter->setParam("\\INIT", val);
        return voter;
    }

    typedef struct Pin {
        RTLIL::Cell *cell;
        RTLIL::IdString port;
        RTLIL::SigBit sigbit;
    } Pin;

    std::map<std::string, std::vector<Pin>> identify_reduction_points(RTLIL::Module *module, std::string suffix, \
                                                                        std::map<std::string, std::vector<RTLIL::Wire*>> wire_map) {
        printMessage("Identifying reduction points in module " + RTLIL::unescape_id(module->name) + "\n", true);
        std::map<std::string, std::vector<Pin>> reduction_map; 

        // iterate through cells in the module
        // if a cell was not selected during replication, his inputs may need to be reduced
        for (auto cell: module->cells()) {
            RTLIL::Module *cell_module = module->design->module(cell->type);
            if (module->selected(cell) && cell_module->get_blackbox_attribute()) {
                // std::cout << "selected and blackbox for cell of type " << unescape_id(cell->type) << "\n";
                continue;
            }
            if (!cell_module->get_blackbox_attribute()){
                // TODO handle these non leaf cell reduction points
                // std::cout << "not blackbox for cell of type " << unescape_id(cell->type) << "\n";
                continue;
            }
            printMessage("Checking cell " + unescape_id(cell->name) + " of type " + unescape_id(cell->type) + " for reduction points\n", false);
            for (auto conn: cell->connections()) {
                if (!cell->input(conn.first)){
                    continue;
                }
                RTLIL::SigSpec sigspec = conn.second;
                for (auto sigbit: sigspec.bits()) {
                    if (sigbit.wire == nullptr) {
                        continue;
                    }
                    std::string plain_wire_name = remove_suffix_from_name(RTLIL::unescape_id(sigbit.wire->name), suffix);
                    if (wire_map[plain_wire_name].size() > 1){ // the wire was replicated and thus needs a red voter
                        std::string cell_name = log_id(cell);
                        std::string to_write = cell_name + " of type " + RTLIL::unescape_id(cell->type) +" needs a reduction voter before his port " + 
                                                RTLIL::unescape_id(conn.first) + "\n";
                        printMessage(to_write, false);
                        Pin pin;
                        pin.cell = cell;
                        pin.port = conn.first;
                        pin.sigbit = sigbit;
                        std::string map_key = RTLIL::unescape_id(sigbit.wire->name) + "_" + std::to_string(sigbit.offset);
                        reduction_map[map_key].push_back(pin);
                    }
                }
            }
        }
        return reduction_map;
    }

    std::map<std::string, std::vector<Pin>> identify_points_after_ff(RTLIL::Module *module, std::string suffix, std::map<std::string, std::vector<RTLIL::Wire*>> wire_map) {
        printMessage("Identifying points after ff in module " + RTLIL::unescape_id(module->name) + "\n", true);  
        std::map<std::string, std::vector<Pin>> ff_map;
        // get each flip flop cell. Get each output wire. Get the driven cells on those wires.
        std::vector<RTLIL::SigBit> ff_driven_sigbits;
        // std::cout << "ff_attr is " << ff_attr << "\n";
        for (auto cell: module->cells()) {
            bool in_ff_names = (std::find(ff_names.begin(), ff_names.end(), log_id(cell->type)) != ff_names.end());
            bool has_ff_attr = false;
            if (ff_attr != "") {
                has_ff_attr = cell->has_attribute("\\" + ff_attr);
            }
            if (!in_ff_names && !has_ff_attr) {
                // std::cout << "cell of type " << log_id(cell->type) << " is not a flip flop\n";
                continue;
            }
            // std::cout << "cell of type " << log_id(cell->type) << " is a flip flop!\n";
            for (auto conn: cell->connections()) {
                if (!cell->output(conn.first)) {
                    continue;
                }
                for (auto sigbit: conn.second.bits()) {
                    if (sigbit.wire == nullptr) {
                        continue;
                    }
                    printMessage(unescape_id(cell->name) + " Port " + unescape_id(conn.first) + \
                                    " drives sigbit with wire " + unescape_id(sigbit.wire->name) + "\n", false);
                    ff_driven_sigbits.push_back(sigbit);
                }
            }
        }

        for (auto cell: module->cells()) {
            for (auto conn: cell->connections()) {
                if (!cell->input(conn.first)){
                    continue;
                }
                RTLIL::SigSpec sigspec = conn.second;
                for (auto sigbit: sigspec.bits()) {
                    if (std::find(ff_driven_sigbits.begin(), ff_driven_sigbits.end(), sigbit) != ff_driven_sigbits.end()) {
                        Pin pin;
                        pin.cell = cell;
                        pin.port = conn.first;
                        pin.sigbit = sigbit;
                        std::string map_key = remove_suffix_from_name(RTLIL::unescape_id(sigbit.wire->name), suffix) + "_" + std::to_string(sigbit.offset);
                        ff_map[map_key].push_back(pin);
                    }
                }
            }
        }
        return ff_map;
    }

    void insert_reduction_voters(RTLIL::Module *module, std::string suffix, std::map<std::string, std::vector<Pin>> reduction_map, \
                                        std::map<std::string, std::vector<RTLIL::Wire*>> wire_map) {
        printMessage("inserting reduction voters\n", false);
        RTLIL::Wire *dummy_wire = module->wire("\\dummy_wire");
        if (voterInfo.input_ports.size() > copy_amount && dummy_wire == nullptr) { // create a dummy wire to tie extra input port to
            dummy_wire = module->addWire("\\dummy_wire");
        }
        for (auto entry: reduction_map) {
            RTLIL::Wire* wire = entry.second[0].sigbit.wire; // grab the wire from one of the pins
            int offset = entry.second[0].sigbit.offset;
            std::string plain_wire_name = remove_suffix_from_name(RTLIL::unescape_id(wire->name), suffix);

            std::string new_wire_name = "\\" + plain_wire_name + "_" + std::to_string(entry.second[0].sigbit.offset) + \
                                        "_RED_" + voterInfo.name + "_wire";
            // std::cout << "New wire name is " << new_wire_name << "\n";
            RTLIL::Wire* voter_output_wire = module->addWire(new_wire_name, 1);

            // prepare voter connections
            std::vector<RTLIL::SigSpec> voter_inputs;
            // std::cout << "plain_wire_name is " << plain_wire_name << "\n";
            for (auto other_wire: wire_map[plain_wire_name]) {
                RTLIL::SigBit sigbit = RTLIL::SigBit(other_wire, offset);
                RTLIL::SigSpec sigspec = RTLIL::SigSpec(sigbit);
                voter_inputs.push_back(sigspec);
            }

            // std::cout << "Voter inputs vector size is " << std::to_string(voter_inputs.size()) << "\n";
            std::map<RTLIL::IdString, RTLIL::SigSpec> voter_input_map;
            for (unsigned int i = 0; i < voterInfo.input_ports.size(); i++){
                if (i < copy_amount) {
                    voter_input_map[voterInfo.input_ports[i]] = SigSpec(voter_inputs[i]);
                }
                else {
                    voter_input_map[voterInfo.input_ports[i]] = SigSpec(SigBit(dummy_wire)); // wire to nothing
                }
            }

            RTLIL::SigBit voter_sigbit = SigBit(voter_output_wire);
            RTLIL::SigSpec voter_output = RTLIL::SigSpec(voter_sigbit);

            // // create and wire up voter
            std::string voter_id = "\\" + plain_wire_name + "_" + std::to_string(entry.second[0].sigbit.offset) + \
                                        "_RED_" + voterInfo.name;
            RTLIL::Cell* voter = addVoter(module, voter_id);
            for (auto voter_input_entry: voter_input_map){
                voter->setPort(voter_input_entry.first, voter_input_entry.second);
            }

            voter->setPort(voterInfo.output_ports[0], voter_output);

            // connect all the other cells to the voter output
            for (auto pin: entry.second) {
                // get the current port and keep everything the same except for the correct new wire
                RTLIL::SigSpec current = pin.cell->getPort(pin.port);
                RTLIL::SigSpec new_input = RTLIL::SigSpec();
                for (auto bit: current.bits()) {
                    if (bit.wire == nullptr) {
                        new_input.append(SigBit());
                        continue;
                    }
                    if (bit.wire == pin.sigbit.wire && bit.offset == pin.sigbit.offset) {
                        RTLIL::SigBit new_sigbit = SigBit(voter_output_wire);
                        new_input.append(new_sigbit);
                    }
                    else {
                        new_input.append(bit);
                    }
                }

                pin.cell->setPort(pin.port, new_input);
            }

            voter_cnt++;
            std::string to_write = "Added reduction voter: " + voter_id + "\n";
            to_write+= "\tConnections:\n";
            for (auto conn: voter->connections()) {
                if (conn.second[0].wire != nullptr) {
                    to_write+="\t\tPort: " + RTLIL::unescape_id(conn.first) + " is connected to " + \
                            RTLIL::unescape_id(conn.second[0].wire->name) + "\n";
                }
                else {
                    to_write+="\t\tPort: " + RTLIL::unescape_id(conn.first) + " is not connected\n";
                }
            }
            printMessage(to_write, false);
        }
        module->fixup_ports();
    }

    void insert_ff_voters(RTLIL::Module *module, std::string suffix, std::map<std::string, std::vector<Pin>> ff_map, \
                                        std::map<std::string, std::vector<RTLIL::Wire*>> wire_map) {
        printMessage("Inserting ff voters\n", false);
        RTLIL::Wire *dummy_wire;
        if (voterInfo.input_ports.size() > copy_amount) { // create a dummy wire to tie extra input port to
            dummy_wire = module->addWire("\\dummy_wire");
        }
        for (auto entry: ff_map) {
            // std::cout << "ff_map key " << entry.first << "\n";
            RTLIL::Wire* wire = entry.second[0].sigbit.wire; // grab the wire from one of the pins
            int offset = entry.second[0].sigbit.offset;
            std::string plain_wire_name = remove_suffix_from_name(RTLIL::unescape_id(wire->name), suffix);

            // prepare voter connections
            std::vector<RTLIL::SigSpec> voter_inputs;
            // std::cout << "plain_wire_name is " << plain_wire_name << "\n";
            for (auto other_wire: wire_map[plain_wire_name]) {
                RTLIL::SigBit sigbit = RTLIL::SigBit(other_wire, offset);
                RTLIL::SigSpec sigspec = RTLIL::SigSpec(sigbit);
                voter_inputs.push_back(sigspec);
            }

            std::map<RTLIL::IdString, RTLIL::SigSpec> voter_input_map;
            for (unsigned int i = 0; i < voterInfo.input_ports.size(); i++){
                if (i < copy_amount) {
                    voter_input_map[voterInfo.input_ports[i]] = SigSpec(voter_inputs[i]);
                }
                else {
                    voter_input_map[voterInfo.input_ports[i]] = SigSpec(SigBit(dummy_wire)); // wire to nothing
                }
            }
            
            for (int i = 0; i < copy_amount; i++) {
                std::string new_wire_name = "\\" + plain_wire_name + "_" + std::to_string(entry.second[0].sigbit.offset) + \
                                        "_" + voterInfo.name + "_wire_" + suffix + "_" + std::to_string(i);
                // std::cout << "new wire name is " << new_wire_name << "\n";
                RTLIL::Wire* voter_output_wire = module->addWire(new_wire_name, 1);

                RTLIL::SigBit voter_sigbit = SigBit(voter_output_wire);
                RTLIL::SigSpec voter_output = RTLIL::SigSpec(voter_sigbit);



                // create and wire up voter
                std::string voter_id = "\\" + plain_wire_name + "_" + std::to_string(entry.second[0].sigbit.offset) + \
                                            "_" + voterInfo.name + "_" + suffix + "_" + std::to_string(i);
                RTLIL::Cell* voter = addVoter(module, voter_id);
                for (auto voter_input_entry: voter_input_map){
                    voter->setPort(voter_input_entry.first, voter_input_entry.second);
                }

                voter->setPort(voterInfo.output_ports[0], voter_output);

                // connect all the other cells to the voter output if the voter is in their TMR domain
                for (auto pin: entry.second) {
                    std::string cell_name = RTLIL::unescape_id(pin.cell->name);
                    if (cell_name.find(suffix + "_" + std::to_string(i)) == std::string::npos) {
                        if (!(cell_name.find(suffix) == std::string::npos && i == 0)) {
                            continue;
                        }
                    }
                    // get the current port and keep everything the same except for the correct new wire
                    RTLIL::SigSpec current = pin.cell->getPort(pin.port);
                    RTLIL::SigSpec new_input = RTLIL::SigSpec();
                    for (auto bit: current.bits()) {
                        if (bit.wire == nullptr) {
                            new_input.append(SigBit());
                            continue;
                        }
                        if (bit.wire == pin.sigbit.wire && bit.offset == pin.sigbit.offset) {
                            RTLIL::SigBit new_sigbit = SigBit(voter_output_wire);
                            new_input.append(new_sigbit);
                        }
                        else {
                            new_input.append(bit);
                        }
                    }
                    pin.cell->setPort(pin.port, new_input);
                }

                std::string to_write = "Added ff voter: " + voter_id + "\n";
                to_write+= "\tConnections:\n";
                for (auto conn: voter->connections()) {
                    if (conn.second[0].wire != nullptr) {
                        to_write+="\t\tPort: " + RTLIL::unescape_id(conn.first) + " is connected to " + \
                                RTLIL::unescape_id(conn.second[0].wire->name) + "\n";
                    }
                    else {
                        to_write+="\t\tPort: " + RTLIL::unescape_id(conn.first) + " is not connected\n";
                    }
                }
                printMessage(to_write, false);
            }

            voter_cnt++;
        }
        module->fixup_ports();
    }

    std::map<std::string, std::vector<RTLIL::Wire*>> create_wire_map(RTLIL::Module *module, std::string suffix) {
        std::map<std::string, std::vector<RTLIL::Wire*>> wire_map;
        printMessage("Creating wire map for module " + unescape_id(module->name) + "\n", false);
        for (auto wire: module->wires()){
            std::string plain_wire_name = remove_suffix_from_name(RTLIL::unescape_id(wire->name), suffix);
            wire_map[plain_wire_name].push_back(wire);
        }
        // for (auto entry: wire_map) {
        //     std::cout << "Entry: " << entry.first << " is size " << std::to_string(entry.second.size()) << "\n";
        // }

        return wire_map;
    }

    std::map<std::string, std::vector<Pin>> remove_redundant_reduction_voters(std::map<std::string, std::vector<Pin>> reduction_map, \
                                                                                std::map<std::string, std::vector<Pin>> ff_map) {
        printMessage("Removing redundant reduction voters...\n", false);
        std::map<std::string, std::vector<Pin>> edited_reduction_points;
        for (auto red_entry: reduction_map) {
            std::cout << red_entry.first << "\n";
            std::string plain_key = remove_suffix_from_name(red_entry.first, suffix);
            if (ff_map.find(plain_key) == ff_map.end()) {
                // std::cout << "\t" << plain_key << " not found\n";
                edited_reduction_points[red_entry.first] = red_entry.second;
                continue;
            }
            // std::cout << "\t" << plain_key << " found in ff_map\n";
        }
        return edited_reduction_points;
    }

public:
    InsertVoterWorker(std::string suffix, int copy_amount, 
                            bool ff_voters, bool reduction_voters, std::vector<std::string> ff_names, std::string ff_attr) {
        this->suffix = suffix;
        this->copy_amount = copy_amount;
        this->reduction_voters = reduction_voters;
        this->ff_voters = ff_voters;
        this->ff_names = ff_names;
        this->ff_attr = ff_attr;
    }

    void setVoterInformation(std::string voter_type, std::string voter_name) {
        // if (voter_type != "") {
        voterInfo.cell_type = voter_type;
        // }
        // else {
        //     voterInfo.cell_type = "$lut";
        // }
        voterInfo.name = voter_name;
    }

    void setWireMap(std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> wire_map) {
        provided_wire_map = wire_map;
    }

    void run(Design* original_design, Design* new_design) {
        log("\nInserting Voters\n");

        initialize_voter_information(new_design);

        // TODO use the original design to find flip flop feedback
        
        for (auto module: new_design->modules()) {
            if (module->get_bool_attribute("\\blackbox") || module->get_blackbox_attribute()) {
                continue;
            }

            std::map<std::string, std::vector<Pin>> reduction_map;
            std::map<std::string, std::vector<Pin>> ff_map;
            std::map<std::string, std::vector<RTLIL::Wire*>> wire_map = create_wire_map(module, suffix);

            if (reduction_voters) {
                reduction_map = identify_reduction_points(module, suffix, wire_map);
            }
            if (ff_voters) {
                ff_map = identify_points_after_ff(module, suffix, wire_map);
            }

            std::map<std::string, std::vector<Pin>> reduction_map_edited = remove_redundant_reduction_voters(reduction_map, ff_map);
            if (ff_voters) {
                insert_ff_voters(module, suffix, ff_map, wire_map);
            }
            if (reduction_voters) {
                insert_reduction_voters(module, suffix, reduction_map_edited, wire_map);
            }

            // module->fixup_ports();
        }
        log("Inserted %d Voters\n", voter_cnt);
    }
};

// create a new module. Iterate through each cell and wire in the old module and copy it to the new module <copy_amount> times.
struct ApplyTMRPass : public Pass {
    ApplyTMRPass() : Pass("apply_tmr") { }

    void help() override {

		//   |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
		log("\n");
		log("    apply_tmr [options] [selection]\n");
		log("\n");
		log("This command applies TMR to the design by replicating it and inserting voters.\n");
		log("It operates on all modules in the design except for blackboxes. Only selected cells \n");
        log("will be replicated\n");
		log("\n");
        log("    -suffix <string>\n");
        log("        Specify the suffix to be appended to each replicated cell and wire name.\n");
        log("        The default suffix is \"TMR\"\n");
		log("\n");
        log("    -amount <int>\n");
        log("        Total number of copies. The default is 3\n");
        log("\n");
        log("    -voter_type <string>\n");
        log("        Specify the name of the primitive in the design to be used as a voter\n");
        log("        The default is Xilinx's LUT3\n");
        log("\n");
        log("    -voter_name <string>\n");
        log("        Specify the name to be appended to each voter\n");
        log("        The default is \"VOTER\"\n");
        log("\n");
        log("    -reduction\n");
        log("        Insert reduction voters\n");
        log("\n");
        log("    -ff\n");
        log("        Insert voters after every flip flop\n");
        log("\n");
        log("    -ff_attr\n");
        log("        Specify an attribute that signifies a cell is a flip flop\n");
        log("        Attributes can be set using the 'setattr' command.\n");
        log("        e.g. \"setattr is_ff 1 */t:FDRE\" and then\n");
        log("        pass \"-ff_attr is_ff\" as a parameter\n");
        log("\n");
        log("    -specify_ff\n");
        log("        Specify the name of a primitive that is a flip flop\n");
        log("\n");
        log("    -verbose\n");
        log("        Print all log messages during replication and voter insertion\n");
        log("\n");
    }

    void execute(vector<string> args, Design* design) override {

        std::string suffix = "TMR";
        int copy_amount = 3;
        bool verbose = false;
        std::string voter_type = "LUT3";
        std::string voter_name = "VOTER";
        bool reduction_voters = false;
        bool ff_voters = false;
        std::vector<std::string> ff_names;
        std::string ff_attr;

        log_header(design, "Executing APPLY TMR Pass\n");

        size_t argidx;
        size_t argidx_2;
        for (argidx = 1; argidx < args.size(); argidx++) {
            if (args[argidx] == "-suffix") {
                suffix = args[++argidx];
                continue;
            }
            if (args[argidx] == "-amount") {
                const char *str = (args[++argidx]).c_str();
                copy_amount = atoi(str);
                continue;
            }
            if (args[argidx] == "-verbose") {
                verbose = true;
                continue;
            }
            if (args[argidx] == "-voter_type") {
                voter_type = (args[++argidx]);
                continue;
            }
            if (args[argidx] == "-voter_name") {
                voter_name = (args[++argidx]);
                continue;
            }
            if (args[argidx] == "-reduction") {
                reduction_voters = true;
                continue;
            }
            if (args[argidx] == "-ff") {
                ff_voters = true;
                continue;
            }
            if (args[argidx] == "-specify_ff") {
                const char *str = (args[++argidx]).c_str();
                ff_names.push_back(str);
                continue;
            }
            if (args[argidx] == "-ff_attr") {
                const char *str = (args[++argidx]).c_str();
                ff_attr = str;
                continue;
            }
            break;
        }
        argidx_2 = argidx;
        extra_args(args, argidx, design);


        ReplicationWorker rep_worker = ReplicationWorker(copy_amount, suffix);
        rep_worker.setVerbose(verbose);
        RTLIL::Design *new_design = rep_worker.run(design);

        std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> rep_wire_map = rep_worker.get_final_wire_map();

        extra_args(args, argidx_2, new_design); // set the selection on the new design

        InsertVoterWorker voter_worker = InsertVoterWorker(suffix, copy_amount, ff_voters, reduction_voters, ff_names, ff_attr);
        voter_worker.setVoterInformation(voter_type, voter_name);
        voter_worker.setVerbose(verbose);
        voter_worker.setWireMap(rep_wire_map);
        voter_worker.run(design, new_design);

        // design = new_design;
        yosys_design = new_design; // set the new design as THE design.
        
    }
} ApplyTMRPass;

PRIVATE_NAMESPACE_END