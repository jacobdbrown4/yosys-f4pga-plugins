#include "kernel/yosys.h"

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

// Adds a new module to the design
// this new module's flow is input->AND->NOT->output

struct ModuleFromScratch : public Pass {
    ModuleFromScratch() : Pass("module_from_scratch") { }
    void execute(vector<string>, Design* design) override {
        std::cout << "in module_from_scratch\n";
        RTLIL::Module *new_module = design->addModule("\\new_module");

        // AND gate
        // RTLIL::Wire *and_wire_1 = new_module->addWire(NEW_ID, 1);
        // and_wire_1->port_input = true;
        // RTLIL::Wire *and_wire_2 = new_module->addWire(NEW_ID, 1);
        // and_wire_2->port_input = true;
        // RTLIL::SigSpec and_sigspec = new_module->And(NEW_ID, and_wire_1, and_wire_2);
        // RTLIL::Wire *and_sig_wire = and_sigspec[0].wire;

        // // NOT gate
        // RTLIL::Wire *not_wire = new_module->addWire(NEW_ID, 1);
        // // wire->port_input = true; // makes this a module input
        // RTLIL::SigSpec sigspec = new_module->Not(NEW_ID, not_wire);
        // RTLIL::SigBit sig = sigspec[0];
        // RTLIL::Wire *sig_wire = sig.wire;
        // sig_wire->port_output=true;
        // new_module->fixup_ports(); // i think this updates port info

        // new_module->connect(not_wire, and_sig_wire);

        // Try adding a lut
        RTLIL::Wire *lut_wires_1 = new_module->addWire(NEW_ID, 1);
        RTLIL::Wire *lut_wires_2 = new_module->addWire(NEW_ID, 1);
        RTLIL::Wire *lut_wires_3 = new_module->addWire(NEW_ID, 1);
        RTLIL::Wire *lut_wire_out = new_module->addWire(NEW_ID, 1);

        lut_wires_1->port_input = true;
        lut_wires_2->port_input = true;
        lut_wires_3->port_input = true;
        lut_wire_out->port_output = true;

        RTLIL::SigSpec sigspec_in = RTLIL::SigSpec();
        sigspec_in.append(RTLIL::SigSpec(lut_wires_1, 0, 1));
        sigspec_in.append(RTLIL::SigSpec(lut_wires_2, 0, 1));
        sigspec_in.append(RTLIL::SigSpec(lut_wires_3, 0, 1));

        RTLIL::SigSpec sigspec_out = RTLIL::SigSpec(lut_wire_out);

        std::cout << "adding lut\n";
        new_module->addLut("\\my_lut", sigspec_in, sigspec_out, RTLIL::Const::from_string("8'11101000"));
        new_module->fixup_ports();

    }   
} HelloWorldPass;

PRIVATE_NAMESPACE_END