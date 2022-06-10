#include "kernel/yosys.h"
#include "tmr_try_hier.cc"
// #include "insert_voter.cc"

USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

// inserts voters after every flip flop

std::string ff_names[] = {"$dff", "$sdff"};
std::map<std::string, std::string> type_to_output_port;

struct TMRPass : public Pass {
    TMRPass() : Pass("tmr") { }

    void execute(vector<string>, Design* design) override {
        TMRTry.execute(design);
    }

} TMRPass;

PRIVATE_NAMESPACE_END