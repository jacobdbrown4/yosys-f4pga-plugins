#include "kernel/yosys.h"


USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

struct ReplicationChecker {

    ReplicationChecker() {}

    bool run(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix) {
        return check_replication(old_module, new_module, suffix);
    }

    bool check_replication(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix) {
        log("\nChecking replication of %s module\n", log_id(new_module));
        bool matches = true;
        std::map<std::string, std::set<std::string>> original_connections = get_connections(old_module);
        std::map<std::string, std::set<std::string>> new_connections = get_connections(new_module);

        for (auto map_entry: new_connections) {
            std::string key = map_entry.first;
            std::string key_for_original = remove_suffix_from_name(key, suffix);
            std::set<string> original_set = original_connections.at(key_for_original);
            if (map_entry.second.size() != original_set.size()) {
                log("NOT MATCHED WARNING: Replicated connections Size of %ld does not equal original connections size of %ld\n", \
                        map_entry.second.size(),original_set.size());
            }
            for (auto replicated_name: map_entry.second) {
                std::string original_name = remove_suffix_from_name(replicated_name, suffix);
                if (original_set.find(original_name) == original_set.end()) {
                    if (original_set.find(original_name.substr(1)) != original_set.end()) {
                    }
                    else {
                        matches = false;
                    }
                }
                else {
                }
            }
        }
        if (!matches) {
            log_warning("Warning: possible error in replication of module %s\n", log_id(new_module));
        }
        else {
            log("Replication of module %s passed check\n", log_id(new_module));
        }
        return matches;
    }

    std::map<std::string, std::set<std::string>> get_connections(RTLIL::Module *module) {
        std::map<std::string, std::set<std::string>> connections;
        for (auto cell: module->cells()) {
            std::string cell_name = RTLIL::unescape_id(cell->name);
            for (auto connection: cell->connections()) {
                std::string port_name = RTLIL::unescape_id(connection.first);
                RTLIL::SigSpec sigspec = connection.second;
                std::set<std::string> current_info;
                for (auto chunk: sigspec.chunks()) {
                    std::string info;
                    if (chunk.wire != nullptr) {
                        info=(RTLIL::unescape_id(chunk.wire->name));
                    }
                    else {
                        info="NULL Wire";
                    }
                    current_info.insert(info);
                }
                std::string map_key = cell_name + "_" + port_name;
                connections.insert( std::pair<std::string, std::set<std::string>>(map_key,current_info));
            }
        }
        return connections;
    }

    std::string remove_suffix_from_name(std::string name, std::string suffix) {
        size_t position = name.find(suffix);
        if (position != std::string::npos) {
            name.erase(position - 1, suffix.length()+3);
        }
        return name;
    }
};

struct ReplicationWorker {

private:
    int copy_amount;
    std::vector<RTLIL::Cell*> non_leaf_cells;
    std::map<std::string, bool> blackbox_map;
    std::vector<std::string> ports_to_replicate;

    typedef struct WireInfo {
        RTLIL::Cell *driver;
        RTLIL::Wire *wire;
        int offset;
        RTLIL::IdString port_name;
        std::vector<RTLIL::Cell*> driven_cells;
    } WireInfo;

    RTLIL::Design* replicate_design(RTLIL::Design *original_design, std::string suffix) {
        blackbox_map = get_blackbox_modules(original_design);
        RTLIL::Design *new_design = new RTLIL::Design;
        yosys_design = new_design; // set the new design as THE design.
        
        for (auto module: original_design->modules()) {
            if (blackbox_map[RTLIL::unescape_id(module->name)]){
                log("Will not replicate inside blackbox module %s\n", log_id(module));
                RTLIL::Module *new_module = new_design->addModule("\\" + RTLIL::unescape_id(module->name));
                module->cloneInto(new_module);
                continue;
            }

            bool check_ports = false;
            if (original_design->top_module() == module) {
                std::cout << "found the top module: " << log_id(module) << "\n";
                check_ports = true; // TODO change this to true later
            }
            log("Replicating module: %s\n", log_id(module));
            replicate_module(new_design, module, suffix, check_ports);
            log("\n");
        }
        for (auto cell: non_leaf_cells) {
            fix_non_leaf_cell_connections(cell->module, cell, suffix);
        }
        return new_design;
    }

