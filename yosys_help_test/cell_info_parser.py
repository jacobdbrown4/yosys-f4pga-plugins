import spydrnet as sdn


def update_cell_info(netlist, cell_type, inputs, outputs):
    cell_def = next(netlist.get_definitions(cell_type), None)
    if not cell_def:
        library = next(netlist.get_libraries())
        cell_def = library.create_definition(name=cell_type)
        # print(cell_type + " found")
        for port_name in inputs:
            port = cell_def.create_port(name=port_name, direction=sdn.IN)
            port.create_pin()
            # port = next(cell_def.get_ports(port_name),None)
            # if port:
            #     port.direction = sdn.IN
            # else:
            #     print("ERROR: " + port_name + " port not found")
        for port_name in outputs:
            port = cell_def.create_port(name=port_name, direction=sdn.OUT)
            port.create_pin()
            # port = next(cell_def.get_ports(port_name),None)
            # if port:
            #     port.direction = sdn.OUT
            # else:
            #     print("ERROR: " + port_name + " port not found")
    else:
        # print(cell_type +" not in netlist")
        None

def read_cell_info(netlist, file_name):
    f = open(file_name)

    cell_type = str()
    inputs = list()
    outputs = list()
    currently_input = bool()

    for line in f.readlines():
        line = line.strip()
        if (line[0] == "$"):
            # print(line)
            cell_type = line
        elif ("INPUTS:" in line):
            # print("beginning inputs")
            currently_input = True
        elif ("OUTPUTS:" in line):
            # print("beginning outputs")
            currently_input = False
        elif ("DONE" in line):
            update_cell_info(netlist, cell_type, inputs, outputs)
            inputs = list()
            outputs = list()
        else:
            if currently_input:
                inputs.append(line)
            else:
                outputs.append(line)

# file = "yosys_cell_info.txt"
# netlist = sdn.ir.Netlist(name="random")
# netlist.create_library(name="SDN.verilog_primitives")
# read_cell_info(netlist, file)
# for definition in netlist.get_definitions():
#     print(definition.name)
# netlist.compose("try_for_blackboxes.v", write_blackbox=True)

# netlist = sdn.parse("original.blif")

# for definition in netlist.get_definitions():
#     print(definition.name)
#     for port in definition.get_ports():
#         print('\t' + port.name + " " + str(port.direction))

# read_cell_info(netlist, file)

# for definition in netlist.get_definitions():
#     print(definition.name)
#     for port in definition.get_ports():
#         print('\t' + port.name + " " + str(port.direction))

        