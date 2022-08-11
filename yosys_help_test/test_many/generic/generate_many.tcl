
file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/yosys/share/plugins/

yosys -import

READ_COMMAND
hierarchy -top TOP_MODULE

yosys synth_xilinx
write_blif -cname -param netlists/original.blif
write_verilog netlists/original.v
write_edif netlists/original.edif
design -save original

plugin -i tmr
yosys -import


# Ports, FF, reduction
# apply_tmr -suffix TMR_dude -ff -reduction -voter_name VOTER -voter_type LUT4 -verbose
replicate -ports
insert_voters -ff -reduction 
write_blif -cname -param netlists/p_ff_r.blif
write_verilog netlists/p_ff_r.v
write_edif netlists/p_ff_r.edif

# Ports, FF
design -load original
replicate -ports
insert_voters -ff 
write_blif -cname -param netlists/p_ff.blif
write_verilog netlists/p_ff.v
write_edif netlists/p_ff.edif


# Ports, reduction
design -load original
replicate -ports
insert_voters -reduction
write_blif -cname -param netlists/p_r.blif
write_verilog netlists/p_r.v
write_edif netlists/p_r.edif

# FF, reduction
design -load original
replicate
insert_voters -ff -reduction
write_blif -cname -param netlists/ff_r.blif
write_verilog netlists/ff_r.v
write_edif netlists/ff_r.edif

# FF. This one may fail cause we need reduction voters
# design -load original
# replicate
# insert_voters -ff 
# write_blif -cname -param netlists/ff.blif

# Reduction
design -load original
replicate
insert_voters -reduction
write_blif -cname -param netlists/r.blif
write_verilog netlists/r.v
write_edif netlists/r.edif

# Ports
design -load original
replicate -ports
# insert_voters
write_blif -cname -param netlists/p.blif
write_verilog netlists/p.v
write_edif netlists/p.edif