    std::map<std::string, bool> get_blackbox_modules(RTLIL::Design *design) {
        std::cout << "getting blackbox modules\n";
        std::map<std::string, bool> blackbox_map;
        for (auto module: design->modules()) {
            if (module->get_bool_attribute("\\blackbox")) {
                std::cout << log_id(module) << " is a blackbox\n";
                blackbox_map[RTLIL::unescape_id(module->name)] = true;
            }
            else {
                blackbox_map[RTLIL::unescape_id(module->name)] = false;
            }
        }
        return blackbox_map;
    }

    std::map<std::string, WireInfo*> collect_connection_information(RTLIL::Design *design) {
        // module/wire_offset to WireInfo so we know all source and sink info of wires
        // this will help us identify what needs to be replicated
        std::map<std::string, WireInfo*> connection_info;
        for (auto module: design->modules()) {
            for (auto cell: module->cells()) {
                for (auto conn: cell->connections()) {
                    RTLIL::IdString port_name = conn.first;
                    for (auto sigbit: conn.second.bits()) {
                        std::string map_key = unescape_id(module->name) + "/" + log_id(sigbit.wire) + "_" + std::to_string(sigbit.offset);
                        WireInfo *info = connection_info[map_key];
                        if (info == nullptr) {
                            std::cout << "it's NULLL\n";
                        }
                        if (sigbit.wire){
                            info->wire = sigbit.wire;
                            if (sigbit.wire->port_output) {
                                info->driver = cell;
                            }
                            else if (sigbit.wire->port_input) {
                                info->driven_cells.push_back(cell);
                            }
                            
                            info->offset = sigbit.offset;
                        }

                    }
                }
            }
        }
        return connection_info;
    }

    void replicate_module(RTLIL::Design *new_design, RTLIL::Module *module, std::string suffix, bool check_ports) {
        RTLIL::Module *new_module = new_design->addModule("\\" + RTLIL::unescape_id(module->name));
        replicate_wires(module, new_module, suffix, check_ports);
        replicate_cells(module, new_module, suffix, check_ports);
        ReplicationChecker checker = ReplicationChecker();
        checker.run(module, new_module, suffix);
        connect_wire_connections(module, new_module, suffix);
    }

    void connect_wire_connections(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix) {
        log("%s", "Connecting wire to wire connections...\n");
        for (auto sigsig: old_module->connections()) {
            RTLIL::SigSpec sigspec_one = sigsig.first;
            RTLIL::SigSpec sigspec_two = sigsig.second;
            for (int i = 0; i < GetSize(sigspec_one); i++) {
                for (int j = 0; j < copy_amount; j++) {
                    // get each replica's wires and connect them.
                    RTLIL::SigSpec new_sigspec_one;
                    RTLIL::SigSpec new_sigspec_two;
                    if (sigspec_one[i].wire != nullptr) {
                        std::string first_wire_name = RTLIL::unescape_id(sigspec_one[i].wire->name);
                        RTLIL::Wire *replicated_wire_one = new_module->wire("\\" + first_wire_name + "_" + suffix + "_" + std::to_string(j));
                        new_sigspec_one = RTLIL::SigSpec(replicated_wire_one, sigspec_one[i].offset, 1);
                    }
                    else {
                        new_sigspec_one = RTLIL::SigSpec(sigspec_one[i], 1); // create a sigbit with a null wire.
                    }
                    if (sigspec_two[i].wire != nullptr) {
                        std::string second_wire_name = RTLIL::unescape_id(sigspec_two[i].wire->name);
                        RTLIL::Wire *replicated_wire_two = new_module->wire("\\" + second_wire_name + "_" + suffix + "_" + std::to_string(j));
                        new_sigspec_two = RTLIL::SigSpec(replicated_wire_two, sigspec_two[i].offset, 1);
                    }
                    else {
                        new_sigspec_two = RTLIL::SigSpec(sigspec_two[i], 1); // create a sigbit with a null wire.
                    }

                    RTLIL::SigSig new_sigsig = std::pair<RTLIL::SigSpec, RTLIL::SigSpec>(new_sigspec_one, new_sigspec_two);
                    new_module->connect(new_sigsig);
                }
            }
        }
    }

