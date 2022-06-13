file copy -force ~/yosys_plugins/yosys-f4pga-plugins/mine-plugin/mine.so ~/yosys/yosys/share/plugins/


yosys -import
# yosys read -sv ../yosys_help_test/toggle.sv
# hierarchy -top toggle
# yosys read_verilog ../yosys_help_test/verilog_files/pulse_led.v ../yosys_help_test/verilog_files/PWM.v
# hierarchy -top top
# yosys read_verilog ../yosys_help_test/verilog_files/counter.v
# hierarchy -top top
yosys read -sv counter/*
hierarchy -top debounce_top

# yosys proc
yosys synth_xilinx
# wreduce


write_blif -cname -icells original.blif
# write_rtlil original.rtlil

plugin -i mine
# yosys cell_primitive_info
# ls
# hierarchy -purge_lib
# yosys collect_connections
yosys apply_tmr -suffix TMR
# hierarchy -top debounce_top
yosys insert_voters
# yosys view_info

yosys write_blif -cname -icells after_tmr.blif

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






