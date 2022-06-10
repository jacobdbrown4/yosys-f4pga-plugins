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
            // std::cout << key << "--->" << key_for_original << "\n";
            // if (original_connections.count(key_for_original)){
            //     // std::cout << key_for_original << " works\n";
            // }
            // else {
            //     // std::cout << key_for_original << " does not work\n";
            // }
            std::set<string> original_set = original_connections.at(key_for_original);
            if (map_entry.second.size() != original_set.size()) {
                log("NOT MATCHED WARNING: Replicated connections Size of %ld does not equal original connections size of %ld\n", \
                        map_entry.second.size(),original_set.size());
            }
            for (auto replicated_name: map_entry.second) {
                std::string original_name = remove_suffix_from_name(replicated_name, suffix);
                if (original_set.find(original_name) == original_set.end()) {
                    // std::cout << "NOT MATCH: " << replicated_name << "\n";
                    if (original_set.find(original_name.substr(1)) != original_set.end()) {
                        // std::cout << "REMOVED \\ AND IT MATCHED: " << replicated_name << "-->" << *(original_set.find(original_name.substr(1))) << "\n";
                        // log("MATCH: %s %s\n", replicated_name, original_name);
                        // << replicated_name << "-->" << *(original_set.find(original_name.substr(1))) << "\n";
                    }
                    else {
                        // std::cout << "NOT MATCH: " << replicated_name << "\n";
                        matches = false;
                    }
                }
                else {
                    // std::cout << "MATCH: " << replicated_name << "-->" << *(original_set.find(original_name)) << "\n";
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

    RTLIL::Design* replicate_design(RTLIL::Design *original_design, std::string suffix) {
        RTLIL::Design *new_design = new RTLIL::Design;
        yosys_design = new_design; // set the new design as THE design.
        
        for (auto module: original_design->modules()) {
            log("Replicating module: %s\n", log_id(module));
            replicate_module(new_design, module, suffix);
            std::cout << "here\n";
            log("\n");
        }
        for (auto cell: non_leaf_cells) {
            // std::cout << RTLIL::unescape_id(cell->name) << " from module " << RTLIL::unescape_id(cell->module->name) << "\n";
            fix_non_leaf_cell_connections(cell->module, cell, suffix);
        }
        return new_design;
    }

    void replicate_module(RTLIL::Design *new_design, RTLIL::Module *module, std::string suffix) {
        RTLIL::Module *new_module = new_design->addModule("\\" + RTLIL::unescape_id(module->name));
        replicate_wires(module, new_module, suffix);
        replicate_cells(module, new_module, suffix);
        ReplicationChecker checker = ReplicationChecker();
        checker.run(module, new_module, suffix);
        std::cout << "here after checker\n";
        connect_wire_connections(module, new_module, suffix);
        // for (auto sigsig: module->connections()) {
        //     RTLIL::SigSpec sigspec_one = sigsig.first;
        //     RTLIL::SigSpec sigspec_two = sigsig.second;
        //     std::cout << std::to_string(GetSize(sigspec_one)) << " connects to " << std::to_string(GetSize(sigspec_two)) << "\n";
        //     for (int i = 0; i < GetSize(sigspec_one); i++) {
        //         std::cout << "\t" << RTLIL::unescape_id(sigspec_one[i].wire->name) << " connects to " << RTLIL::unescape_id(sigspec_two[i].wire->name) << "\n";
        //     }
        // }
    }

    void connect_wire_connections(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix) {
        std::cout << "connecting wire connections\n";
        for (auto sigsig: old_module->connections()) {
            RTLIL::SigSpec sigspec_one = sigsig.first;
            RTLIL::SigSpec sigspec_two = sigsig.second;
            std::cout << std::to_string(GetSize(sigspec_one)) << " connects to " << std::to_string(GetSize(sigspec_two)) << "\n";
            for (int i = 0; i < GetSize(sigspec_one); i++) {
                // std::cout << "\t" << RTLIL::unescape_id(sigspec_one[i].wire->name) << " connects to " << RTLIL::unescape_id(sigspec_two[i].wire->name) << "\n";
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
                    // if (replicated_wire_one == nullptr || replicated_wire_two == nullptr) {
                    //     std::cout << "null wires!\n";
                    // }

                    RTLIL::SigSig new_sigsig = std::pair<RTLIL::SigSpec, RTLIL::SigSpec>(new_sigspec_one, new_sigspec_two);
                    new_module->connect(new_sigsig);
                    // std::cout << "Connected " << RTLIL::unescape_id(replicated_wire_one->name) << "[" << std::to_string(sigspec_one[i].offset) << "]" << 
                    //  " to " << RTLIL::unescape_id(replicated_wire_two->name)  << "[" << std::to_string(sigspec_two[i].offset) << "]" << "\n";
                    // RTLIL::Wire *old_wire = new_module->wire("\\" + wire_chunk_name);
                }
            }
        }
    }

    void replicate_wires(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix) {
        for (auto wire: old_module->wires()) { // copy wires over
            for (int i = 0; i < copy_amount; i++) {
                std::string new_name = "\\" + RTLIL::unescape_id(wire->name) + "_" + suffix + "_" + std::to_string(i);
                // std::cout << new_name << " is the wire's new name. Original name was: " << RTLIL::unescape_id(wire->name) << "\n";
                RTLIL::Wire *new_wire = new_module->addWire(new_name, wire);
                log("Replicated wire %s into wire %s\n", log_id(wire), log_id(new_wire));
                new_module->fixup_ports();
            }
        }
    }

    void replicate_cells(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix) {
        for (auto cell: old_module->cells()) { // copy cells over
            std::string cell_type = RTLIL::unescape_id(cell->type);
            std::string cell_name = RTLIL::unescape_id(cell->name);
            if (cell_type.substr(0,1) != "$" || cell_name.substr(0,1) != "$") {
                std::cout << "got a custom type for ya: " << cell_type << "\n";
                // even if it's not a leaf cell, we need to add it to the new module
                RTLIL::Cell *new_cell = new_module->addCell("\\" + RTLIL::unescape_id(cell->name), cell);
                new_cell->type = "\\" + cell_type;
                non_leaf_cells.push_back(new_cell);
                continue;
            }
            for (int i = 0; i < copy_amount; i++) {
                std::string new_name = RTLIL::unescape_id(cell->name) + "_" + suffix + "_" + std::to_string(i);
                RTLIL::Cell *new_cell = new_module->addCell(new_name, cell);
                log("Replicated cell %s into cell %s\n", log_id(cell), log_id(new_cell));

                // std::cout << "BEFORE:\n";
                // print_connections(new_cell);
                
                fix_cell_connections(new_module, new_cell, i, suffix);      

                // std::cout << "AFTER:\n";
                // print_connections(new_cell);
                new_module->fixup_ports();
            }
        }
    }

    void fix_cell_connections(RTLIL::Module *new_module, RTLIL::Cell *new_cell, int i, std::string suffix) {
        for (auto &connection: new_cell->connections()) {

            unsigned int chunk_count = 0;
            std::string id_string = RTLIL::unescape_id(connection.first);
            RTLIL::SigSpec sigspec = connection.second;
            std::vector<RTLIL::SigChunk> current_chunks; 

            for (auto chunk: sigspec.chunks()) {
                // std::cout << "on chunk " << std::to_string(chunk_count) << "\n";
                if (chunk.wire == nullptr) {
                    // std::cout << id_string << " has a chunk with no wire\n";
                    // for (auto bit: sigspec.bits()) {
                    //     std::cout << "\tbut he's got a bit\n";
                    //     if (bit.wire != nullptr) {
                    //         std::cout << "\t\tand that bit has a wire\n";
                    //     }
                    //     else {
                    //         std::cout << "\t\tbut no wire\n";
                    //     }
                    // }
                    RTLIL::SigChunk* new_chunk = new RTLIL::SigChunk(chunk);
                    current_chunks.push_back(*new_chunk);
                    chunk_count++;
                    continue;
                }
                std::string wire_chunk_name = RTLIL::unescape_id(chunk.wire->name);
                RTLIL::Wire *replicated_wire = new_module->wire("\\" + wire_chunk_name + "_" + suffix + "_" + std::to_string(i));

                RTLIL::Wire *old_wire = new_module->wire("\\" + wire_chunk_name);

                chunk.wire = replicated_wire;
                current_chunks.push_back(chunk);
                chunk_count++;
            }

            RTLIL::SigSpec *new_sigspec = new RTLIL::SigSpec();
            for (auto a_chunk: current_chunks){
                new_sigspec->append(RTLIL::SigSpec(a_chunk));
            }
            
            // std::cout << "New SigSpec stats:\n";
            // for (auto a_chunk: new_sigspec->chunks()) {
            //     if (a_chunk.wire != nullptr) {
            //         std::cout << "\t" << RTLIL::unescape_id(a_chunk.wire->name) << "\n";
            //     }
            //     else {
            //         std::cout << "\tNULL\n";
            //     }
            // }
            // std::cout << "now setting port\n";
            new_cell->setPort(connection.first, *new_sigspec);
            // std::cout << "done with that now\n";
            // new_module->fixup_ports();
            // new_connections.insert(std::pair<RTLIL::IdString, RTLIL::SigSpec>(connection.first, new_sigspec));
        }
    }

    void fix_non_leaf_cell_connections(RTLIL::Module *new_module, RTLIL::Cell *new_cell, std::string suffix) {
        for (auto &connection: new_cell->connections()) {
            bool unset_already = false;
            // unsigned int chunk_count = 0;
            std::string id_string = RTLIL::unescape_id(connection.first);
            // std::string suffix_key = extract_suffix_key_from_name(id_string, suffix);
            // std::cout << suffix_key << " is the suffix key\n";
            RTLIL::SigSpec sigspec = connection.second;
            for (int i = 0; i < copy_amount; i++) {
                std::string suffix_key = "_" + suffix + "_" + std::to_string(i);
                std::vector<RTLIL::SigChunk> current_chunks; 
                // std::cout << "Old SigSpec stats:\n";
                // for (auto a_chunk: sigspec.chunks()) {
                //     std::cout << id_string + suffix_key << "\n";
                //     if (a_chunk.wire != nullptr) {
                //         std::cout << "\t" << RTLIL::unescape_id(a_chunk.wire->name) << " of module " \
                //                 << RTLIL::unescape_id(a_chunk.wire->module->name) << "\n";
                //     }
                //     else {
                //         std::cout << "\tNULL\n";
                //     }
                // }
                for (auto chunk: sigspec.chunks()) {
                    // std::cout << "on chunk " << std::to_string(chunk_count) << "\n";

                    if (chunk.wire == nullptr) {
                        std::cout << id_string << " has a chunk with no wire\n";
                        RTLIL::SigChunk* new_chunk = new RTLIL::SigChunk(chunk);
                        current_chunks.push_back(*new_chunk);
                        // chunk_count++;
                        continue;
                    }
                    std::string wire_chunk_name = RTLIL::unescape_id(chunk.wire->name);
                    std::string replicated_wire_name = "\\" + wire_chunk_name + suffix_key;
                    RTLIL::Wire *replicated_wire = new_module->wire(replicated_wire_name);
                    // if (replicated_wire == nullptr) {
                    //     std::cout << "didn't get it: " << replicated_wire_name << "\n";
                    // }

                    RTLIL::Wire *old_wire = new_module->wire("\\" + wire_chunk_name);
                    RTLIL::SigChunk* new_chunk = new RTLIL::SigChunk(chunk);
                    new_chunk->wire = replicated_wire;
                    // new_chunk->wire->module = new_module;
                    // chunk.wire->module = new_module;
                    current_chunks.push_back(*new_chunk);
                    // chunk_count++;
                }

                RTLIL::SigSpec *new_sigspec = new RTLIL::SigSpec();
                for (auto a_chunk: current_chunks){
                    new_sigspec->append(RTLIL::SigSpec(a_chunk));
                }
                
                // std::cout << "New SigSpec stats:\n";
                // for (auto a_chunk: new_sigspec->chunks()) {
                //     std::cout << id_string + suffix_key << "\n";
                //     if (a_chunk.wire != nullptr) {
                //         std::cout << "\t" << RTLIL::unescape_id(a_chunk.wire->name) << " of module " \
                //                 << RTLIL::unescape_id(a_chunk.wire->module->name) << "\n";
                //     }
                //     else {
                //         std::cout << "\tNULL\n";
                //     }
                // }
                if (!unset_already) {
                    new_cell->unsetPort(connection.first);
                    unset_already = true;
                }
                // std::cout << "now setting port\n";
                std::string new_id_string = "\\" + id_string + suffix_key;
                new_cell->setPort(new_id_string, *new_sigspec);
                // new_cell->setPort(connection.first, *new_sigspec);
            }
            // std::cout << "done with that now\n";
            new_module->fixup_ports();
            // new_connections.insert(std::pair<RTLIL::IdString, RTLIL::SigSpec>(connection.first, new_sigspec));
        }
        // print_connections(new_cell);
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
        std::cout << to_write;
    }


public:
    ReplicationWorker(int amount_of_copies) {
        copy_amount = amount_of_copies;
    }

    RTLIL::Design* run(RTLIL::Design *original_design, std::string suffix) {
        return replicate_design(original_design, suffix);
    }
};