    void replicate_wires(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix, bool check_ports) {
        for (auto wire: old_module->wires()) { // copy wires over
            if ((wire->port_output || wire->port_input) && check_ports) {
                std::string wire_name = RTLIL::unescape_id(wire->name);
                if (std::find(std::begin(ports_to_replicate), std::end(ports_to_replicate), wire_name) != std::end(ports_to_replicate)) {
                    std::cout << "replicating port: " << wire_name << "\n";
                }
                else {
                    std::cout << wire_name << " connected to port of same name will not be replicated. It will simply be copied\n";
                    new_module->addWire(wire->name, wire);

                    continue;
                }
            } 
            for (int i = 0; i < copy_amount; i++) {
                std::string new_name = "\\" + RTLIL::unescape_id(wire->name) + "_" + suffix + "_" + std::to_string(i);
                RTLIL::Wire *new_wire = new_module->addWire(new_name, wire);
                log("Replicated wire %s into wire %s\n", log_id(wire), log_id(new_wire));
                new_module->fixup_ports();
            }
        }
    }

    void replicate_cells(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix, bool check_ports) {
        std::cout << "replicating cells in module"  << log_id(old_module) << "\n";
        for (auto cell: old_module->cells()) { // copy cells over
            std::cout << "set to replicate cell " << log_id(cell) << " of type " << RTLIL::unescape_id(cell->type) << "\n";
            std::string cell_type = RTLIL::unescape_id(cell->type);
            std::string cell_name = RTLIL::unescape_id(cell->name);
            if (cell_type.substr(0,1) != "$" || cell_name.substr(0,1) != "$") {
                if (!cell->known()) {
                    log("Unrecognized yosys cell type: %s. Will not replicate.\n", cell_type.c_str());
                    continue;
                }
                else if (blackbox_map[RTLIL::unescape_id(cell->type)]){
                    // it's a primitive, do nothing here and replicate below
                    // log("Primitive found: %s\n", log_id(cell));
                }
                else {
                    // even if it's not a leaf cell, we need to add it to the new module
                    RTLIL::Cell *new_cell = new_module->addCell("\\" + RTLIL::unescape_id(cell->name), cell);
                    new_cell->type = "\\" + cell_type;
                    non_leaf_cells.push_back(new_cell);
                    continue;
                }
            }
            // check if cell should be replicated
            bool replicate = false;
            bool buffer = false;
            if (check_ports){
                std::cout << "checking cell " << log_id(cell) << " of type " << RTLIL::unescape_id(cell->type) << "\n";
                for (auto conn: cell->connections()) {
                    RTLIL::SigSpec sigspec = conn.second;
                    for (auto bit: sigspec.bits()) {
                        if (bit.wire == NULL) {
                            continue;
                        }
                        RTLIL::Wire *wire = bit.wire;
                        std::cout << log_id(wire) << " is a wire\n";
                        std::cout << "Is it a port_input? " << std::to_string(wire->port_input) << "\n";
                        if ((wire->port_input || wire->port_output)) {
                            std::cout << log_id(wire) << " is connected to top level input/output\n";
                            buffer = true;
                            std::string wire_name = RTLIL::unescape_id(wire->name);
                            if (std::find(std::begin(ports_to_replicate), std::end(ports_to_replicate), "\\" + wire_name) != std::end(ports_to_replicate)) {
                                std::cout << "Cell " << log_id(cell) << " will be replicated\n";
                                replicate = true;
                                break;
                            }
                            // else {
                            //     // std::cout << wire_name << " connected to port of same name will not be replicated\n";
                            //     continue;
                            // }
                        }
                    }
                }
            }
            else{
                replicate = true;
            }
            
            if (!replicate && buffer) {
                std::cout << "Will not replicate cell " << log_id(cell) << " of type " << log_id(cell->type) << " as it should not be replicated\n";
                continue;
            }
            for (int i = 0; i < copy_amount; i++) {
                std::string new_name = RTLIL::unescape_id(cell->name) + "_" + suffix + "_" + std::to_string(i);
                if (new_name.substr(0,1) != "$") {
                    new_name = "\\" + new_name;
                }
                RTLIL::Cell *new_cell = new_module->addCell(new_name, cell);
                log("Replicated cell %s into cell %s\n", log_id(cell), log_id(new_cell));

                // std::cout << "BEFORE:\n";
                // print_connections(new_cell);
                std::cout << "fixing the cell's connections now\n";
                fix_cell_connections(new_module, new_cell, i, suffix);      

                // std::cout << "AFTER:\n";
                // print_connections(new_cell);
                new_module->fixup_ports();
            }
        }
        std::cout << "done replicating cells\n";
    }

