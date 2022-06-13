#include "kernel/yosys.h"
#include "kernel/sigtools.h"
USING_YOSYS_NAMESPACE
PRIVATE_NAMESPACE_BEGIN

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

std::map<std::string, WireConnectionInfo> collect_connections(RTLIL::Module *module) {
    std::map<std::string, WireConnectionInfo> connection_map;
    for (auto cell: module->cells()) {
        log("In cell: %s\n", log_id(cell));
        for (auto conn: cell->connections()) {
            log("\t%s\n", conn.first.c_str());
            RTLIL::SigSpec sigspec = conn.second;
            for (auto sigbit: sigspec.bits()) {
                if (sigbit.wire == NULL) {
                    continue;
                }
                ConnectedCell c = {cell, conn.first, sigbit};
                std::string map_key = unescape_id(sigbit.wire->name) + "_" + std::to_string(sigbit.offset);
                if (cell->output(conn.first)) {
                    connection_map[map_key].driver = c;
                    std::cout << "Now the driver is " << log_id(connection_map[map_key].driver.cell) << "\n";
                }
                else {
                    connection_map[map_key].driven_cells.push_back(c);
                }

                connection_map[map_key].wire = sigbit.wire;
                std::cout << map_key << " in map has offset as " << std::to_string(connection_map[map_key].offset) << "\n";
                connection_map[map_key].offset = sigbit.offset;
            }
        }
    }
    return connection_map;
}

void display_connection_map(std::map<std::string, WireConnectionInfo> connection_map, RTLIL::Module *module) {
    std::cout << "Displaying the connection map\n";
    // SigMap sigmap(module);
    // std::cout << "Connection map size:" << std::to_string(connection_map.size()) << "\n";
    for (auto map_entry: connection_map) {
        WireConnectionInfo info = map_entry.second;
        std::string to_write = "Key: " + RTLIL::unescape_id(map_entry.first) + "\n";
        to_write+= "\tDriver:\n\t\t";
        // RTLIL::SigBit driver_sigbit;
        if (info.driver.cell != nullptr) {
            to_write+=RTLIL::unescape_id(info.driver.cell->name) + " with sigbit offset " + std::to_string(info.driver.sigbit.offset) + "\n";
            // driver_sigbit = info.driver.sigbit;
        }
        else {
            to_write+="NULL\n";
            // driver_sigbit = NULL;
        }
        to_write+="\tDriven Cells:\n";
        for (auto driven_cell: info.driven_cells) {
            to_write+="\t\t" + RTLIL::unescape_id(driven_cell.cell->name) +  " with sigbit offset " \
                         + std::to_string(driven_cell.sigbit.offset) +"\n";
            // if (driver_sigbit != NULL) {
                // to_write+="\t\t\tEqual? " + std::to_string(driver_sigbit == driven_cell.sigbit) + "\n"; 
            // }
        }
        std::cout << to_write;
    }
    std::cout << "Done displaying the connection map\n";
}

struct CollectConnectionsPass : public Pass {
    CollectConnectionsPass() : Pass("collect_connections") { }
    void execute(vector<string>, Design* design) override {
        std::cout << "Collecting connections\n";
        for (auto module: design->modules()) {
            std::map<std::string, WireConnectionInfo> connection_map = collect_connections(module);
            display_connection_map(connection_map, module);
        }
    }
} CollectConnectionsPass;

PRIVATE_NAMESPACE_END