import spydrnet as sdn
from cell_info_parser import read_cell_info
from spydrnet.util.architecture import XILINX_7SERIES # ,YOSYS_CELLS
from spydrnet.util.selection import Selection 


#print the hierarchy of a netlist
def hierarchy(current_instance,indentation="",level=0):
    print(indentation,level,'',current_instance.name," --instance of",current_instance.reference.name,"--")
    for child in current_instance.reference.children:
        hierarchy(child,indentation+"     ",level+1)


print("Parsing original")
netlist_original = sdn.parse("original.blif", architecture=XILINX_7SERIES)
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
for instance in netlist_original.get_instances():
    name = instance.name
    # print(name)
    if (name[0] == "\\" and name[1] == "$"):
        print("Old name is " +instance.name)
        instance.name = name[1:]
        print("New name is " + instance.name)

print("Parsing TMR")
netlist_tmr = sdn.parse("after_tmr.blif", architecture=XILINX_7SERIES)
# read_cell_info(netlist_tmr, file)
# hierarchy(netlist_tmr.top_instance)
for definition in netlist_tmr.get_definitions():
    for port in definition.get_ports():
        if port.direction is sdn.UNDEFINED:
            print("UHOH " + port.name + " is undefined direction")
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

for instance in netlist_tmr.get_instances():
    name = instance.name
    # print(name)
    # print(name[0] + " and " + name[1])
    if (name[0] == "\\" and name[1] == "$"):
        # print("Old name is " +instance.name)
        instance.name = name[1:]
        # print("New name is " + instance.name)

# mux_instance_9 = next(netlist_tmr.get_instances("*mux_instance_9*"))
# print(mux_instance_9.data)



# from spydrnet_tmr.utils.design_rule_check import check_connections
from check_connections_new import check_the_connections
# check_connections(netlist_original, netlist_tmr, "TMR", ["VOTER"], True)
check_the_connections(netlist_original, netlist_tmr,["VOTER"], "TMR", True)

# instance = next(netlist_tmr.get_instances("$abc$2747$auto$blifparse.cc:515:parse_blif$2751_TMR_1"))
# print(instance.name)
# for pin in instance.get_pins(selection=Selection.OUTSIDE):
#     print(pin.inner_pin.port.name + "[" + str(pin.inner_pin.port.pins.index(pin.inner_pin))+"]")
#     if pin.wire:
#         for wire_pin in pin.wire.pins:
#             if wire_pin is not pin:
#                 if wire_pin.__class__ is sdn.ir.OuterPin:
#                     print("\t" + wire_pin.instance.name)
#                 else:
#                     print("\t" + wire_pin.port.name)



# def get_original_name(current_instance,suffix="TMR"):
#     '''
#     returns the instance's name without the replica suffix appended to it
#     '''
#     if isinstance(current_instance,str):
#         modified_name = current_instance
#     else:
#         modified_name = current_instance.name
#     if (modified_name[0] == "\\" and modified_name[1] == "$"):
#         modified_name = modified_name[1:]
#     start_index = modified_name.find(suffix)
#     stop_index = start_index + len(suffix) + 2
#     while True:
#         if start_index is -1:
#             return modified_name
#         else :
#             modified_name = modified_name[:start_index-1] + modified_name[stop_index:]
#             start_index = modified_name.find(suffix)
#             stop_index = start_index + len(suffix) + 2

# def get_voter_driven_instances(voter, pin_index):
#     print(voter.name)
#     for pin in voter.get_pins(selection=Selection.OUTSIDE):
#         if (pin.inner_pin.port.name == "Y"):
#             if pin.inner_pin.port.pins.index(pin.inner_pin) == pin_index:
#                 for other_pin in pin.wire.pins:
#                     if other_pin is not pin:
#                         if (other_pin.__class__ is sdn.OuterPin):
#                             print("\t" + other_pin.instance.name + " Port: " + other_pin.inner_pin.port.name + " Index: " + str(other_pin.inner_pin.port.pins.index(other_pin.inner_pin)))
#                         else:
#                             print("\t" + other_pin.port.name)
#                         yield other_pin

# instance = next(netlist_tmr.get_instances("*$procdff$175_TMR_2*"))
# f = open("delete_later.txt", "w")
# f.write(instance.name + " from " + instance.parent.name + "\n")
# for pin in instance.get_pins(selection=Selection.OUTSIDE):
#     # print(pin)
#     f.write("Port: " + pin.inner_pin.port.name + " Index: " + str(pin.inner_pin.port.pins.index(pin.inner_pin)) + " Cable " + get_original_name(pin.wire.cable.name) + "\n")
#     for other_pin in pin.wire.pins:
#         if other_pin is not pin:
#             if (other_pin.__class__ is sdn.OuterPin):
#                 if ("VOTER" in other_pin.instance.name):
#                     if "TMR_2" in other_pin.instance.name:
#                         for voter_driven in get_voter_driven_instances(other_pin.instance, other_pin.inner_pin.port.pins.index(other_pin.inner_pin)):
#                             if (voter_driven.__class__ is sdn.OuterPin):
#                                 f.write("\t"+ get_original_name(voter_driven.instance.name) + "\n")
#                             else:
#                                 f.write("\t" + get_original_name(voter_driven.port.name) + "\n")
#                 else:
#                     f.write("\t"+ get_original_name(other_pin.instance.name) + "\n")
#             else:
#                 f.write("\t" + get_original_name(other_pin.port.name) + "\n")
# f.close()

# f = open("delete_later_2.txt" , "w")
# instance = next(netlist_original.get_instances("*$procdff$175*"))
# f.write(instance.name + " from " + instance.parent.name + "\n")
# for pin in instance.get_pins(selection=Selection.OUTSIDE):
#     # print(pin)
#     f.write("Port: " + pin.inner_pin.port.name + " Index: " + str(pin.inner_pin.port.pins.index(pin.inner_pin)) + " Cable " + get_original_name(pin.wire.cable.name) + "\n")
#     for other_pin in pin.wire.pins:
#         if other_pin is not pin:
#             if (other_pin.__class__ is sdn.OuterPin):
#                 f.write("\t"+ get_original_name(other_pin.instance.name) + "\n")
#                 if ("VOTER" in other_pin.instance.name):
#                     get_voter_driven_instances(other_pin.instance)
#             else:
#                 f.write("\t" + get_original_name(other_pin.port.name) + "\n")
# for instance in netlist_tmr.get_hinstances(recursive=True):
#     print(instance.name)

# print(list(x.name for x in netlist_original.libraries))
# library = next(netlist_original.get_libraries())
# library.name = "SDN.verilog_primitives"
# netlist_original.compose("try_for_blackboxes.v", write_blackbox=True)

# for definition in netlist_original.get_definitions():
#     for port in definition.get_ports():
#         print(port.direction)

# inst = next(netlist_original.get_instances("*$procmux$37*"))
# for pin in inst.get_pins(selection=Selection.OUTSIDE):
#     to_write = pin.inner_pin.port.name + "[" + str(pin.inner_pin.port.pins.index(pin.inner_pin)) + "]"
#     if pin.wire:
#         to_write+= " on cable " + pin.wire.cable.name + " and index [" + str(pin.wire.cable.wires.index(pin.wire)) + "]"
#     print(to_write)
# while(True):
#     inst = next(it, None)
#     if not inst:
#         break
#     print(inst.name)
    