    void fix_cell_connections(RTLIL::Module *new_module, RTLIL::Cell *new_cell, int i, std::string suffix) {
        for (auto &connection: new_cell->connections()) {

            unsigned int chunk_count = 0;
            std::string id_string = RTLIL::unescape_id(connection.first);
            RTLIL::SigSpec sigspec = connection.second;
            std::vector<RTLIL::SigChunk> current_chunks; 

            for (auto chunk: sigspec.chunks()) {
                if (chunk.wire == nullptr) {
                    RTLIL::SigChunk* new_chunk = new RTLIL::SigChunk(chunk);
                    current_chunks.push_back(*new_chunk);
                    chunk_count++;
                    continue;
                }
                std::string wire_chunk_name = RTLIL::unescape_id(chunk.wire->name);
                std::cout << "trying to add wire named " << ("\\" + wire_chunk_name + "_" + suffix + "_" + std::to_string(i)) << "\n";
                RTLIL::Wire *replicated_wire = new_module->wire("\\" + wire_chunk_name + "_" + suffix + "_" + std::to_string(i));
                if (replicated_wire == nullptr) {
                    std::cout << "the wire was null. It was not replicated.\n";
                    replicated_wire = new_module->wire(chunk.wire->name);
                    // if (replicated_wire != nullptr){
                    //     std::cout << "found the old regular one!\n";
                    // }
                }
                std::cout << "success\n";

                RTLIL::Wire *old_wire = new_module->wire("\\" + wire_chunk_name);

                RTLIL::SigChunk* new_chunk = new RTLIL::SigChunk(chunk);
                // new_chunk->width = chunk.width;
                // new_chunk->offset = chunk.offset;
                new_chunk->wire = replicated_wire;
                current_chunks.push_back(*new_chunk);
                chunk_count++;
            }

            RTLIL::SigSpec *new_sigspec = new RTLIL::SigSpec();
            for (auto a_chunk: current_chunks){
                new_sigspec->append(RTLIL::SigSpec(a_chunk));
            }

            new_cell->setPort(connection.first, *new_sigspec);
        }
    }

    void fix_non_leaf_cell_connections(RTLIL::Module *new_module, RTLIL::Cell *new_cell, std::string suffix) {
        for (auto &connection: new_cell->connections()) {
            bool unset_already = false;
            // unsigned int chunk_count = 0;
            std::string id_string = RTLIL::unescape_id(connection.first);
            RTLIL::SigSpec sigspec = connection.second;
            for (int i = 0; i < copy_amount; i++) {
                std::string suffix_key = "_" + suffix + "_" + std::to_string(i);
                std::vector<RTLIL::SigChunk> current_chunks; 
                for (auto chunk: sigspec.chunks()) {
                    if (chunk.wire == nullptr) {
                        RTLIL::SigChunk* new_chunk = new RTLIL::SigChunk(chunk);
                        current_chunks.push_back(*new_chunk);
                        continue;
                    }
                    std::string wire_chunk_name = RTLIL::unescape_id(chunk.wire->name);
                    std::string replicated_wire_name = "\\" + wire_chunk_name + suffix_key;
                    RTLIL::Wire *replicated_wire = new_module->wire(replicated_wire_name);

                    RTLIL::Wire *old_wire = new_module->wire("\\" + wire_chunk_name);
                    RTLIL::SigChunk* new_chunk = new RTLIL::SigChunk(chunk);
                    new_chunk->wire = replicated_wire;
                    current_chunks.push_back(*new_chunk);
                }

                RTLIL::SigSpec *new_sigspec = new RTLIL::SigSpec();
                for (auto a_chunk: current_chunks){
                    new_sigspec->append(RTLIL::SigSpec(a_chunk));
                }
                
                if (!unset_already) {
                    new_cell->unsetPort(connection.first);
                    unset_already = true;
                }

                std::string new_id_string = "\\" + id_string + suffix_key;
                new_cell->setPort(new_id_string, *new_sigspec);
            }
            new_module->fixup_ports();
        }
    }