struct InsertionPoint_1 {
    RTLIL::Cell *cell;
    RTLIL::IdString port_name;
    RTLIL::SigChunk chunk;
};

struct InsertionPoint_2 {
    RTLIL::Cell *cell;
    RTLIL::IdString port_name;
    RTLIL::SigSpec cell_orig_output;
};

typedef InsertionPoint_2 InsertionPoint;

struct InsertionPointPack {
    std::vector<InsertionPoint> points;
};

typedef InsertionPointPack InsertionPointPack;


struct InsertVoterWorker {
    private:
    std::string ff_names[3] = {"$dff", "$sdff", "$_DFF_P_"};
    std::string suffix;
    int copy_amount = 3;
    std::map<std::string, std::string> type_to_output_port;

    void initialize_output_port_map() {
        type_to_output_port.insert(std::pair<std::string, std::string>("$dff", "Q"));
        type_to_output_port.insert(std::pair<std::string, std::string>("$sdff", "Q"));
        type_to_output_port.insert(std::pair<std::string, std::string>("$_DFF_P_", "Q"));
    }

    // std::map<std::string, std::vector<std::pair<RTLIL::Cell*, RTLIL::IdString>>> find_points_after_ff_2(RTLIL::Module *module, std::string suffix) {
    //     std::map<std::string, std::vector<std::pair<RTLIL::Cell*, RTLIL::IdString>>> insertion_points;
    //     for (auto cell: module->cells()) {
    //         std::cout << "next_cell: " << RTLIL::unescape_id(cell->name) << "\n";
    //         std::string cell_type = RTLIL::unescape_id(cell->type);
    //         if (std::find(std::begin(ff_names), std::end(ff_names), cell_type) == std::end(ff_names)) {
    //             continue;
    //         }
    //         std::string output_port_name = type_to_output_port.at(cell_type);
    //         RTLIL::SigSpec sigspec = cell->getPort("\\" + output_port_name);
    //         for (auto chunk : sigspec.chunks()) {
    //             if (chunk.wire == nullptr) {
    //                 continue;
    //             }
    //             RTLIL::Wire *output_wire = chunk.wire;
    //             std::cout << "\toutput wire: " << RTLIL::unescape_id(output_wire->name) << " from sigchunk of width " << \
    //                     std::to_string(chunk.width) << "\n";
    //             std::string original_wire_name = remove_suffix_from_name(RTLIL::unescape_id(output_wire->name), suffix);
    //             insertion_points[original_wire_name].push_back(std::pair<RTLIL::Cell*, RTLIL::IdString>(cell, "\\" + output_port_name));
    //         }
    //     }
    //     return insertion_points;
    // }

