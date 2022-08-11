import spydrnet as sdn
# from cell_info_parser import read_cell_info
from spydrnet.util.architecture import XILINX_7SERIES # ,YOSYS_CELLS
from spydrnet.util.selection import Selection 


def run_check(netlist_name):
    print("Running check for " + netlist_name)
    print("Parsing original")
    netlist_original = sdn.parse("netlists/original.blif", architecture=XILINX_7SERIES)

    for instance in netlist_original.get_instances():
        name = instance.name
        if (name[0] == "\\" and name[1] == "$"):
            instance.name = name[1:]

    print("Parsing TMR")
    netlist_tmr = sdn.parse(netlist_name, architecture=XILINX_7SERIES)
   
    for instance in netlist_tmr.get_instances():
        name = instance.name

        if (name[0] == "\\" and name[1] == "$"):
            instance.name = name[1:]

    # from spydrnet_tmr.utils.design_rule_check import check_connections
    # check_connections(netlist_original, netlist_tmr, "TMR", ["VOTER"], True)
    from check_connections_new import check_the_connections
    check_the_connections(netlist_original, netlist_tmr,["VOTER"], "TMR", True)
    print()


import sys
if __name__:
    run_check(sys.argv[1])
