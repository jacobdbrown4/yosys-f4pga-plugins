#include "kernel/yosys.h"

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

// inserts voters after every flip flop

std::string ff_names[] = {"$dff", "$sdff"};
std::map<std::string, std::string> type_to_output_port;

struct VoterInsertionPass : public Pass {
    VoterInsertionPass() : Pass("insert_voter") { }

    void execute(vector<string>, Design* design) override {
        std::cout << "\nin insert_voter\n";

        initialize_output_port_map();
        
        for (auto module: design->modules()) {
            // std::vector<RTLIL::Wire*> wire_points = find_points_after_ff(module);
            std::map<std::string, std::vector<std::pair<RTLIL::Cell*, RTLIL::IdString>>> insertion_points = find_points_after_ff_2(module, "TMR");
            insert_voters(module, insertion_points);
        }
    }

    void initialize_output_port_map() {
        type_to_output_port.insert(std::pair<std::string, std::string>("$dff", "Q"));
        type_to_output_port.insert(std::pair<std::string, std::string>("$sdff", "Q"));
    }

    // std::vector<RTLIL::Wire*> find_points_after_ff(RTLIL::Module *module) {
    //     std::vector<RTLIL::Wire*> found_wires;
    //     for (auto cell: module->cells()) {
    //         std::string cell_type = RTLIL::unescape_id(cell->type);
    //         if (std::find(std::begin(ff_names), std::end(ff_names), cell_type) == std::end(ff_names)) {
    //             continue;
    //         }
    //         // std::cout << "found one: " << cell_type << "\n";
    //         std::string output_port_name = type_to_output_port.at(cell_type);
    //         // std::cout << "output port is: " << output_port_name << "\n";
    //         RTLIL::SigSpec sigspec = cell->getPort("\\" + output_port_name);
    //         for (auto chunk : sigspec.chunks()) {
    //             if (chunk.wire == nullptr) {
    //                 continue;
    //             }
    //             RTLIL::Wire *output_wire = chunk.wire;
    //             std::cout << "output wire: " << RTLIL::unescape_id(output_wire->name) << "\n";
    //             found_wires.push_back(output_wire);
    //         }
    //     }
    //     return found_wires;
    // }

    std::map<std::string, std::vector<std::pair<RTLIL::Cell*, RTLIL::IdString>>> find_points_after_ff_2(RTLIL::Module *module, std::string suffix) {
        std::map<std::string, std::vector<std::pair<RTLIL::Cell*, RTLIL::IdString>>> insertion_points;
        for (auto cell: module->cells()) {
            std::string cell_type = RTLIL::unescape_id(cell->type);
            if (std::find(std::begin(ff_names), std::end(ff_names), cell_type) == std::end(ff_names)) {
                continue;
            }
            std::string output_port_name = type_to_output_port.at(cell_type);
            RTLIL::SigSpec sigspec = cell->getPort("\\" + output_port_name);
            for (auto chunk : sigspec.chunks()) {
                if (chunk.wire == nullptr) {
                    continue;
                }
                RTLIL::Wire *output_wire = chunk.wire;
                std::cout << "output wire: " << RTLIL::unescape_id(output_wire->name) << "\n";
                std::string original_wire_name = remove_suffix_from_name(RTLIL::unescape_id(output_wire->name), suffix);
                insertion_points[original_wire_name].push_back(std::pair<RTLIL::Cell*, RTLIL::IdString>(cell, "\\" + output_port_name));
            }
        }
        return insertion_points;
    }

    void insert_voters(RTLIL::Module *module, std::map<std::string, std::vector<std::pair<RTLIL::Cell*, RTLIL::IdString>>> insertion_points) {
        std::cout << "inserting voters\n";
        for (auto map_entry: insertion_points) {
            std::cout << map_entry.first << "\n";

            std::vector<std::pair<RTLIL::Cell*, RTLIL::IdString>> cell_port_pairs = map_entry.second;
            std::vector<std::pair<RTLIL::Cell*, RTLIL::IdString>> new_cell_wire_pairs;
            std::vector<RTLIL::Wire*> old_wires;
            std::vector<RTLIL::Wire*> new_wires;

            // disconnect each cell output wire and reconnect a new wire
            for (auto pair: cell_port_pairs) {
                // std::cout << "next pair\n";
                RTLIL::Cell *cell = pair.first;
                RTLIL::IdString port_name = pair.second;
                RTLIL::SigSpec sigspec = cell->getPort(port_name);
                std::vector<RTLIL::SigChunk> current_chunks;
                for (auto chunk: sigspec.chunks()) {
                    old_wires.push_back(chunk.wire);
                    std::string new_name = "\\" + RTLIL::unescape_id(chunk.wire->name) + \
                                            "_VOTER_" + std::to_string(chunk.offset);
                    // std::cout << "new wire name: " << new_name << "\n";
                    RTLIL::Wire *new_wire = module->addWire(new_name, chunk.wire);
                    new_wire->port_output = false;
                    // chunk.wire = new_wire;
                    new_wires.push_back(new_wire);

                    RTLIL::SigChunk* new_chunk = new RTLIL::SigChunk(chunk);
                    // RTLIL::SigChunk new_chunk = chunk.extract(0, 1);
                    new_chunk->wire = new_wire;
                    current_chunks.push_back(*new_chunk);
                }
                RTLIL::SigSpec *new_sigspec = new RTLIL::SigSpec();
                int chunk_cnt = 0;
                for (auto a_chunk: current_chunks){
                    new_sigspec->append(RTLIL::SigSpec(a_chunk));
                }

                cell->setPort(port_name, *new_sigspec);
                module->fixup_ports();
            }            
            
            // now add luts and connect inputs to new wires and output to old wires
            for (int i = 0; i < 3; i++) {

                RTLIL::SigSpec sigspec_in = RTLIL::SigSpec();
                sigspec_in.append(RTLIL::SigSpec(new_wires[0], 0, 1));
                sigspec_in.append(RTLIL::SigSpec(new_wires[1], 0, 1));
                sigspec_in.append(RTLIL::SigSpec(new_wires[2], 0, 1));

                RTLIL::SigSpec sigspec_out = RTLIL::SigSpec(old_wires[i], 0, 1); // putting 0,1 makes sure the size is just 1

                std::string lut_name = "\\" + RTLIL::unescape_id(old_wires[i]->name) + "_VOTER";
                std::cout << "Voter name: " << lut_name << "\n";
                RTLIL::Cell *lut = module->addLut(lut_name, sigspec_in, sigspec_out, RTLIL::Const::from_string("8'11101000"));
                module->fixup_ports();
            }
        }
    }

    bool check_voter_insertion() {
        
    }

    std::string remove_suffix_from_name(std::string name, std::string suffix) {
        size_t position = name.find(suffix);
        if (position != std::string::npos) {
            name.erase(position - 1, suffix.length()+3);
        }
        return name;
    }


} VoterInsertionPass;

PRIVATE_NAMESPACE_END