    std::map<std::string, std::vector<InsertionPoint>> find_points_after_ff_2(RTLIL::Module *module, std::string suffix) {
        std::map<std::string, std::vector<InsertionPoint>> insertion_points;
        for (auto cell: module->cells()) {
            std::cout << "next_cell: " << RTLIL::unescape_id(cell->name) << "\n";
            std::string cell_type = RTLIL::unescape_id(cell->type);
            if (std::find(std::begin(ff_names), std::end(ff_names), cell_type) == std::end(ff_names)) {
                continue;
            }
            std::string output_port_name = type_to_output_port.at(cell_type);
            RTLIL::SigSpec sigspec = cell->getPort("\\" + output_port_name);
            for (auto chunk : sigspec.chunks()) {
                if (!chunk.is_wire()) {
                    continue;
                }
                RTLIL::Wire *output_wire = chunk.wire;
                std::cout << "\toutput wire: " << RTLIL::unescape_id(output_wire->name) << " from sigchunk of width " << \
                        std::to_string(chunk.width) << " and offset " << std::to_string(chunk.offset) << "\n";
                std::string original_wire_name = remove_suffix_from_name(RTLIL::unescape_id(output_wire->name), suffix) + \
                                                "_" + std::to_string(chunk.offset);
                InsertionPoint point = {cell, "\\" + output_port_name, chunk};
                std::cout << "'\toriginal wire name: " << original_wire_name << "\n";
                insertion_points[original_wire_name].push_back(point);
            }
        }
        return insertion_points;
    }

