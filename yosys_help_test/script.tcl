# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/mine-plugin/mine.so ~/yosys/share/plugins/
# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/share/plugins/
file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/yosys/share/plugins/



yosys -import
# yosys read -sv ../yosys_help_test/toggle.sv
# yosys read -sv ~/yosys_plugins/yosys-f4pga-plugins/yosys_help_test/toggle.sv
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

yosys read -sv uart/*
hierarchy -top tx_top

# yosys proc
yosys synth_xilinx
write_blif -cname -icells -param original.blif
# write_rtlil original.rtlil
plugin -i tmr
# tee -q -o output.txt apply_tmr -suffix TMR
help apply_tmr
help replicate
help insert_voters
# help synth_xilinx
# yosys apply_tmr -suffix TMR_dude -ff -reduction -voter_name VOTER -voter_type LUT4 -verbose
yosys replicate -suffix TMR
write_blif -cname -param -icells after_rep.blif
check
yosys insert_voters -reduction -voter_name VOTER
# check
clean

yosys write_blif -cname -param -icells after_tmr.blif

# yosys help replicate
# yosys help insert_voters

# write_rtlil original.rtlil
# write_verilog -blackboxes original.v

# read_verilog -lib fault_tolerant/ft.v
# techmap
# techmap -map fault_tolerant/not_ft.v
# yosys proc
# synth_xilinx
# write_verilog -blackboxes out.v

# yosys read -sv counter/mod_counter.sv

# write_blif -cname -icells -blackbox after_change_map.blif

# plugin -i mine
# yosys cell_primitive_info
# ls
# hierarchy -purge_lib
# yosys collect_connections
# yosys apply_tmr -suffix TMR
# hierarchy -top debounce_top
# yosys insert_voters
# yosys view_info

# yosys write_blif -cname -icells after_tmr.blif

# exec python3 ../yosys_help_test/checking.py
# hierarchy -top debounce_top

# # xilinx techmapping skipping the opt steps
# # begin
# synth_xilinx -run :flatten

# #bram and dram
# synth_xilinx -run bram:fine

# synth_xilinx -run map_luts:
#fine part
# memory_map
# XILINX_SRL
# # dffsr2dff
# # dff2dffe
# techmap -map +/techmap.v -map +/xilinx/arith_map.v
# memory_bram -rules +/xilinx/brams.txt
# techmap -map +/xilinx/brams_map.v

# memory_bram -rules +/xilinx/drams.txt
# techmap -map +/xilinx/drams_map.v

# memory_map
# dffsr2dff
# dff2dffe
# techmap -map +/techmap.v -map +/xilinx/arith_map.v

# abc -luts 2:2,3,6:5,10,20 -dff

# techmap -map +/xilinx/cells_map.v
# dffinit -ff FDRE Q INIT -ff FDCE Q INIT -ff FDPE Q INIT

# hierarchy -check
# stat
# check -noinit

# write_blif -cname ../yosys_help_test/original_map.blif
# write_blif -cname ../yosys_help_test/after_map.blif






