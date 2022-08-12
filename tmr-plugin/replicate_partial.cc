#include "kernel/yosys.h"
#include <algorithm>


USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

struct ReplicationWorker {
private:
    int copy_amount;
    std::string suffix;
    std::vector<RTLIL::Cell*> non_leaf_cells;
    std::map<std::string, bool> blackbox_map;
    std::vector<std::string> ports_to_replicate;
    bool replicate_ports;
    bool verbose;
    std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> global_wire_map;
    std::vector<Cell*> cells_to_replicate;
    std::vector<Wire*> wires_to_replicate;
    std::vector<std::pair<RTLIL::Cell*, RTLIL::Cell*>> non_leaf_cells_to_fix;

    RTLIL::Design* replicate_design(RTLIL::Design *original_design) {
        if (replicate_ports) {
            for (auto port: original_design->top_module()->ports) {
                ports_to_replicate.push_back(RTLIL::unescape_id(port));
            }
        }
        
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
        // for (auto wire: wires_to_replicate) {
        //     std::cout << "Wire: " << log_id(wire) << " of module " << log_id(wire->module) << " will be replicated\n";
        // }
        
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
                std::cout << "Wire " << log_id(wire) << " from module " << log_id(wire->module) << " is only copied over\n";
                RTLIL::Wire *new_wire = new_module->addWire(wire->name, wire);
                wire_map[wire].push_back(new_wire);
                global_wire_map[wire].push_back(new_wire);
                continue;
            }
            for (int i = 0; i < copy_amount; i++) {
                std::string new_name = "\\" + RTLIL::unescape_id(wire->name) + "_" + suffix + "_" + std::to_string(i);
                // std::cout << "new wire name is " << new_name << "\n";
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
            std::cout << "set to replicate cell " << log_id(cell) << " of type " << RTLIL::unescape_id(cell->type) << "\n";
            if (std::find(std::begin(cells_to_replicate), std::end(cells_to_replicate), cell) == std::end(cells_to_replicate)) {
                std::cout << "\tbut he was not specified to be replicated\n";
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
                if (wire_map[bit.wire].size() > 3) {
                    std::cout << "GREATER THAN THREE " << log_id(bit.wire) << " has size " << std::to_string(wire_map[bit.wire].size()) << "\n";
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
                // std::cout << "another\n";
                bool one_replicated = (std::find(std::begin(wires_to_replicate), std::end(wires_to_replicate), sigspec_one[i].wire) != std::end(wires_to_replicate));
                bool two_replicated = (std::find(std::begin(wires_to_replicate), std::end(wires_to_replicate), sigspec_two[i].wire) != std::end(wires_to_replicate));
                // std::cout << "begin\n";
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

    std::string remove_suffix_from_name(std::string name, std::string suffix) {
        size_t position = name.find(suffix);
        if (position != std::string::npos) {
            name.erase(position - 1, suffix.length()+3);
        }
        return name;
    }

    void fix_non_leaf_cell_connections(RTLIL::Module *new_module, RTLIL::Cell *new_cell, RTLIL::Cell *old_cell, std::string suffix) {
        printMessage("Fixing connections for non leaf cell named " + RTLIL::unescape_id(new_cell->name) + " of type " + \
                    RTLIL::unescape_id(new_cell->type) + "\n", false);

        RTLIL::Module *cell_module = new_module->design->module(new_cell->type);
        if (blackbox_map[RTLIL::unescape_id(cell_module->name)]) {
            std::cout << "TODO..." << log_id(new_module) << " is a blackbox and needs his connections fixed differently.\n";
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
            // std::cout << "trying id string " << id_string << "\n";
            if (replicated_ports_map[id_string] > 1) { // it was replicated on the inside
                // std::cout << "hereeee\n";
                for (int i = 0; i < copy_amount; i++) {
                    RTLIL::SigSpec new_sigspec = RTLIL::SigSpec();
                    for (auto sigbit: connection.second.bits()) {
                        // std::cout << "doing a bit\n";
                        if (sigbit.wire == nullptr) { // create sigbit with null wire
                            // std::cout << "wire is null\n";
                            RTLIL::SigBit new_sigbit = RTLIL::SigBit(sigbit);
                            new_sigspec.append(new_sigbit);
                            continue;
                        }

                        if (global_wire_map[sigbit.wire].size() > 1) {
                            // std::cout << "wire " << log_id(sigbit.wire) << " was replicated\n";
                            RTLIL::SigBit new_sigbit = RTLIL::SigBit(global_wire_map[sigbit.wire][i], sigbit.offset);
                            new_sigspec.append(new_sigbit);
                        }
                        else {
                            // std::cout << "wire was NOT replicated\n";
                            // std::cout << "Global wire map size for that wire is " << std::to_string(global_wire_map[sigbit.wire].size()) << "\n";
                            RTLIL::SigBit new_sigbit = RTLIL::SigBit(global_wire_map[sigbit.wire][0], sigbit.offset);
                            // std::cout << "here\n";
                            new_sigspec.append(new_sigbit);
                            // std::cout << "done\n";
                        }
                        // if (global_wire_map[sigbit.wire].size() > 3) {
                        //     std::cout << "GREATER THAN THREE " << log_id(sigbit.wire) << " has size " << std::to_string(global_wire_map[sigbit.wire].size()) << "\n";
                        // }
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
                    // std::cout << "doing a bit\n";
                    if (sigbit.wire == nullptr) { // create sigbit with null wire
                        // std::cout << "wire is null\n";
                        RTLIL::SigBit new_sigbit = RTLIL::SigBit(sigbit);
                        new_sigspec.append(new_sigbit);
                        continue;
                    }

                    // if (global_wire_map[sigbit.wire].size() > 1) {
                    //     std::cout << "wire was replicated\n";
                    //     RTLIL::SigBit new_sigbit = RTLIL::SigBit(global_wire_map[sigbit.wire][i], sigbit.offset);
                    //     new_sigspec.append(new_sigbit);
                    // }
                    // else {
                    // std::cout << "wire was NOT replicated\n";
                    // std::cout << "Global wire map size or that wire is " << std::to_string(global_wire_map[sigbit.wire].size()) << "\n";
                    RTLIL::SigBit new_sigbit = RTLIL::SigBit(global_wire_map[sigbit.wire][0], sigbit.offset);
                    // std::cout << "here\n";
                    new_sigspec.append(new_sigbit);
                    // std::cout << "done\n";
                    // }
                }
                // std::string suffix_key = "_" + suffix + "_" + std::to_);
                // std::string new_id_string = "\\" + id_string + suffix_key;
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

    void printMessage(std::string main_string, bool force) {
        if (verbose || force){
            log("%s", main_string.c_str());
        }
    }

public:
    ReplicationWorker(int amount_of_copies, std::string suffix) {
        copy_amount = amount_of_copies;
        this->suffix = suffix;
        this->replicate_ports = replicate_ports;
    }

    void setVerbose(bool verbose) {
        this->verbose = verbose;
    }

    RTLIL::Design* run(RTLIL::Design *original_design) {
        return replicate_design(original_design);
    }
};

// create a new module. Iterate through each cell and wire in the old module and copy it to the new module <copy_amount> times.
struct ApplyTMRPass : public Pass {
    ApplyTMRPass() : Pass("replicate_partial") { }

    void help() override {

		//   |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
		log("\n");
		log("    replicate_partial [options] [selection]\n");
		log("\n");
		log("This command replicates the design. It operates on all modules\n");
		log("in the design except for blackboxes. Only selected cells will be replicated\n");
		log("\n");
        log("    -suffix <string>\n");
        log("        Specify the suffix to be appended to each replicated cell and wire name.\n");
        log("        The default suffix is \"TMR\"\n");
		log("\n");
        log("    -amount <int>\n");
        log("        Total number of copies. The default is 3\n");
        log("\n");
        log("    -verbose\n");
        log("        Print all log messages during replication\n");
        log("\n");
    }

    void execute(vector<string> args, Design* design) override {

        std::string suffix = "TMR";
        int copy_amount = 3;
        bool verbose = false;

        log_header(design, "Executing REPLICATE PARTIAL Pass\n");

        size_t argidx;
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
            break;
        }
        extra_args(args, argidx, design);

        ReplicationWorker worker = ReplicationWorker(copy_amount, suffix);
        worker.setVerbose(verbose);
        RTLIL::Design *new_design = worker.run(design);
        yosys_design = new_design; // set the new design as THE design.
        
    }
} ApplyTMRPass;

PRIVATE_NAMESPACE_END