    void print_connections(RTLIL::Cell *new_cell) {
        std::string to_write = RTLIL::unescape_id(new_cell->name) + "\n";
        for (auto &connection: new_cell->connections()) {
            std::string id_string = RTLIL::unescape_id(connection.first);
            to_write+=id_string;
            to_write+="\n";
            RTLIL::SigSpec sigspec = connection.second;
            std::vector<RTLIL::SigChunk> current_chunks;
            for (auto chunk: sigspec.chunks()) {
                if (chunk.wire != nullptr) {
                    to_write+=("\t" + RTLIL::unescape_id(chunk.wire->name) + " of module " \
                                + RTLIL::unescape_id(chunk.wire->module->name) + "\n");
                }
                else {
                    to_write+="\tNULL Wire\n";
                }
            }
        }
        log("%s", to_write.c_str());
    }


public:
    ReplicationWorker(int amount_of_copies) {
        copy_amount = amount_of_copies;
    }

    RTLIL::Design* run(RTLIL::Design *original_design, std::string suffix) {
        return replicate_design(original_design, suffix);
    }
};



struct InsertVoterWorker {
    private:
    std::string ff_names[4] = {"$dff", "$sdff", "$_DFF_P_", "FDRE"};
    std::string suffix;
    int copy_amount = 3;
    std::map<std::string, std::string> type_to_output_port;
    int voter_cnt = 0;

    typedef struct VoterInfo{
        std::string cell_type;
        std::vector<RTLIL::IdString> output_ports;
        std::vector<RTLIL::IdString> input_ports;
    } VoterInfo;

    VoterInfo voterInfo;

    void initialize_output_port_map() {
        type_to_output_port.insert(std::pair<std::string, std::string>("$dff", "Q"));
        type_to_output_port.insert(std::pair<std::string, std::string>("$sdff", "Q"));
        type_to_output_port.insert(std::pair<std::string, std::string>("$_DFF_P_", "Q"));
        type_to_output_port.insert(std::pair<std::string, std::string>("FDRE", "Q"));
    }

