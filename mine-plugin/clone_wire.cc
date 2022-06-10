#include "kernel/yosys.h"

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

// creates a new module and clones all the wires from the original to the new module

struct CloneWirePass : public Pass {
    CloneWirePass() : Pass("clone_wire") { }
    void execute(vector<string>, Design* design) override {
        std::cout << "in clone_wire\n";
        RTLIL::Module *new_module = design->addModule("\\new_module");
        for (auto module: design->selected_modules()) {
            for (auto old_wire: module->wires()) {
                RTLIL::Wire *wire = new_module->addWire(NEW_ID, old_wire);
                std::cout << "\told wire: " << RTLIL::unescape_id(old_wire->name) << "in module: " << RTLIL::unescape_id(module->name) << "\n";
                std::cout << "\tnew wire: " << RTLIL::unescape_id(wire->name) << "in module: " << RTLIL::unescape_id(wire->module->name) << "\n";
                new_module->fixup_ports(); // not sure what this does but without it fails
                new_module->Not(NEW_ID, wire);
            }
        }
        // design->rename(new_module, "\\new_name");
    }   
} CloneWirePass;

PRIVATE_NAMESPACE_END