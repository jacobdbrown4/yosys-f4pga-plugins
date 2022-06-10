#include "kernel/yosys.h"

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

// creates a new module and clones all the wires from the original to the new module

struct ViewInfoPass : public Pass {
    ViewInfoPass() : Pass("view_info") { }
    void execute(vector<string>, Design* design) override {
        std::cout << "in view_info\n";
        for (auto module: design->modules()) {
            for (auto cell: module->cells()) {
                std::cout << "In cell " << log_id(cell) << "\n";
                for (auto conn: cell->connections()) {
                    std::cout << "\tPort: " << log_id(conn.first) << "\n";
                    RTLIL::SigSpec sigspec = conn.second;

                    std::cout << "\t\tChunks:\n";
                    int chunk_cnt = 0;
                    for (auto chunk: sigspec.chunks()) {
                        chunk_cnt++;
                        std::string wire_name;
                        if (chunk.wire) {
                            wire_name = RTLIL::unescape_id(chunk.wire->name);
                        }
                        else {
                            wire_name = "NULL";
                        }
                        std::cout << "\t\t\tWire: " << wire_name << " Width: " << std::to_string(chunk.width) << " Offset: " << \
                                std::to_string(chunk.offset) << " Data Size: " << GetSize(chunk.data) <<  "\n";
                    }
                    if (chunk_cnt > 1) {
                        std::cout << "\t\tMultiple chunks alert\n";
                    }

                    std::cout << "\t\tBits:\n";
                    for (auto bit: sigspec.bits()) {
                        std::string wire_name;
                        if (bit.wire) {
                            wire_name = RTLIL::unescape_id(bit.wire->name);
                        }
                        else {
                            wire_name = "NULL";
                        }
                        std::cout << "\t\t\tWire: " << wire_name << " Data: " << std::to_string(bit.data) << " Offset: " << \
                                std::to_string(bit.offset) <<  "\n";
                    }
                }
            }
        }
    }   
} ViewInfoPass;

PRIVATE_NAMESPACE_END