    std::map<std::string, InsertionPointPack> find_points_after_ff_3(RTLIL::Module *module, std::string suffix) {
        std::cout << "in find points 3\n";
        // create a map from original cell name to an InsertionPointPack containing InsertionPoints for the replica cells
        std::map<std::string, InsertionPointPack> insertion_points;
        for (auto cell: module->cells()) {
            std::cout << "next_cell: " << RTLIL::unescape_id(cell->name) << "\n";
            std::string cell_type = RTLIL::unescape_id(cell->type);
            if (std::find(std::begin(ff_names), std::end(ff_names), cell_type) == std::end(ff_names)) {
                continue;
            }
            // std::cout << "here\n";
            std::string output_port_name = type_to_output_port.at(cell_type);
            // std::cout << "output port name is " << output_port_name << "\n";
            RTLIL::SigSpec sigspec = cell->getPort("\\" + output_port_name);
            std::cout << "here\n";
            std::string cell_original_name = remove_suffix_from_name(RTLIL::unescape_id(cell->name), suffix);
            std::cout << "Map key: " << cell_original_name << " for cell " << log_id(cell) << "\n";

            InsertionPoint point = {cell, "\\" + output_port_name, sigspec};
            insertion_points[cell_original_name].points.push_back(point);
        }
        std::cout << "returning insertion points\n";
        return insertion_points;
    }

    void insert_voters_3(RTLIL::Module *module, std::map<std::string, InsertionPointPack> insertion_points) {
        std::cout << "inserting voters\n";
        for (auto map_entry: insertion_points) {
            std::cout << "\nEntry: " << map_entry.first << "\n";
            std::vector<InsertionPoint> points = map_entry.second.points;
            std::vector<RTLIL::SigSpec> cell_old_outputs;
            std::vector<RTLIL::SigSpec> cell_new_outputs;
            int point_count = 0;
            for (auto point: points) {
                point_count++;
                std::cout << "next point\n";
                // old_cell_output = point.cell->getPort(point.port_name);
                RTLIL::Cell *cell = point.cell;
                RTLIL::SigSpec old_output = point.cell_orig_output;
                cell_old_outputs.push_back(old_output);
                // RTLIL::SigChunk old_chunk = point.chunk;
                // old_cell_output_chunks.push_back(old_chunk);

                /* new strategy: figure out the wire name from cell output to voter. Get the wire but create it if needed.
                 */

                std::string new_name = "\\" + RTLIL::unescape_id(old_output[0].wire->name) + \
                                            "_VOTER_wire_" + std::to_string(old_output[0].offset);
                RTLIL::Wire *new_wire = module->wire(new_name);
                if (new_wire == nullptr) {
                    new_wire = module->addWire(new_name, old_output[0].wire);
                }
                std::cout << "old output size is " << std::to_string(GetSize(old_output)) << "\n";
                std::cout << "old output[0].wire size is " << GetSize(old_output[0].wire) << "\n";
                std::cout << "old output[0]'s offset is " << std::to_string(old_output[0].offset) << "\n";
                // RTLIL::Wire *new_wire = module->addWire(new_name, GetSize(old_output)); // make sure new wire width is same as the old output width
                //RTLIL::*new_wire = module->addWire(new_name, old_output[0].wire);
                std::cout << "new_wire size is " << GetSize(new_wire) << "\n";
                // RTLIL::SigChunk new_cell_output_chunk = SigChunk(new_wire, old_chunk.offset, old_chunk.width);
                new_wire->port_output = false;
                new_wire->port_input = false;
                RTLIL::SigSpec new_cell_output = SigSpec(new_wire, old_output[0].offset);
                // new_cell_output_chunks.push_back(new_cell_output_chunk);
                cell->setPort(point.port_name, new_cell_output);
                cell_new_outputs.push_back(new_cell_output);
                std::cout << "Just set port named " << log_id(point.port_name) << "\n";

                std::cout << "Voter wire name is " << new_name << "\n";
                
                // for (int i = 0; i < old_chunk.size(); i++ ) {
                //     std::cout << "here with " << std::to_string(i) << "\n";
                //     RTLIL::SigChunk voter_output = SigChunk(new_wire, i, 1);
                //     index_to_chunk_for_voter_output[i].push_back(voter_output);
            }

            RTLIL::SigSpec combined_voter_input = SigSpec();
            for (int i = 0; i < cell_new_outputs.size(); i++) {
                combined_voter_input.append(cell_new_outputs[i]);
            }

            for (int i = 0; i < cell_old_outputs.size(); i++) {
                std::string lut_name = "\\" + RTLIL::unescape_id(cell_old_outputs[i][0].wire->name) + "_VOTER" + \
                                        "_" + std::to_string(cell_old_outputs[i][0].offset);
                if (lut_name == "\\buttonPush_TMR_2_VOTER_0") {
                    std::cout << "here for " << lut_name << "\n";
                    std::cout << "his output sigspec size is " << GetSize(cell_old_outputs[i]) << "\n";
                    std::cout << "his input sigspec size is " << GetSize(combined_voter_input) << "\n";
                    std::cout << "point count was " << std::to_string(point_count) << "\n"; 
                }
                RTLIL::Cell *lut = module->addLut(lut_name, combined_voter_input, cell_old_outputs[i], RTLIL::Const::from_string("8'11101000"));

            }
            module->fixup_ports();
            //     // std::cout << "here for copy number " << std::to_string(i) << "\n";
            //     // std::cout << "old chunks size is " << std::to_string(old_cell_output_chunks.size()) << "\n";
            //     // std::cout << "new chunks size is " << std::to_string(new_cell_output_chunks.size()) << "\n";
            //     std::string lut_inputs;
            //     RTLIL::SigSpec sigspec_lut_in = SigSpec();
            //     for (auto chunk: new_cell_output_chunks) {
            //         sigspec_lut_in.append(chunk);
            //         lut_inputs+=log_id(chunk.wire);
            //         lut_inputs+=" ";
            //         std::cout << "\tappended chunk with wire name: " << RTLIL::unescape_id(chunk.wire->name) << "\n";
            //     }
            //     RTLIL::SigSpec sigspec_lut_out = SigSpec(old_cell_output_chunks[i]);
            //     std::string lut_name = "\\" + RTLIL::unescape_id(old_cell_output_chunks[i].wire->name) + "_VOTER" + \
            //                             "_" + std::to_string(old_cell_output_chunks[i].offset);
            //     std::cout << "Adding voter by name of " << lut_name << "\n";
            //     RTLIL::Cell *lut = module->addLut(lut_name, sigspec_lut_in, sigspec_lut_out, RTLIL::Const::from_string("8'11101000"));
            //     std::cout << "Voter by name of " << log_id(lut) << " inputs from " << lut_inputs << " and outputs to " <<
            //                 log_id(old_cell_output[0].wire) << "\n";
            // }

            std::cout << "done\n";
            // }





        }
    }

