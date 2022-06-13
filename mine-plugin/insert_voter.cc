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
    } ConnectedCell;

    typedef struct WireConnectionInfo {
        ConnectedCell driver;
        std::vector<ConnectedCell> driven_cells;
        RTLIL::Wire *wire;
        int offset;
    } WireConnectionInfo;

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

    std::vector<WireConnectionInfo> identify_reduction_points(RTLIL::Module *module, std::string suffix, std::map<std::string, WireConnectionInfo> connection_map) {
        // iterate through cells in the module
        // if a cell does not have the suffix but his input wire does, he needs a reduction voter
        for (auto cell: module->cells()) {
            std::string cell_name = log_id(cell);
            if (cell_name.find(suffix) != std::string::npos) { // he wasn't replicated
                continue;
            }
            log("In cell %s\n", cell_name.c_str());
            for (auto conn: cell->connections()) {
                RTLIL::SigSpec sigspec = conn.second;
                for (auto sigbit: sigspec.bits()) {
                    if (sigbit.wire == nullptr) {
                        continue;
                    }
                    std::string wire_name = log_id(sigbit.wire);
                    if (cell_name.find(suffix) == std::string::npos) {
                        continue;
                    }
                    std::cout << cell_name << " needs a reduction voter before his input port " << RTLIL::unescape_id(conn.first) << "\n";
                }
            }
        }
        std::vector<WireConnectionInfo> stuff;
        return stuff;
    }

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
            identify_reduction_points(module, suffix, connection_map);
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