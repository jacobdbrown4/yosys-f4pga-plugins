# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/mine-plugin/mine.so ~/yosys/share/plugins/
# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/share/plugins/
# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/yosys/share/plugins/
file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/share/plugins/

yosys -import
# yosys read_verilog -lib xilinx_7series.v
# yosys read_verilog riscv_basys3.v
yosys read_verilog digilent_basys3_litex/digilent_basys3.v
yosys read_verilog digilent_basys3_litex/VexRiscv.v
hierarchy -top digilent_basys3

synth_xilinx
check
# scc -all_cell_types -set_attr is_scc 1
yosys write_blif -cname -param -attr original.blif
yosys write_verilog -defparam original.v
write_edif original.edif

plugin -i tmr
yosys apply_tmr -reduction -voter_name VOTER -voter_type LUT3 -verbose */t:IBUF */t:OBUF */t:BUFG */t:RAMB36E1 */t:RAMB18E1 \
                                                                                            */t:GND */t:VCC */t:MMCME2_ADV %% %n
# yosys apply_tmr -verbose */t:IBUF */t:OBUF */t:BUFG */t:RAMB36E1 */t:RAMB18E1 */t:GND */t:VCC %% %n
select *
# clean
check

yosys write_blif -cname -param -attr after_tmr.blif
yosys write_verilog -defparam basys3_riscv_tmr.v
write_edif basys3_riscv_tmr.edif







