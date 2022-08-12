# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/mine-plugin/mine.so ~/yosys/share/plugins/
# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/share/plugins/
# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/yosys/share/plugins/
file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/share/plugins/



yosys -import
yosys read_verilog -lib lifcl.v
yosys read_verilog lattice_riscv.v
hierarchy -top lattice_crosslink_nx_evn
# deminout
check
yosys write_blif -cname -param -attr original.blif
plugin -i tmr
# yosys apply_tmr -suffix TMR_dude -ff -reduction -voter_name VOTER -voter_type LUT4 -verbose
# */t:SP512K
yosys replicate_partial -suffix TMR -ports -verbose */t:IB */t:OB */t:PLL */t:OSCA */t:SP16K */t:SP512K */t:VLO */t:VHI %% %n
check
yosys write_blif -cname -param -attr after_rep.blif
yosys insert_voters_new -reduction -voter_name VOTER -verbose -suffix TMR -voter_type LUT4 */t:IB */t:OB */t:PLL */t:OSCA */t:SP16K */t:SP512K */t:VLO */t:VHI %% %n
# clean
check

yosys write_blif -cname -param -attr after_tmr.blif
# help write_verilog
yosys write_verilog -defparam lattice_riscv_tmr.v

# hierarchy -purge_lib
# yosys write_blif -cname -param -attr -blackbox with_blackboxes.blif
# yosys write_blif -cname -param -icells after_tmr.blif







