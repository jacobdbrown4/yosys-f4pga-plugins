import spydrnet as sdn
from cell_info_parser import read_cell_info
from spydrnet.util.architecture import YOSYS_CELLS
from spydrnet.util.selection import Selection 


#print the hierarchy of a netlist
def hierarchy(current_instance,indentation="",level=0):
    print(indentation,level,'',current_instance.name," --instance of",current_instance.reference.name,"--")
    for child in current_instance.reference.children:
        hierarchy(child,indentation+"     ",level+1)

def instance_count(current_netlist):
    print("Number of times each primitive is instanced:")
    primitives_library = next(current_netlist.get_libraries(),None)
    for primitive in primitives_library.get_definitions():
        count = 0
        for instance in current_netlist.get_instances():
            if primitive.name == instance.reference.name:
                count += 1
        print('\t',primitive.name,": ",count)


print("Parsing original")
netlist_original = sdn.parse("original.blif", architecture=YOSYS_CELLS)
# hierarchy(netlist_original.top_instance)
# debounce = next(netlist_original.get_definitions("debounce"))
# for child in debounce.children:
#     print(child)
# file = "yosys_cell_info.txt"
# read_cell_info(netlist_original, file)
for definition in netlist_original.get_definitions():
    for port in definition.get_ports():
        if port.direction is sdn.UNDEFINED:
            print("UHOH")
# for instance in netlist_original.get_instances():
#     name = instance.name
#     # print(name)
#     if (name[0] == "\\" and name[1] == "$"):
#         print("Old name is " +instance.name)
#         instance.name = name[1:]
#         print("New name is " + instance.name)
instance_count(netlist_original)

# print("Parsing TMR")
# netlist_tmr = sdn.parse("after_map.blif", architecture=YOSYS_CELLS)
# # read_cell_info(netlist_tmr, file)
# # hierarchy(netlist_tmr.top_instance)
# for definition in netlist_tmr.get_definitions():
#     for port in definition.get_ports():
#         if port.direction is sdn.UNDEFINED:
#             print("UHOH " + port.name + " is undefined direction")

# instance_count(netlist_tmr)
        # print(port.direction)
# for instance in netlist_tmr.get_instances():
#     if "EBLIF.type" in instance.data:
#         if instance["EBLIF.type"] == "EBLIF.subckt":
#             # print("yup")
#             output_pin = next(instance.get_pins(selection=Selection.OUTSIDE, filter=lambda x: x.inner_pin.port.pins.index(x.inner_pin) == 0))
#             output_pin.name = 
    # name = instance.name
    # print(name)
    # print(name[0] + " and " + name[1])
    # if (name[0] == "\\" and name[1] == "$"):
    #     print("Old name is " +instance.name)
    #     instance.name = name[1:]
    #     print("New name is " + instance.name)

# from spydrnet.parsers.eblif.eblif_parser import EBLIFParser
# parser = EBLIFParser.from_filename("random")
# parser.netlist = netlist_original
# parser.set_subcircuit_names_by_convention()
# parser.netlist = netlist_tmr
# parser.set_subcircuit_names_by_convention()

# for instance in netlist_tmr.get_instances():
#     name = instance.name
#     # print(name)
#     # print(name[0] + " and " + name[1])
#     if (name[0] == "\\" and name[1] == "$"):
#         # print("Old name is " +instance.name)
#         instance.name = name[1:]
        # print("New name is " + instance.name)

# mux_instance_9 = next(netlist_tmr.get_instances("*mux_instance_9*"))
# print(mux_instance_9.data)



# from spydrnet_tmr.utils.design_rule_check import check_connections
# from check_connections_new import check_the_connections
# # check_connections(netlist_original, netlist_tmr, "TMR", ["VOTER"], True)
# check_the_connections(netlist_original, netlist_tmr,["VOTER"], "TMR", True)


