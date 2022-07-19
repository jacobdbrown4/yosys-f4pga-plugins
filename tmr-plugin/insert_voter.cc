#include "kernel/yosys.h"

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

struct InsertVoterWorker {
    private:
    std::string ff_names[4] = {"$dff", "$sdff", "$_DFF_P_", "FDRE"};
    std::string suffix;
    int copy_amount = 3;
    bool ff_voters;
    bool reduction_voters;
    std::map<std::string, std::string> type_to_output_port;
    int voter_cnt = 0;
    bool verbose;

    typedef struct VoterInfo{
        std::string cell_type;
        std::string name;
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
        printMessage("Initializing Voter Information\n", false);
        printMessage("Voter type is " + voterInfo.cell_type + "\n", false);
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

    RTLIL::Cell* addVoter(RTLIL::Module *module, std::string voter_id) {
        RTLIL::Cell* voter = module->addCell(voter_id, "\\" + voterInfo.cell_type);
        RTLIL::Const val = RTLIL::Const(232, 8); // "voter init value of 8'hE8
        voter->setParam("\\INIT", val);
        return voter;
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

    typedef struct ReductionPoint {
        ConnectedCell receiver;
        WireConnectionInfo info;
    } ReductionPoint;

    typedef struct NormalPoint {
        std::vector<ConnectedCell> cells;
    } NormalPoint;

    typedef struct InsertionPoint_ {
        bool is_reduction;
        NormalPoint normal_point;
        ReductionPoint red_point;
        union point_ {
            int x;
            float x_2;
        } point_u;
    } InsertionPoint;

    std::map<std::string, WireConnectionInfo> collect_connections(RTLIL::Module *module) {
        printMessage("Creating map of cell connections in module: " + RTLIL::unescape_id(module->name) + "\n", false);
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
        return connection_map;
    }

    std::vector<InsertionPoint> identify_reduction_points(RTLIL::Module *module, std::string suffix, std::map<std::string, WireConnectionInfo> connection_map) {
        printMessage("Identifying reduction points in module " + RTLIL::unescape_id(module->name) + "\n", true);  
        std::vector<ReductionPoint> points;
        std::vector<InsertionPoint> insertion_points;
        // iterate through cells in the module
        // if a cell does not have the suffix but his input wire does, he needs a reduction voter
        for (auto cell: module->cells()) {
            std::string cell_name = log_id(cell);
            if (cell_name.find(suffix) != std::string::npos) { // he was replicated
                continue;
            }
            for (auto conn: cell->connections()) {
                RTLIL::SigSpec sigspec = conn.second;
                for (auto sigbit: sigspec.bits()) {
                    if (sigbit.wire == nullptr) {
                        continue;
                    }
                    std::string wire_name = log_id(sigbit.wire);
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
                    ReductionPoint new_point = {c, connection_map[map_key]};

                    std::string new_map_key = remove_suffix_from_name(wire_name, suffix) + "_" + std::to_string(sigbit.offset);
                    WireConnectionInfo info = connection_map[map_key];
                    InsertionPoint point;
                    point.is_reduction = true;
                    point.red_point = new_point;
                    insertion_points.push_back(point);
                }
            }
        }
        return insertion_points;
    }

    std::vector<InsertionPoint> identify_points_after_ff(RTLIL::Module *module, std::string suffix, std::map<std::string, WireConnectionInfo> connection_map) {
        printMessage("Identifying points after ff in module " + RTLIL::unescape_id(module->name) + "\n", true);  
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
            for (auto cell: entry.second) {
                point.cells.push_back(cell);
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
        ConnectedCell receiving_cell = point.receiver;
        WireConnectionInfo info = point.info;
        RTLIL::Cell* primary_driver = info.driver.cell;
        std::vector<RTLIL::Cell*> driver_cells;
        std::string plain_name = remove_suffix_from_name(RTLIL::unescape_id(primary_driver->name), suffix);
        for (int i = 0; i < 3; i++) {
            std::string other_driver_name = plain_name + "_" + suffix + "_" + std::to_string(i);
            RTLIL::Cell* other_driver = module->cell(other_driver_name);
            if (other_driver != nullptr){
                driver_cells.push_back(other_driver);
            }
            else{
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
                voter_input.push_back(sigbit); 
            }
        }

        std::string new_wire_name = RTLIL::unescape_id(receiving_cell.cell->name) + "_RED_" + voterInfo.name + "_wire";
        RTLIL::Wire *voter_output_wire = module->addWire(new_wire_name);
        RTLIL::SigSpec voter_output = SigSpec(voter_output_wire);

        std::map<RTLIL::IdString, RTLIL::SigSpec> voter_inputs;
        for (unsigned int i = 0; i < voter_input.size(); i++){
            voter_inputs[voterInfo.input_ports[i]] = voter_input[i];
        }



        std::string voter_id = "\\" + RTLIL::unescape_id(receiving_cell.cell->name) + \
                                            "_RED_" + voterInfo.name;
        // add the voter now
        // RTLIL::Cell *voter = module->addCell(voter_id, "\\" + voterInfo.cell_type);
        RTLIL::Cell* voter = addVoter(module, voter_id);
        // voter_other->setPort("\\I", voter_input);
        for (auto voter_input_entry: voter_inputs){
            voter->setPort(voter_input_entry.first, voter_input_entry.second);
        }
        voter->setPort(voterInfo.output_ports[0], voter_output);
        voter_cnt++;

        std::string to_write = "Added reduction voter: " + voter_id + "\n";
        to_write+= "\tConnections:\n";
        for (auto conn: voter->connections()) {
            to_write+="\tPort: " + RTLIL::unescape_id(conn.first) + " is connected to " + \
                        RTLIL::unescape_id(conn.second[0].wire->name) + "\n";
        }
        printMessage(to_write, false);
        
        // then connect the voter's output to the buffer
        receiving_cell.cell->setPort(receiving_cell.port_name, voter_output);
    }

    void insert_voters(RTLIL::Module *module, std::string suffix, std::vector<InsertionPoint> insertion_points,
                        std::map<std::string, WireConnectionInfo> connection_map) {
        printMessage("Inserting voters in module " + RTLIL::unescape_id(module->name) + "\n", true);  
        std::vector<RTLIL::Cell*> cells_set;
        for (auto insertion_point: insertion_points) {
            if (insertion_point.is_reduction) {
                insert_reduction_voter(module, suffix, insertion_point.red_point, connection_map);
                continue;
            }
            NormalPoint point = insertion_point.normal_point;

            std::vector<RTLIL::SigBit> voter_outputs;
            std::vector<RTLIL::SigBit> voter_inputs;
            for (auto driver: point.cells) {
                RTLIL::Cell *driver_cell = driver.cell;
                voter_outputs.push_back(driver.sigbit);
                std::string new_wire_name = "\\" + RTLIL::unescape_id(driver.sigbit.wire->name) + "_" + voterInfo.name + \
                                                "_wire_" + std::to_string(driver.sigbit.offset);
                RTLIL::Wire *new_wire = module->addWire(new_wire_name);
                voter_inputs.push_back(SigBit(new_wire));
            } 

            int i = 0;
            for (auto driver: point.cells) {
                // disconnect the cell from original output and connect to new sigbit
                RTLIL::Cell *driver_cell = driver.cell;
                if (std::find(cells_set.begin(), cells_set.end(), driver_cell) == cells_set.end()) {
                    RTLIL::SigSpec new_sigspec = SigSpec();
                    driver_cell->setPort(driver.port_name, new_sigspec);
                    cells_set.push_back(driver_cell);
                }

                // add the new sigbit to the driver_cell's output
                RTLIL::SigSpec cell_output = driver_cell->getPort(driver.port_name);
                cell_output.append(voter_inputs[i]);
                driver_cell->setPort(driver.port_name, cell_output);

                RTLIL::SigSpec voter_output = SigSpec(voter_outputs[i]);
                RTLIL::SigSpec voter_input = SigSpec();
                std::map<RTLIL::IdString, RTLIL::SigSpec> voter_input_map;
                for (unsigned int i = 0; i < point.cells.size(); i++){
                    voter_input_map[voterInfo.input_ports[i]] = SigSpec(voter_inputs[i]);
                }
                std::string voter_id = "\\" + RTLIL::unescape_id(driver.sigbit.wire->name) + \
                                            "_" + voterInfo.name + "_" + std::to_string(driver.sigbit.offset);
                // add the voter now
                // RTLIL::Cell *voter = module->addCell(voter_id, "\\" + voterInfo.cell_type);
                RTLIL::Cell* voter = addVoter(module, voter_id);
                for (auto voter_input_entry: voter_input_map){
                    voter->setPort(voter_input_entry.first, voter_input_entry.second);
                }
                voter->setPort(voterInfo.output_ports[0], voter_output);
                voter_cnt++;
                i++;
                std::string to_write = "Added voter: " + voter_id + "\n";
                to_write+= "\tConnections:\n";
                for (auto conn: voter->connections()) {
                    to_write+="\tPort: " + RTLIL::unescape_id(conn.first) + " is connected to " + \
                                RTLIL::unescape_id(conn.second[0].wire->name) + "\n";
                }
                printMessage(to_write, false);
            }
        }
        module->fixup_ports();

    }

    void printMessage(std::string main_string, bool force) {
        if (verbose || force){
            log("%s", main_string.c_str());
        }
    }

    std::vector<InsertionPoint> remove_redundant_reduction_voters(std::vector<InsertionPoint> insertion_points) {
        printMessage("Removing redundant reduction voters...\n", false);
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
        }
        for (auto map_entry: point_map) {
            if (map_entry.second.size() == 1) {
                insertion_points_edited.push_back(map_entry.second[0]);
            }
            else {
                InsertionPoint non_reduction_point;
                for (auto point: map_entry.second) {
                    if (point.is_reduction) {
                    }
                    else{
                        non_reduction_point = point;
                    }
                }
                insertion_points_edited.push_back(non_reduction_point);
            }
        }
        return insertion_points_edited;
    }

    std::vector<InsertionPoint> combine_insertion_points(std::vector<InsertionPoint> first, std::vector<InsertionPoint> two) {
        if (first.size() == 0) {
            return two;
        }
        if (two.size() == 0) {
            return first;
        }
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
    InsertVoterWorker(std::string new_suffix, int amount_of_copies, bool ff_voters, bool reduction_voters) {
        suffix = new_suffix;
        copy_amount = amount_of_copies;
        this->reduction_voters = reduction_voters;
        this->ff_voters = ff_voters;
    }

    void setVoterInformation(std::string voter_type, std::string voter_name) {
        voterInfo.cell_type = voter_type;
        voterInfo.name = voter_name;
    }
    
    void setVerbose(bool verbose) {
        this->verbose = verbose;
    }

    void run(Design* design) {

        // initialize_output_port_map();
        initialize_voter_information(design);
        
        for (auto module: design->modules()) {
            if (module->get_bool_attribute("\\blackbox")) {
                continue;
            }
            std::map<std::string, WireConnectionInfo> connection_map = collect_connections(module);

            std::vector<InsertionPoint> insertion_points_1;
            std::vector<InsertionPoint> insertion_points_2;

            if (reduction_voters) {
                insertion_points_1 = identify_reduction_points(module, suffix, connection_map);
            }
            if (ff_voters) {
                insertion_points_2 = identify_points_after_ff(module, suffix, connection_map);
            }

            std::vector<InsertionPoint> all_insertion_points = combine_insertion_points(insertion_points_1, insertion_points_2);
            std::vector<InsertionPoint> final_insertion_points = remove_redundant_reduction_voters(all_insertion_points);
            insert_voters(module, suffix, final_insertion_points, connection_map);

            module->fixup_ports();
        }
        log("Inserted %d Voters\n", voter_cnt);
    }
};

struct VoterInsertionPass : public Pass {
    VoterInsertionPass() : Pass("insert_voters") { }

    void help() override {

		//   |---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|---v---|
		log("\n");
		log("    insert_voters [options]\n");
		log("\n");
		log("This command inserts voters into a replicated the design.\n");
		log("It operates on all modules in the design except for blackboxes.\n");
		log("\n");
        log("    -suffix <string>\n");
        log("        Specify the suffix to be appended to each inserted voter.\n");
        log("        The default suffix is \"TMR\"\n");
		log("\n");
        log("    -amount <int>\n");
        log("        Total number of copies in the replicated design.\n");
        log("        The default is 3\n");
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
        log("    -verbose\n");
        log("        Print all log messages during voter insertion\n");
        log("\n");
    }

    void execute(vector<string> args, Design* design) override {

        log_header(design, "Executing INSERT_VOTERS Pass\n");

        std::string suffix = "TMR";
        int copy_amount = 3;
        std::string voter_type = "LUT3";
        std::string voter_name = "VOTER";
        bool reduction_voters = false;
        bool ff_voters = false;
        bool verbose = false;

        size_t argidx;
        for (argidx = 1; argidx < args.size(); argidx++) {
            if (args[argidx] == "-suffix") {
                suffix = args[++argidx];
            }
            else if (args[argidx] == "-amount") {
                const char *str = (args[++argidx]).c_str();
                copy_amount = atoi(str);
            }
            else if (args[argidx] == "-voter_type") {
                voter_type = (args[++argidx]);
            }
            else if (args[argidx] == "-voter_name") {
                voter_name = (args[++argidx]);
            }
            else if (args[argidx] == "-reduction") {
                reduction_voters = true;
            }
            else if (args[argidx] == "-ff") {
                ff_voters = true;
            }
            else if (args[argidx] == "-verbose") {
                verbose = true;
            }
            else {
                log("Unknown argument '%s'. It will be ignored.\n", args[argidx].c_str());
            }
        }
        InsertVoterWorker voter_worker = InsertVoterWorker(suffix, copy_amount, ff_voters, reduction_voters);
        voter_worker.setVoterInformation(voter_type, voter_name);
        voter_worker.setVerbose(verbose);
        voter_worker.run(design);
    }

} VoterInsertionPass;

PRIVATE_NAMESPACE_END