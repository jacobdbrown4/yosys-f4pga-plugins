#include "kernel/yosys.h"
#include "kernel/register.h"
#include "kernel/rtlil.h"
#include "kernel/log.h"


USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

struct ApplyTMRPass : public ScriptPass {
    ApplyTMRPass() : ScriptPass("apply_tmr", "Apply TMR to a design") { }
    void help() override {

        log("\n");
		log("\n");
		log("    apply_tmr [options]\n");
		log("\n");
        log("Convenience command to run both replicate and insert_voters");
		log("\n");
        log("    -suffix <string>\n");
        log("        Specify the suffix to be appended to each replicated cell and wire name.\n");
        log("        The default suffix is \"TMR\"\n");
		log("\n");
        log("    -amount <int>\n");
        log("        Total number of copies. The default is 3\n");
        log("\n");
        log("    -ports\n");
        log("        When this option is passed, all top level ports will be replicated.\n");
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

    std::string suffix, voter_type, voter_name;
    int amount;
    bool ports, reduction, ff, verbose;

    void clear_flags() override {
        suffix = "TMR";
        voter_type = "LUT3";
        voter_name = "VOTER";
        amount = 3;
        ports = false;
        reduction = false;
        ff = false;
        verbose = false;
    }

    void execute(vector<string> args, Design* design) override {

        // std::string suffix = "TMR";
        // int copy_amount = 3;
        // std::string voter_type = "LUT3";

        log_header(design, "Executing APPLY_TMR Pass\n");

        size_t argidx;
        for (argidx = 1; argidx < args.size(); argidx++) {
            if (args[argidx] == "-suffix") {
                suffix = args[++argidx];
            }
            else if (args[argidx] == "-amount") {
                const char *str = (args[++argidx]).c_str();
                amount = atoi(str);
            }
            else if (args[argidx] == "-ports") {
                ports = true;
            }
            else if (args[argidx] == "-verbose") {
                verbose = true;
            }
            else if (args[argidx] == "-voter_type") {
                voter_type = (args[++argidx]);
            }
            else if (args[argidx] == "-voter_name") {
                voter_name = (args[++argidx]);
            }
            else if (args[argidx] == "-reduction") {
                reduction = true;
            }
            else if (args[argidx] == "-ff") {
                ff = true;
            }
            else {
                log("Unknown argument '%s'. It will be ignored.\n", args[argidx].c_str());
            }
        }

        std::string run_from, run_to;

        log_push();
        // run_script(design, run_from, run_to);
        run_script(yosys_design, run_from, "insert_voters");
        run_script(yosys_design, "insert_voters", run_to);
        log_pop();        
    }

    void script() override {

        std::string replicate_args = "";
        std::string insert_voters_args = "";

        replicate_args+=" -suffix " + suffix;
        insert_voters_args+=" -suffix " + suffix;

        replicate_args+=" -amount " + std::to_string(amount);
        insert_voters_args+=" -amount " + std::to_string(amount);

        if (ports) {
            replicate_args+=" -ports";
        }
        if (verbose) {
            replicate_args+=" -verbose";
            insert_voters_args+=" -verbose";
        }

        insert_voters_args+=" -voter_type " + voter_type;
        insert_voters_args+=" -voter_name " + voter_name;

        if (reduction) {
            insert_voters_args+=" -reduction";
        }
        if (ff) {
            insert_voters_args+=" -ff";
        }

        if (check_label("replicate")) {
            log("Running replicate with args: %s\n", replicate_args.c_str());
            run("replicate " + replicate_args);
            // run("write_blif -cname between.blif");
        }
        if (check_label("insert_voters")) {
            log("Running insert_voters with args: %s\n", insert_voters_args.c_str());
            run("insert_voters " + insert_voters_args);
        }

    }
} ApplyTMRPass;

PRIVATE_NAMESPACE_END