    typedef struct SigBitInfo {
        RTLIL::SigBit sigbit; // new wire to go between cell and voter
        RTLIL::Cell *cell; // the cell
        RTLIL::IdString port_name;
        RTLIL::SigBit original;
        bool port_reset;
    } SigBitInfo;

    typedef struct SigBitPack {
        std::vector<SigBitInfo> bit_pack;
    } SigBitPack;

    // create map from output wire name (without suffix) to the three new wires (SigBits) that will exit each cell and input to each voter.
    std::map<std::string, SigBitPack> arrangePointPackBits(RTLIL::Module *module, std::map<std::string, InsertionPointPack> insertion_points) {
        std::cout << "in arrangePointPackBits\n";
        std::map<std::string, SigBitPack> new_sigbit_map;
        for (auto map_entry: insertion_points) {
            std::cout << "Entry: " << map_entry.first << "\n";
            std::vector<InsertionPoint> points = map_entry.second.points;
            for (auto point: points) {
                std::cout << "next point\n";
                RTLIL::SigSpec original_output = point.cell_orig_output;

                // make sure new wires exist for all the chunks in the sigspec
                for (auto chunk: original_output.chunks()) {
                    std::cout << "\tnext chunk\n";
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
                    std::cout << "\tnext bit\n";
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
                    SigBitInfo info = {new_sigbit, point.cell, point.port_name, bit, false};
                    new_sigbit_map[plain_name].bit_pack.push_back(info);
                    std::cout << "entered a sigbit under " << plain_name << "\n";
                }

            }
        }
        std::cout << "done arranging \n";
        return new_sigbit_map;
    }

    void insert_voters_4(RTLIL::Module *module, std::map<std::string, InsertionPointPack> insertion_points) {
        std::cout << "in insert_voters_4\n";
        std::map<std::string, SigBitPack> new_sigbit_map = arrangePointPackBits(module, insertion_points);
        // std::map<RTLIL::Cell*, bool> cell_set_or_not;
        std::vector<RTLIL::Cell*> cells_set;
        for (auto map_entry: new_sigbit_map) {
            std::cout << "original bit wire: " << map_entry.first << "\n";
            std::vector<SigBitInfo> bit_pack = map_entry.second.bit_pack;
            for (auto bit: bit_pack) {
                std::cout << "bit_pack size is " << std::to_string(bit_pack.size()) << "\n";

                // disconnect the cell from original output and connect to new sigbit
                if (std::find(cells_set.begin(), cells_set.end(), bit.cell) == cells_set.end()) {
                    std::cout << "setting port " << RTLIL::unescape_id(bit.port_name) << " for cell " << RTLIL::unescape_id(bit.cell->name) << "\n";
                    RTLIL::SigSpec new_sigspec = SigSpec();
                    bit.cell->setPort(bit.port_name, new_sigspec);
                    // bit.port_reset = true;
                    cells_set.push_back(bit.cell);
                }
                // bit.cell->setPort(bit.port_name, bit.sigbit);
                bit.sigbit.wire->port_output = false;
                RTLIL::SigSpec cell_output = bit.cell->getPort(bit.port_name);
                cell_output.append(bit.sigbit);
                bit.cell->setPort(bit.port_name, cell_output);

                RTLIL::SigSpec voter_output = bit.original;
                RTLIL::SigSpec voter_input = SigSpec();
                for (unsigned int i = 0; i < bit_pack.size(); i++){
                    voter_input.append(bit_pack[i].sigbit);
                }
                std::string voter_name = "\\" + RTLIL::unescape_id(bit.sigbit.wire->name) + \
                                            "_VOTER_" + std::to_string(bit.sigbit.offset);
                // add the voter now
                RTLIL::Cell *voter = module->addLut(voter_name, voter_input, voter_output, RTLIL::Const::from_string("8'11101000"));
                



            }
        }
        // std::cout << "inserting voters\n";
        // for (auto map_entry: insertion_points) {
        //     std::cout << "\nEntry: " << map_entry.first << "\n";
        //     std::vector<InsertionPoint> points = map_entry.second.points;
        //     std::vector<RTLIL::SigSpec> cell_old_outputs;
        //     std::vector<RTLIL::SigSpec> cell_new_outputs;
        //     int point_count = 0;
        //     for (auto point: points) {
        //         point_count++;
        //         std::cout << "next point\n";
        //         // old_cell_output = point.cell->getPort(point.port_name);
        //         RTLIL::Cell *cell = point.cell;
        //         RTLIL::SigSpec old_output = point.cell_orig_output;
        //         cell_old_outputs.push_back(old_output);
        //         // RTLIL::SigChunk old_chunk = point.chunk;
        //         // old_cell_output_chunks.push_back(old_chunk);

        //         /* new strategy: figure out the wire name from cell output to voter. Get the wire but create it if needed.
        //          */

        //         std::string new_name = "\\" + RTLIL::unescape_id(old_output[0].wire->name) + \
        //                                     "_VOTER_wire_" + std::to_string(old_output[0].offset);
        //         RTLIL::Wire *new_wire = module->wire(new_name);
        //         if (new_wire == nullptr) {
        //             new_wire = module->addWire(new_name, old_output[0].wire);
        //         }
        //         std::cout << "old output size is " << std::to_string(GetSize(old_output)) << "\n";
        //         std::cout << "old output[0].wire size is " << GetSize(old_output[0].wire) << "\n";
        //         std::cout << "old output[0]'s offset is " << std::to_string(old_output[0].offset) << "\n";
        //         // RTLIL::Wire *new_wire = module->addWire(new_name, GetSize(old_output)); // make sure new wire width is same as the old output width
        //         //RTLIL::*new_wire = module->addWire(new_name, old_output[0].wire);
        //         std::cout << "new_wire size is " << GetSize(new_wire) << "\n";
        //         // RTLIL::SigChunk new_cell_output_chunk = SigChunk(new_wire, old_chunk.offset, old_chunk.width);
        //         new_wire->port_output = false;
        //         new_wire->port_input = false;
        //         RTLIL::SigSpec new_cell_output = SigSpec(new_wire, old_output[0].offset);
        //         // new_cell_output_chunks.push_back(new_cell_output_chunk);
        //         cell->setPort(point.port_name, new_cell_output);
        //         cell_new_outputs.push_back(new_cell_output);
        //         std::cout << "Just set port named " << log_id(point.port_name) << "\n";

        //         std::cout << "Voter wire name is " << new_name << "\n";
                
        //         // for (int i = 0; i < old_chunk.size(); i++ ) {
        //         //     std::cout << "here with " << std::to_string(i) << "\n";
        //         //     RTLIL::SigChunk voter_output = SigChunk(new_wire, i, 1);
        //         //     index_to_chunk_for_voter_output[i].push_back(voter_output);
        //     }

        //     RTLIL::SigSpec combined_voter_input = SigSpec();
        //     for (int i = 0; i < cell_new_outputs.size(); i++) {
        //         combined_voter_input.append(cell_new_outputs[i]);
        //     }

        //     for (int i = 0; i < cell_old_outputs.size(); i++) {
        //         std::string lut_name = "\\" + RTLIL::unescape_id(cell_old_outputs[i][0].wire->name) + "_VOTER" + \
        //                                 "_" + std::to_string(cell_old_outputs[i][0].offset);
        //         if (lut_name == "\\buttonPush_TMR_2_VOTER_0") {
        //             std::cout << "here for " << lut_name << "\n";
        //             std::cout << "his output sigspec size is " << GetSize(cell_old_outputs[i]) << "\n";
        //             std::cout << "his input sigspec size is " << GetSize(combined_voter_input) << "\n";
        //             std::cout << "point count was " << std::to_string(point_count) << "\n"; 
        //         }
        //         RTLIL::Cell *lut = module->addLut(lut_name, combined_voter_input, cell_old_outputs[i], RTLIL::Const::from_string("8'11101000"));

        //     }
        //     module->fixup_ports();
        // }
    }

