# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/mine-plugin/mine.so ~/yosys/share/plugins/
# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/share/plugins/
# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/yosys/share/plugins/
file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/share/plugins/



yosys -import
# yosys read -sv ../yosys_help_test/toggle.sv
# yosys read -sv ~/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv
# yosys read_verilog ~/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.v
# hierarchy -top toggle
# yosys read_verilog ../yosys_help_test/verilog_files/pulse_led.v ../yosys_help_test/verilog_files/PWM.v
# hierarchy -top top
# yosys read_verilog ../yosys_help_test/verilog_files/counter.v
# hierarchy -top top
# yosys read -sv counter/*
# yosys read -sv counter/debounce*
# yosys read -sv -lib counter/mod_counter.sv
# hierarchy -top debounce_top
# yosys read -vlog2k SID.v
# write_rtlil out.rtlil
# hierarchy -top debounce_top

yosys read -sv uart/*
hierarchy -top tx_top

# yosys proc
yosys synth_xilinx
check
scc -all_cell_types -set_attr is_scc 1
# zinit
# yosys dffinit -ff FDRE Q INIT
write_blif -cname -attr -param -conn original.blif
# write_verilog -nohex original.v
# write_rtlil original.rtlil
# write_edif original.edif
plugin -i tmr
# uniquify
# dump */t:INV %n 
# setattr -set is_ff 1 */t:FDRE
# yosys apply_tmr -verbose -ff -reduction -ff_attr is_ff */t:IBUF */t:OBUF */t:BUFG %% %n
# setattr -unset is_ff */t:FDRE
yosys apply_tmr -verbose -scc is_scc -specify_ff FDRE 
# yosys replicate_partial -suffix TMR -verbose */t:IBUF */t:OBUF */t:BUFG %% %n
# check
# clean

# write_blif -cname -param -attr -conn after_rep.blif
# check
# yosys insert_voters_new -reduction -voter_name VOTER -verbose -suffix TMR */t:IBUF */t:OBUF */t:BUFG %% %n
# help check
check
# clean

yosys write_blif -cname -param -attr -conn after_tmr.blif
help apply_tmr
# check





