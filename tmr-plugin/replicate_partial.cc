#include "kernel/yosys.h"
#include <algorithm>


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

    // std::map<std::string, WireConnectionInfo> collect_connections(RTLIL::Module *module) {
    //     std::map<std::string, WireConnectionInfo> connection_map;
    //     for (auto cell: module->cells()) {
    //         for (auto conn: cell->connections()) {
    //             RTLIL::SigSpec sigspec = conn.second;
    //             for (auto sigbit: sigspec.bits()) {
    //                 if (sigbit.wire == NULL) {
    //                     continue;
    //                 }
    //                 ConnectedCell c = {cell, conn.first, sigbit};
    //                 std::string map_key = unescape_id(sigbit.wire->name) + "_" + std::to_string(sigbit.offset);
    //                 if (cell->output(conn.first)) {
    //                     connection_map[map_key].driver = c;
    //                 }
    //                 else {
    //                     connection_map[map_key].driven_cells.push_back(c);
    //                 }

    //                 connection_map[map_key].wire = sigbit.wire;
    //                 connection_map[map_key].offset = sigbit.offset;
    //             }
    //         }
    //     }
    //     printMessage("Connection Map for Module: " + RTLIL::unescape_id(module->name) + "\n", false);
    //     for (auto map_entry: connection_map) {
    //         std::string to_write;
    //         to_write = "Key: " + map_entry.first + "\n";
    //         to_write+= "\tDriver: ";
    //         if (map_entry.second.driver.cell == nullptr) {
    //             to_write+= "NULL\n";
    //         }
    //         else {
    //             to_write+= RTLIL::unescape_id(map_entry.second.driver.cell->name) + "\n";
    //         }
    //         to_write+= "\tDriven Cells: \n";
    //         for(auto cell: map_entry.second.driven_cells) {
    //             to_write+= "\t\t" + RTLIL::unescape_id(cell.cell->name) + "\n";
    //         }
    //         printMessage(to_write, false);
    //     }
    //     return connection_map;
    // }

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
    // std::set<std::string> modules_to_replicate;
    int copy_amount;
    std::string suffix;
    std::vector<RTLIL::Cell*> non_leaf_cells;
    std::map<std::string, bool> blackbox_map;
    std::vector<std::string> ports_to_replicate;
    bool replicate_ports;
    bool verbose;
    std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> global_wire_map;

    typedef struct ConnectedCell {
        RTLIL::Cell *cell;
        RTLIL::IdString port_name;
        RTLIL::SigBit sigbit;
    } ConnectedCell;

    typedef struct WireConnectionInfo {
        ConnectedCell driver;
        std::vector<ConnectedCell> driven_cells;
        RTLIL::Wire *wire;
        int offset;
        
    } WireConnectionInfo;

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
                printMessage("Will not replicate inside blackbox module "+ RTLIL::unescape_id(module->name) +  "\n", false);
                RTLIL::Module *new_module = new_design->addModule("\\" + RTLIL::unescape_id(module->name));
                module->cloneInto(new_module);
                continue;
            }
            // if (modules_to_replicate.size() > 0 && modules_to_replicate.find(RTLIL::unescape_id(module->name)) == modules_to_replicate.end()) {
            //     printMessage("Will not replicate module "+ RTLIL::unescape_id(module->name) +  " because it is not specified \n", false);
            //     RTLIL::Module *new_module = new_design->addModule("\\" + RTLIL::unescape_id(module->name));
            //     module->cloneInto(new_module);
            //     continue;
            // }

            bool check_ports = false;
            if (original_design->top_module() == module) {
                check_ports = true;
            }
            log("Replicating module: %s\n", log_id(module));
            replicate_module(new_design, module, suffix, check_ports);
            log("\n");
        }
        for (auto cell: non_leaf_cells) {
            // if (modules_to_replicate.size() > 0 && modules_to_replicate.find(RTLIL::unescape_id(cell->name)) == modules_to_replicate.end()) {
            //     // printMessage("Will not replicate module "+ RTLIL::unescape_id(module->name) +  " because it is not specified \n", false);
            //     // RTLIL::Module *new_module = new_design->addModule("\\" + RTLIL::unescape_id(module->name));
            //     // module->cloneInto(new_module);
            //     continue;
            // }
            fix_non_leaf_cell_connections(cell->module, cell, suffix);
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

    void replicate_module(RTLIL::Design *new_design, RTLIL::Module *module, std::string suffix, bool check_ports) {

        RTLIL::Module *new_module = new_design->addModule("\\" + RTLIL::unescape_id(module->name));
        if (module->get_bool_attribute(ID::top)) {
            new_module->set_bool_attribute(ID::top);
        }
        std::map<std::string, WireConnectionInfo> connection_map = collect_connections(module);

        std::vector<Cell*> cells_to_replicate = identify_cells_to_replicate(module);
        std::vector<Wire*> wires_to_replicate = identify_wires_to_replicate(module, cells_to_replicate);
        std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> wire_map = replicate_wires_new(module, new_module, suffix, wires_to_replicate);
        replicate_cells_new(module, new_module, suffix, cells_to_replicate, wire_map);

        connect_wire_to_wire_connections(module, new_module, suffix, wires_to_replicate, wire_map);
        std::cout << "finished with this module\n";

        // ReplicationChecker checker = ReplicationChecker();
        // checker.run(module, new_module, suffix);
    }

    std::vector<Wire*> identify_wires_to_replicate(RTLIL::Module *module, std::vector<Cell*> cells_to_replicate) {
        /* 
        All wires that output from cells that will be replicated, 
        or input to a cell that will be replicated from the cell's 
        parent module will be replicated
        */
        std::vector<Wire*> wires_to_replicate;
        for (auto cell: cells_to_replicate) {
            printMessage("Checking wires for cell " + RTLIL::unescape_id(cell->name) + "\n", false);
            for (auto conn: cell->connections()) {
                for (auto bit: conn.second.bits()) {
                    if (bit.wire == nullptr) {
                        continue;
                    }
                    if (bit.wire->port_input) { // inputs from parent module to replicated cell
                        wires_to_replicate.push_back(bit.wire);
                        printMessage("\tWire " + RTLIL::unescape_id(bit.wire->name) + "[" + std::to_string(bit.offset) + "] will be replicated\n", false);
                    }
                    else if (cell->output(conn.first)) { // output of replicated cell
                        wires_to_replicate.push_back(bit.wire);
                        printMessage("\tWire " + RTLIL::unescape_id(bit.wire->name) + "[" + std::to_string(bit.offset) + "] will be replicated\n", false);
                    }
                    else {
                        // printMessage("\tWire " + RTLIL::unescape_id(bit.wire->name) + "[" + std::to_string(bit.offset) + "] will may not be replicated\n", false);
                    }
                }
            }
        }
        // for (auto sigsig: module->connections()) {
        //     RTLIL::SigSpec sigspec_one = sigsig.first;
        //     RTLIL::SigSpec sigspec_two = sigsig.second;
        //     for (int i = 0; i < GetSize(sigspec_one); i++) {
        //         bool wire_one = false;
        //         bool wire_two = false;

        //         if (std::find(wires_to_replicate.begin(), wires_to_replicate.end(), sigspec_one[i].wire) != wires_to_replicate.end()) {
        //             wire_one = true;
        //             std::cout << "Wire named " << RTLIL::unescape_id(sigspec_one[i].wire->name) << " is set to be replicated\n";
        //         }
        //         else {
        //             std::cout << "Wire named " << RTLIL::unescape_id(sigspec_one[i].wire->name) << " is NOT set to be replicated\n";
        //         }

        //         if (std::find(wires_to_replicate.begin(), wires_to_replicate.end(), sigspec_two[i].wire) != wires_to_replicate.end()) {
        //             wire_two = true;
        //             std::cout << "Wire named " << RTLIL::unescape_id(sigspec_two[i].wire->name) << " is set to be replicated\n";
        //         }
        //         else {
        //             std::cout << "Wire named " << RTLIL::unescape_id(sigspec_two[i].wire->name) << " is NOT set to be replicated\n";
        //         }

        //         if (wire_one || wire_two) { // at least one will be replicated so make sure both will
        //             if (!wire_one) {
        //                 wires_to_replicate.push_back(sigspec_one[i].wire);
        //             }
        //             if (!wire_two) {
        //                 wires_to_replicate.push_back(sigspec_two[i].wire);
        //             }
        //         }
                // if (wire_map.find(wire) != wire_map.end()) {
                //     if (wire_map[wire].size() > 1) {
                //         replicate = true;
                //     }
                // }

                // wire = sigspec_two[i].wire;
                // if (wire_map.find(wire) != wire_map.end()) {
                //     if (wire_map[wire].size() > 1) {
                //         replicate = true;
                //     }
                // }

                // if (replicate) {

                // }
                // }
                    //     std::string first_wire_name = RTLIL::unescape_id(sigspec_one[i].wire->name);
                    //     RTLIL::Wire *replicated_wire_one = new_module->wire("\\" + first_wire_name + "_" + suffix + "_" + std::to_string(j));
                    //     // new_sigspec_one = RTLIL::SigSpec(replicated_wire_one, sigspec_one[i].offset, 1);
                    // }
                    // // else {
                    // //     new_sigspec_one = RTLIL::SigSpec(sigspec_one[i], 1); // create a sigbit with a null wire.
                    // // }
                    // if (sigspec_two[i].wire != nullptr) {
                    //     std::string second_wire_name = RTLIL::unescape_id(sigspec_two[i].wire->name);
                    //     RTLIL::Wire *replicated_wire_two = new_module->wire("\\" + second_wire_name + "_" + suffix + "_" + std::to_string(j));
                    //     // new_sigspec_two = RTLIL::SigSpec(replicated_wire_two, sigspec_two[i].offset, 1);
                    // }
                    // // else {
                    //     new_sigspec_two = RTLIL::SigSpec(sigspec_two[i], 1); // create a sigbit with a null wire.
                    // }
        //     }
        // }
        return wires_to_replicate;
    }

    std::vector<Cell*> identify_cells_to_replicate(RTLIL::Module *module) {
        printMessage("Identifying cells to replicate\n", false);
        std::vector<Cell*> cells_to_replicate;
        for (auto cell: module->selected_cells()) {
            cells_to_replicate.push_back(cell);
            printMessage("Cell " + RTLIL::unescape_id(cell->name) + " of type " + RTLIL::unescape_id(cell->type) + " will be replicated\n", false);
        }
        return cells_to_replicate;
    }

    std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> replicate_wires_new(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix, \
                            std::vector<Wire*> wires_to_replicate) {
        printMessage("Replicating wires...\n", false);
        std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> wire_map;
        for (auto wire: old_module->wires()) {
            if (std::find(std::begin(wires_to_replicate), std::end(wires_to_replicate), wire) == std::end(wires_to_replicate)) {
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

    void replicate_cells_new(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix, std::vector<Cell*> cells_to_replicate, \
                                std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> wire_map) {
        printMessage("Replicating cells in module " + RTLIL::unescape_id(old_module->name) + "\n", false);

        for (auto cell: old_module->cells()) { // copy cells over
            std::cout << "set to replicate cell " << log_id(cell) << " of type " << RTLIL::unescape_id(cell->type) << "\n";
            if (std::find(std::begin(cells_to_replicate), std::end(cells_to_replicate), cell) == std::end(cells_to_replicate)) {
                std::cout << "\tbut he was not specified to be replicated\n";

                RTLIL::Cell *new_cell = new_module->addCell(cell->name, cell);
                fix_cell_connections_new(new_module, new_cell, cell, 0, suffix, wire_map);    
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
                    RTLIL::Cell *new_cell = new_module->addCell("\\" + RTLIL::unescape_id(cell->name), cell);
                    new_cell->type = "\\" + cell_type;
                    non_leaf_cells.push_back(new_cell);
                    // fix_cell_connections_new(new_module, new_cell, cell, 0, suffix, wire_map);
                    fix_non_leaf_cell_connections_new(new_module, new_cell, cell, suffix, wire_map);
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
                fix_cell_connections_new(new_module, new_cell, cell, i, suffix, wire_map);      
            }
            new_module->fixup_ports();
        }
    }

    void fix_cell_connections_new(RTLIL::Module *new_module, RTLIL::Cell *new_cell, RTLIL::Cell *old_cell, int i, std::string suffix, \
                                    std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> wire_map) {
        for (auto conn: old_cell->connections()) {
            bool port_set_already = false;
            std::cout << "Old Cell " << RTLIL::unescape_id(old_cell->name) << " connections for port " << RTLIL::unescape_id(conn.first) \
                        << " is size " << std::to_string(GetSize(conn.second)) << "\n";
            for (auto bit: conn.second.bits()) {
                if (bit.wire == nullptr) {
                    continue;
                }
                std::cout << "The wiremap size for that wire key is " << std::to_string(wire_map[bit.wire].size()) << "\n";
                RTLIL::Wire *wire;
                if (wire_map[bit.wire].size() == 1) { // the wire was not replicated
                    wire = wire_map[bit.wire][0];
                }
                else {
                    wire = wire_map[bit.wire][i];
                }
                if (!port_set_already) {
                    RTLIL::SigSpec signal = RTLIL::SigSpec(wire, bit.offset, 1);
                    // RTLIL::SigSpec(replicated_wire_one, sigspec_one[i].offset, 1
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

    // std::vector<Cell*> identify_cells_to_not_replicate (RTLIL::Module *module, std::map<std::string, WireConnectionInfo> connection_map, \
    //                                                                 bool check_ports) {
    //     printMessage("Identifying cells to not replicate in module " + RTLIL::unescape_id(module->name) +  "\n", false);
    //     std::vector<Cell*> cells_to_not_replicate;
    //     if (!check_ports) {
    //         return cells_to_not_replicate;
    //     }
    //     for (auto cell: module->cells()) {
    //         if (!module->selected(cell)) {
    //             cells_to_not_replicate.push_back(cell);
    //         }
    //         // for (auto conn: cell->connections()) {
    //         //     for (auto bit: conn.second.bits()) {
    //         //         if (bit.wire == nullptr) {
    //         //             continue;
    //         //         }
    //         //         std::string map_key = unescape_id(bit.wire->name) + "_" + std::to_string(bit.offset);
    //         //         WireConnectionInfo info = connection_map[map_key];
    //         //         std::string wire_name = RTLIL::unescape_id(bit.wire->name);
    //         //         if (bit.wire->port_input && info.driver.cell == nullptr) {
    //         //             if (std::find(std::begin(ports_to_replicate), std::end(ports_to_replicate), wire_name) == std::end(ports_to_replicate)) {
    //         //                 std::string message = "Cell " + RTLIL::unescape_id(cell->name) + " of type " + \
    //         //                                         RTLIL::unescape_id(cell->type) + " will not be replicated\n";
    //         //                 printMessage(message, false);
    //         //                 cells_to_not_replicate.push_back(cell);
    //         //             }
    //         //         }
    //         //         else if (bit.wire->port_input) {
    //         //             // log("%s is a port_input. He's part of cell %s\n", map_key.c_str(), log_id(cell));
    //         //         }
    //         //         else if (bit.wire->port_output && info.driven_cells.size() == 0) {
    //         //             if (std::find(std::begin(ports_to_replicate), std::end(ports_to_replicate), wire_name) == std::end(ports_to_replicate)) {
    //         //                 std::string message = "Cell " + RTLIL::unescape_id(cell->name) + " of type " + \
    //         //                                         RTLIL::unescape_id(cell->type) + " will not be replicated\n";
    //         //                 printMessage(message, false);
    //         //                 cells_to_not_replicate.push_back(cell);
    //         //             }
    //         //         }
    //         //         else {

    //         //         }

    //         //     }
    //         // }
    //     }
    //     return cells_to_not_replicate;
    // }

    // std::set<Wire*> identify_wires_to_not_replicate(RTLIL::Module *module, std::map<std::string, WireConnectionInfo> connection_map, \
    //                                                                 std::vector<Cell*> cells_to_not_replicate, bool check_ports) {
    //     printMessage("Identifying wires to not replicate in module " + RTLIL::unescape_id(module->name) +  "\n", false);
    //     std::set<Wire*> wires_to_not_replicate;
    //     if (!check_ports) {
    //         return wires_to_not_replicate;
    //     }
    //     for (auto cell: cells_to_not_replicate) {
    //         for (auto conn: cell->connections()) {
    //             for (auto bit: conn.second.bits()) {
    //                 if (bit.wire == nullptr) {
    //                     continue;
    //                 }
    //                 std::string map_key = unescape_id(bit.wire->name) + "_" + std::to_string(bit.offset);
    //                 WireConnectionInfo info = connection_map[map_key];
    //                 if (bit.wire->port_input && info.driver.cell == nullptr) {
    //                     std::string message = "Wire " + RTLIL::unescape_id(bit.wire->name) + " going into cell " + \
    //                                                 RTLIL::unescape_id(cell->name) + " will not be replicated\n";
    //                     printMessage(message, false);
    //                     wires_to_not_replicate.insert(bit.wire);
    //                 }
    //                 else if (info.driver.cell == cell) {
    //                     std::string message = "Wire " + RTLIL::unescape_id(bit.wire->name) + " leaving cell " + \
    //                                                 RTLIL::unescape_id(cell->name) + " will not be replicated\n";
    //                     printMessage(message, false);
    //                     wires_to_not_replicate.insert(bit.wire);
    //                 }
    //                 else {

    //                 }

    //             }
    //         }
    //     }
    //     return wires_to_not_replicate;
    // }

    std::map<std::string, WireConnectionInfo> collect_connections(RTLIL::Module *module) {
        std::map<std::string, WireConnectionInfo> connection_map;
        for (auto cell: module->cells()) {
            for (auto conn: cell->connections()) {
                RTLIL::SigSpec sigspec = conn.second;
                for (auto sigbit: sigspec.bits()) {
                    if (sigbit.wire == NULL) {
                        continue;
                    }
                    ConnectedCell c = {cell, conn.first, sigbit};
                    std::string map_key = unescape_id(sigbit.wire->name) + "_" + std::to_string(sigbit.offset);
                    if (cell->output(conn.first)) {
                        connection_map[map_key].driver = c;
                    }
                    else {
                        connection_map[map_key].driven_cells.push_back(c);
                    }

                    connection_map[map_key].wire = sigbit.wire;
                    connection_map[map_key].offset = sigbit.offset;
                }
            }
        }
        printMessage("Connection Map for Module: " + RTLIL::unescape_id(module->name) + "\n", false);
        for (auto map_entry: connection_map) {
            std::string to_write;
            to_write = "Key: " + map_entry.first + "\n";
            to_write+= "\tDriver: ";
            if (map_entry.second.driver.cell == nullptr) {
                to_write+= "NULL\n";
            }
            else {
                to_write+= RTLIL::unescape_id(map_entry.second.driver.cell->name) + "\n";
            }
            to_write+= "\tDriven Cells: \n";
            for(auto cell: map_entry.second.driven_cells) {
                to_write+= "\t\t" + RTLIL::unescape_id(cell.cell->name) + "\n";
            }
            printMessage(to_write, false);
        }
        printMessage("Finished printing connection map\n", false);
        return connection_map;
    }

    void connect_wire_to_wire_connections(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix, std::vector<Wire*> wires_to_replicate, \
                                            std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> wire_map) {
        printMessage("Connecting wire to wire connections...\n", false);
        for (auto sigsig: old_module->connections()) {
            std::cout << "another connection to do\n";
            RTLIL::SigSpec sigspec_one = sigsig.first;
            RTLIL::SigSpec sigspec_two = sigsig.second;
            for (int i = 0; i < GetSize(sigspec_one); i++) {
                std::cout << "another\n";
                bool one_replicated = (std::find(std::begin(wires_to_replicate), std::end(wires_to_replicate), sigspec_one[i].wire) != std::end(wires_to_replicate));
                bool two_replicated = (std::find(std::begin(wires_to_replicate), std::end(wires_to_replicate), sigspec_two[i].wire) != std::end(wires_to_replicate));
                std::cout << "begin\n";
                if (one_replicated || two_replicated ) {
                    for (int j = 0; j < copy_amount; j++) {
                        RTLIL::SigSpec new_sigspec_one;
                        RTLIL::SigSpec new_sigspec_two;
                        if (sigspec_one[i].wire != nullptr) {
                            std::cout << "first_wire_name is " << RTLIL::unescape_id(sigspec_one[i].wire->name) << "\n";
                            if (one_replicated) { // get the replicated wire
                                std::cout << "one is replicated\n";
                                std::string first_wire_name = RTLIL::unescape_id(sigspec_one[i].wire->name);
                                // RTLIL::Wire *replicated_wire_one = new_module->wire("\\" + first_wire_name + "_" + suffix + "_" + std::to_string(j));
                                RTLIL::Wire *replicated_wire_one = wire_map[sigspec_one[i].wire][j];
                                new_sigspec_one = RTLIL::SigSpec(replicated_wire_one, sigspec_one[i].offset, 1);
                            }
                            else { // get the non replicated wire
                                std::cout << "here for one\n";
                                // RTLIL::Wire *wire_one = new_module->wire(sigspec_one[i].wire->name);
                                RTLIL::Wire *wire_one = wire_map[sigspec_one[i].wire][0];
                                std::cout << "now next thing\n";
                                new_sigspec_one = RTLIL::SigSpec(wire_one, sigspec_one[i].offset, 1);
                            }
                        }
                        else { // create a sigbit with a null wire.
                            std::cout << "one is a null wire";
                            new_sigspec_one = RTLIL::SigSpec(sigspec_one[i], 1);
                        }

                        if (sigspec_two[i].wire != nullptr) {
                            std::cout << "second_wire_name is " << RTLIL::unescape_id(sigspec_two[i].wire->name) << "\n";
                            if (two_replicated){ // get the replicated wire
                                std::cout << "two is replicated\n";
                                std::string second_wire_name = RTLIL::unescape_id(sigspec_two[i].wire->name);
                                // RTLIL::Wire *replicated_wire_two = new_module->wire("\\" + second_wire_name + "_" + suffix + "_" + std::to_string(j));
                                RTLIL::Wire *replicated_wire_two = wire_map[sigspec_two[i].wire][j];
                                new_sigspec_two = RTLIL::SigSpec(replicated_wire_two, sigspec_two[i].offset, 1);
                                // new_sigspec_two = RTLIL::SigSpec(replicated_wire_two, 0, 1);
                                // std::cout << "next\n";
                            }
                            else { // get the non replicated wire
                                std::cout << "here for two\n";
                                // RTLIL::Wire *wire_two = new_module->wire(sigspec_two[i].wire->name);
                                RTLIL::Wire *wire_two = wire_map[sigspec_two[i].wire][0];
                                new_sigspec_two = RTLIL::SigSpec(wire_two, sigspec_two[i].offset, 1);
                            }
                        }
                        else { // create a sigbit with a null wire.
                            std::cout << "two is a null wire";
                            new_sigspec_two = RTLIL::SigSpec(sigspec_two[i], 1);
                        }

                        std::cout << "connecting now\n";
                        RTLIL::SigSig new_sigsig = std::pair<RTLIL::SigSpec, RTLIL::SigSpec>(new_sigspec_one, new_sigspec_two);
                        new_module->connect(new_sigsig);
                        std::cout << "connected\n";
                    }
                    std::cout << "Done here\n";
                }
                else { // get the two non replicated ones and connect them
                    std::cout << "connecting two non replicated wires\n";
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
                // GetSize(sigspec_one);
                std::cout << "head back to top\n";
                    // if (sigspec_one[i].wire != nullptr) {
        //                 RTLIL::Wire *wire_one;
        //                 if (std::find(std::begin(wires_to_replicate), std::end(wires_to_replicate), sigspec_one[i].wire) == std::end(wires_to_replicate)) { // he wasn't replicated
        //                     std::string first_wire_name = RTLIL::unescape_id(sigspec_one[i].wire->name);
        //                     wire_one = new_module->wire(sigspec_one[i].wire->name);
        //                 }
        //                 else {
        //                     std::string first_wire_name = RTLIL::unescape_id(sigspec_one[i].wire->name);
        //                     wire_one = new_module->wire("\\" + first_wire_name + "_" + suffix + "_" + std::to_string(j));
        //                 }
        //                 // if (replicated_wire_one == nullptr) {
        //                 //     std::cout << "he's nulllll\n";
        //                 // }
        //                 new_sigspec_one = RTLIL::SigSpec(wire_one, sigspec_one[i].offset, 1);
        //             }
        //             else {
        //                 new_sigspec_one = RTLIL::SigSpec(sigspec_one[i], 1); // create a sigbit with a null wire.
        //             }
                    // if (sigspec_two[i].wire != nullptr) {
                    //     std::string second_wire_name = RTLIL::unescape_id(sigspec_two[i].wire->name);
                    //     RTLIL::Wire *replicated_wire_two = new_module->wire("\\" + second_wire_name + "_" + suffix + "_" + std::to_string(j));
                    //     new_sigspec_two = RTLIL::SigSpec(replicated_wire_two, sigspec_two[i].offset, 1);
                    // }
                    // else {
                    //     new_sigspec_two = RTLIL::SigSpec(sigspec_two[i], 1); // create a sigbit with a null wire.
                    // }

                    // RTLIL::SigSig new_sigsig = std::pair<RTLIL::SigSpec, RTLIL::SigSpec>(new_sigspec_one, new_sigspec_two);
                    // new_module->connect(new_sigsig);
            }
        }
        std::cout << "all done with wire2wire connections\n";
    }

    // void replicate_wires(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix, bool check_ports, \
    //                         std::set<Wire*> wires_to_not_replicate) {
    //     printMessage("Replicating wires...\n", false);
    //     std::set<RTLIL::Wire*> wires_to_replicate;
    //     for (auto wire: old_module->wires()) { // copy wires over
    //         if (check_ports) {
    //             std::string wire_name = RTLIL::unescape_id(wire->name);
    //                 if (std::find(std::begin(wires_to_not_replicate), std::end(wires_to_not_replicate), wire) == std::end(wires_to_not_replicate)) {
    //                     // std::cout << "set to replicate wire: " << wire_name << "\n";
    //                     wires_to_replicate.insert(wire);
    //                 }
    //                 else {
    //                     // std::cout << wire_name << " connected to port or buffer of same name will not be replicated. It will simply be copied\n";
    //                     new_module->addWire(wire->name, wire);
    //                 }
    //         }
    //         else{
    //             wires_to_replicate.insert(wire);
    //         }
    //     } 
    //     for (auto wire: wires_to_replicate) {
    //         for (int i = 0; i < copy_amount; i++) {
    //             std::string new_name = "\\" + RTLIL::unescape_id(wire->name) + "_" + suffix + "_" + std::to_string(i);
    //             // std::cout << "new wire name is " << new_name << "\n";
    //             RTLIL::Wire *new_wire = new_module->addWire(new_name, wire);
    //             std::string message = "Replicated wire " + RTLIL::unescape_id(wire->name) + " into wire " + \
    //                                     RTLIL::unescape_id(new_wire->name) + "\n";
    //             printMessage(message, false);
    //             new_module->fixup_ports();
    //         }
    //     }
    // }

    // void replicate_cells(RTLIL::Module *old_module, RTLIL::Module *new_module, std::string suffix, bool check_ports, std::vector<Cell*> cells_to_not_replicate ) {
    //     printMessage("Replicating cells in module " + RTLIL::unescape_id(old_module->name) + "\n", false);
    //     for (auto cell: old_module->cells()) { // copy cells over
    //         // std::cout << "set to replicate cell " << log_id(cell) << " of type " << RTLIL::unescape_id(cell->type) << "\n";
    //         if (std::find(std::begin(cells_to_not_replicate), std::end(cells_to_not_replicate), cell) != std::end(cells_to_not_replicate)) {
    //             // std::cout << "but he was found in cells_to_not_replicate\n";

    //             RTLIL::Cell *new_cell = new_module->addCell(cell->name, cell);
    //             fix_cell_connections(new_module, new_cell, 0, suffix); 
    //             continue;
    //         }
    //         std::string cell_type = RTLIL::unescape_id(cell->type);
    //         std::string cell_name = RTLIL::unescape_id(cell->name);
    //         if (cell_type.substr(0,1) != "$" || cell_name.substr(0,1) != "$") {
    //             // std::cout << log_id(cell) << " of cell_type " << cell_type << " made it here\n";
    //             if (!cell->known()) {
    //                 log("Unrecognized yosys cell type: %s. Will not replicate.\n", cell_type.c_str());
    //                 continue;
    //             }
    //             else if (blackbox_map[RTLIL::unescape_id(cell->type)]){
    //                 // it's a primitive, do nothing here and replicate below
    //             }
    //             else {
    //                 // if it's a non_leaf_cell or blackbox, we still need to add it to the new module
    //                 RTLIL::Cell *new_cell = new_module->addCell("\\" + RTLIL::unescape_id(cell->name), cell);
    //                 new_cell->type = "\\" + cell_type;
    //                 non_leaf_cells.push_back(new_cell);
    //                 continue;
    //             }
    //         }
           
    //         for (int i = 0; i < copy_amount; i++) {
    //             std::string new_name = RTLIL::unescape_id(cell->name) + "_" + suffix + "_" + std::to_string(i);
    //             if (new_name.substr(0,1) != "$") {
    //                 new_name = "\\" + new_name;
    //             }
    //             RTLIL::Cell *new_cell = new_module->addCell(new_name, cell);
    //             std::string message = "Replicated cell" + unescape_id(cell->name) + " into cell " + \
    //                                     unescape_id(new_cell->name) + "\n";
    //             printMessage(message, false);

    //             fix_cell_connections(new_module, new_cell, i, suffix);      
    //             new_module->fixup_ports();
    //         }
    //     }
    // }

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
                // std::cout << "trying to add wire named " << ("\\" + wire_chunk_name + "_" + suffix + "_" + std::to_string(i)) << "\n";
                RTLIL::Wire *replicated_wire = new_module->wire("\\" + wire_chunk_name + "_" + suffix + "_" + std::to_string(i));
                if (replicated_wire == nullptr) {
                    // std::cout << "the wire was null. It was not replicated. Using normal wire named: " << wire_chunk_name << "\n";
                    replicated_wire = new_module->wire(chunk.wire->name);
                }

                RTLIL::Wire *old_wire = new_module->wire("\\" + wire_chunk_name);

                RTLIL::SigChunk* new_chunk = new RTLIL::SigChunk(chunk);
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

    std::string remove_suffix_from_name(std::string name, std::string suffix) {
        size_t position = name.find(suffix);
        if (position != std::string::npos) {
            name.erase(position - 1, suffix.length()+3);
        }
        return name;
    }

    void fix_non_leaf_cell_connections_new(RTLIL::Module *new_module, RTLIL::Cell *new_cell, RTLIL::Cell *old_cell, std::string suffix, \
                                    std::map<RTLIL::Wire*,std::vector<RTLIL::Wire*>> wire_map) {
        std::cout << "fixing connections NEW for non leaf cell named " << RTLIL::unescape_id(new_cell->name) << " of type " << \
                    RTLIL::unescape_id(new_cell->type) << "\n";
        // do stuff here
        // if it's not a blackbox, do what we were saying before. Otherwise (if it's a blackbox), hook it up to the one (TMR_0)
        if (blackbox_map[RTLIL::unescape_id(new_module->name)]) {
            return; // TODO do something here
        }
        // see what ports are replicated
        RTLIL::Module *cell_module = new_module->design->module(new_cell->type);
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
        for (auto entry: replicated_ports_map) {
            std::cout << "Entry: " << entry.first << " has " << std::to_string(entry.second) << "\n";
        }
        // std::cout << "going into connections\n";
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
                            // std::cout << "wire was replicated\n";
                            RTLIL::SigBit new_sigbit = RTLIL::SigBit(global_wire_map[sigbit.wire][i], sigbit.offset);
                            new_sigspec.append(new_sigbit);
                        }
                        else {
                            // std::cout << "wire was NOT replicated\n";
                            // std::cout << "Global wire map size or that wire is " << std::to_string(global_wire_map[sigbit.wire].size()) << "\n";
                            RTLIL::SigBit new_sigbit = RTLIL::SigBit(global_wire_map[sigbit.wire][0], sigbit.offset);
                            // std::cout << "here\n";
                            new_sigspec.append(new_sigbit);
                            // std::cout << "done\n";
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
    }

    void fix_non_leaf_cell_connections(RTLIL::Module *new_module, RTLIL::Cell *new_cell, std::string suffix) {
        std::cout << "fixing connections for non leaf cell named " << RTLIL::unescape_id(new_cell->name) << " of type " << \
                    RTLIL::unescape_id(new_cell->type) << "\n";
        // for (auto entry: global_wire_map) {
        //     std::cout << "Wire: " << log_id(entry.first) << " is amount " << std::to_string(entry.second.size()) << "\n";
        // }
        RTLIL::Module *cell_module = new_module->design->module(new_cell->type);
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
        for (auto entry: replicated_ports_map) {
            std::cout << "Entry: " << entry.first << " has " << std::to_string(entry.second) << "\n";
        }
        std::cout << "going into connections\n";
        for (auto &connection: new_cell->connections()) {
            bool unset_already = false;
            std::string id_string = RTLIL::unescape_id(connection.first);
            std::cout << "trying id string " << id_string << "\n";
            if (replicated_ports_map[id_string] > 1) { // it was replicated on the inside
                std::cout << "hereeee\n";
                for (int i = 0; i < copy_amount; i++) {
                    RTLIL::SigSpec new_sigspec = RTLIL::SigSpec();
                    for (auto chunk: connection.second.chunks()) {
                        std::cout << "doing a bit\n";
                        if (chunk.wire == nullptr) { // create sigbit with null wire
                            std::cout << "wire is null\n";
                            // RTLIL::SigBit new_sigbit = RTLIL::SigBit(sigbit);
                            // new_sigspec.append(new_sigbit);
                            continue;
                        }
                        // std::cout << "Wire name is " << log_id(chunk.wire) << "\n";
                        if (RTLIL::unescape_id(chunk.wire->name) == "") {
                            std::cout << "his name is null\n";
                        }
                        if (global_wire_map[chunk.wire].size() > 1) {
                            std::cout << "wire was replicated\n";
                            // RTLIL::SigBit new_sigbit = RTLIL::SigBit(global_wire_map[chunk.wire][i], sigbit.offset);
                            // new_sigspec.append(new_sigbit);
                        }
                        else {
                            std::cout << "wire was NOT replicated\n";
                            std::cout << "Global wire map size or that wire is " << std::to_string(global_wire_map[chunk.wire].size()) << "\n";
                            // RTLIL::SigBit new_sigbit = RTLIL::SigBit(global_wire_map[chunk.wire][0], sigbit.offset);
                            std::cout << "here\n";
                            // new_sigspec.append(new_sigbit);
                            std::cout << "done\n";
                        }
                    }
                    std::string suffix_key = "_" + suffix + "_" + std::to_string(i);
                    std::string new_id_string = "\\" + id_string + suffix_key;
                    new_cell->setPort(new_id_string, new_sigspec);
                }
            }
            // RTLIL::SigSpec sigspec = connection.second;
        //     RTLIL::SigSpec new_sigspec = RTLIL::SigSpec();
        //     // std::cout << "port name is " << id_string << "\n";
        //     for (auto sigbit: sigspec.bits()) {
        //         if (sigbit.wire == nullptr) {
        //             RTLIL::SigBit new_sigbit = RTLIL::SigBit(sigbit);
        //             new_sigspec.append(new_sigbit);
        //             continue;
        //         }
        //         // for (auto new_wire: global_wire_map[sigbit.wire]) {
        //         //     // if (!unset_already) {
        //         //     //     new_cell->unsetPort(connection.first);
        //         //     //     unset_already = true;
        //         //     // }
        //         // }                
        //     }
        }
        //     for (int i = 0; i < copy_amount; i++) {
        //         std::string suffix_key = "_" + suffix + "_" + std::to_string(i);
        //         std::vector<RTLIL::SigChunk> current_chunks; 
        //         for (auto chunk: sigspec.chunks()) {
        //             if (chunk.wire == nullptr) {
        //                 RTLIL::SigChunk* new_chunk = new RTLIL::SigChunk(chunk);
        //                 current_chunks.push_back(*new_chunk);
        //                 continue;
        //             }
        //             std::string wire_chunk_name = RTLIL::unescape_id(chunk.wire->name);
        //             std::string replicated_wire_name = "\\" + wire_chunk_name + suffix_key;
        //             RTLIL::Wire *replicated_wire = new_module->wire(replicated_wire_name);

        //             RTLIL::Wire *old_wire = new_module->wire("\\" + wire_chunk_name);
        //             RTLIL::SigChunk* new_chunk = new RTLIL::SigChunk(chunk);
        //             new_chunk->wire = replicated_wire;
        //             current_chunks.push_back(*new_chunk);
        //         }

        //         RTLIL::SigSpec *new_sigspec = new RTLIL::SigSpec();
        //         for (auto a_chunk: current_chunks){
        //             new_sigspec->append(RTLIL::SigSpec(a_chunk));
        //         }
                
                // if (!unset_already) {
                //     new_cell->unsetPort(connection.first);
                //     unset_already = true;
                // }

        //         std::string new_id_string = "\\" + id_string + suffix_key;
        //         new_cell->setPort(new_id_string, *new_sigspec);
        //     }
        //     new_module->fixup_ports();
        // }
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

    void printMessage(std::string main_string, bool force) {
        if (verbose || force){
            log("%s", main_string.c_str());
        }
    }

public:
    ReplicationWorker(int amount_of_copies, std::string suffix, bool replicate_ports) {
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
		log("in the design except for blackboxes.\n");
		log("\n");
        log("    -suffix <string>\n");
        log("        Specify the suffix to be appended to each replicated cell and wire name.\n");
        log("        The default suffix is \"TMR\"\n");
		log("\n");
        log("    -amount <int>\n");
        log("        Total number of copies. The default is 3\n");
        log("\n");
        log("    -ports\n");
        log("        When this option is passed, all top level ports will be replicated.\n");
        log("\n");
        log("    -verbose\n");
        log("        Print all log messages during replication\n");
        log("\n");
    }

    void execute(vector<string> args, Design* design) override {

        std::string suffix = "TMR";
        int copy_amount = 3;
        bool verbose = false;
        // std::vector<std::string> port_to_replicate;
        bool replicate_ports = false;
        // std::set<std::string> modules_to_replicate;

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
            if (args[argidx] == "-ports") {
                replicate_ports = true;
                continue;
                // ++argidx;
                // if (argidx >= args.size()) {
                //     log_error("Expected '[' to start port list\n");
                // }
                // std::string token = (args[argidx]);
                // if (next_token.substr(0) != "[") {
                //     log_error("Expected '[' to start port list\n");
                // }
                // token = 
                // else {
                //     while (token.substr(0) != "]") {
                //         port_to_replicate.push_back(token);
                //         token = args[++argidx];
                //     }
                // }
            }
            if (args[argidx] == "-verbose") {
                verbose = true;
                continue;
            }
            // else if (args[argidx] == "-module") {
            //     const char *str = (args[++argidx]).c_str();
            //     modules_to_replicate.insert(str);
            // }
            // else {
            //     log("Unknown argument '%s'. It will be ignored.\n", args[argidx].c_str());
            // }
            break;
        }
        extra_args(args, argidx, design);

        ReplicationWorker worker = ReplicationWorker(copy_amount, suffix, replicate_ports);
        worker.setVerbose(verbose);
        RTLIL::Design *new_design = worker.run(design);
        // std::cout << "finished\n";
        yosys_design = new_design; // set the new design as THE design.
        
    }
} ApplyTMRPass;

PRIVATE_NAMESPACE_END