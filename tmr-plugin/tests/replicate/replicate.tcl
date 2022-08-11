yosys -import 
# if { [info procs ls] == {} } { plugin -i tmr }
read_verilog $::env(DESIGN_TOP).v
hierarchy -top toggle

# yosys synth_xilinx

plugin -i tmr
yosys -import

# yosys replicate

yosys cd toggle
yosys ls

set fp [open [test_output_path "replicate.txt"] "w"]

puts "hi"
puts $fp "hi"
puts $fp [replicate]

# puts $fp [yosys ls > fp]
# yosys tee -o ~/yosys_plugins/yosys-f4pga-plugins/testing.txt ls
# puts [yosys ls]
puts $fp [replicate]

close $fp