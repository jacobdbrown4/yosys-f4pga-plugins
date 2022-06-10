#include "kernel/yosys.h"
#include "kernel/celltypes.h"

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

// inserts voters after every flip flop

std::string ff_names[] = {"$dff", "$sdff"};
std::map<std::string, std::string> type_to_output_port;



struct CellPrimitiveInfo : public Pass {
    CellPrimitiveInfo() : Pass("cell_primitive_info") { }

    void execute(vector<string>, Design* design) override {
        struct CellTypes cell_types_struct = CellTypes(design);
        for (auto cell: cell_types_struct.cell_types) {
            std::string to_write;
            std::string name = RTLIL::unescape_id(cell.first);

            to_write+=name+"\n";

            CellType cell_type = cell.second;
            to_write+="\tINPUTS:\n";
            for (auto input : cell_type.inputs) {
                std::string input_name = RTLIL::unescape_id(input);
                to_write+="\t\t" + input_name + "\n";
            }

            to_write+="\tOUTPUTS:\n";
            for (auto output : cell_type.outputs) {
                std::string output_name = RTLIL::unescape_id(output);
                to_write+="\t\t" + output_name + "\n";
            }

            std::cout << to_write << "DONE\n";
        }

    }


} CellPrimitiveInfo;

PRIVATE_NAMESPACE_END