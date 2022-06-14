#include "kernel/yosys.h"

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

// inserts voters after every flip flop

// std::string ff_names[] = {"$dff", "$sdff"};
// std::map<std::string, std::string> type_to_output_port;

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

    typedef struct ConnectedCell {
        RTLIL::Cell *cell;
        RTLIL::IdString port_name;
        RTLIL::SigBit sigbit;
        // bool ConnectedCell::operator <(const ConnectedCell &other) const {return false;}
    } ConnectedCell;

    typedef struct WireConnectionInfo {
        ConnectedCell driver;
        std::vector<ConnectedCell> driven_cells;
        RTLIL::Wire *wire;
        int offset;
        
    } WireConnectionInfo;

    typedef struct ReductionPoint {
        ConnectedCell receiver;
        WireConnectionInfo info;
    } ReductionPoint;

    typedef struct NormalPoint {
        std::vector<ConnectedCell> cells;
    } NormalPoint;

    typedef struct InsertionPoint_ {
        // std::vector<ConnectedCell> cells;
        bool is_reduction;
        NormalPoint normal_point;
        ReductionPoint red_point;
        // union point_u {
        //     // NormalPoint normal_point;
        //     ReductionPoint red_point;
        // } point;
    } InsertionPoint;

    std::map<std::string, WireConnectionInfo> collect_connections(RTLIL::Module *module) {
        std::map<std::string, WireConnectionInfo> connection_map;
        for (auto cell: module->cells()) {
            // log("In cell: %s\n", log_id(cell));
            for (auto conn: cell->connections()) {
                // log("\t%s\n", conn.first.c_str());
                RTLIL::SigSpec sigspec = conn.second;
                for (auto sigbit: sigspec.bits()) {
                    if (sigbit.wire == NULL) {
                        continue;
                    }
                    ConnectedCell c = {cell, conn.first, sigbit};
                    std::string map_key = unescape_id(sigbit.wire->name) + "_" + std::to_string(sigbit.offset);
                    if (cell->output(conn.first)) {
                        connection_map[map_key].driver = c;
                        // std::cout << "Now the driver is " << log_id(connection_map[map_key].driver.cell) << "\n";
                    }
                    else {
                        connection_map[map_key].driven_cells.push_back(c);
                    }

                    connection_map[map_key].wire = sigbit.wire;
                    // std::cout << map_key << " in map has offset as " << std::to_string(connection_map[map_key].offset) << "\n";
                    connection_map[map_key].offset = sigbit.offset;
                }
            }
        }
        return connection_map;
    }

    // std::vector<ReductionPoint> identify_reduction_points(RTLIL::Module *module, std::string suffix, std::map<std::string, WireConnectionInfo> connection_map) {
    std::vector<InsertionPoint> identify_reduction_points(RTLIL::Module *module, std::string suffix, std::map<std::string, WireConnectionInfo> connection_map) {
        log("Identifying reduction points in module %s\n", log_id(module));    
        // map from a cell needing a replication voter before him to wire connection info.
        // std::map<ConnectedCell, WireConnectionInfo> insertion_points;
        std::vector<ReductionPoint> points;
        std::map<std::string, std::vector<ConnectedCell>> plain_name_to_drivers;
        std::vector<InsertionPoint> insertion_points;
        // iterate through cells in the module
        // if a cell does not have the suffix but his input wire does, he needs a reduction voter
        for (auto cell: module->cells()) {
            std::string cell_name = log_id(cell);
            if (cell_name.find(suffix) != std::string::npos) { // he was replicated
                // std::cout << cell_name << " of type " <<  RTLIL::unescape_id(cell->type) << " was replicated\n";
                continue;
            }
            // log("At cell %s of type %s\n", cell_name.c_str(), RTLIL::unescape_id(cell->type).c_str());
            for (auto conn: cell->connections()) {
                RTLIL::SigSpec sigspec = conn.second;
                for (auto sigbit: sigspec.bits()) {
                    // std::cout << "\tnext sigbit\n";
                    if (sigbit.wire == nullptr) {
                        continue;
                    }
                    std::string wire_name = log_id(sigbit.wire);
                    // std::cout << "\t wire name is " << wire_name << "\n";
                    if (wire_name.find(suffix) == std::string::npos) {
                        continue;
                    }
                    std::string port_name = RTLIL::unescape_id(conn.first);
                    if (port_name.find(suffix) != std::string::npos) {
                        continue;
                    }
                    if (cell->output(conn.first)) {
                        continue;
                    }
                    // std::cout << cell_name << " of type " << RTLIL::unescape_id(cell->type) << " needs a reduction voter before his port " << RTLIL::unescape_id(conn.first) << "\n";
                    std::string map_key = unescape_id(sigbit.wire->name) + "_" + std::to_string(sigbit.offset);
                    ConnectedCell c = {cell, conn.first, sigbit};
                    // insertion_points[c] = connection_map[map_key];
                    ReductionPoint new_point = {c, connection_map[map_key]};
                    points.push_back(new_point);

                    // std::string wire_name = RTLIL::unescape_id(sigbit.wire->name);
                    std::string new_map_key = remove_suffix_from_name(wire_name, suffix) + "_" + std::to_string(sigbit.offset);
                    WireConnectionInfo info = connection_map[map_key];
                    // plain_name_to_drivers[new_map_key].push_back(info.driver);
                    InsertionPoint point;
                    point.is_reduction = true;
                    point.red_point = new_point;
                    insertion_points.push_back(point);
                }
            }
        }
        // for (auto map_entry: plain_name_to_drivers) {
        //     ReductionPoint point;
        //     for (auto cell: map_entry.second) {
        //         point.cells.push_back(cell);
        //         // std::cout << "\t" << log_id(cell.cell) << "\n";
        //     }
        //     point.is_reduction = true;
        //     insertion_points.push_back(point);
        // }

        // return points;
        return insertion_points;
    }

    void insert_reduction_voters(RTLIL::Module *module, std::string suffix, std::vector<ReductionPoint> insertion_points,  \
                                            std::map<std::string, WireConnectionInfo> connection_map) {
        log("Inserting Voters...\n");
        for (auto point: insertion_points) {
            ConnectedCell receiving_cell = point.receiver;
            WireConnectionInfo info = point.info;
            std::cout << log_id(receiving_cell.cell) << " needs a reduction voter \n";
            // std::cout << "his number of wire connection infos is " << std::to_string(map_entry.second.size()) << "\n";
            RTLIL::Cell* primary_driver = info.driver.cell;
            std::vector<RTLIL::Cell*> driver_cells;
            // driver_cells.push_back(primary_driver);
            std::string plain_name = remove_suffix_from_name(RTLIL::unescape_id(primary_driver->name), suffix);
            // std::cout << "driver name is: " << RTLIL::unescape_id(primary_driver->name) << " and plain name is " << plain_name << "\n";
            for (int i = 0; i < 3; i++) {
                std::string other_driver_name = plain_name + "_" + suffix + "_" + std::to_string(i);
                RTLIL::Cell* other_driver = module->cell(other_driver_name);
                if (other_driver != nullptr){
                    // std::cout << "\tfound other driver of name " << other_driver_name << "\n";
                    driver_cells.push_back(other_driver);
                }
                else{
                    // std::cout << "\t other driver of name " << other_driver_name << " was not found\n";
                }
            }

            RTLIL::IdString port_name = info.driver.port_name;
            std::string plain_wire_name = remove_suffix_from_name(RTLIL::unescape_id(info.wire->name), suffix);
            int offset = info.offset;
            std::vector<RTLIL::SigBit> voter_input;
            for (int i = 0; i < driver_cells.size(); i++) {
                RTLIL::Cell *current_cell = driver_cells[i];
                RTLIL::SigSpec cell_output = current_cell->getPort(port_name);
                for (auto sigbit: cell_output.bits()) {
                    if (sigbit.wire == NULL) {
                        continue;
                    }
                    if (remove_suffix_from_name(RTLIL::unescape_id(sigbit.wire->name), suffix) != plain_wire_name) {
                        continue;
                    }
                    if (sigbit.offset != offset) {
                        continue;
                    }
                    // std::cout << "adding sigbit of name " << RTLIL::unescape_id(sigbit.wire->name) << " and offset " << std::to_string(sigbit.offset) << "\n";
                    voter_input.push_back(sigbit); 
                }
            }

            std::string new_wire_name = RTLIL::unescape_id(receiving_cell.cell->name) + "_VOTER_wire";
            RTLIL::Wire *voter_output_wire = module->addWire(new_wire_name);
            RTLIL::SigSpec voter_output = SigSpec(voter_output_wire);

            std::map<RTLIL::IdString, RTLIL::SigSpec> voter_inputs;
            // RTLIL::SigSpec voter_input = SigSpec();
            for (unsigned int i = 0; i < voter_input.size(); i++){
                voter_inputs[voterInfo.input_ports[i]] = voter_input[i];
                // voter_input.append(bit_pack[i].sigbit);
            }



            std::string voter_name = "\\" + RTLIL::unescape_id(receiving_cell.cell->name) + \
                                                "_VOTER";
            // add the voter now
            RTLIL::Cell *voter = module->addCell(voter_name, "\\" + voterInfo.cell_type);
            // voter_other->setPort("\\I", voter_input);
            for (auto voter_input_entry: voter_inputs){
                voter->setPort(voter_input_entry.first, voter_input_entry.second);
            }
            voter->setPort(voterInfo.output_ports[0], voter_output);
            voter_cnt++;

            std::cout << "Added voter: " << voter_name << "\n";
            std::cout << "\tConnections:\n";
            for (auto conn: voter->connections()) {
                log("\tPort: %s is connected to %s\n", log_id(conn.first), log_id(conn.second[0].wire));
            }
            
            // then connect the voter's output to the buffer
            receiving_cell.cell->setPort(receiving_cell.port_name, voter_output);
        }
    }

    std::vector<InsertionPoint> identify_points_after_ff(RTLIL::Module *module, std::string suffix, std::map<std::string, WireConnectionInfo> connection_map) {
        std::vector<InsertionPoint> insertion_points;
        std::map<std::string, std::vector<ConnectedCell>> plain_name_to_drivers;
        for (auto entry: connection_map) {
            if (entry.second.driver.cell != nullptr) {
                RTLIL::Cell *driver_cell = entry.second.driver.cell;
                std::string cell_type = RTLIL::unescape_id(driver_cell->type);
                if (std::find(std::begin(ff_names), std::end(ff_names), cell_type) == std::end(ff_names)) {
                    continue;
                }
                std::string wire_name = RTLIL::unescape_id(entry.second.wire->name);
                std::string map_key = remove_suffix_from_name(wire_name, suffix) + "_" + std::to_string(entry.second.offset);
                plain_name_to_drivers[map_key].push_back(entry.second.driver);
                
            }
        }
        for (auto entry: plain_name_to_drivers){
            NormalPoint point;
            std::cout << entry.first << "\n";
            for (auto cell: entry.second) {
                point.cells.push_back(cell);
                std::cout << "\t" << log_id(cell.cell) << "\n";
            }
            InsertionPoint insertion_point;
            insertion_point.is_reduction = false;
            insertion_point.normal_point = point;
            insertion_points.push_back(insertion_point);
        }
        return insertion_points;
    }

    void insert_reduction_voter(RTLIL::Module *module, std::string suffix, ReductionPoint point,  \
                                            std::map<std::string, WireConnectionInfo> connection_map) {
        log("Inserting Reduction Voter...\n");
    //     for (auto point: insertion_points) {
        ConnectedCell receiving_cell = point.receiver;
        WireConnectionInfo info = point.info;
        std::cout << log_id(receiving_cell.cell) << " needs a reduction voter \n";
        // std::cout << "his number of wire connection infos is " << std::to_string(map_entry.second.size()) << "\n";
        RTLIL::Cell* primary_driver = info.driver.cell;
        std::vector<RTLIL::Cell*> driver_cells;
        // driver_cells.push_back(primary_driver);
        std::string plain_name = remove_suffix_from_name(RTLIL::unescape_id(primary_driver->name), suffix);
        // std::cout << "driver name is: " << RTLIL::unescape_id(primary_driver->name) << " and plain name is " << plain_name << "\n";
        for (int i = 0; i < 3; i++) {
            std::string other_driver_name = plain_name + "_" + suffix + "_" + std::to_string(i);
            RTLIL::Cell* other_driver = module->cell(other_driver_name);
            if (other_driver != nullptr){
                // std::cout << "\tfound other driver of name " << other_driver_name << "\n";
                driver_cells.push_back(other_driver);
            }
            else{
                // std::cout << "\t other driver of name " << other_driver_name << " was not found\n";
            }
        }

        RTLIL::IdString port_name = info.driver.port_name;
        std::string plain_wire_name = remove_suffix_from_name(RTLIL::unescape_id(info.wire->name), suffix);
        int offset = info.offset;
        std::vector<RTLIL::SigBit> voter_input;
        for (int i = 0; i < driver_cells.size(); i++) {
            RTLIL::Cell *current_cell = driver_cells[i];
            RTLIL::SigSpec cell_output = current_cell->getPort(port_name);
            for (auto sigbit: cell_output.bits()) {
                if (sigbit.wire == NULL) {
                    continue;
                }
                if (remove_suffix_from_name(RTLIL::unescape_id(sigbit.wire->name), suffix) != plain_wire_name) {
                    continue;
                }
                if (sigbit.offset != offset) {
                    continue;
                }
                // std::cout << "adding sigbit of name " << RTLIL::unescape_id(sigbit.wire->name) << " and offset " << std::to_string(sigbit.offset) << "\n";
                voter_input.push_back(sigbit); 
            }
        }

        std::string new_wire_name = RTLIL::unescape_id(receiving_cell.cell->name) + "_RED_VOTER_wire";
        RTLIL::Wire *voter_output_wire = module->addWire(new_wire_name);
        RTLIL::SigSpec voter_output = SigSpec(voter_output_wire);

        std::map<RTLIL::IdString, RTLIL::SigSpec> voter_inputs;
        // RTLIL::SigSpec voter_input = SigSpec();
        for (unsigned int i = 0; i < voter_input.size(); i++){
            voter_inputs[voterInfo.input_ports[i]] = voter_input[i];
            // voter_input.append(bit_pack[i].sigbit);
        }



        std::string voter_name = "\\" + RTLIL::unescape_id(receiving_cell.cell->name) + \
                                            "_RED_VOTER";
        // add the voter now
        RTLIL::Cell *voter = module->addCell(voter_name, "\\" + voterInfo.cell_type);
        // voter_other->setPort("\\I", voter_input);
        for (auto voter_input_entry: voter_inputs){
            voter->setPort(voter_input_entry.first, voter_input_entry.second);
        }
        voter->setPort(voterInfo.output_ports[0], voter_output);
        voter_cnt++;

        std::cout << "Added reduction voter: " << voter_name << "\n";
        std::cout << "\tConnections:\n";
        for (auto conn: voter->connections()) {
            log("\tPort: %s is connected to %s\n", log_id(conn.first), log_id(conn.second[0].wire));
        }
        
        // then connect the voter's output to the buffer
        receiving_cell.cell->setPort(receiving_cell.port_name, voter_output);
        // }
    }

    void insert_voters(RTLIL::Module *module, std::string suffix, std::vector<InsertionPoint> insertion_points,
                        std::map<std::string, WireConnectionInfo> connection_map) {
        std::vector<RTLIL::Cell*> cells_set;
        for (auto insertion_point: insertion_points) {
            if (insertion_point.is_reduction) {
                std::cout << "we got a red voter here\n";
                insert_reduction_voter(module, suffix, insertion_point.red_point, connection_map);
                continue;
            }
            NormalPoint point = insertion_point.normal_point;

            std::vector<RTLIL::SigBit> voter_outputs;
            std::vector<RTLIL::SigBit> voter_inputs;
            // std::vector<RTLIL::
            for (auto driver: point.cells) {
                RTLIL::Cell *driver_cell = driver.cell;
                voter_outputs.push_back(driver.sigbit);
                std::string new_wire_name = "\\" + RTLIL::unescape_id(driver.sigbit.wire->name) + "_VOTER_wire_" + std::to_string(driver.sigbit.offset);
                RTLIL::Wire *new_wire = module->addWire(new_wire_name);
                // new_wire->port_output = driver.sigbit.wire->port_output;
                voter_inputs.push_back(SigBit(new_wire));
            } 

            int i = 0;
            for (auto driver: point.cells) {
                // disconnect the cell from original output and connect to new sigbit
                RTLIL::Cell *driver_cell = driver.cell;
                if (std::find(cells_set.begin(), cells_set.end(), driver_cell) == cells_set.end()) {
                    RTLIL::SigSpec new_sigspec = SigSpec();
                    std::cout << "trying to set port " << RTLIL::unescape_id(driver.port_name) << \
                         " on cell " << RTLIL::unescape_id(driver_cell->name) << "\n";
                    driver_cell->setPort(driver.port_name, new_sigspec);
                    cells_set.push_back(driver_cell);
                    std::cout << "done\n";
                }

                // driver.sigbit.wire->port_output = false;
                // add the new sigbit to the driver_cell's output
                RTLIL::SigSpec cell_output = driver_cell->getPort(driver.port_name);
                cell_output.append(voter_inputs[i]);
                driver_cell->setPort(driver.port_name, cell_output);

                RTLIL::SigSpec voter_output = SigSpec(voter_outputs[i]);
                RTLIL::SigSpec voter_input = SigSpec();
                std::map<RTLIL::IdString, RTLIL::SigSpec> voter_input_map;
                for (unsigned int i = 0; i < point.cells.size(); i++){
                    voter_input_map[voterInfo.input_ports[i]] = SigSpec(voter_inputs[i]);
                    // voter_input.append(bit_pack[i].sigbit);
                }
                std::string voter_name = "\\" + RTLIL::unescape_id(driver.sigbit.wire->name) + \
                                            "_VOTER_" + std::to_string(driver.sigbit.offset);
                // add the voter now
                // // RTLIL::Cell *voter = module->addLut(voter_name, voter_input, voter_output, RTLIL::Const::from_string("8'11101000"));
                RTLIL::Cell *voter = module->addCell(voter_name, "\\" + voterInfo.cell_type);
                        // // voter_other->setPort("\\I", voter_input);
                for (auto voter_input_entry: voter_input_map){
                    voter->setPort(voter_input_entry.first, voter_input_entry.second);
                }
                voter->setPort(voterInfo.output_ports[0], voter_output);
                voter_cnt++;
                i++;
                std::cout << "Added voter: " << voter_name << " (in module: " << RTLIL::unescape_id(module->name) << ")\n";
                std::cout << "\tConnections:\n";
                for (auto conn: voter->connections()) {
                    log("\tPort: %s is connected to %s\n", log_id(conn.first), log_id(conn.second[0].wire));
                }
            }
        }
        module->fixup_ports();

    }
    //     std::map<std::string, SigBitPack> new_sigbit_map = arrangePointPackBits(module, insertion_points);
    //     std::vector<RTLIL::Cell*> cells_set;
    //     for (auto map_entry: new_sigbit_map) {
    //         std::vector<SigBitInfo> bit_pack = map_entry.second.bit_pack;
    //         if (map_entry.second.is_reduction) {
    //             std::cout << "it's a reduction for " << map_entry.first << "\n";
    //             for (auto bit: bit_pack) {
    //                 // create new sigspec for cell output. Copy everything over except replace certain sigbit
    //                 RTLIL::SigSpec sigspec_orig = bit.cell->getPort(bit.port_name);
    //                 RTLIL::SigSpec new_sigspec = SigSpec();
    //                 for (auto sigbit: sigspec_orig.bits()) {
    //                     if (sigbit == bit.original) {
    //                         new_sigspec.append(bit.sigbit);
    //                     }
    //                     else {
    //                         new_sigspec.append(sigbit);
    //                     }
    //                 }
    //                 bit.cell->setPort(bit.port_name, new_sigspec);
    //                 // voter_input.append(bit.sigbit);
    //                 // RTLIL::SigBit original_output = bit.original;
    //             }
    //             RTLIL::SigSpec voter_output = bit_pack[0].original;
    //             std::map<RTLIL::IdString, RTLIL::SigSpec> voter_inputs;
    //             RTLIL::SigSpec voter_input = SigSpec();
    //             for (unsigned int i = 0; i < bit_pack.size(); i++){
    //                 std::cout << "here with " << std::to_string(i) << "\n";
    //                 voter_inputs[voterInfo.input_ports[i]] = bit_pack[i].sigbit;
    //                 // voter_input.append(bit_pack[i].sigbit);
    //             }
    //             std::string voter_name = "\\" + RTLIL::unescape_id(bit_pack[0].original.wire->name) + \
    //                                         "_VOTER_" + std::to_string(bit_pack[0].original.offset);
    //             // add the voter now
    //             // RTLIL::Cell *voter = module->addLut(voter_name, voter_input, voter_output, RTLIL::Const::from_string("8'11101000"));
    //             RTLIL::Cell *voter_other = module->addCell(voter_name, "\\" + voterInfo.cell_type);
    //             // voter_other->setPort("\\I", voter_input);
    //             for (auto voter_input_entry: voter_inputs){
    //                 voter_other->setPort(voter_input_entry.first, voter_input_entry.second);
    //             }
    //             voter_other->setPort(voterInfo.output_ports[0], voter_output);
    //             voter_cnt++;

    //         }
    //         else {
    //             for (auto bit: bit_pack) {

                    // // disconnect the cell from original output and connect to new sigbit
                    // if (std::find(cells_set.begin(), cells_set.end(), bit.cell) == cells_set.end()) {
                    //     RTLIL::SigSpec new_sigspec = SigSpec();
                    //     bit.cell->setPort(bit.port_name, new_sigspec);
                    //     cells_set.push_back(bit.cell);
                    // }

                    // bit.sigbit.wire->port_output = false;
                    // RTLIL::SigSpec cell_output = bit.cell->getPort(bit.port_name);
                    // cell_output.append(bit.sigbit);
                    // bit.cell->setPort(bit.port_name, cell_output);

                    // RTLIL::SigSpec voter_output = bit.original;
                    // std::map<RTLIL::IdString, RTLIL::SigSpec> voter_inputs;
                    // RTLIL::SigSpec voter_input = SigSpec();
                    // for (unsigned int i = 0; i < bit_pack.size(); i++){
                    //     voter_inputs[voterInfo.input_ports[i]] = bit_pack[i].sigbit;
                    //     // voter_input.append(bit_pack[i].sigbit);
                    // }
                    // std::string voter_name = "\\" + RTLIL::unescape_id(bit.sigbit.wire->name) + \
                    //                             "_VOTER_" + std::to_string(bit.sigbit.offset);
                    // // add the voter now
                    // // RTLIL::Cell *voter = module->addLut(voter_name, voter_input, voter_output, RTLIL::Const::from_string("8'11101000"));
                    // RTLIL::Cell *voter_other = module->addCell(voter_name, "\\" + voterInfo.cell_type);
                    // // voter_other->setPort("\\I", voter_input);
                    // for (auto voter_input_entry: voter_inputs){
                    //     voter_other->setPort(voter_input_entry.first, voter_input_entry.second);
                    // }
                    // voter_other->setPort(voterInfo.output_ports[0], voter_output);
                    // voter_cnt++;
    //             }
    //         }
    //     }
    // }

    // bool check_voter_insertion() {
    //     return false;
    // }

    // typedef struct InsertionPoint {
    //     RTLIL::Cell *cell;
    //     RTLIL::IdString port_name;
    //     RTLIL::SigSpec cell_orig_output;
    //     RTLIL::Wire *wire;
    //     int offset;
    //     bool is_reduction;
    // } InsertionPoint;

    // typedef struct InsertionPointPack {
    //     std::vector<InsertionPoint> points;
    // } InsertionPointPack;

    // std::map<std::string, InsertionPointPack> find_points_after_ff(RTLIL::Module *module, std::string suffix) {
    //     log("Finding Voter Insertion Points After FFs...\n");
    //     // create a map from original cell name to an InsertionPointPack containing InsertionPoints for the replica cells
    //     std::map<std::string, InsertionPointPack> insertion_points;
    //     for (auto cell: module->cells()) {
    //         std::string cell_type = RTLIL::unescape_id(cell->type);
    //         if (std::find(std::begin(ff_names), std::end(ff_names), cell_type) == std::end(ff_names)) {
    //             continue;
    //         }
    //         std::string output_port_name = type_to_output_port.at(cell_type);
    //         RTLIL::SigSpec sigspec = cell->getPort("\\" + output_port_name);
    //         std::string cell_original_name = remove_suffix_from_name(RTLIL::unescape_id(cell->name), suffix);

    //         InsertionPoint point = {cell, "\\" + output_port_name, sigspec, nullptr, 0, false};
    //         insertion_points[cell_original_name].points.push_back(point);
    //     }
    //     return insertion_points;
    // }

    // typedef struct ReductionPoint {
    //     RTLIL::SigBit sigbit; // new wire to go between cell and voter
    //     std::vector<RTLIL::Cell*> cells; // the cells
    //     // RTLIL::IdString port_name; // cell output port name
    //     RTLIL::SigBit original; // cell's original sigbit connection
    // } ReductionPoint;

    // std::map<std::string, InsertionPointPack> find_reduction_points(RTLIL::Module *module, std::string suffix) {
    //     log("Finding Reduction Voter Points...\n");
    //     // create a map from original cell name to an InsertionPointPack containing InsertionPoints for the replica cells
    //     std::map<std::string, InsertionPointPack> insertion_points;
    //     // create map from output wire_offset to cells
    //     // std::map<std::string, std::vector<RTLIL::Cell*>
    //     // for each cell, if he contains the suffix, he was replicated
    //     // and if he outputs to a wire that doesn't have the suffix, he needs a reduction voter.
    //     // std::cout << "here silly\n";
    //     for (auto cell: module->cells()) {
    //         std::string cell_type = RTLIL::unescape_id(cell->type);
    //         std::string cell_name = RTLIL::unescape_id(cell->name);
    //         std::cout << "Checking for reduction points after cell " << cell_name << " of type " << cell_type << "\n";
    //         if (cell_name.find(suffix) == std::string::npos) {
    //             continue;
    //         }
    //         for (auto conn: cell->connections()){
    //             // std::cout << "continuing\n";
    //             RTLIL::IdString port_name = conn.first;
    //             if (!(cell->output(port_name))) {
    //                 continue;
    //             }
    //             RTLIL::SigSpec sigspec = conn.second;
    //             for  (auto bit: sigspec.bits()) {
    //                 if (bit.wire == NULL) {
    //                     continue;
    //                 }
    //                 std::string wire_name = RTLIL::unescape_id(bit.wire->name);
    //                 std::cout << "\t his wire name is " << wire_name << "\n";
    //                 if (wire_name.find(suffix) != std::string::npos) {
    //                     continue;
    //                 }
    //                 // cell has suffix, wire doesn't. Need reduction voter.
    //                 std::cout << cell_name << " at port " << RTLIL::unescape_id(port_name) << " needs a reduction voter on wire " << wire_name << " offset " << \
    //                             std::to_string(bit.offset) << "\n";
    //                 std::string cell_original_name = remove_suffix_from_name(RTLIL::unescape_id(cell->name), suffix);
    //                 InsertionPoint point = {cell, port_name, sigspec, bit.wire, bit.offset, true}; 
    //                 insertion_points[cell_original_name].points.push_back(point);
                    
    //             }

    //         }
    //         // std::string output_port_name = type_to_output_port.at(cell_type);
    //         // RTLIL::SigSpec sigspec = cell->getPort("\\" + output_port_name);
    //         // std::string cell_original_name = remove_suffix_from_name(RTLIL::unescape_id(cell->name), suffix);

    //         // InsertionPoint point = {cell, "\\" + output_port_name, sigspec};
    //         // insertion_points[cell_original_name].points.push_back(point);
    //     }
    //     return insertion_points;
    // }

    // typedef struct SigBitInfo {
    //     RTLIL::SigBit sigbit; // new wire to go between cell and voter
    //     RTLIL::Cell *cell; // the cell
    //     RTLIL::IdString port_name; // cell output port name
    //     RTLIL::SigBit original; // cell's original sigbit connection
    //     bool is_reduction;
    // } SigBitInfo;

    // typedef struct SigBitPack {
    //     std::vector<SigBitInfo> bit_pack;
    //     bool is_reduction;
    // } SigBitPack;

    // // create map from output wire name (without suffix) to the three new wires (SigBits) that will exit each cell and input to each voter.
    // std::map<std::string, SigBitPack> arrangePointPackBits(RTLIL::Module *module, std::map<std::string, InsertionPointPack> insertion_points) {
    //     log("%s", "Organizing Voter Insertion Points...\n");
    //     std::map<std::string, SigBitPack> new_sigbit_map;
    //     for (auto map_entry: insertion_points) {
    //         std::vector<InsertionPoint> points = map_entry.second.points;
    //         for (auto point: points) {
    //             if (!point.is_reduction) {
    //                 RTLIL::SigSpec original_output = point.cell_orig_output;

    //                 // make sure new wires exist for all the chunks in the sigspec
    //                 for (auto chunk: original_output.chunks()) {
    //                     if (chunk.wire == NULL) {
    //                         continue;
    //                     }
    //                     std::string new_name = "\\" + RTLIL::unescape_id(chunk.wire->name) + \
    //                                             "_VOTER_wire";
    //                     RTLIL::Wire *new_wire = module->wire(new_name);
    //                     if (new_wire == nullptr) {
    //                         new_wire = module->addWire(new_name, chunk.wire);
    //                     }
    //                 }

    //                 // for each sigbit in the original, find the corresponding wire and make a new sigbit. Put it into the map.
    //                 for (auto bit: original_output.bits()) {
    //                     if (bit.wire == NULL) {
    //                         continue;
    //                     }
    //                     std::string new_name = "\\" + RTLIL::unescape_id(bit.wire->name) + \
    //                                             "_VOTER_wire";
    //                     RTLIL::Wire *new_wire = module->wire(new_name);
    //                     RTLIL::SigBit new_sigbit = SigBit(new_wire, bit.offset);

    //                     // name of original wire without the suffix and with the bit's offset
    //                     // used to match with other tmr domains later
    //                     std::string plain_name = remove_suffix_from_name(RTLIL::unescape_id(bit.wire->name), "TMR") + "_" + std::to_string(bit.offset);
    //                     SigBitInfo info = {new_sigbit, point.cell, point.port_name, bit, point.is_reduction};
    //                     new_sigbit_map[plain_name].bit_pack.push_back(info);
    //                     new_sigbit_map[plain_name].is_reduction = false;
    //                 }
    //             }
    //             else {
    //                 RTLIL::SigSpec original_output = point.cell_orig_output;
    //                 for (auto bit: original_output.bits()) {
    //                     if (bit.wire == point.wire && bit.offset == point.offset) {
    //                         std::string new_name = "\\" + RTLIL::unescape_id(point.wire->name) + \
    //                                             "_VOTER_wire";
    //                         RTLIL::Wire *new_wire = module->wire(new_name);
    //                             if (new_wire == nullptr) {
    //                                 new_wire = module->addWire(new_name, point.wire);
    //                             }
    //                         RTLIL::SigBit new_sigbit = SigBit(new_wire, point.offset);
    //                         SigBitInfo info = {new_sigbit, point.cell, point.port_name, bit, point.is_reduction};
    //                         std::string key = RTLIL::unescape_id(bit.wire->name) + "_" + std::to_string(bit.offset);
    //                         new_sigbit_map[key].bit_pack.push_back(info);
    //                         new_sigbit_map[key].is_reduction = true;
    //                         break;
    //                     }
    //                 }
    //             }

    //         }
    //     }
    //     return new_sigbit_map;
    // }

    // void insert_voters(RTLIL::Module *module, std::map<std::string, InsertionPointPack> insertion_points) {
    //     log("Inserting Voters...\n");
    //     std::map<std::string, SigBitPack> new_sigbit_map = arrangePointPackBits(module, insertion_points);
    //     std::vector<RTLIL::Cell*> cells_set;
    //     for (auto map_entry: new_sigbit_map) {
    //         std::vector<SigBitInfo> bit_pack = map_entry.second.bit_pack;
    //         if (map_entry.second.is_reduction) {
    //             std::cout << "it's a reduction for " << map_entry.first << "\n";
    //             for (auto bit: bit_pack) {
    //                 // create new sigspec for cell output. Copy everything over except replace certain sigbit
    //                 RTLIL::SigSpec sigspec_orig = bit.cell->getPort(bit.port_name);
    //                 RTLIL::SigSpec new_sigspec = SigSpec();
    //                 for (auto sigbit: sigspec_orig.bits()) {
    //                     if (sigbit == bit.original) {
    //                         new_sigspec.append(bit.sigbit);
    //                     }
    //                     else {
    //                         new_sigspec.append(sigbit);
    //                     }
    //                 }
    //                 bit.cell->setPort(bit.port_name, new_sigspec);
    //                 // voter_input.append(bit.sigbit);
    //                 // RTLIL::SigBit original_output = bit.original;
    //             }
    //             RTLIL::SigSpec voter_output = bit_pack[0].original;
    //             std::map<RTLIL::IdString, RTLIL::SigSpec> voter_inputs;
    //             RTLIL::SigSpec voter_input = SigSpec();
    //             for (unsigned int i = 0; i < bit_pack.size(); i++){
    //                 std::cout << "here with " << std::to_string(i) << "\n";
    //                 voter_inputs[voterInfo.input_ports[i]] = bit_pack[i].sigbit;
    //                 // voter_input.append(bit_pack[i].sigbit);
    //             }
    //             std::string voter_name = "\\" + RTLIL::unescape_id(bit_pack[0].original.wire->name) + \
    //                                         "_VOTER_" + std::to_string(bit_pack[0].original.offset);
    //             // add the voter now
    //             // RTLIL::Cell *voter = module->addLut(voter_name, voter_input, voter_output, RTLIL::Const::from_string("8'11101000"));
    //             RTLIL::Cell *voter_other = module->addCell(voter_name, "\\" + voterInfo.cell_type);
    //             // voter_other->setPort("\\I", voter_input);
    //             for (auto voter_input_entry: voter_inputs){
    //                 voter_other->setPort(voter_input_entry.first, voter_input_entry.second);
    //             }
    //             voter_other->setPort(voterInfo.output_ports[0], voter_output);
    //             voter_cnt++;

    //         }
    //         else {
    //             for (auto bit: bit_pack) {

    //                 // disconnect the cell from original output and connect to new sigbit
    //                 if (std::find(cells_set.begin(), cells_set.end(), bit.cell) == cells_set.end()) {
    //                     RTLIL::SigSpec new_sigspec = SigSpec();
    //                     bit.cell->setPort(bit.port_name, new_sigspec);
    //                     cells_set.push_back(bit.cell);
    //                 }

    //                 bit.sigbit.wire->port_output = false;
    //                 RTLIL::SigSpec cell_output = bit.cell->getPort(bit.port_name);
    //                 cell_output.append(bit.sigbit);
    //                 bit.cell->setPort(bit.port_name, cell_output);

    //                 RTLIL::SigSpec voter_output = bit.original;
    //                 std::map<RTLIL::IdString, RTLIL::SigSpec> voter_inputs;
    //                 RTLIL::SigSpec voter_input = SigSpec();
    //                 for (unsigned int i = 0; i < bit_pack.size(); i++){
    //                     voter_inputs[voterInfo.input_ports[i]] = bit_pack[i].sigbit;
    //                     // voter_input.append(bit_pack[i].sigbit);
    //                 }
    //                 std::string voter_name = "\\" + RTLIL::unescape_id(bit.sigbit.wire->name) + \
    //                                             "_VOTER_" + std::to_string(bit.sigbit.offset);
    //                 // add the voter now
    //                 // RTLIL::Cell *voter = module->addLut(voter_name, voter_input, voter_output, RTLIL::Const::from_string("8'11101000"));
    //                 RTLIL::Cell *voter_other = module->addCell(voter_name, "\\" + voterInfo.cell_type);
    //                 // voter_other->setPort("\\I", voter_input);
    //                 for (auto voter_input_entry: voter_inputs){
    //                     voter_other->setPort(voter_input_entry.first, voter_input_entry.second);
    //                 }
    //                 voter_other->setPort(voterInfo.output_ports[0], voter_output);
    //                 voter_cnt++;
    //             }
    //         }
    //     }
    // }

    // bool check_voter_insertion() {
    //     return false;
    // }

    std::vector<InsertionPoint> remove_redundant_reduction_voters(std::vector<InsertionPoint> insertion_points) {
        std::cout << "removing redundant reduction voters\n";
        std::vector<InsertionPoint> insertion_points_edited;
        std::map<std::string, std::vector<InsertionPoint>> point_map; 
        for (auto voter: insertion_points) {
            if (voter.is_reduction) {
                RTLIL::Wire *wire = voter.red_point.info.wire;
                RTLIL::SigBit sigbit = voter.red_point.receiver.sigbit;
                std::string map_key = unescape_id(sigbit.wire->name) + "_" + std::to_string(sigbit.offset);
                point_map[map_key].push_back(voter);
            }
            if (voter.normal_point.cells.size() > 0) {
                RTLIL::SigBit sigbit = voter.normal_point.cells[0].sigbit;
                std::string map_key = unescape_id(sigbit.wire->name) + "_" + std::to_string(sigbit.offset);
                point_map[map_key].push_back(voter);
            }
            // else if (voter.red_point.)
        }
        for (auto map_entry: point_map) {
            std::cout << map_entry.first << "\n";
            if (map_entry.second.size() == 1) {
                insertion_points_edited.push_back(map_entry.second[0]);
            }
            else {
                InsertionPoint non_reduction_point;
                for (auto point: map_entry.second) {
                    if (point.is_reduction) {
                        std::cout << "\tReduction\n";
                    }
                    else{
                        std::cout << "\tOther\n";
                        non_reduction_point = point;
                    }
                }
                insertion_points_edited.push_back(non_reduction_point);
            }
        }
        return insertion_points_edited;
    }

    std::vector<InsertionPoint> combine_insertion_points(std::vector<InsertionPoint> first, std::vector<InsertionPoint> two) {
        for (auto point: first){
            two.push_back(point);
        }
        return two;
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

        // initialize_output_port_map();
        initialize_voter_information(design);
        
        for (auto module: design->modules()) {
            if (module->get_bool_attribute("\\blackbox")) {
                continue;
            }
            std::map<std::string, WireConnectionInfo> connection_map = collect_connections(module);
            // std::vector<ReductionPoint> insertion_points = identify_reduction_points(module, suffix, connection_map);
            std::vector<InsertionPoint> insertion_points = identify_reduction_points(module, suffix, connection_map);
            // insert_reduction_voters(module, suffix, insertion_points, connection_map);
            std::vector<InsertionPoint> insertion_points_2 = identify_points_after_ff(module, suffix, connection_map);
            std::vector<InsertionPoint> all_insertion_points = combine_insertion_points(insertion_points, insertion_points_2);
            std::vector<InsertionPoint> final_insertion_points = remove_redundant_reduction_voters(all_insertion_points);
            insert_voters(module, suffix, final_insertion_points, connection_map);
            // std::map<std::string, InsertionPointPack>  insertion_points = find_points_after_ff(module, suffix);
            // std::map<std::string, InsertionPointPack>  reduction_insertion_points = find_reduction_points(module, suffix);
            // for (auto point: reduction_insertion_points) {
            //     insertion_points[point.first] = point.second;
            // }
            // insert_voters(module, insertion_points);
            module->fixup_ports();
        }
        log("Inserted %d Voters\n", voter_cnt);
    }
};

struct VoterInsertionPass : public Pass {
    VoterInsertionPass() : Pass("insert_voters") { }

    void execute(vector<string>, Design* design) override {
        std::string suffix = "TMR";
        int copy_amount = 3;
        std::string voter_type = "LUT3";
        InsertVoterWorker voter_worker = InsertVoterWorker(suffix, copy_amount, voter_type);
        voter_worker.run(design);
    }

} VoterInsertionPass;

PRIVATE_NAMESPACE_END