# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/share/plugins/
# file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/yosys/share/plugins/
file copy -force ~/yosys_plugins/yosys-f4pga-plugins/tmr-plugin/tmr.so ~/yosys/share/plugins/

yosys -import
yosys read -sv pico/picosoc_noflash.v
yosys read -sv pico/picorv32.v
yosys read -sv pico/progmem.v
yosys read -sv pico/simpleuart.v
yosys read -sv pico/basys3.v
# yosys read_verilog -lib xilinx_7series.v
# yosys read_blif original.blif

hierarchy -top top

yosys synth_xilinx
check
write_blif -cname -attr -param -conn original.blif
# write_verilog -norename original.v
# write_edif pico_original.edif

plugin -i tmr
yosys apply_tmr -verbose -reduction */t:IBUF */t:OBUF */t:BUFG %% %n 
select *
check

yosys write_blif -cname -param -attr after_tmr.blif
# write_verilog -norename after_tmr.v
# write_edif pico_tmr.edif
# hierarchy