    // void insert_voters(RTLIL::Module *module, std::map<std::string, std::vector<InsertionPoint>> insertion_points) {
    //     std::cout << "inserting voters\n";
    //     for (auto map_entry: insertion_points) {
    //         std::cout << "\nEntry: " << map_entry.first << "\n";

    //         std::vector<InsertionPoint> points = map_entry.second;

    //         std::vector<RTLIL::SigChunk> new_cell_output_chunks;
    //         std::map<int, std::vector<RTLIL::SigChunk>> index_to_chunk_for_voter_output;
    //         std::vector<RTLIL::SigChunk> old_cell_output_chunks;
    //         RTLIL::SigSpec old_cell_output;
    //         for (auto point: points) {
    //             std::cout << "next point\n";
    //             old_cell_output = point.cell->getPort(point.port_name);
    //             RTLIL::Cell *cell = point.cell;
    //             RTLIL::SigChunk old_chunk = point.chunk;
    //             old_cell_output_chunks.push_back(old_chunk);

    //             std::string new_name = "\\" + RTLIL::unescape_id(old_chunk.wire->name) + \
    //                                         "_VOTER_wire_" + std::to_string(old_chunk.offset);
    //             RTLIL::Wire *new_wire = module->addWire(new_name, old_chunk.wire);
    //             RTLIL::SigChunk new_cell_output_chunk = SigChunk(new_wire, old_chunk.offset, old_chunk.width);
    //             new_cell_output_chunks.push_back(new_cell_output_chunk);
    //             cell->setPort(point.port_name, new_cell_output_chunk);

    //             std::cout << "Voter wire name is " << new_name << "\n";
                
    //             // for (int i = 0; i < old_chunk.size(); i++ ) {
    //             //     std::cout << "here with " << std::to_string(i) << "\n";
    //             //     RTLIL::SigChunk voter_output = SigChunk(new_wire, i, 1);
    //             //     index_to_chunk_for_voter_output[i].push_back(voter_output);
    //         }
    //         for (int i = 0; i < copy_amount; i++) {
    //             // std::cout << "here for copy number " << std::to_string(i) << "\n";
    //             // std::cout << "old chunks size is " << std::to_string(old_cell_output_chunks.size()) << "\n";
    //             // std::cout << "new chunks size is " << std::to_string(new_cell_output_chunks.size()) << "\n";
    //             std::string lut_inputs;
    //             RTLIL::SigSpec sigspec_lut_in = SigSpec();
    //             for (auto chunk: new_cell_output_chunks) {
    //                 sigspec_lut_in.append(chunk);
    //                 lut_inputs+=log_id(chunk.wire);
    //                 lut_inputs+=" ";
    //                 std::cout << "\tappended chunk with wire name: " << RTLIL::unescape_id(chunk.wire->name) << "\n";
    //             }
    //             RTLIL::SigSpec sigspec_lut_out = SigSpec(old_cell_output_chunks[i]);
    //             std::string lut_name = "\\" + RTLIL::unescape_id(old_cell_output_chunks[i].wire->name) + "_VOTER" + \
    //                                     "_" + std::to_string(old_cell_output_chunks[i].offset);
    //             std::cout << "Adding voter by name of " << lut_name << "\n";
    //             RTLIL::Cell *lut = module->addLut(lut_name, sigspec_lut_in, sigspec_lut_out, RTLIL::Const::from_string("8'11101000"));
    //             std::cout << "Voter by name of " << log_id(lut) << " inputs from " << lut_inputs << " and outputs to " <<
    //                         log_id(old_cell_output[0].wire) << "\n";
    //         }