    void initialize_voter_information(RTLIL::Design *design) {
        std::cout << "initializing voter info\n";
        std::cout << "voter_type is " << voterInfo.cell_type << "\n";
        RTLIL::Module *voter_module = design->module(RTLIL::escape_id(voterInfo.cell_type));
        if (voter_module == NULL) {
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

    typedef struct InsertionPoint {
        RTLIL::Cell *cell;
        RTLIL::IdString port_name;
        RTLIL::SigSpec cell_orig_output;
        RTLIL::Wire *wire;
        int offset;
        bool is_reduction;
    } InsertionPoint;

    typedef struct InsertionPointPack {
        std::vector<InsertionPoint> points;
    } InsertionPointPack;

    std::map<std::string, InsertionPointPack> find_points_after_ff(RTLIL::Module *module, std::string suffix) {
        log("Finding Voter Insertion Points After FFs...\n");
        // create a map from original cell name to an InsertionPointPack containing InsertionPoints for the replica cells
        std::map<std::string, InsertionPointPack> insertion_points;
        for (auto cell: module->cells()) {
            std::string cell_type = RTLIL::unescape_id(cell->type);
            if (std::find(std::begin(ff_names), std::end(ff_names), cell_type) == std::end(ff_names)) {
                continue;
            }
            std::string output_port_name = type_to_output_port.at(cell_type);
            RTLIL::SigSpec sigspec = cell->getPort("\\" + output_port_name);
            std::string cell_original_name = remove_suffix_from_name(RTLIL::unescape_id(cell->name), suffix);

            InsertionPoint point = {cell, "\\" + output_port_name, sigspec, nullptr, 0, false};
            insertion_points[cell_original_name].points.push_back(point);
        }
        return insertion_points;
    }

    // typedef struct ReductionPoint {
    //     RTLIL::SigBit sigbit; // new wire to go between cell and voter
    //     std::vector<RTLIL::Cell*> cells; // the cells
    //     // RTLIL::IdString port_name; // cell output port name
    //     RTLIL::SigBit original; // cell's original sigbit connection
    // } ReductionPoint;

    std::map<std::string, InsertionPointPack> find_reduction_points(RTLIL::Module *module, std::string suffix) {
        log("Finding Reduction Voter Points...\n");
        // create a map from original cell name to an InsertionPointPack containing InsertionPoints for the replica cells
        std::map<std::string, InsertionPointPack> insertion_points;
        // create map from output wire_offset to cells
        // std::map<std::string, std::vector<RTLIL::Cell*>
        // for each cell, if he contains the suffix, he was replicated
        // and if he outputs to a wire that doesn't have the suffix, he needs a reduction voter.
        // std::cout << "here silly\n";
        for (auto cell: module->cells()) {
            std::string cell_type = RTLIL::unescape_id(cell->type);
            std::string cell_name = RTLIL::unescape_id(cell->name);
            std::cout << "Checking for reduction points after cell " << cell_name << " of type " << cell_type << "\n";
            if (cell_name.find(suffix) == std::string::npos) {
                continue;
            }
            for (auto conn: cell->connections()){
                // std::cout << "continuing\n";
                RTLIL::IdString port_name = conn.first;
                if (!(cell->output(port_name))) {
                    continue;
                }
                RTLIL::SigSpec sigspec = conn.second;
                for  (auto bit: sigspec.bits()) {
                    if (bit.wire == NULL) {
                        continue;
                    }
                    std::string wire_name = RTLIL::unescape_id(bit.wire->name);
                    std::cout << "\t his wire name is " << wire_name << "\n";
                    if (wire_name.find(suffix) != std::string::npos) {
                        continue;
                    }
                    // cell has suffix, wire doesn't. Need reduction voter.
                    std::cout << cell_name << " at port " << RTLIL::unescape_id(port_name) << " needs a reduction voter on wire " << wire_name << " offset " << \
                                std::to_string(bit.offset) << "\n";
                    std::string cell_original_name = remove_suffix_from_name(RTLIL::unescape_id(cell->name), suffix);
                    InsertionPoint point = {cell, port_name, sigspec, bit.wire, bit.offset, true}; 
                    insertion_points[cell_original_name].points.push_back(point);
                    
                }

            }
            // std::string output_port_name = type_to_output_port.at(cell_type);
            // RTLIL::SigSpec sigspec = cell->getPort("\\" + output_port_name);
            // std::string cell_original_name = remove_suffix_from_name(RTLIL::unescape_id(cell->name), suffix);

            // InsertionPoint point = {cell, "\\" + output_port_name, sigspec};
            // insertion_points[cell_original_name].points.push_back(point);
        }
        return insertion_points;
    }

    typedef struct SigBitInfo {
        RTLIL::SigBit sigbit; // new wire to go between cell and voter
        RTLIL::Cell *cell; // the cell
        RTLIL::IdString port_name; // cell output port name
        RTLIL::SigBit original; // cell's original sigbit connection
        bool is_reduction;
    } SigBitInfo;

    typedef struct SigBitPack {
        std::vector<SigBitInfo> bit_pack;
        bool is_reduction;
    } SigBitPack;

    // create map from output wire name (without suffix) to the three new wires (SigBits) that will exit each cell and input to each voter.
    std::map<std::string, SigBitPack> arrangePointPackBits(RTLIL::Module *module, std::map<std::string, InsertionPointPack> insertion_points) {
        log("%s", "Organizing Voter Insertion Points...\n");
        std::map<std::string, SigBitPack> new_sigbit_map;
        for (auto map_entry: insertion_points) {
            std::vector<InsertionPoint> points = map_entry.second.points;
            for (auto point: points) {
                if (!point.is_reduction) {
                    RTLIL::SigSpec original_output = point.cell_orig_output;

                    // make sure new wires exist for all the chunks in the sigspec
                    for (auto chunk: original_output.chunks()) {
                        if (chunk.wire == NULL) {
                            continue;
                        }
                        std::string new_name = "\\" + RTLIL::unescape_id(chunk.wire->name) + \
                                                "_VOTER_wire";
                        RTLIL::Wire *new_wire = module->wire(new_name);
                        if (new_wire == nullptr) {
                            new_wire = module->addWire(new_name, chunk.wire);
                        }
                    }

                    // for each sigbit in the original, find the corresponding wire and make a new sigbit. Put it into the map.
                    for (auto bit: original_output.bits()) {
                        if (bit.wire == NULL) {
                            continue;
                        }
                        std::string new_name = "\\" + RTLIL::unescape_id(bit.wire->name) + \
                                                "_VOTER_wire";
                        RTLIL::Wire *new_wire = module->wire(new_name);
                        RTLIL::SigBit new_sigbit = SigBit(new_wire, bit.offset);

                        // name of original wire without the suffix and with the bit's offset
                        // used to match with other tmr domains later
                        std::string plain_name = remove_suffix_from_name(RTLIL::unescape_id(bit.wire->name), "TMR") + "_" + std::to_string(bit.offset);
                        SigBitInfo info = {new_sigbit, point.cell, point.port_name, bit, point.is_reduction};
                        new_sigbit_map[plain_name].bit_pack.push_back(info);
                        new_sigbit_map[plain_name].is_reduction = false;
                    }
                }
                else {
                    RTLIL::SigSpec original_output = point.cell_orig_output;
                    for (auto bit: original_output.bits()) {
                        if (bit.wire == point.wire && bit.offset == point.offset) {
                            std::string new_name = "\\" + RTLIL::unescape_id(point.wire->name) + \
                                                "_VOTER_wire";
                            RTLIL::Wire *new_wire = module->wire(new_name);
                                if (new_wire == nullptr) {
                                    new_wire = module->addWire(new_name, point.wire);
                                }
                            RTLIL::SigBit new_sigbit = SigBit(new_wire, point.offset);
                            SigBitInfo info = {new_sigbit, point.cell, point.port_name, bit, point.is_reduction};
                            std::string key = RTLIL::unescape_id(bit.wire->name) + "_" + std::to_string(bit.offset);
                            new_sigbit_map[key].bit_pack.push_back(info);
                            new_sigbit_map[key].is_reduction = true;
                            break;
                        }
                    }
                }

            }
        }
        return new_sigbit_map;
    }

    void insert_voters(RTLIL::Module *module, std::map<std::string, InsertionPointPack> insertion_points) {
        log("Inserting Voters...\n");
        std::map<std::string, SigBitPack> new_sigbit_map = arrangePointPackBits(module, insertion_points);
        std::vector<RTLIL::Cell*> cells_set;
        for (auto map_entry: new_sigbit_map) {
            std::vector<SigBitInfo> bit_pack = map_entry.second.bit_pack;
            if (map_entry.second.is_reduction) {
                std::cout << "it's a reduction for " << map_entry.first << "\n";
                for (auto bit: bit_pack) {
                    // create new sigspec for cell output. Copy everything over except replace certain sigbit
                    RTLIL::SigSpec sigspec_orig = bit.cell->getPort(bit.port_name);
                    RTLIL::SigSpec new_sigspec = SigSpec();
                    for (auto sigbit: sigspec_orig.bits()) {
                        if (sigbit == bit.original) {
                            new_sigspec.append(bit.sigbit);
                        }
                        else {
                            new_sigspec.append(sigbit);
                        }
                    }
                    bit.cell->setPort(bit.port_name, new_sigspec);
                    // voter_input.append(bit.sigbit);
                    // RTLIL::SigBit original_output = bit.original;
                }
                RTLIL::SigSpec voter_output = bit_pack[0].original;
                std::map<RTLIL::IdString, RTLIL::SigSpec> voter_inputs;
                RTLIL::SigSpec voter_input = SigSpec();
                for (unsigned int i = 0; i < bit_pack.size(); i++){
                    std::cout << "here with " << std::to_string(i) << "\n";
                    voter_inputs[voterInfo.input_ports[i]] = bit_pack[i].sigbit;
                    // voter_input.append(bit_pack[i].sigbit);
                }
                std::string voter_name = "\\" + RTLIL::unescape_id(bit_pack[0].original.wire->name) + \
                                            "_VOTER_" + std::to_string(bit_pack[0].original.offset);
                // add the voter now
                // RTLIL::Cell *voter = module->addLut(voter_name, voter_input, voter_output, RTLIL::Const::from_string("8'11101000"));
                RTLIL::Cell *voter_other = module->addCell(voter_name, "\\" + voterInfo.cell_type);
                // voter_other->setPort("\\I", voter_input);
                for (auto voter_input_entry: voter_inputs){
                    voter_other->setPort(voter_input_entry.first, voter_input_entry.second);
                }
                voter_other->setPort(voterInfo.output_ports[0], voter_output);
                voter_cnt++;

            }
            else {
                for (auto bit: bit_pack) {

                    // disconnect the cell from original output and connect to new sigbit
                    if (std::find(cells_set.begin(), cells_set.end(), bit.cell) == cells_set.end()) {
                        RTLIL::SigSpec new_sigspec = SigSpec();
                        bit.cell->setPort(bit.port_name, new_sigspec);
                        cells_set.push_back(bit.cell);
                    }

                    bit.sigbit.wire->port_output = false;
                    RTLIL::SigSpec cell_output = bit.cell->getPort(bit.port_name);
                    cell_output.append(bit.sigbit);
                    bit.cell->setPort(bit.port_name, cell_output);

                    RTLIL::SigSpec voter_output = bit.original;
                    std::map<RTLIL::IdString, RTLIL::SigSpec> voter_inputs;
                    RTLIL::SigSpec voter_input = SigSpec();
                    for (unsigned int i = 0; i < bit_pack.size(); i++){
                        voter_inputs[voterInfo.input_ports[i]] = bit_pack[i].sigbit;
                        // voter_input.append(bit_pack[i].sigbit);
                    }
                    std::string voter_name = "\\" + RTLIL::unescape_id(bit.sigbit.wire->name) + \
                                                "_VOTER_" + std::to_string(bit.sigbit.offset);
                    // add the voter now
                    // RTLIL::Cell *voter = module->addLut(voter_name, voter_input, voter_output, RTLIL::Const::from_string("8'11101000"));
                    RTLIL::Cell *voter_other = module->addCell(voter_name, "\\" + voterInfo.cell_type);
                    // voter_other->setPort("\\I", voter_input);
                    for (auto voter_input_entry: voter_inputs){
                        voter_other->setPort(voter_input_entry.first, voter_input_entry.second);
                    }
                    voter_other->setPort(voterInfo.output_ports[0], voter_output);
                    voter_cnt++;
                }
            }
        }
    }

    bool check_voter_insertion() {
        return false;
    }

    std::string remove_suffix_from_name(std::string name, std::string suffix) {
        size_t position = name.find(suffix);
        if (position != std::string::npos) {
            name.erase(position - 1, suffix.length()+3);
        }
        return name;
    }

public:
    InsertVoterWorker(std::string new_suffix, int amount_of_copies, std::string voter_type) {
        suffix = new_suffix;
        copy_amount = amount_of_copies;
        voterInfo.cell_type = voter_type;
    }

    void run(Design* design) {

        initialize_output_port_map();
        initialize_voter_information(design);
        
        for (auto module: design->modules()) {
            std::map<std::string, InsertionPointPack>  insertion_points = find_points_after_ff(module, suffix);
            std::map<std::string, InsertionPointPack>  reduction_insertion_points = find_reduction_points(module, suffix);
            for (auto point: reduction_insertion_points) {
                insertion_points[point.first] = point.second;
            }
            insert_voters(module, insertion_points);
            module->fixup_ports();
        }
        log("Inserted %d Voters\n", voter_cnt);
    }
};

// create a new module. Iterate through each cell and wire in the old module and copy it to the new module <copy_amount> times.
struct ApplyTMRPass : public Pass {
    ApplyTMRPass() : Pass("apply_tmr") { }
    void help() override {

        log("\n");
        log("TODO put information about command and arguments here\n");
    }

    void execute(vector<string> args, Design* design) override {

        std::string suffix = "TMR";
        int copy_amount = 3;
        std::string voter_type = "LUT3";

        log_header(design, "Executing APPLY_TMR Pass\n");

        size_t argidx;
        for (argidx = 1; argidx < args.size(); argidx++) {
            if (args[argidx] == "-suffix") {
                suffix = args[++argidx];
                // std::cout << "got suffix argument as " << suffix << "\n";
            }
            else if (args[argidx] == "-amount") {
                const char *str = (args[++argidx]).c_str();
                copy_amount = atoi(str);
                // std::cout << "got copy amount argument as " << copy_amount << "\n";
            }
            else if (args[argidx] == "-voter") {
                voter_type = (args[++argidx]);
                // std::cout << "got copy amount argument as " << copy_amount << "\n";
            }
        }

        ReplicationWorker worker = ReplicationWorker(copy_amount);
        RTLIL::Design *new_design = worker.run(design, suffix);
        yosys_design = new_design; // set the new design as THE design.

        // InsertVoterWorker voter_worker = InsertVoterWorker(suffix, copy_amount, voter_type);
        // voter_worker.run(new_design);
        
    }
} ApplyTMRPass;

PRIVATE_NAMESPACE_END