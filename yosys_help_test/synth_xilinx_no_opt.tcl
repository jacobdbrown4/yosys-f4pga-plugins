# begin:
read_verilog -lib -specify +/xilinx/cells_sim.v
read_verilog -lib +/xilinx/cells_xtra.v
hierarchy -check -auto-top

# prepare:
yosys proc
#yosys flatten (with ’-flatten’)
tribuf -logic
deminout
opt_expr
opt_clean
check
opt -nodffe -nosdff
fsm
opt
# wreduce [-keepdc] (option for ’-widemux’)
peepopt
opt_clean
# muxpack (’-widemux’ only)
# pmux2shiftx (skip if ’-nosrl’ and ’-widemux=0’)
# clean (skip if ’-nosrl’ and ’-widemux=0’)

# map_dsp: (skip if ’-nodsp’)
memory_dff
techmap -map +/mul2dsp.v -map +/xilinx/xc7_dsp_map.v
select a:mul2dsp
setattr -unset mul2dsp
opt_expr -fine
wreduce
select -clear
xilinx_dsp -family <family>
chtype -set $mul t:$__soft_mul

# coarse:
techmap -map +/cmp2lut.v -map +/cmp2lcu.v -D LUT_WIDTH=[46]
alumacc
share
opt
yosys memory -nomap
opt_clean

# map_uram: (only if ’-uram’)
memory_bram -rules +/xilinx/xc7_urams.txt
techmap -map +/xilinx/xc7_urams_map.v

# map_bram: (skip if ’-nobram’)
memory_bram -rules +/xilinx/xc7_brams.txt
techmap -map +/xilinx/xc7_brams_map.v

# map_lutram: (skip if ’-nolutram’)
memory_bram -rules +/xilinx/lut[46]_lutrams.txt
techmap -map +/xilinx/lutrams_map.v

# map_ffram:
opt -fast -full
memory_map

# fine:
# simplemap t:$mux (’-widemux’ only)
# muxcover <internal options> (’-widemux’ only)
opt -full
xilinx_srl -variable -minlen 3
techmap -map +/techmap.v -D LUT_SIZE=[46] [-map +/xilinx/mux_map.v] -map +/xilinx/arith_map.v
opt -fast

# map_cells:
iopadmap -bits -outpad OBUF I:O -inpad IBUF O:I -toutpad OBUFT ~T:I:O -tinoutpad IOBUF ~T:O:I:IO A:
techmap -map +/techmap.v -map +/xilinx/cells_map.v
clean

# map_ffs:
dfflegalize -cell $_DFFE_?P?P_ 01 -cell $_SDFFE_?P?P_ 01 -cell $_DLATCH_?P?_ 01 (for xc6v, xc7,168 zinit -all w:* t:$_SDFFE_*)
techmap -map +/xilinx/ff_map.v

# map_luts:
opt_expr -mux_undef -noclkinv
# abc -luts 2:2,3,6:5[,10,20] [-dff] [-D 1] (option for ’-nowidelut’, ’-dff’, ’-retime’)
clean
techmap -map +/xilinx/ff_map.v
xilinx_srl -fixed -minlen 3 
techmap -map +/xilinx/lut_map.v -map +/xilinx/cells_map.v -D LUT_WIDTH=[46]
xilinx_dffopt [-lut4]
opt_lut_ins -tech xilinx

# finalize:
clkbufmap -buf BUFG O:I
# extractinv -inv INV O:I (only if ’-ise’)
clean

# check:
hierarchy -check
stat -tech xilinx
check -noinit
blackbox =A:whitebox