    //         std::cout << "done\n";
    //         // }


    //         // std::cout << "resetting cell port\n";
    //         // cell->setPort(point.port_name, )

    //         // for (auto voter_map_entry: index_to_chunk_for_voter_output) {
    //         //     int index = voter_map_entry.first;
    //         //     std::vector<RTLIL::SigChunk> voter_sig_chunks = voter_map_entry.second;
    //         //     RTLIL::SigChunk cell_output_chunk = new_cell_output_chunks[index];
    //         //     for (int i = 0; i < voter_sig_chunks.size(); i++) {
    //         //         // create a voter, connect it to the 
    //         //         std::string lut_name = "\\" + RTLIL::unescape_id(cell_output_chunk.wire->name) + "_VOTER";
    //         //         std::cout << "Voter name: " << lut_name << "\n";
    //         //         // RTLIL::Cell *lut = module->addLut(lut_name, sigspec_in, sigspec_out, RTLIL::Const::from_string("8'11101000"));

    //         //     }
    //         // }

    //     //     std::vector<std::pair<RTLIL::Cell*, RTLIL::IdString>> new_cell_wire_pairs;
    //     //     std::vector<RTLIL::Wire*> old_wires;
    //     //     std::map<int, std::vector<RTLIL::Wire*>> new_wires;

    //     //     // disconnect each cell output wire and reconnect a new wire
    //     //     for (auto pair: cell_port_pairs) {
    //     //         std::cout << "next pair\n";
    //     //         RTLIL::Cell *cell = pair.first;
    //     //         RTLIL::IdString port_name = pair.second;
    //     //         RTLIL::SigSpec sigspec = cell->getPort(port_name);
    //     //         std::vector<RTLIL::SigChunk> current_chunks;
    //     //         int i = 0;
    //     //         for (auto chunk: sigspec.chunks()) {
    //     //             old_wires.push_back(chunk.wire);
    //     //             std::string new_name = "\\" + RTLIL::unescape_id(chunk.wire->name) + \
    //     //                                     "_VOTER_" + std::to_string(chunk.offset);
    //     //             // std::cout << "new wire name: " << new_name << "\n";
    //     //             RTLIL::Wire *new_wire = module->addWire(new_name, chunk.wire);
    //     //             new_wire->port_output = false;
    //     //             // chunk.wire = new_wire;
    //     //             // new_wires.push_back(new_wire);
    //     //             if (i == 0) {
    //     //                 std::vector<RTLIL::Wire*> new_vector;
    //     //                 new_vector.push_back(new_wire);
    //     //                 new_wires.insert(std::pair<int, std::vector<RTLIL::Wire*>>(i, new_vector));
    //     //             }
    //     //             else {
    //     //                 std::vector<RTLIL::Wire*> new_vector = new_wires.at(i);
    //     //                 new_wires.insert(std::pair<int, std::vector<RTLIL::Wire*>>(i, new_vector));
    //     //             }
    //     //             std::cout << "\tpushed back new_wire: " << RTLIL::unescape_id(new_wire->name) << "\n";

    //     //             RTLIL::SigChunk* new_chunk = new RTLIL::SigChunk(chunk);
    //     //             // RTLIL::SigChunk new_chunk = chunk.extract(0, 1);
    //     //             new_chunk->wire = new_wire;
    //     //             current_chunks.push_back(*new_chunk);
    //     //             i++;
    //     //         }
    //     //         // std::cout << "here\n";
    //     //         RTLIL::SigSpec *new_sigspec = new RTLIL::SigSpec();
    //     //         int chunk_cnt = 0;
    //     //         for (auto a_chunk: current_chunks){
    //     //             new_sigspec->append(RTLIL::SigSpec(a_chunk));
    //     //         }
    //     //         // std::cout << "here\n";
    //     //         cell->setPort(port_name, *new_sigspec);
    //     //         // std::cout << "here\n";
    //     //         module->fixup_ports();
    //     //         // std::cout << "here\n";
    //     //     }            
            
    //     //     // now add luts and connect inputs to new wires and output to old wires
    //     //     for (int j = 0; j < copy_amount; j++) {
                
    //     //         RTLIL::SigSpec sigspec_in = RTLIL::SigSpec();
    //     //         for (int k = 0; k < copy_amount; k++) {
    //     //             sigspec_in.append(RTLIL::SigSpec(new_wires[j], 0, 1));
    //     //             // sigspec_in.append(RTLIL::SigSpec(new_wires[1], 0, 1));
    //     //             // sigspec_in.append(RTLIL::SigSpec(new_wires[2], 0, 1));
    //     //         }
    //     //         // std::cout << "here\n";
                
    //     //         log("old wires size is %ld while i is %d\n", old_wires.size(), i);
    //     //         RTLIL::SigSpec sigspec_out = RTLIL::SigSpec(old_wires[i], 0, 1); // putting 0,1 makes sure the size is just 1

    //     //         std::string lut_name = "\\" + RTLIL::unescape_id(old_wires[i]->name) + "_VOTER";
    //     //         std::cout << "Voter name: " << lut_name << "\n";
    //     //         RTLIL::Cell *lut = module->addLut(lut_name, sigspec_in, sigspec_out, RTLIL::Const::from_string("8'11101000"));
    //     //         module->fixup_ports();
    //     //     }
    //     }
    //     std::cout << "leaving inserting voters\n";
    // }

    // void insert_voters(RTLIL::Module *module, std::map<std::string, std::vector<std::pair<RTLIL::Cell*, RTLIL::IdString>>> insertion_points) {
    //     std::cout << "inserting voters\n";
    // //     for (auto map_entry: insertion_points) {
    // //         std::cout << map_entry.first << "\n";

