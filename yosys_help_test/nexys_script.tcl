# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/mine-plugin/mine.so ~/yosys/share/plugins/
# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/share/plugins/
# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/yosys/share/plugins/
# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/share/plugins/



yosys -import
yosys read_verilog -lib xilinx_7series.v
yosys read_verilog nexys_video.v
hierarchy -top nexys_video
# deminout
check
# scc -all_cell_types
yosys write_blif -cname -param -attr original.blif
# yosys write_rtlil original.rtlil
plugin -i tmr
# yosys apply_tmr -suffix TMR_dude -ff -reduction -voter_name VOTER -voter_type LUT4 -verbose
# yosys replicate_partial -suffix TMR -verbose */t:IB */t:OB */t:PLL */t:OSCA */t:SP16K */t:SP512K */t:VLO */t:VHI %% %n
# check
# yosys write_blif -cname -param -attr after_rep.blif
# yosys insert_voters_new -reduction -ff -voter_name VOTER -verbose -suffix TMR -specify_ff FD1P3IX -voter_type LUT4 */t:IB */t:OB */t:PLL */t:OSCA */t:SP16K */t:SP512K */t:VLO */t:VHI %% %n
# clean
yosys apply_tmr_new -reduction -ff -voter_name VOTER -specify_ff FDRE -voter_type LUT3-verbose */t:IBUF */t:OBUF %% %n
check

yosys write_blif -cname -param -attr after_tmr.blif
# help write_verilog
yosys write_verilog -defparam lattice_riscv_tmr.v

# hierarchy -purge_lib
# yosys write_blif -cname -param -attr -blackbox with_blackboxes.blif
# yosys write_blif -cname -param -icells after_tmr.blif







