yosys -import
yosys read -sv counter/*
hierarchy -top debounce_top

yosys proc

write_blif -cname fsm_before.blif
fsm -export
# fsm_export -o fsm_out
write_blif -cname fsm_after.blif

fsm_info