    // //         std::vector<std::pair<RTLIL::Cell*, RTLIL::IdString>> cell_port_pairs = map_entry.second;
    // //         std::vector<std::pair<RTLIL::Cell*, RTLIL::IdString>> new_cell_wire_pairs;
    // //         std::vector<RTLIL::Wire*> old_wires;
    // //         std::map<int, std::vector<RTLIL::Wire*>> new_wires;

    // //         // disconnect each cell output wire and reconnect a new wire
    // //         for (auto pair: cell_port_pairs) {
    // //             std::cout << "next pair\n";
    // //             RTLIL::Cell *cell = pair.first;
    // //             RTLIL::IdString port_name = pair.second;
    // //             RTLIL::SigSpec sigspec = cell->getPort(port_name);
    // //             std::vector<RTLIL::SigChunk> current_chunks;
    // //             int i = 0;
    // //             for (auto chunk: sigspec.chunks()) {
    // //                 old_wires.push_back(chunk.wire);
    // //                 std::string new_name = "\\" + RTLIL::unescape_id(chunk.wire->name) + \
    // //                                         "_VOTER_" + std::to_string(chunk.offset);
    // //                 // std::cout << "new wire name: " << new_name << "\n";
    // //                 RTLIL::Wire *new_wire = module->addWire(new_name, chunk.wire);
    // //                 new_wire->port_output = false;
    // //                 // chunk.wire = new_wire;
    // //                 // new_wires.push_back(new_wire);
    // //                 if (i == 0) {
    // //                     std::vector<RTLIL::Wire*> new_vector;
    // //                     new_vector.push_back(new_wire);
    // //                     new_wires.insert(std::pair<int, std::vector<RTLIL::Wire*>>(i, new_vector));
    // //                 }
    // //                 else {
    // //                     std::vector<RTLIL::Wire*> new_vector = new_wires.at(i);
    // //                     new_wires.insert(std::pair<int, std::vector<RTLIL::Wire*>>(i, new_vector));
    // //                 }
    // //                 std::cout << "\tpushed back new_wire: " << RTLIL::unescape_id(new_wire->name) << "\n";

    // //                 RTLIL::SigChunk* new_chunk = new RTLIL::SigChunk(chunk);
    // //                 // RTLIL::SigChunk new_chunk = chunk.extract(0, 1);
    // //                 new_chunk->wire = new_wire;
    // //                 current_chunks.push_back(*new_chunk);
    // //                 i++;
    // //             }
    // //             // std::cout << "here\n";
    // //             RTLIL::SigSpec *new_sigspec = new RTLIL::SigSpec();
    // //             int chunk_cnt = 0;
    // //             for (auto a_chunk: current_chunks){
    // //                 new_sigspec->append(RTLIL::SigSpec(a_chunk));
    // //             }
    // //             // std::cout << "here\n";
    // //             cell->setPort(port_name, *new_sigspec);
    // //             // std::cout << "here\n";
    // //             module->fixup_ports();
    // //             // std::cout << "here\n";
    // //         }            
            
    // //         // now add luts and connect inputs to new wires and output to old wires
    // //         for (int j = 0; j < copy_amount; j++) {
                
    // //             RTLIL::SigSpec sigspec_in = RTLIL::SigSpec();
    // //             for (int k = 0; k < copy_amount; k++) {
    // //                 sigspec_in.append(RTLIL::SigSpec(new_wires[j], 0, 1));
    // //                 // sigspec_in.append(RTLIL::SigSpec(new_wires[1], 0, 1));
    // //                 // sigspec_in.append(RTLIL::SigSpec(new_wires[2], 0, 1));
    // //             }
    // //             // std::cout << "here\n";
                
    // //             log("old wires size is %ld while i is %d\n", old_wires.size(), i);
    // //             RTLIL::SigSpec sigspec_out = RTLIL::SigSpec(old_wires[i], 0, 1); // putting 0,1 makes sure the size is just 1

    // //             std::string lut_name = "\\" + RTLIL::unescape_id(old_wires[i]->name) + "_VOTER";
    // //             std::cout << "Voter name: " << lut_name << "\n";
    // //             RTLIL::Cell *lut = module->addLut(lut_name, sigspec_in, sigspec_out, RTLIL::Const::from_string("8'11101000"));
    // //             module->fixup_ports();
    // //         }
    // //     }
    // }

    bool check_voter_insertion() {
        
    }

    std::string remove_suffix_from_name(std::string name, std::string suffix) {
        size_t position = name.find(suffix);
        if (position != std::string::npos) {
            name.erase(position - 1, suffix.length()+3);
        }
        return name;
    }

public:
    InsertVoterWorker(std::string new_suffix, int amount_of_copies) {
        suffix = new_suffix;
        copy_amount = amount_of_copies;
    }

    void run(Design* design) {
        std::cout << "\nin insert_voter\n";

        initialize_output_port_map();
        
        for (auto module: design->modules()) {
            // std::vector<RTLIL::Wire*> wire_points = find_points_after_ff(module);
            // std::map<std::string, std::vector<std::pair<RTLIL::Cell*, RTLIL::IdString>>> insertion_points = find_points_after_ff_2(module, suffix);
            // std::map<std::string, std::vector<InsertionPoint>>  insertion_points = find_points_after_ff_2(module, suffix);
            std::map<std::string, InsertionPointPack>  insertion_points = find_points_after_ff_3(module, suffix);
            insert_voters_4(module, insertion_points);
            // insert_voters(module, insertion_points);
            module->fixup_ports();
        }
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
        }

        ReplicationWorker worker = ReplicationWorker(copy_amount);
        RTLIL::Design *new_design = worker.run(design, suffix);
        yosys_design = new_design; // set the new design as THE design.

        InsertVoterWorker voter_worker = InsertVoterWorker(suffix, copy_amount);
        voter_worker.run(new_design);
        
    }
} ApplyTMRPass;

PRIVATE_NAMESPACE_END