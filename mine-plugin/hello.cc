#include "kernel/yosys.h"

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

struct HelloWorldPass : public Pass {
    HelloWorldPass() : Pass("hello_world") { }
    void execute(vector<string>, Design* design) override {
        log("Hello World! wow this works\n");
        for (auto module : design->selected_modules()) {
            std::string name = RTLIL::unescape_id(module->name);
            std::cout << "MODULE DEF: " << name << "\n";
            for (auto cell: module->cells()) {
                std::string cell_name = RTLIL::unescape_id(cell->name);
                std::cout << "\t" << cell_name << "\n";
            }
        }
    }
} HelloWorldPass;

PRIVATE_NAMESPACE_END