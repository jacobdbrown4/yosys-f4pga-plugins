#include "kernel/yosys.h"

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

struct AddSomethingPass : public Pass {
    AddSomethingPass() : Pass("add_something") { }
    void execute(vector<string>, Design* design) override {
        std::cout << "in add_something\n";
        for (auto module: design->modules()) {
            RTLIL::Wire *wire = module->addWire(NEW_ID, 1);
            std::cout << "new wire of name \"" << RTLIL::unescape_id(wire->name) << "\" was created\n";
        }
    }   
} HelloWorldPass;

PRIVATE_NAMESPACE_END