# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/mine-plugin/mine.so ~/yosys/share/plugins/
# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/share/plugins/
file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/yosys/share/plugins/



yosys -import
yosys read_verilog -lib lifcl.v
yosys read_verilog lattice_riscv.v
hierarchy -top lattice_crosslink_nx_evn

plugin -i tmr
# yosys apply_tmr -suffix TMR_dude -ff -reduction -voter_name VOTER -voter_type LUT4 -verbose
yosys replicate -suffix TMR -ports
yosys insert_voters -ff -reduction -voter_name VOTER -verbose -voter_type LUT4
clean

yosys write_verilog lattice_riscv_tmr.v
# yosys write_blif -cname -param -icells after_tmr.blif







