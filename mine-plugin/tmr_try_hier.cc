#include "kernel/yosys.h"

#define COPY_AMOUNT 3

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

// create a new module. Iterate through each cell and wire in the old module and copy it to the new module 3 times.

struct TMRTry : public Pass {
    TMRTry() : Pass("tmr_try_hier") { }
    std::vector<RTLIL::Cell*> non_leaf_cells;
    void execute(vector<string>, Design* design) override {
        std::cout << "in tmr_try_hier\n";
        std::string suffix = "TMR";
        RTLIL::Design *new_design = new RTLIL::Design;
        yosys_design = new_design; // set the new design as THE design.
        
        // replicate_module(new_design, design->top_module(), suffix);
        // for (auto cell: design->modules()) {
        //     // std::cout <<  RTLIL::unescape_id(cell->name) << " is type " << RTLIL::unescape_id(cell->type) << "\n";
        //     std::cout <<  RTLIL::unescape_id(cell->name) << "\n";
        // }
        for (auto module: design->modules()) {
            replicate_module(new_design, module, suffix);
        }
        for (auto cell: non_leaf_cells) {
            std::cout << RTLIL::unescape_id(cell->name) << " from module " << RTLIL::unescape_id(cell->module->name) << "\n";
            fix_non_leaf_cell_connections(cell->module, cell, suffix);
        }
        // for (auto module: new_design->modules()) {
        //     module->fixup_ports();
        // }
        // std::cout << "\nprinting connections!!!!!!!!!!!!!!\n";
        // for (auto module: new_design->modules()) {
        //     for (auto cell: module->cells()) {
        //         print_connections(cell);

        //     }
        // }
    }

    void replicate_module(RTLIL::Design *new_design, RTLIL::Module *module, std::string suffix) {
        RTLIL::Module *new_module = new_design->addModule("\\" + RTLIL::unescape_id(module->name));
        replicate_wires(module, new_module, suffix);
        replicate_cells(module, new_module, new_design, suffix);
        check_replication(module, new_module, suffix);
    }

    void replicate_wires(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix) {
        for (auto wire: old_module->wires()) { // copy wires over
            for (int i = 0; i < COPY_AMOUNT; i++) {
                std::string new_name = "\\" + RTLIL::unescape_id(wire->name) + "_" + suffix + "_" + std::to_string(i);
                // std::cout << new_name << " is the wire's new name. Original name was: " << RTLIL::unescape_id(wire->name) << "\n";
                RTLIL::Wire *new_wire = new_module->addWire(new_name, wire);
                new_module->fixup_ports();
            }
        }
    }

    void replicate_cells(RTLIL::Module *old_module, RTLIL::Module *new_module, RTLIL::Design *new_design, std::string suffix) {
        for (auto cell: old_module->cells()) { // copy cells over
            // std::cout <<  RTLIL::unescape_id(cell->name) << " is type " << RTLIL::unescape_id(cell->type) << "\n";
            std::string cell_type = RTLIL::unescape_id(cell->type);
            std::string cell_name = RTLIL::unescape_id(cell->name);
            if (cell_type.substr(0,1) != "$" || cell_name.substr(0,1) != "$") {
                std::cout << "got a custom type for ya: " << cell_type << "\n";
                // cell->type = "\\" + cell_type;
                // even if it's not a leaf cell, we need to add it to the new module
                RTLIL::Cell *new_cell = new_module->addCell("\\" + RTLIL::unescape_id(cell->name), cell);
                new_cell->type = "\\" + cell_type;
                non_leaf_cells.push_back(new_cell);
                // fix_cell_connections(new_module, new_cell, i, suffix);     
                continue;
            }
            for (int i = 0; i < COPY_AMOUNT; i++) {
                std::string new_name = RTLIL::unescape_id(cell->name) + "_" + suffix + "_" + std::to_string(i);
                // std::cout << "new name is: " << new_name << "\n";
                // RTLIL::Cell *new_cell = new_module->addCell(new_name, cell->type);
                RTLIL::Cell *new_cell = new_module->addCell(new_name, cell);

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
            for (int i = 0; i < 3; i++) {
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

    bool check_replication(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix) {
        std::cout << "\nCHECKING CONNECTIONS:\n";
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
                std::cout << "NOT MATCHED WARNING: Original Connections Size of " << original_set.size() << \
                        " does not equal replicated connections size of " << map_entry.second.size() << "\n";
            }
            for (auto replicated_name: map_entry.second) {
                std::string original_name = remove_suffix_from_name(replicated_name, suffix);
                if (original_set.find(original_name) == original_set.end()) {
                    // std::cout << "NOT MATCH: " << replicated_name << "\n";
                    if (original_set.find(original_name.substr(1)) != original_set.end()) {
                        // std::cout << "REMOVED \\ AND IT MATCHED: " << replicated_name << "-->" << *(original_set.find(original_name.substr(1))) << "\n";
                        std::cout << "MATCH: " << replicated_name << "-->" << *(original_set.find(original_name.substr(1))) << "\n";
                    }
                    else {
                        std::cout << "NOT MATCH: " << replicated_name << "\n";
                        matches = false;
                    }
                }
                else {
                    std::cout << "MATCH: " << replicated_name << "-->" << *(original_set.find(original_name)) << "\n";
                }
            }
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
        // std::cout << "Original Name: " << name << "\n";
        size_t position = name.find(suffix);
        if (position != std::string::npos) {
            // if ((position + suffix.length()+3) > name.length()) {
            //     std::cout << "TOO LONG for" << name << "\n";
            //     std::cout << "but it was found at " << std::to_string(position) << "\n";
            // }
            name.erase(position - 1, suffix.length()+3);
        }
        return name;
    }

    // std::string extract_suffix_key_from_name(std::string name, std::string suffix) {
    //     // std::cout << "Original Name: " << name << "\n";
    //     size_t position = name.find(suffix);
    //     if (position != std::string::npos) {
    //         // if ((position + suffix.length()+3) > name.length()) {
    //         //     std::cout << "TOO LONG for" << name << "\n";
    //         //     std::cout << "but it was found at " << std::to_string(position) << "\n";
    //         // }
    //         name.erase(0, position - 1);
    //         name.erase(suffix.length()+3, name.length());
    //         return name;
    //     }
    //     return "";
    // }
} TMRTry;

PRIVATE_NAMESPACE_END