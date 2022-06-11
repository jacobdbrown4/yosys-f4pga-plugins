
import spydrnet as sdn
from spydrnet.util.selection import Selection


def check_the_connections(netlist_original, netlist_modified, organ_names: list(), suffix: str(), write_enable: bool()):
    checker = CheckConnections(netlist_original,netlist_modified, organ_names, suffix, write_enable)
    checker.run()
    if checker.passed:
        print("PASSED")
    else:
        print("FAILED")

class CheckConnections():
    def __init__(self, netlist_original, netlist_modified, organ_names: list(), suffix: str(), write_enable: bool()):
        self.netlist_original = netlist_original
        self.netlist_modified = netlist_modified
        self.organ_names = organ_names
        self.suffix = suffix
        self.write_enable = write_enable
        self.original_dict = dict()
        self.modified_dict = dict()
        self.passed = True

    def run(self):
        self.organ_names.append("COMPLEX")
        for instance in self.netlist_original.get_hinstances(recursive=True, filter=lambda x: self.filter_instances(x.item) is True):
            self.original_dict[instance.name] = self.get_driven_instances(instance)
        for instance in self.netlist_modified.get_hinstances(recursive=True, filter=lambda x: self.filter_instances(x.item) is True):
            self.modified_dict[instance.name] = self.get_driven_instances(instance)
        self.compare_connections()

    def filter_instances(self, instance):
        if self.is_organ(instance):
            return False
        elif 'GND' in instance.name:
            return False
        elif 'VCC' in instance.name:
            return False
        else:
            return True

    def is_organ(self, instance):
        if any(organ in instance.name for organ in self.organ_names):
            return True
        return False

    def get_driven_instances(self, instance):
        driven_instances = list()
        for pin in instance.item.get_pins(selection=Selection.OUTSIDE,filter=lambda x: x.inner_pin.port.direction is sdn.OUT):
            if pin.wire:
                for driven_pin in pin.wire.pins:
                    if driven_pin is not pin:
                        if driven_pin.__class__ is sdn.ir.InnerPin:
                            to_add = instance.parent.name+"/"+driven_pin.port.name + "[" + str(driven_pin.port.pins.index(driven_pin)) + "]"
                            driven_instances.append(to_add)
                        elif driven_pin.__class__ is sdn.ir.OuterPin:
                            if any(name in driven_pin.instance.name for name in self.organ_names): # it's a voter
                                if self.is_own_voter(instance, driven_pin.instance): # it's his own voter
                                    # print(instance.name +" goes to voter " + driven_pin.instance.name)
                                    voter_driven_instances = self.get_voter_driven_instances(driven_pin.instance, instance.parent.name, driven_pin.inner_pin.port.pins.index(driven_pin.inner_pin))
                                    driven_instances+=voter_driven_instances
                                else:
                                    non_replicated_driven = self.get_non_replicated_voter_driven_instances(driven_pin.instance, instance.parent.name)
                                    driven_instances+=non_replicated_driven
                            else:
                                to_add = instance.parent.name+"/"+driven_pin.instance.name+"/"+driven_pin.inner_pin.port.name \
                                    + "[" + str(driven_pin.inner_pin.port.pins.index(driven_pin.inner_pin)) + "]"
                                driven_instances.append(to_add)
                        else:
                            print("ERROR: pin is neither an outerpin nor innerpin...")
        return driven_instances

    def get_voter_driven_instances(self, voter, parent_name, pin_index=0):
        driven_instances = list()
        for pin in voter.get_pins(selection=Selection.OUTSIDE,filter=lambda x: x.inner_pin.port.direction is sdn.OUT):
            if (not pin.wire):
                continue
            port_active_width = len(list(x for x in voter.get_pins(selection=Selection.OUTSIDE,filter=lambda x: x.inner_pin.port.direction is sdn.OUT and x.inner_pin.port is pin.inner_pin.port \
                                                                                                                and x.wire)))
            index_potential_pin = pin.inner_pin.port.pins.index(pin.inner_pin)
            if ((index_potential_pin == pin_index) or ((pin_index%(port_active_width)) == index_potential_pin)):
                if pin.wire:
                    for driven_pin in pin.wire.pins:
                        if driven_pin is not pin:
                            if driven_pin.__class__ is sdn.ir.InnerPin:
                                to_add = parent_name+"/"+driven_pin.port.name + "[" + str(driven_pin.port.pins.index(driven_pin)) + "]"
                                driven_instances.append(to_add)
                            elif driven_pin.__class__ is sdn.ir.OuterPin:
                                to_add = parent_name + "/"+driven_pin.instance.name+"/"+driven_pin.inner_pin.port.name \
                                    + "[" + str(driven_pin.inner_pin.port.pins.index(driven_pin.inner_pin)) + "]"
                                driven_instances.append(to_add)
                            else:
                                print("something's not right")
        return driven_instances

    def is_own_voter(self, instance, voter):
        instance_key = self.find_key(instance)
        voter_key = self.find_key(voter)
        return instance_key == voter_key

    def get_non_replicated_voter_driven_instances(self, voter, parent_name):
        driven_instances = self.get_voter_driven_instances(voter, parent_name)
        non_replicated_driven = list(x for x in driven_instances if self.suffix not in x)
        return non_replicated_driven

    def compare_connections(self):
        f = None
        if self.write_enable:
            f = open('drc_connection_results_'+self.netlist_original.name+'.txt','w')
        for key in self.modified_dict.keys():
            plain_key = self.get_original_name(key)
            modified_driven_instances_modified_names = self.modified_dict[key]
            modified_driven_instances_modified_names.sort()
            modified_driven_instances_plain_names = list(self.get_original_name(name) for name in modified_driven_instances_modified_names)
            if plain_key == key: #this instance was not replicated
                no_duplicate_list = list()
                [no_duplicate_list.append(x) for x in modified_driven_instances_plain_names if x not in no_duplicate_list]
                modified_driven_instances_plain_names = no_duplicate_list
            try:
                original_driven_instances = self.original_dict[plain_key]
            except KeyError:
                    if f:
                        f.write(key+ ' had no one to compare to. Key attempted was: ' + plain_key+'\n')
                    # self.not_matched.append(key)
                    continue
            modified_driven_instances_plain_names.sort()
            original_driven_instances.sort()
            if modified_driven_instances_plain_names != original_driven_instances:
                self.passed = False
                if f:
                    f.write("NOT MATCH: "+ key + ' ' + str(modified_driven_instances_modified_names) + '---' + str(original_driven_instances)
                             + " from " + plain_key + '\n')
                # print("NOPE"+key+" "+ str(modified_driven_instances_plain_names)+" didn't match "+ str(original_driven_instances)+" from "+plain_key)
            else:
                if f:
                    f.write("MATCH: "+ key + ' ' + str(modified_driven_instances_modified_names) + '---' + str(original_driven_instances)
                             + " from " + plain_key + '\n')
        if f:
            f.close()

    
    def get_original_name(self, current_instance,suffix="TMR"):
        '''
        returns the instance's name without the replica suffix appended to it
        '''
        if isinstance(current_instance,str):
            modified_name = current_instance
        else:
            modified_name = current_instance.name
        if (modified_name[0] == "\\" and modified_name[1] == "$"):
            modified_name = modified_name[1:]
        start_index = modified_name.find(suffix)
        stop_index = start_index + len(suffix) + 2
        while True:
            if start_index == -1:
                return modified_name
            else :
                modified_name = modified_name[:start_index-1] + modified_name[stop_index:]
                start_index = modified_name.find(suffix)
                stop_index = start_index + len(suffix) + 2

    def find_key(self, instance):
        start_index = instance.name.find(self.suffix)
        stop_index = start_index + len(self.suffix) + 2
        if start_index == -1:
            key = ''
        else:
            key = instance.name[start_index:stop_index]
        return key



# TODO if something is not replicated and then goes to replicated, only add one.
# maybe when comparing check for that and if so, remove the duplicates.
# when writing to file, write the normal but leave a note saying non-replicated to replicated