//Generated from netlist by SpyDrNet
//netlist name: flappy_top
module flappy_top
(
    clk,
    Vsync,
    dp,
    Hsync,
    .an<3:0>({an<3>, an<2>, an<1>, an<0>}),
    .vgaRed<2:0>({vgaRed<2>, vgaRed<1>, vgaRed<0>}),
    .vgaBlue<1:0>({vgaBlue<1>, vgaBlue<0>}),
    .vgaGreen<2:0>({vgaGreen<2>, vgaGreen<1>, vgaGreen<0>}),
    .seg<6:0>({seg<6>, seg<5>, seg<4>, seg<3>, seg<2>, seg<1>, seg<0>}),
    .led<7:0>({led<7>, led<6>, led<5>, led<4>, led<3>, led<2>, led<1>, led<0>}),
    .btn<3:0>({btn<3>}),
    .sw<7:0>({sw<7>, sw<6>, sw<5>, sw<4>, sw<3>, sw<2>, sw<1>, sw<0>})
);

    input clk;
    output Vsync;
    output dp;
    output Hsync;
    output an<3>;
    output an<2>;
    output an<1>;
    output an<0>;
    output vgaRed<2>;
    output vgaRed<1>;
    output vgaRed<0>;
    output vgaBlue<1>;
    output vgaBlue<0>;
    output vgaGreen<2>;
    output vgaGreen<1>;
    output vgaGreen<0>;
    output seg<6>;
    output seg<5>;
    output seg<4>;
    output seg<3>;
    output seg<2>;
    output seg<1>;
    output seg<0>;
    output led<7>;
    output led<6>;
    output led<5>;
    output led<4>;
    output led<3>;
    output led<2>;
    output led<1>;
    output led<0>;
    input btn<3>;
    input btn<0>;
    input sw<7>;
    input sw<6>;
    input sw<5>;
    input sw<4>;
    input sw<3>;
    input sw<2>;
    input sw<1>;
    input sw<0>;

    wire HS;
    wire Hsync;
    wire Hsync_OBUF;
    wire Madd_bird_color_on_add0000_cy<1>;
    wire Madd_bird_color_on_add0000_cy<2>;
    wire Madd_bird_color_on_add0000_cy<2>_rt;
    wire Madd_bird_color_on_add0000_cy<3>;
    wire Madd_bird_color_on_add0000_cy<3>_rt;
    wire Madd_bird_color_on_add0000_cy<4>;
    wire Madd_bird_color_on_add0000_cy<4>_rt;
    wire Madd_bird_color_on_add0000_cy<5>;
    wire Madd_bird_color_on_add0000_cy<5>_rt;
    wire Madd_bird_color_on_add0000_cy<6>;
    wire Madd_bird_color_on_add0000_cy<6>_rt;
    wire Madd_bird_color_on_add0000_cy<7>;
    wire Madd_bird_color_on_add0000_cy<7>_rt;
    wire Madd_bird_color_on_add0000_cy<8>;
    wire Madd_bird_color_on_add0000_cy<8>_rt;
    wire Madd_bird_color_on_add0000_lut<1>;
    wire Madd_bird_color_on_add0001_cy<0>;
    wire Madd_bird_color_on_add0001_cy<1>;
    wire Madd_bird_color_on_add0001_cy<2>;
    wire Madd_bird_color_on_add0001_cy<2>_rt;
    wire Madd_bird_color_on_add0001_cy<3>;
    wire Madd_bird_color_on_add0001_cy<3>_rt;
    wire Madd_bird_color_on_add0001_cy<4>;
    wire Madd_bird_color_on_add0001_cy<4>_rt;
    wire Madd_bird_color_on_add0001_cy<5>;
    wire Madd_bird_color_on_add0001_cy<5>_rt;
    wire Madd_bird_color_on_add0001_cy<6>;
    wire Madd_bird_color_on_add0001_cy<6>_rt;
    wire Madd_bird_color_on_add0001_cy<7>;
    wire Madd_bird_color_on_add0001_cy<7>_rt;
    wire Madd_bird_color_on_add0001_cy<8>;
    wire Madd_bird_color_on_add0001_cy<8>_rt;
    wire Madd_bird_color_on_add0001_lut<0>;
    wire Madd_bird_color_on_add0001_lut<1>;
    wire Madd_bird_color_on_add0002_cy<3>;
    wire Madd_bird_color_on_add0002_lut<9>;
    wire Madd_bird_color_on_add0003_cy<0>;
    wire Madd_bird_color_on_add0003_cy<1>;
    wire Madd_bird_color_on_add0003_cy<1>_rt;
    wire Madd_bird_color_on_add0003_cy<2>;
    wire Madd_bird_color_on_add0003_cy<3>;
    wire Madd_bird_color_on_add0003_cy<3>_rt;
    wire Madd_bird_color_on_add0003_cy<4>;
    wire Madd_bird_color_on_add0003_cy<4>_rt;
    wire Madd_bird_color_on_add0003_cy<5>;
    wire Madd_bird_color_on_add0003_cy<5>_rt;
    wire Madd_bird_color_on_add0003_cy<6>;
    wire Madd_bird_color_on_add0003_cy<6>_rt;
    wire Madd_bird_color_on_add0003_cy<7>;
    wire Madd_bird_color_on_add0003_cy<7>_rt;
    wire Madd_bird_color_on_add0003_cy<8>;
    wire Madd_bird_color_on_add0003_cy<8>_rt;
    wire Madd_bird_color_on_add0003_lut<0>;
    wire Madd_bird_color_on_add0003_lut<2>1;
    wire Madd_bird_color_on_add0004_cy<1>;
    wire Madd_bird_color_on_add0004_cy<2>;
    wire Madd_bird_color_on_add0004_cy<3>;
    wire Madd_bird_color_on_add0004_cy<3>_rt;
    wire Madd_bird_color_on_add0004_cy<4>;
    wire Madd_bird_color_on_add0004_cy<4>_rt;
    wire Madd_bird_color_on_add0004_cy<5>;
    wire Madd_bird_color_on_add0004_cy<5>_rt;
    wire Madd_bird_color_on_add0004_cy<6>;
    wire Madd_bird_color_on_add0004_cy<6>_rt;
    wire Madd_bird_color_on_add0004_cy<7>;
    wire Madd_bird_color_on_add0004_cy<7>_rt;
    wire Madd_bird_color_on_add0004_cy<8>;
    wire Madd_bird_color_on_add0004_cy<8>_rt;
    wire Madd_bird_color_on_add0004_lut<1>;
    wire Madd_bird_color_on_add0004_lut<2>;
    wire Madd_bird_color_on_add0005_cy<0>;
    wire Madd_bird_color_on_add0005_cy<1>;
    wire Madd_bird_color_on_add0005_cy<2>;
    wire Madd_bird_color_on_add0005_cy<3>;
    wire Madd_bird_color_on_add0005_cy<3>_rt;
    wire Madd_bird_color_on_add0005_cy<4>;
    wire Madd_bird_color_on_add0005_cy<4>_rt;
    wire Madd_bird_color_on_add0005_cy<5>;
    wire Madd_bird_color_on_add0005_cy<5>_rt;
    wire Madd_bird_color_on_add0005_cy<6>;
    wire Madd_bird_color_on_add0005_cy<6>_rt;
    wire Madd_bird_color_on_add0005_cy<7>;
    wire Madd_bird_color_on_add0005_cy<7>_rt;
    wire Madd_bird_color_on_add0005_cy<8>;
    wire Madd_bird_color_on_add0005_cy<8>_rt;
    wire Madd_bird_color_on_add0005_lut<0>;
    wire Madd_bird_color_on_add0005_lut<1>;
    wire Madd_bird_color_on_add0005_lut<2>;
    wire Madd_bird_color_on_add0006_cy<8>_bdd0;
    wire Madd_bird_color_on_add0007_cy<0>;
    wire Madd_bird_color_on_add0007_cy<1>;
    wire Madd_bird_color_on_add0007_cy<1>_rt;
    wire Madd_bird_color_on_add0007_cy<2>;
    wire Madd_bird_color_on_add0007_cy<2>_rt;
    wire Madd_bird_color_on_add0007_cy<3>;
    wire Madd_bird_color_on_add0007_cy<4>;
    wire Madd_bird_color_on_add0007_cy<4>_rt;
    wire Madd_bird_color_on_add0007_cy<5>;
    wire Madd_bird_color_on_add0007_cy<5>_rt;
    wire Madd_bird_color_on_add0007_cy<6>;
    wire Madd_bird_color_on_add0007_cy<6>_rt;
    wire Madd_bird_color_on_add0007_cy<7>;
    wire Madd_bird_color_on_add0007_cy<7>_rt;
    wire Madd_bird_color_on_add0007_cy<8>;
    wire Madd_bird_color_on_add0007_cy<8>_rt;
    wire Madd_bird_color_on_add0007_lut<0>;
    wire Madd_bird_color_on_add0007_lut<3>1;
    wire Madd_bird_color_on_add0008_cy<1>;
    wire Madd_bird_color_on_add0008_cy<2>;
    wire Madd_bird_color_on_add0008_cy<2>_rt;
    wire Madd_bird_color_on_add0008_cy<3>;
    wire Madd_bird_color_on_add0008_cy<4>;
    wire Madd_bird_color_on_add0008_cy<4>_rt;
    wire Madd_bird_color_on_add0008_cy<5>;
    wire Madd_bird_color_on_add0008_cy<5>_rt;
    wire Madd_bird_color_on_add0008_cy<6>;
    wire Madd_bird_color_on_add0008_cy<6>_rt;
    wire Madd_bird_color_on_add0008_cy<7>;
    wire Madd_bird_color_on_add0008_cy<7>_rt;
    wire Madd_bird_color_on_add0008_cy<8>;
    wire Madd_bird_color_on_add0008_cy<8>_rt;
    wire Madd_bird_color_on_add0008_lut<1>;
    wire Madd_bird_color_on_add0008_lut<3>;
    wire Madd_bird_color_on_add0009_cy<0>;
    wire Madd_bird_color_on_add0009_cy<1>;
    wire Madd_bird_color_on_add0009_cy<2>;
    wire Madd_bird_color_on_add0009_cy<2>_rt;
    wire Madd_bird_color_on_add0009_cy<3>;
    wire Madd_bird_color_on_add0009_cy<4>;
    wire Madd_bird_color_on_add0009_cy<4>_rt;
    wire Madd_bird_color_on_add0009_cy<5>;
    wire Madd_bird_color_on_add0009_cy<5>_rt;
    wire Madd_bird_color_on_add0009_cy<6>;
    wire Madd_bird_color_on_add0009_cy<6>_rt;
    wire Madd_bird_color_on_add0009_cy<7>;
    wire Madd_bird_color_on_add0009_cy<7>_rt;
    wire Madd_bird_color_on_add0009_cy<8>;
    wire Madd_bird_color_on_add0009_cy<8>_rt;
    wire Madd_bird_color_on_add0009_lut<0>;
    wire Madd_bird_color_on_add0009_lut<1>;
    wire Madd_bird_color_on_add0009_lut<3>;
    wire Madd_bird_color_on_add0010_cy<8>_bdd0;
    wire Madd_bird_color_on_add0011_cy<0>;
    wire Madd_bird_color_on_add0011_cy<1>;
    wire Madd_bird_color_on_add0011_cy<1>_rt;
    wire Madd_bird_color_on_add0011_cy<2>;
    wire Madd_bird_color_on_add0011_cy<3>;
    wire Madd_bird_color_on_add0011_cy<4>;
    wire Madd_bird_color_on_add0011_cy<4>_rt;
    wire Madd_bird_color_on_add0011_cy<5>;
    wire Madd_bird_color_on_add0011_cy<5>_rt;
    wire Madd_bird_color_on_add0011_cy<6>;
    wire Madd_bird_color_on_add0011_cy<6>_rt;
    wire Madd_bird_color_on_add0011_cy<7>;
    wire Madd_bird_color_on_add0011_cy<7>_rt;
    wire Madd_bird_color_on_add0011_cy<8>;
    wire Madd_bird_color_on_add0011_cy<8>_rt;
    wire Madd_bird_color_on_add0011_lut<0>;
    wire Madd_bird_color_on_add0011_lut<2>;
    wire Madd_bird_color_on_add0011_lut<3>;
    wire Madd_bird_color_on_add0012_cy<1>;
    wire Madd_bird_color_on_add0012_cy<2>;
    wire Madd_bird_color_on_add0012_cy<3>;
    wire Madd_bird_color_on_add0012_cy<4>;
    wire Madd_bird_color_on_add0012_cy<4>_rt;
    wire Madd_bird_color_on_add0012_cy<5>;
    wire Madd_bird_color_on_add0012_cy<5>_rt;
    wire Madd_bird_color_on_add0012_cy<6>;
    wire Madd_bird_color_on_add0012_cy<6>_rt;
    wire Madd_bird_color_on_add0012_cy<7>;
    wire Madd_bird_color_on_add0012_cy<7>_rt;
    wire Madd_bird_color_on_add0012_cy<8>;
    wire Madd_bird_color_on_add0012_cy<8>_rt;
    wire Madd_bird_color_on_add0012_lut<1>;
    wire Madd_bird_color_on_add0012_lut<2>;
    wire Madd_bird_color_on_add0012_lut<3>;
    wire Madd_bird_color_on_add0013_cy<0>;
    wire Madd_bird_color_on_add0013_cy<1>;
    wire Madd_bird_color_on_add0013_cy<2>;
    wire Madd_bird_color_on_add0013_cy<3>;
    wire Madd_bird_color_on_add0013_cy<4>;
    wire Madd_bird_color_on_add0013_cy<4>_rt;
    wire Madd_bird_color_on_add0013_cy<5>;
    wire Madd_bird_color_on_add0013_cy<5>_rt;
    wire Madd_bird_color_on_add0013_cy<6>;
    wire Madd_bird_color_on_add0013_cy<6>_rt;
    wire Madd_bird_color_on_add0013_cy<7>;
    wire Madd_bird_color_on_add0013_cy<7>_rt;
    wire Madd_bird_color_on_add0013_cy<8>;
    wire Madd_bird_color_on_add0013_cy<8>_rt;
    wire Madd_bird_color_on_add0013_lut<0>;
    wire Madd_bird_color_on_add0013_lut<1>;
    wire Madd_bird_color_on_add0013_lut<2>;
    wire Madd_bird_color_on_add0013_lut<3>;
    wire Madd_bird_color_on_add0014_cy<8>_bdd0;
    wire Madd_bird_color_on_add0015_cy<0>;
    wire Madd_bird_color_on_add0015_cy<1>;
    wire Madd_bird_color_on_add0015_cy<1>_rt;
    wire Madd_bird_color_on_add0015_cy<2>;
    wire Madd_bird_color_on_add0015_cy<2>_rt;
    wire Madd_bird_color_on_add0015_cy<3>;
    wire Madd_bird_color_on_add0015_cy<3>_rt;
    wire Madd_bird_color_on_add0015_cy<4>;
    wire Madd_bird_color_on_add0015_cy<5>;
    wire Madd_bird_color_on_add0015_cy<5>_rt;
    wire Madd_bird_color_on_add0015_cy<6>;
    wire Madd_bird_color_on_add0015_cy<6>_rt;
    wire Madd_bird_color_on_add0015_cy<7>;
    wire Madd_bird_color_on_add0015_cy<7>_rt;
    wire Madd_bird_color_on_add0015_cy<8>;
    wire Madd_bird_color_on_add0015_cy<8>_rt;
    wire Madd_bird_color_on_add0015_lut<0>;
    wire Madd_bird_color_on_add0015_lut<4>1;
    wire Madd_bird_color_on_add0016_cy<1>;
    wire Madd_bird_color_on_add0016_cy<2>;
    wire Madd_bird_color_on_add0016_cy<2>_rt;
    wire Madd_bird_color_on_add0016_cy<3>;
    wire Madd_bird_color_on_add0016_cy<3>_rt;
    wire Madd_bird_color_on_add0016_cy<4>;
    wire Madd_bird_color_on_add0016_cy<5>;
    wire Madd_bird_color_on_add0016_cy<5>_rt;
    wire Madd_bird_color_on_add0016_cy<6>;
    wire Madd_bird_color_on_add0016_cy<6>_rt;
    wire Madd_bird_color_on_add0016_cy<7>;
    wire Madd_bird_color_on_add0016_cy<7>_rt;
    wire Madd_bird_color_on_add0016_cy<8>;
    wire Madd_bird_color_on_add0016_cy<8>_rt;
    wire Madd_bird_color_on_add0016_lut<1>;
    wire Madd_bird_color_on_add0016_lut<4>;
    wire Madd_bird_color_on_add0017_cy<0>;
    wire Madd_bird_color_on_add0017_cy<1>;
    wire Madd_bird_color_on_add0017_cy<2>;
    wire Madd_bird_color_on_add0017_cy<2>_rt;
    wire Madd_bird_color_on_add0017_cy<3>;
    wire Madd_bird_color_on_add0017_cy<3>_rt;
    wire Madd_bird_color_on_add0017_cy<4>;
    wire Madd_bird_color_on_add0017_cy<5>;
    wire Madd_bird_color_on_add0017_cy<5>_rt;
    wire Madd_bird_color_on_add0017_cy<6>;
    wire Madd_bird_color_on_add0017_cy<6>_rt;
    wire Madd_bird_color_on_add0017_cy<7>;
    wire Madd_bird_color_on_add0017_cy<7>_rt;
    wire Madd_bird_color_on_add0017_cy<8>;
    wire Madd_bird_color_on_add0017_cy<8>_rt;
    wire Madd_bird_color_on_add0017_lut<0>;
    wire Madd_bird_color_on_add0017_lut<1>;
    wire Madd_bird_color_on_add0017_lut<4>;
    wire Madd_bird_color_on_add0018_cy<6>;
    wire Madd_bird_color_on_add0019_cy<0>;
    wire Madd_bird_color_on_add0019_cy<1>;
    wire Madd_bird_color_on_add0019_cy<1>_rt;
    wire Madd_bird_color_on_add0019_cy<2>;
    wire Madd_bird_color_on_add0019_cy<3>;
    wire Madd_bird_color_on_add0019_cy<3>_rt;
    wire Madd_bird_color_on_add0019_cy<4>;
    wire Madd_bird_color_on_add0019_cy<5>;
    wire Madd_bird_color_on_add0019_cy<5>_rt;
    wire Madd_bird_color_on_add0019_cy<6>;
    wire Madd_bird_color_on_add0019_cy<6>_rt;
    wire Madd_bird_color_on_add0019_cy<7>;
    wire Madd_bird_color_on_add0019_cy<7>_rt;
    wire Madd_bird_color_on_add0019_cy<8>;
    wire Madd_bird_color_on_add0019_cy<8>_rt;
    wire Madd_bird_color_on_add0019_lut<0>;
    wire Madd_bird_color_on_add0019_lut<2>;
    wire Madd_bird_color_on_add0019_lut<4>;
    wire Madd_bird_color_on_add0020_cy<1>;
    wire Madd_bird_color_on_add0020_cy<2>;
    wire Madd_bird_color_on_add0020_cy<3>;
    wire Madd_bird_color_on_add0020_cy<3>_rt;
    wire Madd_bird_color_on_add0020_cy<4>;
    wire Madd_bird_color_on_add0020_cy<5>;
    wire Madd_bird_color_on_add0020_cy<5>_rt;
    wire Madd_bird_color_on_add0020_cy<6>;
    wire Madd_bird_color_on_add0020_cy<6>_rt;
    wire Madd_bird_color_on_add0020_cy<7>;
    wire Madd_bird_color_on_add0020_cy<7>_rt;
    wire Madd_bird_color_on_add0020_cy<8>;
    wire Madd_bird_color_on_add0020_cy<8>_rt;
    wire Madd_bird_color_on_add0020_lut<1>;
    wire Madd_bird_color_on_add0020_lut<2>;
    wire Madd_bird_color_on_add0020_lut<4>;
    wire Madd_bird_color_on_add0021_cy<0>;
    wire Madd_bird_color_on_add0021_cy<1>;
    wire Madd_bird_color_on_add0021_cy<2>;
    wire Madd_bird_color_on_add0021_cy<3>;
    wire Madd_bird_color_on_add0021_cy<3>_rt;
    wire Madd_bird_color_on_add0021_cy<4>;
    wire Madd_bird_color_on_add0021_cy<5>;
    wire Madd_bird_color_on_add0021_cy<5>_rt;
    wire Madd_bird_color_on_add0021_cy<6>;
    wire Madd_bird_color_on_add0021_cy<6>_rt;
    wire Madd_bird_color_on_add0021_cy<7>;
    wire Madd_bird_color_on_add0021_cy<7>_rt;
    wire Madd_bird_color_on_add0021_cy<8>;
    wire Madd_bird_color_on_add0021_cy<8>_rt;
    wire Madd_bird_color_on_add0021_lut<0>;
    wire Madd_bird_color_on_add0021_lut<1>;
    wire Madd_bird_color_on_add0021_lut<2>;
    wire Madd_bird_color_on_add0021_lut<4>;
    wire Madd_bird_outline_on_addsub0000_cy<0>;
    wire Madd_bird_outline_on_addsub0000_cy<1>;
    wire Madd_bird_outline_on_addsub0000_cy<1>_rt;
    wire Madd_bird_outline_on_addsub0000_cy<2>;
    wire Madd_bird_outline_on_addsub0000_cy<2>_rt;
    wire Madd_bird_outline_on_addsub0000_cy<3>;
    wire Madd_bird_outline_on_addsub0000_cy<3>_rt;
    wire Madd_bird_outline_on_addsub0000_cy<4>;
    wire Madd_bird_outline_on_addsub0000_cy<4>_rt;
    wire Madd_bird_outline_on_addsub0000_cy<5>;
    wire Madd_bird_outline_on_addsub0000_cy<5>_rt;
    wire Madd_bird_outline_on_addsub0000_cy<6>;
    wire Madd_bird_outline_on_addsub0000_cy<6>_rt;
    wire Madd_bird_outline_on_addsub0000_cy<7>;
    wire Madd_bird_outline_on_addsub0000_cy<7>_rt;
    wire Madd_bird_outline_on_addsub0000_cy<8>;
    wire Madd_bird_outline_on_addsub0000_cy<8>_rt;
    wire Madd_bird_outline_on_addsub0000_lut<0>;
    wire Madd_bird_outline_on_addsub0001_cy<8>_bdd0;
    wire Madd_bird_outline_on_addsub0002_cy<0>;
    wire Madd_bird_outline_on_addsub0002_cy<1>;
    wire Madd_bird_outline_on_addsub0002_cy<1>_rt;
    wire Madd_bird_outline_on_addsub0002_cy<2>;
    wire Madd_bird_outline_on_addsub0002_cy<2>_rt;
    wire Madd_bird_outline_on_addsub0002_cy<3>;
    wire Madd_bird_outline_on_addsub0002_cy<4>;
    wire Madd_bird_outline_on_addsub0002_cy<5>;
    wire Madd_bird_outline_on_addsub0002_cy<5>_rt;
    wire Madd_bird_outline_on_addsub0002_cy<6>;
    wire Madd_bird_outline_on_addsub0002_cy<6>_rt;
    wire Madd_bird_outline_on_addsub0002_cy<7>;
    wire Madd_bird_outline_on_addsub0002_cy<7>_rt;
    wire Madd_bird_outline_on_addsub0002_cy<8>;
    wire Madd_bird_outline_on_addsub0002_cy<8>_rt;
    wire Madd_bird_outline_on_addsub0002_lut<0>;
    wire Madd_bird_outline_on_addsub0002_lut<3>;
    wire Madd_bird_outline_on_addsub0002_lut<4>;
    wire Madd_bird_top_temp_addsub0001_cy<0>;
    wire Madd_bird_top_temp_addsub0001_cy<1>;
    wire Madd_bird_top_temp_addsub0001_cy<2>;
    wire Madd_bird_top_temp_addsub0001_cy<3>;
    wire Madd_bird_top_temp_addsub0001_cy<4>;
    wire Madd_bird_top_temp_addsub0001_cy<4>_rt;
    wire Madd_bird_top_temp_addsub0001_cy<5>;
    wire Madd_bird_top_temp_addsub0001_cy<5>_rt;
    wire Madd_bird_top_temp_addsub0001_cy<6>;
    wire Madd_bird_top_temp_addsub0001_cy<6>_rt;
    wire Madd_bird_top_temp_addsub0001_cy<7>;
    wire Madd_bird_top_temp_addsub0001_cy<7>_rt;
    wire Madd_bird_top_temp_addsub0001_cy<8>;
    wire Madd_bird_top_temp_addsub0001_cy<8>_rt;
    wire Madd_bird_top_temp_addsub0001_lut<0>;
    wire Madd_bird_top_temp_addsub0001_lut<1>;
    wire Madd_bird_top_temp_addsub0001_lut<2>;
    wire Madd_bird_top_temp_addsub0001_lut<3>;
    wire Madd_delay_next_addsub0000_cy<0>;
    wire Madd_delay_next_addsub0000_cy<10>;
    wire Madd_delay_next_addsub0000_cy<10>_rt;
    wire Madd_delay_next_addsub0000_cy<11>;
    wire Madd_delay_next_addsub0000_cy<11>_rt;
    wire Madd_delay_next_addsub0000_cy<12>;
    wire Madd_delay_next_addsub0000_cy<12>_rt;
    wire Madd_delay_next_addsub0000_cy<13>;
    wire Madd_delay_next_addsub0000_cy<13>_rt;
    wire Madd_delay_next_addsub0000_cy<14>;
    wire Madd_delay_next_addsub0000_cy<14>_rt;
    wire Madd_delay_next_addsub0000_cy<15>;
    wire Madd_delay_next_addsub0000_cy<15>_rt;
    wire Madd_delay_next_addsub0000_cy<16>;
    wire Madd_delay_next_addsub0000_cy<16>_rt;
    wire Madd_delay_next_addsub0000_cy<17>;
    wire Madd_delay_next_addsub0000_cy<17>_rt;
    wire Madd_delay_next_addsub0000_cy<18>;
    wire Madd_delay_next_addsub0000_cy<18>_rt;
    wire Madd_delay_next_addsub0000_cy<19>;
    wire Madd_delay_next_addsub0000_cy<19>_rt;
    wire Madd_delay_next_addsub0000_cy<1>;
    wire Madd_delay_next_addsub0000_cy<1>_rt;
    wire Madd_delay_next_addsub0000_cy<20>;
    wire Madd_delay_next_addsub0000_cy<20>_rt;
    wire Madd_delay_next_addsub0000_cy<21>;
    wire Madd_delay_next_addsub0000_cy<21>_rt;
    wire Madd_delay_next_addsub0000_cy<22>;
    wire Madd_delay_next_addsub0000_cy<22>_rt;
    wire Madd_delay_next_addsub0000_cy<23>;
    wire Madd_delay_next_addsub0000_cy<23>_rt;
    wire Madd_delay_next_addsub0000_cy<24>;
    wire Madd_delay_next_addsub0000_cy<24>_rt;
    wire Madd_delay_next_addsub0000_cy<25>;
    wire Madd_delay_next_addsub0000_cy<25>_rt;
    wire Madd_delay_next_addsub0000_cy<26>;
    wire Madd_delay_next_addsub0000_cy<26>_rt;
    wire Madd_delay_next_addsub0000_cy<27>;
    wire Madd_delay_next_addsub0000_cy<27>_rt;
    wire Madd_delay_next_addsub0000_cy<28>;
    wire Madd_delay_next_addsub0000_cy<28>_rt;
    wire Madd_delay_next_addsub0000_cy<29>;
    wire Madd_delay_next_addsub0000_cy<29>_rt;
    wire Madd_delay_next_addsub0000_cy<2>;
    wire Madd_delay_next_addsub0000_cy<2>_rt;
    wire Madd_delay_next_addsub0000_cy<3>;
    wire Madd_delay_next_addsub0000_cy<3>_rt;
    wire Madd_delay_next_addsub0000_cy<4>;
    wire Madd_delay_next_addsub0000_cy<4>_rt;
    wire Madd_delay_next_addsub0000_cy<5>;
    wire Madd_delay_next_addsub0000_cy<5>_rt;
    wire Madd_delay_next_addsub0000_cy<6>;
    wire Madd_delay_next_addsub0000_cy<6>_rt;
    wire Madd_delay_next_addsub0000_cy<7>;
    wire Madd_delay_next_addsub0000_cy<7>_rt;
    wire Madd_delay_next_addsub0000_cy<8>;
    wire Madd_delay_next_addsub0000_cy<8>_rt;
    wire Madd_delay_next_addsub0000_cy<9>;
    wire Madd_delay_next_addsub0000_cy<9>_rt;
    wire Madd_delay_next_addsub0000_lut<0>;
    wire Madd_delay_next_addsub0000_xor<30>_rt;
    wire Mcompar_bird_color_on_cmp_eq0000_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0000_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0000_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0000_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0000_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0000_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0000_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0000_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0000_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0000_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0001_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0001_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0001_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0001_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0001_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0001_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0001_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0001_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0001_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0001_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0002_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0002_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0002_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0002_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0002_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0002_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0002_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0002_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0002_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0002_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0003_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0003_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0003_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0003_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0003_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0003_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0003_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0003_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0003_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0003_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0004_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0004_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0004_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0004_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0004_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0004_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0004_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0004_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0004_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0004_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0005_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0005_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0005_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0005_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0005_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0005_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0005_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0005_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0005_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0005_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0006_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0006_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0006_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0006_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0006_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0006_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0006_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0006_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0006_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0006_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0007_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0007_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0007_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0007_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0007_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0007_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0007_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0007_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0007_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0007_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0008_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0008_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0008_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0008_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0008_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0008_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0008_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0008_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0008_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0008_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0009_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0009_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0009_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0009_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0009_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0009_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0009_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0009_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0009_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0009_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0012_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0012_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0012_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0012_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0012_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0012_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0012_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0012_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0012_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0012_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0013_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0013_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0013_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0013_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0013_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0013_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0013_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0013_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0013_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0013_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0014_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0014_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0014_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0014_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0014_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0014_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0014_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0014_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0014_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0014_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0015_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0015_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0015_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0015_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0015_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0015_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0015_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0015_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0015_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0015_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0016_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0016_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0016_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0016_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0016_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0016_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0016_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0016_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0016_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0016_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0017_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0017_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0017_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0017_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0017_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0017_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0017_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0017_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0017_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0017_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0018_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0018_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0018_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0018_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0018_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0018_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0018_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0018_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0018_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0018_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0019_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0019_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0019_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0019_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0019_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0019_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0019_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0019_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0019_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0019_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0020_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0020_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0020_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0020_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0020_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0020_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0020_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0020_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0020_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0020_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0021_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0021_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0021_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0021_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0021_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0021_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0021_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0021_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0021_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0021_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0022_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0022_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0022_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0022_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0022_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0022_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0022_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0022_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0022_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0022_lut<4>;
    wire Mcompar_bird_color_on_cmp_eq0023_cy<0>;
    wire Mcompar_bird_color_on_cmp_eq0023_cy<1>;
    wire Mcompar_bird_color_on_cmp_eq0023_cy<2>;
    wire Mcompar_bird_color_on_cmp_eq0023_cy<3>;
    wire Mcompar_bird_color_on_cmp_eq0023_cy<4>;
    wire Mcompar_bird_color_on_cmp_eq0023_lut<0>;
    wire Mcompar_bird_color_on_cmp_eq0023_lut<1>;
    wire Mcompar_bird_color_on_cmp_eq0023_lut<2>;
    wire Mcompar_bird_color_on_cmp_eq0023_lut<3>;
    wire Mcompar_bird_color_on_cmp_eq0023_lut<4>;
    wire Mcompar_bird_outline_on_cmp_eq0000_cy<0>;
    wire Mcompar_bird_outline_on_cmp_eq0000_cy<1>;
    wire Mcompar_bird_outline_on_cmp_eq0000_cy<2>;
    wire Mcompar_bird_outline_on_cmp_eq0000_cy<3>;
    wire Mcompar_bird_outline_on_cmp_eq0000_cy<4>;
    wire Mcompar_bird_outline_on_cmp_eq0000_lut<0>;
    wire Mcompar_bird_outline_on_cmp_eq0000_lut<1>;
    wire Mcompar_bird_outline_on_cmp_eq0000_lut<2>;
    wire Mcompar_bird_outline_on_cmp_eq0000_lut<3>;
    wire Mcompar_bird_outline_on_cmp_eq0000_lut<4>;
    wire Mcompar_bird_outline_on_cmp_eq0001_cy<0>;
    wire Mcompar_bird_outline_on_cmp_eq0001_cy<1>;
    wire Mcompar_bird_outline_on_cmp_eq0001_cy<2>;
    wire Mcompar_bird_outline_on_cmp_eq0001_cy<3>;
    wire Mcompar_bird_outline_on_cmp_eq0001_cy<4>;
    wire Mcompar_bird_outline_on_cmp_eq0001_lut<0>;
    wire Mcompar_bird_outline_on_cmp_eq0001_lut<1>;
    wire Mcompar_bird_outline_on_cmp_eq0001_lut<2>;
    wire Mcompar_bird_outline_on_cmp_eq0001_lut<3>;
    wire Mcompar_bird_outline_on_cmp_eq0001_lut<4>;
    wire Mcompar_bird_outline_on_cmp_eq0030_cy<0>;
    wire Mcompar_bird_outline_on_cmp_eq0030_cy<1>;
    wire Mcompar_bird_outline_on_cmp_eq0030_cy<2>;
    wire Mcompar_bird_outline_on_cmp_eq0030_cy<3>;
    wire Mcompar_bird_outline_on_cmp_eq0030_cy<4>;
    wire Mcompar_bird_outline_on_cmp_eq0030_lut<0>;
    wire Mcompar_bird_outline_on_cmp_eq0030_lut<1>;
    wire Mcompar_bird_outline_on_cmp_eq0030_lut<2>;
    wire Mcompar_bird_outline_on_cmp_eq0030_lut<3>;
    wire Mcompar_bird_outline_on_cmp_eq0030_lut<4>;
    wire Mcompar_bird_outline_on_cmp_eq0031_cy<0>;
    wire Mcompar_bird_outline_on_cmp_eq0031_cy<1>;
    wire Mcompar_bird_outline_on_cmp_eq0031_cy<2>;
    wire Mcompar_bird_outline_on_cmp_eq0031_cy<3>;
    wire Mcompar_bird_outline_on_cmp_eq0031_cy<4>;
    wire Mcompar_bird_outline_on_cmp_eq0031_lut<0>;
    wire Mcompar_bird_outline_on_cmp_eq0031_lut<1>;
    wire Mcompar_bird_outline_on_cmp_eq0031_lut<2>;
    wire Mcompar_bird_outline_on_cmp_eq0031_lut<3>;
    wire Mcompar_bird_outline_on_cmp_eq0031_lut<4>;
    wire Mcompar_delay_next_cmp_gt0000_cy<0>;
    wire Mcompar_delay_next_cmp_gt0000_cy<10>;
    wire Mcompar_delay_next_cmp_gt0000_cy<11>;
    wire Mcompar_delay_next_cmp_gt0000_cy<1>;
    wire Mcompar_delay_next_cmp_gt0000_cy<2>;
    wire Mcompar_delay_next_cmp_gt0000_cy<2>_rt;
    wire Mcompar_delay_next_cmp_gt0000_cy<3>;
    wire Mcompar_delay_next_cmp_gt0000_cy<4>;
    wire Mcompar_delay_next_cmp_gt0000_cy<4>_rt;
    wire Mcompar_delay_next_cmp_gt0000_cy<5>;
    wire Mcompar_delay_next_cmp_gt0000_cy<6>;
    wire Mcompar_delay_next_cmp_gt0000_cy<7>;
    wire Mcompar_delay_next_cmp_gt0000_cy<8>;
    wire Mcompar_delay_next_cmp_gt0000_cy<9>;
    wire Mcompar_delay_next_cmp_gt0000_lut<0>;
    wire Mcompar_delay_next_cmp_gt0000_lut<10>;
    wire Mcompar_delay_next_cmp_gt0000_lut<11>;
    wire Mcompar_delay_next_cmp_gt0000_lut<1>;
    wire Mcompar_delay_next_cmp_gt0000_lut<3>;
    wire Mcompar_delay_next_cmp_gt0000_lut<5>;
    wire Mcompar_delay_next_cmp_gt0000_lut<6>;
    wire Mcompar_delay_next_cmp_gt0000_lut<7>;
    wire Mcompar_delay_next_cmp_gt0000_lut<8>;
    wire Mcompar_delay_next_cmp_gt0000_lut<9>;
    wire Mcompar_highscore_cmp_gt0000_cy<0>;
    wire Mcompar_highscore_cmp_gt0000_cy<1>;
    wire Mcompar_highscore_cmp_gt0000_cy<2>;
    wire Mcompar_highscore_cmp_gt0000_cy<3>;
    wire Mcompar_highscore_cmp_gt0000_cy<4>;
    wire Mcompar_highscore_cmp_gt0000_cy<5>;
    wire Mcompar_highscore_cmp_gt0000_cy<6>;
    wire Mcompar_highscore_cmp_gt0000_cy<7>;
    wire Mcompar_highscore_cmp_gt0000_lut<0>;
    wire Mcompar_highscore_cmp_gt0000_lut<1>;
    wire Mcompar_highscore_cmp_gt0000_lut<2>;
    wire Mcompar_highscore_cmp_gt0000_lut<3>;
    wire Mcompar_highscore_cmp_gt0000_lut<4>;
    wire Mcompar_highscore_cmp_gt0000_lut<5>;
    wire Mcompar_highscore_cmp_gt0000_lut<6>;
    wire Mcompar_highscore_cmp_gt0000_lut<7>;
    wire Mcompar_pipe_on_cmp_ge0000_cy<0>;
    wire Mcompar_pipe_on_cmp_ge0000_cy<1>;
    wire Mcompar_pipe_on_cmp_ge0000_cy<2>;
    wire Mcompar_pipe_on_cmp_ge0000_cy<3>;
    wire Mcompar_pipe_on_cmp_ge0000_cy<4>;
    wire Mcompar_pipe_on_cmp_ge0000_cy<5>;
    wire Mcompar_pipe_on_cmp_ge0000_cy<6>;
    wire Mcompar_pipe_on_cmp_ge0000_cy<7>;
    wire Mcompar_pipe_on_cmp_ge0000_cy<8>;
    wire Mcompar_pipe_on_cmp_ge0000_lut<0>;
    wire Mcompar_pipe_on_cmp_ge0000_lut<1>;
    wire Mcompar_pipe_on_cmp_ge0000_lut<2>;
    wire Mcompar_pipe_on_cmp_ge0000_lut<3>;
    wire Mcompar_pipe_on_cmp_ge0000_lut<4>;
    wire Mcompar_pipe_on_cmp_ge0000_lut<5>;
    wire Mcompar_pipe_on_cmp_ge0000_lut<6>;
    wire Mcompar_pipe_on_cmp_ge0000_lut<7>;
    wire Mcompar_pipe_on_cmp_ge0000_lut<8>;
    wire Mcompar_pipe_on_cmp_ge0000_lut<9>;
    wire Mcompar_pipe_on_cmp_ge0001_cy<0>;
    wire Mcompar_pipe_on_cmp_ge0001_cy<1>;
    wire Mcompar_pipe_on_cmp_ge0001_cy<2>;
    wire Mcompar_pipe_on_cmp_ge0001_cy<3>;
    wire Mcompar_pipe_on_cmp_ge0001_cy<4>;
    wire Mcompar_pipe_on_cmp_ge0001_cy<5>;
    wire Mcompar_pipe_on_cmp_ge0001_cy<6>;
    wire Mcompar_pipe_on_cmp_ge0001_cy<7>;
    wire Mcompar_pipe_on_cmp_ge0001_cy<8>;
    wire Mcompar_pipe_on_cmp_ge0001_lut<0>;
    wire Mcompar_pipe_on_cmp_ge0001_lut<1>;
    wire Mcompar_pipe_on_cmp_ge0001_lut<2>;
    wire Mcompar_pipe_on_cmp_ge0001_lut<3>;
    wire Mcompar_pipe_on_cmp_ge0001_lut<4>;
    wire Mcompar_pipe_on_cmp_ge0001_lut<5>;
    wire Mcompar_pipe_on_cmp_ge0001_lut<6>;
    wire Mcompar_pipe_on_cmp_ge0001_lut<7>;
    wire Mcompar_pipe_on_cmp_ge0001_lut<8>;
    wire Mcompar_pipe_on_cmp_ge0001_lut<9>;
    wire Mcompar_pipe_on_cmp_ge0002_cy<0>;
    wire Mcompar_pipe_on_cmp_ge0002_cy<1>;
    wire Mcompar_pipe_on_cmp_ge0002_cy<2>;
    wire Mcompar_pipe_on_cmp_ge0002_cy<3>;
    wire Mcompar_pipe_on_cmp_ge0002_cy<4>;
    wire Mcompar_pipe_on_cmp_ge0002_cy<5>;
    wire Mcompar_pipe_on_cmp_ge0002_cy<6>;
    wire Mcompar_pipe_on_cmp_ge0002_cy<7>;
    wire Mcompar_pipe_on_cmp_ge0002_cy<8>;
    wire Mcompar_pipe_on_cmp_ge0002_lut<0>;
    wire Mcompar_pipe_on_cmp_ge0002_lut<1>;
    wire Mcompar_pipe_on_cmp_ge0002_lut<2>;
    wire Mcompar_pipe_on_cmp_ge0002_lut<3>;
    wire Mcompar_pipe_on_cmp_ge0002_lut<4>;
    wire Mcompar_pipe_on_cmp_ge0002_lut<5>;
    wire Mcompar_pipe_on_cmp_ge0002_lut<6>;
    wire Mcompar_pipe_on_cmp_ge0002_lut<7>;
    wire Mcompar_pipe_on_cmp_ge0002_lut<8>;
    wire Mcompar_pipe_on_cmp_ge0002_lut<9>;
    wire Mcompar_pipe_on_cmp_gt0000_cy<0>;
    wire Mcompar_pipe_on_cmp_gt0000_cy<1>;
    wire Mcompar_pipe_on_cmp_gt0000_cy<2>;
    wire Mcompar_pipe_on_cmp_gt0000_cy<3>;
    wire Mcompar_pipe_on_cmp_gt0000_cy<4>;
    wire Mcompar_pipe_on_cmp_gt0000_cy<5>;
    wire Mcompar_pipe_on_cmp_gt0000_cy<6>;
    wire Mcompar_pipe_on_cmp_gt0000_cy<7>;
    wire Mcompar_pipe_on_cmp_gt0000_cy<8>;
    wire Mcompar_pipe_on_cmp_gt0000_cy<9>;
    wire Mcompar_pipe_on_cmp_gt0000_lut<0>;
    wire Mcompar_pipe_on_cmp_gt0000_lut<1>;
    wire Mcompar_pipe_on_cmp_gt0000_lut<2>;
    wire Mcompar_pipe_on_cmp_gt0000_lut<3>;
    wire Mcompar_pipe_on_cmp_gt0000_lut<4>;
    wire Mcompar_pipe_on_cmp_gt0000_lut<5>;
    wire Mcompar_pipe_on_cmp_gt0000_lut<6>;
    wire Mcompar_pipe_on_cmp_gt0000_lut<7>;
    wire Mcompar_pipe_on_cmp_gt0000_lut<8>;
    wire Mcompar_pipe_on_cmp_gt0000_lut<9>;
    wire Mcompar_pipe_on_cmp_gt0001_cy<0>;
    wire Mcompar_pipe_on_cmp_gt0001_cy<1>;
    wire Mcompar_pipe_on_cmp_gt0001_cy<2>;
    wire Mcompar_pipe_on_cmp_gt0001_cy<3>;
    wire Mcompar_pipe_on_cmp_gt0001_cy<4>;
    wire Mcompar_pipe_on_cmp_gt0001_cy<5>;
    wire Mcompar_pipe_on_cmp_gt0001_cy<6>;
    wire Mcompar_pipe_on_cmp_gt0001_cy<7>;
    wire Mcompar_pipe_on_cmp_gt0001_cy<8>;
    wire Mcompar_pipe_on_cmp_gt0001_cy<9>;
    wire Mcompar_pipe_on_cmp_gt0001_lut<0>;
    wire Mcompar_pipe_on_cmp_gt0001_lut<1>;
    wire Mcompar_pipe_on_cmp_gt0001_lut<2>;
    wire Mcompar_pipe_on_cmp_gt0001_lut<3>;
    wire Mcompar_pipe_on_cmp_gt0001_lut<4>;
    wire Mcompar_pipe_on_cmp_gt0001_lut<5>;
    wire Mcompar_pipe_on_cmp_gt0001_lut<6>;
    wire Mcompar_pipe_on_cmp_gt0001_lut<7>;
    wire Mcompar_pipe_on_cmp_gt0001_lut<8>;
    wire Mcompar_pipe_on_cmp_gt0001_lut<9>;
    wire Mcompar_pipe_on_cmp_gt0002_cy<0>;
    wire Mcompar_pipe_on_cmp_gt0002_cy<1>;
    wire Mcompar_pipe_on_cmp_gt0002_cy<2>;
    wire Mcompar_pipe_on_cmp_gt0002_cy<3>;
    wire Mcompar_pipe_on_cmp_gt0002_cy<4>;
    wire Mcompar_pipe_on_cmp_gt0002_cy<5>;
    wire Mcompar_pipe_on_cmp_gt0002_cy<6>;
    wire Mcompar_pipe_on_cmp_gt0002_cy<7>;
    wire Mcompar_pipe_on_cmp_gt0002_cy<8>;
    wire Mcompar_pipe_on_cmp_gt0002_cy<9>;
    wire Mcompar_pipe_on_cmp_gt0002_lut<0>;
    wire Mcompar_pipe_on_cmp_gt0002_lut<1>;
    wire Mcompar_pipe_on_cmp_gt0002_lut<2>;
    wire Mcompar_pipe_on_cmp_gt0002_lut<3>;
    wire Mcompar_pipe_on_cmp_gt0002_lut<4>;
    wire Mcompar_pipe_on_cmp_gt0002_lut<5>;
    wire Mcompar_pipe_on_cmp_gt0002_lut<6>;
    wire Mcompar_pipe_on_cmp_gt0002_lut<7>;
    wire Mcompar_pipe_on_cmp_gt0002_lut<8>;
    wire Mcompar_pipe_on_cmp_gt0002_lut<9>;
    wire Mcompar_pipe_on_cmp_le0001_cy<0>;
    wire Mcompar_pipe_on_cmp_le0001_cy<1>;
    wire Mcompar_pipe_on_cmp_le0001_cy<2>;
    wire Mcompar_pipe_on_cmp_le0001_cy<3>;
    wire Mcompar_pipe_on_cmp_le0001_cy<4>;
    wire Mcompar_pipe_on_cmp_le0001_cy<5>;
    wire Mcompar_pipe_on_cmp_le0001_cy<6>;
    wire Mcompar_pipe_on_cmp_le0001_cy<7>;
    wire Mcompar_pipe_on_cmp_le0001_cy<8>;
    wire Mcompar_pipe_on_cmp_le0001_lut<0>;
    wire Mcompar_pipe_on_cmp_le0001_lut<1>;
    wire Mcompar_pipe_on_cmp_le0001_lut<2>;
    wire Mcompar_pipe_on_cmp_le0001_lut<3>;
    wire Mcompar_pipe_on_cmp_le0001_lut<4>;
    wire Mcompar_pipe_on_cmp_le0001_lut<5>;
    wire Mcompar_pipe_on_cmp_le0001_lut<6>;
    wire Mcompar_pipe_on_cmp_le0001_lut<7>;
    wire Mcompar_pipe_on_cmp_le0001_lut<8>;
    wire Mcompar_pipe_on_cmp_le0001_lut<9>;
    wire Mcompar_pipe_on_cmp_le0003_cy<0>;
    wire Mcompar_pipe_on_cmp_le0003_cy<1>;
    wire Mcompar_pipe_on_cmp_le0003_cy<2>;
    wire Mcompar_pipe_on_cmp_le0003_cy<3>;
    wire Mcompar_pipe_on_cmp_le0003_cy<4>;
    wire Mcompar_pipe_on_cmp_le0003_cy<5>;
    wire Mcompar_pipe_on_cmp_le0003_cy<6>;
    wire Mcompar_pipe_on_cmp_le0003_cy<7>;
    wire Mcompar_pipe_on_cmp_le0003_cy<8>;
    wire Mcompar_pipe_on_cmp_le0003_lut<0>;
    wire Mcompar_pipe_on_cmp_le0003_lut<1>;
    wire Mcompar_pipe_on_cmp_le0003_lut<2>;
    wire Mcompar_pipe_on_cmp_le0003_lut<3>;
    wire Mcompar_pipe_on_cmp_le0003_lut<4>;
    wire Mcompar_pipe_on_cmp_le0003_lut<5>;
    wire Mcompar_pipe_on_cmp_le0003_lut<6>;
    wire Mcompar_pipe_on_cmp_le0003_lut<7>;
    wire Mcompar_pipe_on_cmp_le0003_lut<8>;
    wire Mcompar_pipe_on_cmp_le0003_lut<9>;
    wire Mcompar_pipe_on_cmp_le0005_cy<0>;
    wire Mcompar_pipe_on_cmp_le0005_cy<1>;
    wire Mcompar_pipe_on_cmp_le0005_cy<2>;
    wire Mcompar_pipe_on_cmp_le0005_cy<3>;
    wire Mcompar_pipe_on_cmp_le0005_cy<4>;
    wire Mcompar_pipe_on_cmp_le0005_cy<5>;
    wire Mcompar_pipe_on_cmp_le0005_cy<6>;
    wire Mcompar_pipe_on_cmp_le0005_cy<7>;
    wire Mcompar_pipe_on_cmp_le0005_cy<8>;
    wire Mcompar_pipe_on_cmp_le0005_lut<0>;
    wire Mcompar_pipe_on_cmp_le0005_lut<1>;
    wire Mcompar_pipe_on_cmp_le0005_lut<2>;
    wire Mcompar_pipe_on_cmp_le0005_lut<3>;
    wire Mcompar_pipe_on_cmp_le0005_lut<4>;
    wire Mcompar_pipe_on_cmp_le0005_lut<5>;
    wire Mcompar_pipe_on_cmp_le0005_lut<6>;
    wire Mcompar_pipe_on_cmp_le0005_lut<7>;
    wire Mcompar_pipe_on_cmp_le0005_lut<8>;
    wire Mcompar_pipe_on_cmp_le0005_lut<9>;
    wire Mcompar_pipe_on_cmp_lt0000_cy<0>;
    wire Mcompar_pipe_on_cmp_lt0000_cy<1>;
    wire Mcompar_pipe_on_cmp_lt0000_cy<2>;
    wire Mcompar_pipe_on_cmp_lt0000_cy<3>;
    wire Mcompar_pipe_on_cmp_lt0000_cy<4>;
    wire Mcompar_pipe_on_cmp_lt0000_cy<5>;
    wire Mcompar_pipe_on_cmp_lt0000_cy<6>;
    wire Mcompar_pipe_on_cmp_lt0000_cy<7>;
    wire Mcompar_pipe_on_cmp_lt0000_cy<8>;
    wire Mcompar_pipe_on_cmp_lt0000_cy<9>;
    wire Mcompar_pipe_on_cmp_lt0000_lut<0>;
    wire Mcompar_pipe_on_cmp_lt0000_lut<1>;
    wire Mcompar_pipe_on_cmp_lt0000_lut<2>;
    wire Mcompar_pipe_on_cmp_lt0000_lut<3>;
    wire Mcompar_pipe_on_cmp_lt0000_lut<4>;
    wire Mcompar_pipe_on_cmp_lt0000_lut<5>;
    wire Mcompar_pipe_on_cmp_lt0000_lut<6>;
    wire Mcompar_pipe_on_cmp_lt0000_lut<7>;
    wire Mcompar_pipe_on_cmp_lt0000_lut<8>;
    wire Mcompar_pipe_on_cmp_lt0000_lut<9>;
    wire Mcompar_pipe_on_cmp_lt0001_cy<0>;
    wire Mcompar_pipe_on_cmp_lt0001_cy<1>;
    wire Mcompar_pipe_on_cmp_lt0001_cy<2>;
    wire Mcompar_pipe_on_cmp_lt0001_cy<3>;
    wire Mcompar_pipe_on_cmp_lt0001_cy<4>;
    wire Mcompar_pipe_on_cmp_lt0001_cy<5>;
    wire Mcompar_pipe_on_cmp_lt0001_cy<6>;
    wire Mcompar_pipe_on_cmp_lt0001_cy<7>;
    wire Mcompar_pipe_on_cmp_lt0001_cy<8>;
    wire Mcompar_pipe_on_cmp_lt0001_cy<9>;
    wire Mcompar_pipe_on_cmp_lt0001_lut<0>;
    wire Mcompar_pipe_on_cmp_lt0001_lut<1>;
    wire Mcompar_pipe_on_cmp_lt0001_lut<2>;
    wire Mcompar_pipe_on_cmp_lt0001_lut<3>;
    wire Mcompar_pipe_on_cmp_lt0001_lut<4>;
    wire Mcompar_pipe_on_cmp_lt0001_lut<5>;
    wire Mcompar_pipe_on_cmp_lt0001_lut<6>;
    wire Mcompar_pipe_on_cmp_lt0001_lut<7>;
    wire Mcompar_pipe_on_cmp_lt0001_lut<8>;
    wire Mcompar_pipe_on_cmp_lt0001_lut<9>;
    wire Mcompar_pipe_on_cmp_lt0002_cy<0>;
    wire Mcompar_pipe_on_cmp_lt0002_cy<1>;
    wire Mcompar_pipe_on_cmp_lt0002_cy<2>;
    wire Mcompar_pipe_on_cmp_lt0002_cy<3>;
    wire Mcompar_pipe_on_cmp_lt0002_cy<4>;
    wire Mcompar_pipe_on_cmp_lt0002_cy<5>;
    wire Mcompar_pipe_on_cmp_lt0002_cy<6>;
    wire Mcompar_pipe_on_cmp_lt0002_cy<7>;
    wire Mcompar_pipe_on_cmp_lt0002_cy<8>;
    wire Mcompar_pipe_on_cmp_lt0002_cy<9>;
    wire Mcompar_pipe_on_cmp_lt0002_lut<0>;
    wire Mcompar_pipe_on_cmp_lt0002_lut<1>;
    wire Mcompar_pipe_on_cmp_lt0002_lut<2>;
    wire Mcompar_pipe_on_cmp_lt0002_lut<3>;
    wire Mcompar_pipe_on_cmp_lt0002_lut<4>;
    wire Mcompar_pipe_on_cmp_lt0002_lut<5>;
    wire Mcompar_pipe_on_cmp_lt0002_lut<6>;
    wire Mcompar_pipe_on_cmp_lt0002_lut<7>;
    wire Mcompar_pipe_on_cmp_lt0002_lut<8>;
    wire Mcompar_pipe_on_cmp_lt0002_lut<9>;
    wire Mcount_bird_delay_cy<0>;
    wire Mcount_bird_delay_cy<10>;
    wire Mcount_bird_delay_cy<10>_rt;
    wire Mcount_bird_delay_cy<11>;
    wire Mcount_bird_delay_cy<11>_rt;
    wire Mcount_bird_delay_cy<12>;
    wire Mcount_bird_delay_cy<12>_rt;
    wire Mcount_bird_delay_cy<13>;
    wire Mcount_bird_delay_cy<13>_rt;
    wire Mcount_bird_delay_cy<14>;
    wire Mcount_bird_delay_cy<14>_rt;
    wire Mcount_bird_delay_cy<15>;
    wire Mcount_bird_delay_cy<15>_rt;
    wire Mcount_bird_delay_cy<16>;
    wire Mcount_bird_delay_cy<16>_rt;
    wire Mcount_bird_delay_cy<17>;
    wire Mcount_bird_delay_cy<17>_rt;
    wire Mcount_bird_delay_cy<18>;
    wire Mcount_bird_delay_cy<18>_rt;
    wire Mcount_bird_delay_cy<19>;
    wire Mcount_bird_delay_cy<19>_rt;
    wire Mcount_bird_delay_cy<1>;
    wire Mcount_bird_delay_cy<1>_rt;
    wire Mcount_bird_delay_cy<2>;
    wire Mcount_bird_delay_cy<2>_rt;
    wire Mcount_bird_delay_cy<3>;
    wire Mcount_bird_delay_cy<3>_rt;
    wire Mcount_bird_delay_cy<4>;
    wire Mcount_bird_delay_cy<4>_rt;
    wire Mcount_bird_delay_cy<5>;
    wire Mcount_bird_delay_cy<5>_rt;
    wire Mcount_bird_delay_cy<6>;
    wire Mcount_bird_delay_cy<6>_rt;
    wire Mcount_bird_delay_cy<7>;
    wire Mcount_bird_delay_cy<7>_rt;
    wire Mcount_bird_delay_cy<8>;
    wire Mcount_bird_delay_cy<8>_rt;
    wire Mcount_bird_delay_cy<9>;
    wire Mcount_bird_delay_cy<9>_rt;
    wire Mcount_bird_delay_lut<0>;
    wire Mcount_bird_delay_xor<20>_rt;
    wire Mcount_debounce_counter_value_cy<0>;
    wire Mcount_debounce_counter_value_cy<10>;
    wire Mcount_debounce_counter_value_cy<10>_rt;
    wire Mcount_debounce_counter_value_cy<11>;
    wire Mcount_debounce_counter_value_cy<11>_rt;
    wire Mcount_debounce_counter_value_cy<12>;
    wire Mcount_debounce_counter_value_cy<12>_rt;
    wire Mcount_debounce_counter_value_cy<13>;
    wire Mcount_debounce_counter_value_cy<13>_rt;
    wire Mcount_debounce_counter_value_cy<14>;
    wire Mcount_debounce_counter_value_cy<14>_rt;
    wire Mcount_debounce_counter_value_cy<15>;
    wire Mcount_debounce_counter_value_cy<15>_rt;
    wire Mcount_debounce_counter_value_cy<16>;
    wire Mcount_debounce_counter_value_cy<16>_rt;
    wire Mcount_debounce_counter_value_cy<17>;
    wire Mcount_debounce_counter_value_cy<17>_rt;
    wire Mcount_debounce_counter_value_cy<1>;
    wire Mcount_debounce_counter_value_cy<1>_rt;
    wire Mcount_debounce_counter_value_cy<2>;
    wire Mcount_debounce_counter_value_cy<2>_rt;
    wire Mcount_debounce_counter_value_cy<3>;
    wire Mcount_debounce_counter_value_cy<3>_rt;
    wire Mcount_debounce_counter_value_cy<4>;
    wire Mcount_debounce_counter_value_cy<4>_rt;
    wire Mcount_debounce_counter_value_cy<5>;
    wire Mcount_debounce_counter_value_cy<5>_rt;
    wire Mcount_debounce_counter_value_cy<6>;
    wire Mcount_debounce_counter_value_cy<6>_rt;
    wire Mcount_debounce_counter_value_cy<7>;
    wire Mcount_debounce_counter_value_cy<7>_rt;
    wire Mcount_debounce_counter_value_cy<8>;
    wire Mcount_debounce_counter_value_cy<8>_rt;
    wire Mcount_debounce_counter_value_cy<9>;
    wire Mcount_debounce_counter_value_cy<9>_rt;
    wire Mcount_debounce_counter_value_lut<0>;
    wire Mcount_debounce_counter_value_xor<18>_rt;
    wire Mcount_scoreOnes_eqn_0;
    wire Mcount_scoreOnes_eqn_1;
    wire Mcount_scoreOnes_eqn_2;
    wire Mcount_scoreOnes_eqn_3;
    wire Mcount_scoreTens;
    wire Mcount_scoreTens1;
    wire Mcount_scoreTens2;
    wire Mcount_scoreTens3;
    wire Msub_bird_top_temp_addsub0000_cy<0>;
    wire Msub_bird_top_temp_addsub0000_cy<1>;
    wire Msub_bird_top_temp_addsub0000_cy<2>;
    wire Msub_bird_top_temp_addsub0000_cy<3>;
    wire Msub_bird_top_temp_addsub0000_cy<4>;
    wire Msub_bird_top_temp_addsub0000_cy<5>;
    wire Msub_bird_top_temp_addsub0000_cy<6>;
    wire Msub_bird_top_temp_addsub0000_cy<7>;
    wire Msub_bird_top_temp_addsub0000_cy<8>;
    wire Msub_bird_top_temp_addsub0000_lut<0>;
    wire Msub_bird_top_temp_addsub0000_lut<1>;
    wire Msub_bird_top_temp_addsub0000_lut<2>;
    wire Msub_bird_top_temp_addsub0000_lut<3>;
    wire Msub_bird_top_temp_addsub0000_lut<4>;
    wire Msub_bird_top_temp_addsub0000_lut<5>;
    wire Msub_bird_top_temp_addsub0000_lut<6>;
    wire Msub_bird_top_temp_addsub0000_lut<7>;
    wire Msub_bird_top_temp_addsub0000_lut<8>;
    wire Msub_bird_top_temp_addsub0000_lut<9>;
    wire Msub_col1_x_addsub0000_cy<0>;
    wire Msub_col1_x_addsub0000_cy<0>_rt;
    wire Msub_col1_x_addsub0000_cy<1>;
    wire Msub_col1_x_addsub0000_cy<2>;
    wire Msub_col1_x_addsub0000_cy<3>;
    wire Msub_col1_x_addsub0000_cy<4>;
    wire Msub_col1_x_addsub0000_cy<5>;
    wire Msub_col1_x_addsub0000_cy<6>;
    wire Msub_col1_x_addsub0000_cy<7>;
    wire Msub_col1_x_addsub0000_cy<8>;
    wire Msub_col1_x_addsub0000_lut<1>;
    wire Msub_col1_x_addsub0000_lut<2>;
    wire Msub_col1_x_addsub0000_lut<3>;
    wire Msub_col1_x_addsub0000_lut<4>1;
    wire Msub_col1_x_addsub0000_lut<5>;
    wire Msub_col1_x_addsub0000_lut<6>;
    wire Msub_col1_x_addsub0000_lut<7>;
    wire Msub_col1_x_addsub0000_lut<8>;
    wire Msub_col1_x_addsub0000_lut<9>;
    wire Msub_col2_x_addsub0000_cy<0>;
    wire Msub_col2_x_addsub0000_cy<0>_rt;
    wire Msub_col2_x_addsub0000_cy<1>;
    wire Msub_col2_x_addsub0000_cy<2>;
    wire Msub_col2_x_addsub0000_cy<3>;
    wire Msub_col2_x_addsub0000_cy<4>;
    wire Msub_col2_x_addsub0000_cy<5>;
    wire Msub_col2_x_addsub0000_cy<6>;
    wire Msub_col2_x_addsub0000_cy<7>;
    wire Msub_col2_x_addsub0000_cy<8>;
    wire Msub_col2_x_addsub0000_lut<1>;
    wire Msub_col2_x_addsub0000_lut<2>;
    wire Msub_col2_x_addsub0000_lut<3>;
    wire Msub_col2_x_addsub0000_lut<4>1;
    wire Msub_col2_x_addsub0000_lut<5>;
    wire Msub_col2_x_addsub0000_lut<6>;
    wire Msub_col2_x_addsub0000_lut<7>;
    wire Msub_col2_x_addsub0000_lut<8>;
    wire Msub_col2_x_addsub0000_lut<9>;
    wire Msub_col3_x_addsub0000_cy<0>;
    wire Msub_col3_x_addsub0000_cy<0>_rt;
    wire Msub_col3_x_addsub0000_cy<1>;
    wire Msub_col3_x_addsub0000_cy<2>;
    wire Msub_col3_x_addsub0000_cy<3>;
    wire Msub_col3_x_addsub0000_cy<4>;
    wire Msub_col3_x_addsub0000_cy<5>;
    wire Msub_col3_x_addsub0000_cy<6>;
    wire Msub_col3_x_addsub0000_cy<7>;
    wire Msub_col3_x_addsub0000_cy<8>;
    wire Msub_col3_x_addsub0000_lut<1>;
    wire Msub_col3_x_addsub0000_lut<2>;
    wire Msub_col3_x_addsub0000_lut<3>;
    wire Msub_col3_x_addsub0000_lut<4>1;
    wire Msub_col3_x_addsub0000_lut<5>;
    wire Msub_col3_x_addsub0000_lut<6>;
    wire Msub_col3_x_addsub0000_lut<7>;
    wire Msub_col3_x_addsub0000_lut<8>;
    wire Msub_col3_x_addsub0000_lut<9>;
    wire N100;
    wire N1001;
    wire N101;
    wire N102;
    wire N104;
    wire N1041;
    wire N106;
    wire N108;
    wire N110;
    wire N114;
    wire N116;
    wire N118;
    wire N122;
    wire N124;
    wire N126;
    wire N128;
    wire N13;
    wire N132;
    wire N134;
    wire N136;
    wire N138;
    wire N140;
    wire N142;
    wire N144;
    wire N146;
    wire N148;
    wire N15;
    wire N150;
    wire N152;
    wire N154;
    wire N156;
    wire N158;
    wire N16;
    wire N161;
    wire N163;
    wire N165;
    wire N167;
    wire N168;
    wire N169;
    wire N17;
    wire N171;
    wire N173;
    wire N175;
    wire N179;
    wire N18;
    wire N181;
    wire N183;
    wire N185;
    wire N187;
    wire N189;
    wire N19;
    wire N191;
    wire N193;
    wire N194;
    wire N195;
    wire N196;
    wire N197;
    wire N198;
    wire N199;
    wire N2;
    wire N20;
    wire N200;
    wire N201;
    wire N202;
    wire N203;
    wire N204;
    wire N205;
    wire N206;
    wire N207;
    wire N208;
    wire N209;
    wire N210;
    wire N211;
    wire N212;
    wire N213;
    wire N214;
    wire N215;
    wire N216;
    wire N217;
    wire N218;
    wire N219;
    wire N220;
    wire N221;
    wire N222;
    wire N223;
    wire N224;
    wire N225;
    wire N226;
    wire N227;
    wire N228;
    wire N229;
    wire N23;
    wire N230;
    wire N231;
    wire N232;
    wire N24;
    wire N25;
    wire N26;
    wire N29;
    wire N32;
    wire N33;
    wire N331;
    wire N39;
    wire N41;
    wire N43;
    wire N45;
    wire N47;
    wire N49;
    wire N50;
    wire N52;
    wire N6;
    wire N61;
    wire N62;
    wire N67;
    wire N72;
    wire N74;
    wire N75;
    wire N77;
    wire N8;
    wire N81;
    wire N83;
    wire N85;
    wire N92;
    wire N94;
    wire N96;
    wire N961;
    wire N98;
    wire N981;
    wire N99;
    wire Result<0>;
    wire Result<0>2;
    wire Result<0>3;
    wire Result<10>;
    wire Result<10>1;
    wire Result<10>2;
    wire Result<11>;
    wire Result<11>1;
    wire Result<11>2;
    wire Result<12>;
    wire Result<12>1;
    wire Result<12>2;
    wire Result<13>;
    wire Result<13>1;
    wire Result<13>2;
    wire Result<14>;
    wire Result<14>1;
    wire Result<14>2;
    wire Result<15>;
    wire Result<15>1;
    wire Result<16>;
    wire Result<16>1;
    wire Result<17>;
    wire Result<17>1;
    wire Result<18>;
    wire Result<18>1;
    wire Result<19>;
    wire Result<1>;
    wire Result<1>2;
    wire Result<1>3;
    wire Result<20>;
    wire Result<2>;
    wire Result<2>2;
    wire Result<2>3;
    wire Result<3>;
    wire Result<3>2;
    wire Result<3>3;
    wire Result<4>;
    wire Result<4>1;
    wire Result<4>2;
    wire Result<5>;
    wire Result<5>1;
    wire Result<5>2;
    wire Result<6>;
    wire Result<6>1;
    wire Result<6>2;
    wire Result<7>;
    wire Result<7>1;
    wire Result<7>2;
    wire Result<8>;
    wire Result<8>1;
    wire Result<8>2;
    wire Result<9>;
    wire Result<9>1;
    wire Result<9>2;
    wire VS;
    wire Vsync;
    wire Vsync_OBUF;
    wire an<0>;
    wire an<1>;
    wire an<2>;
    wire an<3>;
    wire an_0_OBUF;
    wire an_1_OBUF;
    wire an_3_OBUF;
    wire bird_color_on;
    wire bird_color_on_add0000<1>;
    wire bird_color_on_add0000<2>;
    wire bird_color_on_add0000<3>;
    wire bird_color_on_add0000<4>;
    wire bird_color_on_add0000<5>;
    wire bird_color_on_add0000<6>;
    wire bird_color_on_add0000<7>;
    wire bird_color_on_add0000<8>;
    wire bird_color_on_add0000<9>;
    wire bird_color_on_add0001<0>;
    wire bird_color_on_add0001<1>;
    wire bird_color_on_add0001<2>;
    wire bird_color_on_add0001<3>;
    wire bird_color_on_add0001<4>;
    wire bird_color_on_add0001<5>;
    wire bird_color_on_add0001<6>;
    wire bird_color_on_add0001<7>;
    wire bird_color_on_add0001<8>;
    wire bird_color_on_add0001<9>;
    wire bird_color_on_add0002<4>;
    wire bird_color_on_add0002<5>;
    wire bird_color_on_add0003<0>;
    wire bird_color_on_add0003<1>;
    wire bird_color_on_add0003<2>;
    wire bird_color_on_add0003<3>;
    wire bird_color_on_add0003<4>;
    wire bird_color_on_add0003<5>;
    wire bird_color_on_add0003<6>;
    wire bird_color_on_add0003<7>;
    wire bird_color_on_add0003<8>;
    wire bird_color_on_add0003<9>;
    wire bird_color_on_add0004<1>;
    wire bird_color_on_add0004<2>;
    wire bird_color_on_add0004<3>;
    wire bird_color_on_add0004<4>;
    wire bird_color_on_add0004<5>;
    wire bird_color_on_add0004<6>;
    wire bird_color_on_add0004<7>;
    wire bird_color_on_add0004<8>;
    wire bird_color_on_add0004<9>;
    wire bird_color_on_add0005<0>;
    wire bird_color_on_add0005<1>;
    wire bird_color_on_add0005<2>;
    wire bird_color_on_add0005<3>;
    wire bird_color_on_add0005<4>;
    wire bird_color_on_add0005<5>;
    wire bird_color_on_add0005<6>;
    wire bird_color_on_add0005<7>;
    wire bird_color_on_add0005<8>;
    wire bird_color_on_add0005<9>;
    wire bird_color_on_add0007<0>;
    wire bird_color_on_add0007<1>;
    wire bird_color_on_add0007<2>;
    wire bird_color_on_add0007<3>;
    wire bird_color_on_add0007<4>;
    wire bird_color_on_add0007<5>;
    wire bird_color_on_add0007<6>;
    wire bird_color_on_add0007<7>;
    wire bird_color_on_add0007<8>;
    wire bird_color_on_add0007<9>;
    wire bird_color_on_add0008<1>;
    wire bird_color_on_add0008<2>;
    wire bird_color_on_add0008<3>;
    wire bird_color_on_add0008<4>;
    wire bird_color_on_add0008<5>;
    wire bird_color_on_add0008<6>;
    wire bird_color_on_add0008<7>;
    wire bird_color_on_add0008<8>;
    wire bird_color_on_add0008<9>;
    wire bird_color_on_add0009<0>;
    wire bird_color_on_add0009<1>;
    wire bird_color_on_add0009<2>;
    wire bird_color_on_add0009<3>;
    wire bird_color_on_add0009<4>;
    wire bird_color_on_add0009<5>;
    wire bird_color_on_add0009<6>;
    wire bird_color_on_add0009<7>;
    wire bird_color_on_add0009<8>;
    wire bird_color_on_add0009<9>;
    wire bird_color_on_add0010<4>;
    wire bird_color_on_add0010<5>;
    wire bird_color_on_add0011<0>;
    wire bird_color_on_add0011<1>;
    wire bird_color_on_add0011<2>;
    wire bird_color_on_add0011<3>;
    wire bird_color_on_add0011<4>;
    wire bird_color_on_add0011<5>;
    wire bird_color_on_add0011<6>;
    wire bird_color_on_add0011<7>;
    wire bird_color_on_add0011<8>;
    wire bird_color_on_add0011<9>;
    wire bird_color_on_add0012<1>;
    wire bird_color_on_add0012<2>;
    wire bird_color_on_add0012<3>;
    wire bird_color_on_add0012<4>;
    wire bird_color_on_add0012<5>;
    wire bird_color_on_add0012<6>;
    wire bird_color_on_add0012<7>;
    wire bird_color_on_add0012<8>;
    wire bird_color_on_add0012<9>;
    wire bird_color_on_add0013<0>;
    wire bird_color_on_add0013<1>;
    wire bird_color_on_add0013<2>;
    wire bird_color_on_add0013<3>;
    wire bird_color_on_add0013<4>;
    wire bird_color_on_add0013<5>;
    wire bird_color_on_add0013<6>;
    wire bird_color_on_add0013<7>;
    wire bird_color_on_add0013<8>;
    wire bird_color_on_add0013<9>;
    wire bird_color_on_add0014<6>;
    wire bird_color_on_add0014<7>;
    wire bird_color_on_add0015<0>;
    wire bird_color_on_add0015<1>;
    wire bird_color_on_add0015<2>;
    wire bird_color_on_add0015<3>;
    wire bird_color_on_add0015<4>;
    wire bird_color_on_add0015<5>;
    wire bird_color_on_add0015<6>;
    wire bird_color_on_add0015<7>;
    wire bird_color_on_add0015<8>;
    wire bird_color_on_add0015<9>;
    wire bird_color_on_add0016<1>;
    wire bird_color_on_add0016<2>;
    wire bird_color_on_add0016<3>;
    wire bird_color_on_add0016<4>;
    wire bird_color_on_add0016<5>;
    wire bird_color_on_add0016<6>;
    wire bird_color_on_add0016<7>;
    wire bird_color_on_add0016<8>;
    wire bird_color_on_add0016<9>;
    wire bird_color_on_add0017<0>;
    wire bird_color_on_add0017<1>;
    wire bird_color_on_add0017<2>;
    wire bird_color_on_add0017<3>;
    wire bird_color_on_add0017<4>;
    wire bird_color_on_add0017<5>;
    wire bird_color_on_add0017<6>;
    wire bird_color_on_add0017<7>;
    wire bird_color_on_add0017<8>;
    wire bird_color_on_add0017<9>;
    wire bird_color_on_add0018<5>;
    wire bird_color_on_add0019<0>;
    wire bird_color_on_add0019<1>;
    wire bird_color_on_add0019<2>;
    wire bird_color_on_add0019<3>;
    wire bird_color_on_add0019<4>;
    wire bird_color_on_add0019<5>;
    wire bird_color_on_add0019<6>;
    wire bird_color_on_add0019<7>;
    wire bird_color_on_add0019<8>;
    wire bird_color_on_add0019<9>;
    wire bird_color_on_add0020<1>;
    wire bird_color_on_add0020<2>;
    wire bird_color_on_add0020<3>;
    wire bird_color_on_add0020<4>;
    wire bird_color_on_add0020<5>;
    wire bird_color_on_add0020<6>;
    wire bird_color_on_add0020<7>;
    wire bird_color_on_add0020<8>;
    wire bird_color_on_add0020<9>;
    wire bird_color_on_add0021<0>;
    wire bird_color_on_add0021<1>;
    wire bird_color_on_add0021<2>;
    wire bird_color_on_add0021<3>;
    wire bird_color_on_add0021<4>;
    wire bird_color_on_add0021<5>;
    wire bird_color_on_add0021<6>;
    wire bird_color_on_add0021<7>;
    wire bird_color_on_add0021<8>;
    wire bird_color_on_add0021<9>;
    wire bird_color_on_cmp_ge0000;
    wire bird_color_on_cmp_ge0001;
    wire bird_color_on_cmp_ge000110;
    wire bird_color_on_cmp_ge000116;
    wire bird_color_on_cmp_ge0002;
    wire bird_color_on_cmp_ge0003;
    wire bird_color_on_cmp_ge0004;
    wire bird_color_on_cmp_le0002;
    wire bird_color_on_or0000;
    wire bird_color_on_or0001;
    wire bird_color_on_or0003;
    wire bird_color_on_or0004;
    wire bird_color_on_or0010;
    wire bird_color_on_or0012103;
    wire bird_color_on_or0012123;
    wire bird_color_on_or0012131;
    wire bird_color_on_or001220;
    wire bird_color_on_or001232;
    wire bird_color_on_or00124;
    wire bird_color_on_or001249;
    wire bird_color_on_or001265;
    wire bird_color_on_or001271;
    wire bird_color_on_or001298;
    wire bird_delay<0>;
    wire bird_delay<1>;
    wire bird_delay<10>;
    wire bird_delay<11>;
    wire bird_delay<12>;
    wire bird_delay<13>;
    wire bird_delay<14>;
    wire bird_delay<15>;
    wire bird_delay<16>;
    wire bird_delay<17>;
    wire bird_delay<18>;
    wire bird_delay<19>;
    wire bird_delay<2>;
    wire bird_delay<20>;
    wire bird_delay<3>;
    wire bird_delay<4>;
    wire bird_delay<5>;
    wire bird_delay<6>;
    wire bird_delay<7>;
    wire bird_delay<8>;
    wire bird_delay<9>;
    wire bird_lips_on;
    wire bird_lips_on_or000118;
    wire bird_lips_on_or00014;
    wire bird_outline_on;
    wire bird_outline_on_addsub0000<0>;
    wire bird_outline_on_addsub0000<1>;
    wire bird_outline_on_addsub0000<2>;
    wire bird_outline_on_addsub0000<3>;
    wire bird_outline_on_addsub0000<4>;
    wire bird_outline_on_addsub0000<5>;
    wire bird_outline_on_addsub0000<6>;
    wire bird_outline_on_addsub0000<7>;
    wire bird_outline_on_addsub0000<8>;
    wire bird_outline_on_addsub0000<9>;
    wire bird_outline_on_addsub0002<0>;
    wire bird_outline_on_addsub0002<1>;
    wire bird_outline_on_addsub0002<2>;
    wire bird_outline_on_addsub0002<3>;
    wire bird_outline_on_addsub0002<4>;
    wire bird_outline_on_addsub0002<5>;
    wire bird_outline_on_addsub0002<6>;
    wire bird_outline_on_addsub0002<7>;
    wire bird_outline_on_addsub0002<8>;
    wire bird_outline_on_addsub0002<9>;
    wire bird_outline_on_cmp_ge0000;
    wire bird_outline_on_cmp_ge0001;
    wire bird_outline_on_cmp_ge0002;
    wire bird_outline_on_cmp_le0000;
    wire bird_outline_on_cmp_le00001;
    wire bird_outline_on_cmp_le0001;
    wire bird_outline_on_cmp_le0002;
    wire bird_outline_on_cmp_le0003;
    wire bird_outline_on_or0013101;
    wire bird_outline_on_or0013109;
    wire bird_outline_on_or0013129;
    wire bird_outline_on_or0013145;
    wire bird_outline_on_or0013156;
    wire bird_outline_on_or0013166;
    wire bird_outline_on_or0013170;
    wire bird_outline_on_or0013176;
    wire bird_outline_on_or0013178;
    wire bird_outline_on_or0013190;
    wire bird_outline_on_or0013233;
    wire bird_outline_on_or0013255;
    wire bird_outline_on_or0013274;
    wire bird_outline_on_or0013285;
    wire bird_outline_on_or0013286;
    wire bird_outline_on_or0013294;
    wire bird_outline_on_or001330;
    wire bird_outline_on_or0013302;
    wire bird_outline_on_or0013329;
    wire bird_outline_on_or0013351;
    wire bird_outline_on_or001337;
    wire bird_outline_on_or00134;
    wire bird_outline_on_or001344;
    wire bird_outline_on_or001356;
    wire bird_outline_on_or001362;
    wire bird_outline_on_or001386;
    wire bird_outline_on_or00139;
    wire bird_top<0>;
    wire bird_top_0_1;
    wire bird_top<1>;
    wire bird_top_1_1;
    wire bird_top<2>;
    wire bird_top_2_1;
    wire bird_top<3>;
    wire bird_top<4>;
    wire bird_top<5>;
    wire bird_top_5_1;
    wire bird_top<6>;
    wire bird_top_6_1;
    wire bird_top<7>;
    wire bird_top<8>;
    wire bird_top_8_1;
    wire bird_top_next<0>;
    wire bird_top_next<1>;
    wire bird_top_next<2>;
    wire bird_top_next<3>;
    wire bird_top_next<4>;
    wire bird_top_next<5>;
    wire bird_top_next<6>;
    wire bird_top_next<7>;
    wire bird_top_next<8>;
    wire bird_top_next_cmp_lt0000;
    wire bird_top_next_cmp_lt0000211;
    wire bird_top_next_cmp_lt0000220;
    wire bird_top_next_cmp_lt0000243;
    wire bird_top_next_cmp_lt000027;
    wire bird_top_temp<0>;
    wire bird_top_temp<1>;
    wire bird_top_temp<2>;
    wire bird_top_temp<3>;
    wire bird_top_temp<4>;
    wire bird_top_temp<5>;
    wire bird_top_temp<6>;
    wire bird_top_temp<7>;
    wire bird_top_temp<8>;
    wire bird_top_temp_addsub0000<0>;
    wire bird_top_temp_addsub0000<1>;
    wire bird_top_temp_addsub0000<2>;
    wire bird_top_temp_addsub0000<3>;
    wire bird_top_temp_addsub0000<4>;
    wire bird_top_temp_addsub0000<5>;
    wire bird_top_temp_addsub0000<6>;
    wire bird_top_temp_addsub0000<7>;
    wire bird_top_temp_addsub0000<8>;
    wire bird_top_temp_addsub0000<9>;
    wire bird_top_temp_addsub0001<0>;
    wire bird_top_temp_addsub0001<1>;
    wire bird_top_temp_addsub0001<2>;
    wire bird_top_temp_addsub0001<3>;
    wire bird_top_temp_addsub0001<4>;
    wire bird_top_temp_addsub0001<5>;
    wire bird_top_temp_addsub0001<6>;
    wire bird_top_temp_addsub0001<7>;
    wire bird_top_temp_addsub0001<8>;
    wire bird_top_temp_addsub0001<9>;
    wire bird_top_temp_and0000;
    wire bird_top_temp_and0001;
    wire bird_top_temp_cmp_eq0000;
    wire bird_top_temp_cmp_eq0000_wg_cy<0>;
    wire bird_top_temp_cmp_eq0000_wg_cy<1>;
    wire bird_top_temp_cmp_eq0000_wg_cy<2>;
    wire bird_top_temp_cmp_eq0000_wg_cy<3>;
    wire bird_top_temp_cmp_eq0000_wg_cy<4>;
    wire bird_top_temp_cmp_eq0000_wg_lut<0>;
    wire bird_top_temp_cmp_eq0000_wg_lut<1>;
    wire bird_top_temp_cmp_eq0000_wg_lut<2>;
    wire bird_top_temp_cmp_eq0000_wg_lut<3>;
    wire bird_top_temp_cmp_eq0000_wg_lut<4>;
    wire bird_top_temp_cmp_eq0000_wg_lut<5>;
    wire bird_white_on;
    wire bird_white_on_cmp_le0002;
    wire bird_white_on_or00041;
    wire bird_white_on_or000411;
    wire bird_white_on_or0004110;
    wire bird_white_on_or0004128;
    wire bird_white_on_or0004153;
    wire bird_white_on_or0004187;
    wire bird_white_on_or000426;
    wire bird_white_on_or000427;
    wire bird_white_on_or000440;
    wire bird_white_on_or000456;
    wire bird_white_on_or000468;
    wire bird_white_on_or00047;
    wire bird_white_on_or000473;
    wire bird_white_on_or000492;
    wire blank;
    wire btn<0>;
    wire btn<3>;
    wire btn<3>_inv;
    wire btn_0_IBUF;
    wire btn_3_IBUF;
    wire button0;
    wire button0_and0000;
    wire button0_and0002;
    wire button0_cmp_eq0000;
    wire button0_cmp_eq0000_wg_cy<0>;
    wire button0_cmp_eq0000_wg_cy<1>;
    wire button0_cmp_eq0000_wg_cy<2>;
    wire button0_cmp_eq0000_wg_cy<3>;
    wire button0_cmp_eq0000_wg_lut<0>;
    wire button0_cmp_eq0000_wg_lut<1>;
    wire button0_cmp_eq0000_wg_lut<2>;
    wire button0_cmp_eq0000_wg_lut<3>;
    wire button0_cmp_eq0000_wg_lut<4>;
    wire clk;
    wire clk_BUFGP;
    wire col1_on_cmp_gt0000;
    wire col1_on_cmp_gt0000210;
    wire col1_on_cmp_le0000;
    wire col1_x<0>;
    wire col1_x<1>;
    wire col1_x<2>;
    wire col1_x<3>;
    wire col1_x<4>;
    wire col1_x<5>;
    wire col1_x<6>;
    wire col1_x<7>;
    wire col1_x<8>;
    wire col1_x<9>;
    wire col1_x_addsub0000<0>;
    wire col1_x_addsub0000<1>;
    wire col1_x_addsub0000<2>;
    wire col1_x_addsub0000<3>;
    wire col1_x_addsub0000<4>;
    wire col1_x_addsub0000<5>;
    wire col1_x_addsub0000<6>;
    wire col1_x_addsub0000<7>;
    wire col1_x_addsub0000<8>;
    wire col1_x_addsub0000<9>;
    wire col1_x_cmp_eq0000;
    wire col1_x_cmp_eq000019;
    wire col1_x_cmp_eq00008;
    wire col1_x_mux0000<0>;
    wire col1_x_mux0000<1>;
    wire col1_x_mux0000<2>;
    wire col1_x_mux0000<3>;
    wire col1_x_mux0000<4>;
    wire col1_x_mux0000<5>;
    wire col1_x_mux0000<6>;
    wire col1_x_mux0000<7>;
    wire col1_x_mux0000<8>;
    wire col1_x_mux0000<9>;
    wire col1_x_not0001;
    wire col1_y<0>;
    wire col1_y<4>;
    wire col1_y<5>;
    wire col1_y<6>;
    wire col1_y<7>;
    wire col1_y<8>;
    wire col1_y_and0000;
    wire col2_on_cmp_gt0000;
    wire col2_on_cmp_gt0000210;
    wire col2_on_cmp_le0000;
    wire col2_x<0>;
    wire col2_x<1>;
    wire col2_x<2>;
    wire col2_x<3>;
    wire col2_x<4>;
    wire col2_x<5>;
    wire col2_x<6>;
    wire col2_x<7>;
    wire col2_x<8>;
    wire col2_x<9>;
    wire col2_x_addsub0000<0>;
    wire col2_x_addsub0000<1>;
    wire col2_x_addsub0000<2>;
    wire col2_x_addsub0000<3>;
    wire col2_x_addsub0000<4>;
    wire col2_x_addsub0000<5>;
    wire col2_x_addsub0000<6>;
    wire col2_x_addsub0000<7>;
    wire col2_x_addsub0000<8>;
    wire col2_x_addsub0000<9>;
    wire col2_x_cmp_eq0000;
    wire col2_x_cmp_eq000010;
    wire col2_x_cmp_eq000021;
    wire col2_x_mux0000<0>;
    wire col2_x_mux0000<1>;
    wire col2_x_mux0000<2>;
    wire col2_x_mux0000<3>;
    wire col2_x_mux0000<4>;
    wire col2_x_mux0000<5>;
    wire col2_x_mux0000<6>;
    wire col2_x_mux0000<7>;
    wire col2_x_mux0000<8>;
    wire col2_x_mux0000<9>;
    wire col2_x_not0001;
    wire col2_x_not00011;
    wire col2_y<0>;
    wire col2_y<4>;
    wire col2_y<5>;
    wire col2_y<6>;
    wire col2_y<7>;
    wire col2_y<8>;
    wire col2_y_and0000;
    wire col3_on_cmp_gt0000;
    wire col3_on_cmp_gt0000210;
    wire col3_on_cmp_le0000;
    wire col3_x<0>;
    wire col3_x<1>;
    wire col3_x<2>;
    wire col3_x<3>;
    wire col3_x<4>;
    wire col3_x<5>;
    wire col3_x<6>;
    wire col3_x<7>;
    wire col3_x<8>;
    wire col3_x<9>;
    wire col3_x_addsub0000<0>;
    wire col3_x_addsub0000<1>;
    wire col3_x_addsub0000<2>;
    wire col3_x_addsub0000<3>;
    wire col3_x_addsub0000<4>;
    wire col3_x_addsub0000<5>;
    wire col3_x_addsub0000<6>;
    wire col3_x_addsub0000<7>;
    wire col3_x_addsub0000<8>;
    wire col3_x_addsub0000<9>;
    wire col3_x_cmp_eq0000;
    wire col3_x_cmp_eq000019;
    wire col3_x_cmp_eq00008;
    wire col3_x_mux0000<0>;
    wire col3_x_mux0000<1>;
    wire col3_x_mux0000<2>;
    wire col3_x_mux0000<3>;
    wire col3_x_mux0000<4>;
    wire col3_x_mux0000<5>;
    wire col3_x_mux0000<6>;
    wire col3_x_mux0000<7>;
    wire col3_x_mux0000<8>;
    wire col3_x_mux0000<9>;
    wire col3_x_not0001;
    wire col3_y<0>;
    wire col3_y<4>;
    wire col3_y<5>;
    wire col3_y<6>;
    wire col3_y<7>;
    wire col3_y<8>;
    wire col3_y_and0000;
    wire debounce_counter_value<0>;
    wire debounce_counter_value<1>;
    wire debounce_counter_value<10>;
    wire debounce_counter_value<11>;
    wire debounce_counter_value<12>;
    wire debounce_counter_value<13>;
    wire debounce_counter_value<14>;
    wire debounce_counter_value<15>;
    wire debounce_counter_value<16>;
    wire debounce_counter_value<17>;
    wire debounce_counter_value<18>;
    wire debounce_counter_value<2>;
    wire debounce_counter_value<3>;
    wire debounce_counter_value<4>;
    wire debounce_counter_value<5>;
    wire debounce_counter_value<6>;
    wire debounce_counter_value<7>;
    wire debounce_counter_value<8>;
    wire debounce_counter_value<9>;
    wire debouncer/state_reg_FSM_FFd2;
    wire debouncer/state_reg_FSM_FFd2-In;
    wire debouncer/state_reg_FSM_FFd3;
    wire debouncer/state_reg_FSM_FFd3-In;
    wire delay<0>;
    wire delay<1>;
    wire delay<10>;
    wire delay<11>;
    wire delay<12>;
    wire delay<13>;
    wire delay<14>;
    wire delay<15>;
    wire delay<16>;
    wire delay<17>;
    wire delay<18>;
    wire delay<19>;
    wire delay<2>;
    wire delay<20>;
    wire delay<21>;
    wire delay<22>;
    wire delay<23>;
    wire delay<24>;
    wire delay<25>;
    wire delay<26>;
    wire delay<27>;
    wire delay<28>;
    wire delay<29>;
    wire delay<3>;
    wire delay<30>;
    wire delay<4>;
    wire delay<5>;
    wire delay<6>;
    wire delay<7>;
    wire delay<8>;
    wire delay<9>;
    wire delay_next<0>;
    wire delay_next<10>;
    wire delay_next<11>;
    wire delay_next<12>;
    wire delay_next<13>;
    wire delay_next<14>;
    wire delay_next<15>;
    wire delay_next<16>;
    wire delay_next<17>;
    wire delay_next<18>;
    wire delay_next<19>;
    wire delay_next<1>;
    wire delay_next<20>;
    wire delay_next<21>;
    wire delay_next<22>;
    wire delay_next<23>;
    wire delay_next<24>;
    wire delay_next<25>;
    wire delay_next<26>;
    wire delay_next<27>;
    wire delay_next<28>;
    wire delay_next<29>;
    wire delay_next<2>;
    wire delay_next<30>;
    wire delay_next<3>;
    wire delay_next<4>;
    wire delay_next<5>;
    wire delay_next<6>;
    wire delay_next<7>;
    wire delay_next<8>;
    wire delay_next<9>;
    wire delay_next_addsub0000<0>;
    wire delay_next_addsub0000<10>;
    wire delay_next_addsub0000<11>;
    wire delay_next_addsub0000<12>;
    wire delay_next_addsub0000<13>;
    wire delay_next_addsub0000<14>;
    wire delay_next_addsub0000<15>;
    wire delay_next_addsub0000<16>;
    wire delay_next_addsub0000<17>;
    wire delay_next_addsub0000<18>;
    wire delay_next_addsub0000<19>;
    wire delay_next_addsub0000<1>;
    wire delay_next_addsub0000<20>;
    wire delay_next_addsub0000<21>;
    wire delay_next_addsub0000<22>;
    wire delay_next_addsub0000<23>;
    wire delay_next_addsub0000<24>;
    wire delay_next_addsub0000<25>;
    wire delay_next_addsub0000<26>;
    wire delay_next_addsub0000<27>;
    wire delay_next_addsub0000<28>;
    wire delay_next_addsub0000<29>;
    wire delay_next_addsub0000<2>;
    wire delay_next_addsub0000<30>;
    wire delay_next_addsub0000<3>;
    wire delay_next_addsub0000<4>;
    wire delay_next_addsub0000<5>;
    wire delay_next_addsub0000<6>;
    wire delay_next_addsub0000<7>;
    wire delay_next_addsub0000<8>;
    wire delay_next_addsub0000<9>;
    wire display/Mcount_counter_value_cy<0>;
    wire display/Mcount_counter_value_cy<10>;
    wire display/Mcount_counter_value_cy<10>_rt;
    wire display/Mcount_counter_value_cy<11>;
    wire display/Mcount_counter_value_cy<11>_rt;
    wire display/Mcount_counter_value_cy<12>;
    wire display/Mcount_counter_value_cy<12>_rt;
    wire display/Mcount_counter_value_cy<13>;
    wire display/Mcount_counter_value_cy<13>_rt;
    wire display/Mcount_counter_value_cy<1>;
    wire display/Mcount_counter_value_cy<1>_rt;
    wire display/Mcount_counter_value_cy<2>;
    wire display/Mcount_counter_value_cy<2>_rt;
    wire display/Mcount_counter_value_cy<3>;
    wire display/Mcount_counter_value_cy<3>_rt;
    wire display/Mcount_counter_value_cy<4>;
    wire display/Mcount_counter_value_cy<4>_rt;
    wire display/Mcount_counter_value_cy<5>;
    wire display/Mcount_counter_value_cy<5>_rt;
    wire display/Mcount_counter_value_cy<6>;
    wire display/Mcount_counter_value_cy<6>_rt;
    wire display/Mcount_counter_value_cy<7>;
    wire display/Mcount_counter_value_cy<7>_rt;
    wire display/Mcount_counter_value_cy<8>;
    wire display/Mcount_counter_value_cy<8>_rt;
    wire display/Mcount_counter_value_cy<9>;
    wire display/Mcount_counter_value_cy<9>_rt;
    wire display/Mcount_counter_value_lut<0>;
    wire display/Mcount_counter_value_xor<14>_rt;
    wire display/Mmux_decode_3;
    wire display/Mmux_decode_31;
    wire display/Mmux_decode_32;
    wire display/Mmux_decode_33;
    wire display/Mmux_decode_4;
    wire display/Mmux_decode_41;
    wire display/Mmux_decode_42;
    wire display/Mmux_decode_43;
    wire display/counter_value<0>;
    wire display/counter_value<1>;
    wire display/counter_value<10>;
    wire display/counter_value<11>;
    wire display/counter_value<12>;
    wire display/counter_value<13>;
    wire display/counter_value<14>;
    wire display/counter_value<2>;
    wire display/counter_value<3>;
    wire display/counter_value<4>;
    wire display/counter_value<5>;
    wire display/counter_value<6>;
    wire display/counter_value<7>;
    wire display/counter_value<8>;
    wire display/counter_value<9>;
    wire display/decode<0>;
    wire display/decode<1>;
    wire display/decode<2>;
    wire display/decode<3>;
    wire dp;
    wire dp_OBUF;
    wire fall_reg<0>;
    wire fall_reg<1>;
    wire fall_reg<2>;
    wire fall_reg<3>;
    wire fall_reg_and0000;
    wire fall_reg_and000017;
    wire fall_reg_and0000171;
    wire fall_reg_mux0001<0>;
    wire fall_reg_mux0001<1>;
    wire fall_reg_mux0001<2>;
    wire fall_reg_mux0001<3>;
    wire ground_border_on_cmp_ge0000;
    wire ground_border_on_cmp_ge0000217;
    wire ground_border_on_cmp_ge000025;
    wire ground_border_on_cmp_lt0000;
    wire ground_border_on_cmp_lt0000219;
    wire ground_border_on_cmp_lt000023;
    wire ground_border_on_cmp_lt0000244;
    wire highscore<0>;
    wire highscore<1>;
    wire highscore<2>;
    wire highscore<3>;
    wire highscore<4>;
    wire highscore<5>;
    wire highscore<6>;
    wire highscore<7>;
    wire highscore_and0000;
    wire jump_reg<0>;
    wire jump_reg<1>;
    wire jump_reg<2>;
    wire jump_reg<3>;
    wire jump_reg<4>;
    wire jump_reg_and0001;
    wire jump_reg_mux0001<1>;
    wire jump_reg_mux0001<2>;
    wire jump_reg_mux0001<3>;
    wire jump_reg_mux0001<4>;
    wire led<0>;
    wire led<1>;
    wire led<2>;
    wire led<3>;
    wire led<4>;
    wire led<5>;
    wire led<6>;
    wire led<7>;
    wire led_0_OBUF;
    wire led_1_OBUF;
    wire led_2_OBUF;
    wire led_3_OBUF;
    wire led_4_OBUF;
    wire led_5_OBUF;
    wire led_6_OBUF;
    wire led_7_OBUF;
    wire left_seven_seg_data<0>;
    wire left_seven_seg_data<1>;
    wire left_seven_seg_data<2>;
    wire left_seven_seg_data<3>;
    wire left_seven_seg_data<4>;
    wire left_seven_seg_data<5>;
    wire left_seven_seg_data<6>;
    wire left_seven_seg_data<7>;
    wire moveEN;
    wire moveEN_cmp_eq0000_wg_cy<0>;
    wire moveEN_cmp_eq0000_wg_cy<1>;
    wire moveEN_cmp_eq0000_wg_cy<2>;
    wire moveEN_cmp_eq0000_wg_cy<3>;
    wire moveEN_cmp_eq0000_wg_cy<4>;
    wire moveEN_cmp_eq0000_wg_cy<5>;
    wire moveEN_cmp_eq0000_wg_cy<6>;
    wire moveEN_cmp_eq0000_wg_lut<0>;
    wire moveEN_cmp_eq0000_wg_lut<1>;
    wire moveEN_cmp_eq0000_wg_lut<2>;
    wire moveEN_cmp_eq0000_wg_lut<3>;
    wire moveEN_cmp_eq0000_wg_lut<4>;
    wire moveEN_cmp_eq0000_wg_lut<5>;
    wire moveEN_cmp_eq0000_wg_lut<6>;
    wire moveEN_cmp_eq0000_wg_lut<7>;
    wire pipe_on;
    wire pipe_on_addsub0000<7>;
    wire pipe_on_addsub0000<8>_bdd0;
    wire pipe_on_addsub0001<2>;
    wire pipe_on_addsub0001<4>;
    wire pipe_on_addsub0001<5>;
    wire pipe_on_addsub0001<6>;
    wire pipe_on_addsub0001<7>;
    wire pipe_on_addsub0001<7>_bdd0;
    wire pipe_on_addsub0001<8>;
    wire pipe_on_addsub0001<9>;
    wire pipe_on_addsub0002<7>;
    wire pipe_on_addsub0002<8>_bdd0;
    wire pipe_on_addsub0003<2>;
    wire pipe_on_addsub0003<4>;
    wire pipe_on_addsub0003<5>;
    wire pipe_on_addsub0003<6>;
    wire pipe_on_addsub0003<7>;
    wire pipe_on_addsub0003<7>_bdd0;
    wire pipe_on_addsub0003<8>;
    wire pipe_on_addsub0003<9>;
    wire pipe_on_addsub0004<7>;
    wire pipe_on_addsub0004<8>_bdd0;
    wire pipe_on_addsub0005<2>;
    wire pipe_on_addsub0005<4>;
    wire pipe_on_addsub0005<5>;
    wire pipe_on_addsub0005<6>;
    wire pipe_on_addsub0005<7>;
    wire pipe_on_addsub0005<7>_bdd0;
    wire pipe_on_addsub0005<8>;
    wire pipe_on_addsub0005<9>;
    wire pipe_on_cmp_ge0000;
    wire pipe_on_cmp_ge0001;
    wire pipe_on_cmp_ge0002;
    wire pipe_on_cmp_le0001;
    wire pipe_on_cmp_le0003;
    wire pipe_on_cmp_le0005;
    wire pipe_on_or00060;
    wire pipe_on_or0006111;
    wire pipe_on_or0006129;
    wire pipe_on_or0006146;
    wire pipe_on_or000615;
    wire pipe_on_or0006159;
    wire pipe_on_or0006179;
    wire pipe_on_or0006216;
    wire pipe_on_or0006229;
    wire pipe_on_or0006255;
    wire pipe_on_or0006275;
    wire pipe_on_or0006291;
    wire pipe_on_or0006310;
    wire pipe_on_or000633;
    wire pipe_on_or000666;
    wire random<0>;
    wire random<4>;
    wire random<5>;
    wire random<6>;
    wire random<7>;
    wire random_next<4>;
    wire random_next<5>;
    wire rgb<0>;
    wire rgb<0>11;
    wire rgb<0>21;
    wire rgb<1>;
    wire rgb<2>;
    wire rgb<2>14;
    wire rgb<2>5;
    wire rgb<3>;
    wire rgb<3>0;
    wire rgb<3>14;
    wire rgb<3>36;
    wire rgb<4>;
    wire rgb<4>5;
    wire rgb<5>;
    wire rgb<5>0;
    wire rgb<5>1;
    wire rgb<6>;
    wire rgb<6>4;
    wire rgb<7>;
    wire rgb<7>1;
    wire right_seven_seg_data<0>;
    wire right_seven_seg_data<1>;
    wire right_seven_seg_data<2>;
    wire right_seven_seg_data<3>;
    wire right_seven_seg_data<4>;
    wire right_seven_seg_data<5>;
    wire right_seven_seg_data<6>;
    wire right_seven_seg_data<7>;
    wire scoreOnes<0>;
    wire scoreOnes<1>;
    wire scoreOnes<2>;
    wire scoreOnes<3>;
    wire scoreOnes_and0000;
    wire scoreOnes_cmp_eq0003;
    wire scoreOnes_not0001;
    wire scoreOnes_or0000;
    wire scoreOnes_or0000122;
    wire scoreOnes_or0000133;
    wire scoreOnes_or000014;
    wire scoreOnes_or0000147;
    wire scoreOnes_or000034;
    wire scoreOnes_or000036;
    wire scoreOnes_or000063;
    wire scoreOnes_or000083;
    wire scoreOnes_or000085;
    wire scoreTens<0>;
    wire scoreTens<1>;
    wire scoreTens<2>;
    wire scoreTens<3>;
    wire scoreTens_not0001;
    wire seg<0>;
    wire seg<1>;
    wire seg<2>;
    wire seg<3>;
    wire seg<4>;
    wire seg<5>;
    wire seg<6>;
    wire seg_0_OBUF;
    wire seg_1_OBUF;
    wire seg_2_OBUF;
    wire seg_3_OBUF;
    wire seg_4_OBUF;
    wire seg_5_OBUF;
    wire seg_6_OBUF;
    wire state_next;
    wire state_reg<0>;
    wire sw<0>;
    wire sw<1>;
    wire sw<2>;
    wire sw<3>;
    wire sw<4>;
    wire sw<5>;
    wire sw<6>;
    wire sw<7>;
    wire vgaBlue<0>;
    wire vgaBlue<1>;
    wire vgaBlue_0;
    wire vgaBlue_1;
    wire vgaGreen<0>;
    wire vgaGreen<1>;
    wire vgaGreen<2>;
    wire vgaGreen_0;
    wire vgaGreen_1;
    wire vgaGreen_2;
    wire vgaRed<0>;
    wire vgaRed<1>;
    wire vgaRed<2>;
    wire vgaRed_0;
    wire vgaRed_1;
    wire vgaRed_2;
    wire vga_timer/Mcount_horizontal_pixel_counter_cy<0>;
    wire vga_timer/Mcount_horizontal_pixel_counter_cy<1>;
    wire vga_timer/Mcount_horizontal_pixel_counter_cy<1>_rt;
    wire vga_timer/Mcount_horizontal_pixel_counter_cy<2>;
    wire vga_timer/Mcount_horizontal_pixel_counter_cy<2>_rt;
    wire vga_timer/Mcount_horizontal_pixel_counter_cy<3>;
    wire vga_timer/Mcount_horizontal_pixel_counter_cy<3>_rt;
    wire vga_timer/Mcount_horizontal_pixel_counter_cy<4>;
    wire vga_timer/Mcount_horizontal_pixel_counter_cy<4>_rt;
    wire vga_timer/Mcount_horizontal_pixel_counter_cy<5>;
    wire vga_timer/Mcount_horizontal_pixel_counter_cy<5>_rt;
    wire vga_timer/Mcount_horizontal_pixel_counter_cy<6>;
    wire vga_timer/Mcount_horizontal_pixel_counter_cy<6>_rt;
    wire vga_timer/Mcount_horizontal_pixel_counter_cy<7>;
    wire vga_timer/Mcount_horizontal_pixel_counter_cy<7>_rt;
    wire vga_timer/Mcount_horizontal_pixel_counter_cy<8>;
    wire vga_timer/Mcount_horizontal_pixel_counter_cy<8>_rt;
    wire vga_timer/Mcount_horizontal_pixel_counter_eqn_0;
    wire vga_timer/Mcount_horizontal_pixel_counter_eqn_0110;
    wire vga_timer/Mcount_horizontal_pixel_counter_eqn_0118;
    wire vga_timer/Mcount_horizontal_pixel_counter_eqn_1;
    wire vga_timer/Mcount_horizontal_pixel_counter_eqn_2;
    wire vga_timer/Mcount_horizontal_pixel_counter_eqn_3;
    wire vga_timer/Mcount_horizontal_pixel_counter_eqn_4;
    wire vga_timer/Mcount_horizontal_pixel_counter_eqn_5;
    wire vga_timer/Mcount_horizontal_pixel_counter_eqn_6;
    wire vga_timer/Mcount_horizontal_pixel_counter_eqn_7;
    wire vga_timer/Mcount_horizontal_pixel_counter_eqn_8;
    wire vga_timer/Mcount_horizontal_pixel_counter_eqn_9;
    wire vga_timer/Mcount_horizontal_pixel_counter_lut<0>;
    wire vga_timer/Mcount_horizontal_pixel_counter_xor<9>_rt;
    wire vga_timer/Mcount_vertical_pixel_counter_cy<0>;
    wire vga_timer/Mcount_vertical_pixel_counter_cy<1>;
    wire vga_timer/Mcount_vertical_pixel_counter_cy<1>_rt;
    wire vga_timer/Mcount_vertical_pixel_counter_cy<2>;
    wire vga_timer/Mcount_vertical_pixel_counter_cy<2>_rt;
    wire vga_timer/Mcount_vertical_pixel_counter_cy<3>;
    wire vga_timer/Mcount_vertical_pixel_counter_cy<3>_rt;
    wire vga_timer/Mcount_vertical_pixel_counter_cy<4>;
    wire vga_timer/Mcount_vertical_pixel_counter_cy<4>_rt;
    wire vga_timer/Mcount_vertical_pixel_counter_cy<5>;
    wire vga_timer/Mcount_vertical_pixel_counter_cy<5>_rt;
    wire vga_timer/Mcount_vertical_pixel_counter_cy<6>;
    wire vga_timer/Mcount_vertical_pixel_counter_cy<6>_rt;
    wire vga_timer/Mcount_vertical_pixel_counter_cy<7>;
    wire vga_timer/Mcount_vertical_pixel_counter_cy<7>_rt;
    wire vga_timer/Mcount_vertical_pixel_counter_cy<8>;
    wire vga_timer/Mcount_vertical_pixel_counter_cy<8>_rt;
    wire vga_timer/Mcount_vertical_pixel_counter_eqn_0;
    wire vga_timer/Mcount_vertical_pixel_counter_eqn_1;
    wire vga_timer/Mcount_vertical_pixel_counter_eqn_2;
    wire vga_timer/Mcount_vertical_pixel_counter_eqn_3;
    wire vga_timer/Mcount_vertical_pixel_counter_eqn_4;
    wire vga_timer/Mcount_vertical_pixel_counter_eqn_5;
    wire vga_timer/Mcount_vertical_pixel_counter_eqn_6;
    wire vga_timer/Mcount_vertical_pixel_counter_eqn_7;
    wire vga_timer/Mcount_vertical_pixel_counter_eqn_8;
    wire vga_timer/Mcount_vertical_pixel_counter_eqn_9;
    wire vga_timer/Mcount_vertical_pixel_counter_lut<0>;
    wire vga_timer/Mcount_vertical_pixel_counter_xor<9>_rt;
    wire vga_timer/Result<0>;
    wire vga_timer/Result<0>1;
    wire vga_timer/Result<1>;
    wire vga_timer/Result<1>1;
    wire vga_timer/Result<2>;
    wire vga_timer/Result<2>1;
    wire vga_timer/Result<3>;
    wire vga_timer/Result<3>1;
    wire vga_timer/Result<4>;
    wire vga_timer/Result<4>1;
    wire vga_timer/Result<5>;
    wire vga_timer/Result<5>1;
    wire vga_timer/Result<6>;
    wire vga_timer/Result<6>1;
    wire vga_timer/Result<7>;
    wire vga_timer/Result<7>1;
    wire vga_timer/Result<8>;
    wire vga_timer/Result<8>1;
    wire vga_timer/Result<9>;
    wire vga_timer/Result<9>1;
    wire vga_timer/VS25;
    wire vga_timer/VS251;
    wire vga_timer/VS28;
    wire vga_timer/blank_or000011;
    wire vga_timer/blank_or00004;
    wire vga_timer/horizontal_pixel_counter<0>;
    wire vga_timer/horizontal_pixel_counter<1>;
    wire vga_timer/horizontal_pixel_counter<2>;
    wire vga_timer/horizontal_pixel_counter<3>;
    wire vga_timer/horizontal_pixel_counter<4>;
    wire vga_timer/horizontal_pixel_counter<5>;
    wire vga_timer/horizontal_pixel_counter<6>;
    wire vga_timer/horizontal_pixel_counter<7>;
    wire vga_timer/horizontal_pixel_counter<8>;
    wire vga_timer/horizontal_pixel_counter<9>;
    wire vga_timer/pixel_en;
    wire vga_timer/pixel_en_not0001;
    wire vga_timer/vertical_pixel_counter<0>;
    wire vga_timer/vertical_pixel_counter<1>;
    wire vga_timer/vertical_pixel_counter<2>;
    wire vga_timer/vertical_pixel_counter<3>;
    wire vga_timer/vertical_pixel_counter<4>;
    wire vga_timer/vertical_pixel_counter<5>;
    wire vga_timer/vertical_pixel_counter<6>;
    wire vga_timer/vertical_pixel_counter<7>;
    wire vga_timer/vertical_pixel_counter<8>;
    wire vga_timer/vertical_pixel_counter<9>;
    wire vga_timer/vertical_pixel_counter_and0000;
    wire vga_timer/vertical_pixel_counter_and000014;
    wire vga_timer/vertical_pixel_counter_and000035;
    wire vga_timer/vertical_pixel_counter_not0001;

    GND XST_GND
    (
        .G(Madd_bird_color_on_add0002_lut<9>)
    );
    VCC XST_VCC
    (
        .P(Msub_bird_top_temp_addsub0000_lut<9>)
    );
    FDCE col3_x_0
    (
        .C(clk_BUFGP),
        .CE(col3_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col3_x_mux0000<9>),
        .Q(col3_x<0>)
    );
    FDCE col3_x_1
    (
        .C(clk_BUFGP),
        .CE(col3_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col3_x_mux0000<8>),
        .Q(col3_x<1>)
    );
    FDCE col3_x_2
    (
        .C(clk_BUFGP),
        .CE(col3_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col3_x_mux0000<7>),
        .Q(col3_x<2>)
    );
    FDCE col3_x_3
    (
        .C(clk_BUFGP),
        .CE(col3_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col3_x_mux0000<6>),
        .Q(col3_x<3>)
    );
    FDCE col3_x_4
    (
        .C(clk_BUFGP),
        .CE(col3_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col3_x_mux0000<5>),
        .Q(col3_x<4>)
    );
    FDCE col3_x_5
    (
        .C(clk_BUFGP),
        .CE(col3_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col3_x_mux0000<4>),
        .Q(col3_x<5>)
    );
    FDCE col3_x_6
    (
        .C(clk_BUFGP),
        .CE(col3_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col3_x_mux0000<3>),
        .Q(col3_x<6>)
    );
    FDCE col3_x_7
    (
        .C(clk_BUFGP),
        .CE(col3_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col3_x_mux0000<2>),
        .Q(col3_x<7>)
    );
    FDCE col3_x_8
    (
        .C(clk_BUFGP),
        .CE(col3_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col3_x_mux0000<1>),
        .Q(col3_x<8>)
    );
    FDCE col3_x_9
    (
        .C(clk_BUFGP),
        .CE(col3_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col3_x_mux0000<0>),
        .Q(col3_x<9>)
    );
    FDE vgaBlue_0
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(rgb<0>),
        .Q(vgaBlue_0)
    );
    FDE vgaBlue_1
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(rgb<1>),
        .Q(vgaBlue_1)
    );
    FDC delay_0
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<0>),
        .Q(delay<0>)
    );
    FDC delay_1
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<1>),
        .Q(delay<1>)
    );
    FDC delay_2
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<2>),
        .Q(delay<2>)
    );
    FDC delay_3
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<3>),
        .Q(delay<3>)
    );
    FDC delay_4
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<4>),
        .Q(delay<4>)
    );
    FDC delay_5
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<5>),
        .Q(delay<5>)
    );
    FDC delay_6
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<6>),
        .Q(delay<6>)
    );
    FDC delay_7
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<7>),
        .Q(delay<7>)
    );
    FDC delay_8
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<8>),
        .Q(delay<8>)
    );
    FDC delay_9
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<9>),
        .Q(delay<9>)
    );
    FDC delay_10
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<10>),
        .Q(delay<10>)
    );
    FDC delay_11
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<11>),
        .Q(delay<11>)
    );
    FDC delay_12
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<12>),
        .Q(delay<12>)
    );
    FDC delay_13
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<13>),
        .Q(delay<13>)
    );
    FDC delay_14
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<14>),
        .Q(delay<14>)
    );
    FDC delay_15
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<15>),
        .Q(delay<15>)
    );
    FDC delay_16
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<16>),
        .Q(delay<16>)
    );
    FDC delay_17
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<17>),
        .Q(delay<17>)
    );
    FDC delay_18
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<18>),
        .Q(delay<18>)
    );
    FDC delay_19
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<19>),
        .Q(delay<19>)
    );
    FDC delay_20
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<20>),
        .Q(delay<20>)
    );
    FDC delay_21
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<21>),
        .Q(delay<21>)
    );
    FDC delay_22
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<22>),
        .Q(delay<22>)
    );
    FDC delay_23
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<23>),
        .Q(delay<23>)
    );
    FDC delay_24
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<24>),
        .Q(delay<24>)
    );
    FDC delay_25
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<25>),
        .Q(delay<25>)
    );
    FDC delay_26
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<26>),
        .Q(delay<26>)
    );
    FDC delay_27
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<27>),
        .Q(delay<27>)
    );
    FDC delay_28
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<28>),
        .Q(delay<28>)
    );
    FDC delay_29
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<29>),
        .Q(delay<29>)
    );
    FDC delay_30
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(delay_next<30>),
        .Q(delay<30>)
    );
    FDC state_reg_0
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(state_next),
        .Q(state_reg<0>)
    );
    FDE button0
    (
        .C(clk_BUFGP),
        .CE(button0_and0000),
        .D(button0_and0002),
        .Q(button0)
    );
    FDE fall_reg_0
    (
        .C(clk_BUFGP),
        .CE(fall_reg_and0000),
        .D(fall_reg_mux0001<3>),
        .Q(fall_reg<0>)
    );
    FDE fall_reg_1
    (
        .C(clk_BUFGP),
        .CE(fall_reg_and0000),
        .D(fall_reg_mux0001<2>),
        .Q(fall_reg<1>)
    );
    FDE fall_reg_2
    (
        .C(clk_BUFGP),
        .CE(fall_reg_and0000),
        .D(fall_reg_mux0001<1>),
        .Q(fall_reg<2>)
    );
    FDE fall_reg_3
    (
        .C(clk_BUFGP),
        .CE(fall_reg_and0000),
        .D(fall_reg_mux0001<0>),
        .Q(fall_reg<3>)
    );
    FDE vgaRed_0
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(rgb<5>),
        .Q(vgaRed_0)
    );
    FDE vgaRed_1
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(rgb<6>),
        .Q(vgaRed_1)
    );
    FDE vgaRed_2
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(rgb<7>),
        .Q(vgaRed_2)
    );
    FDCE col1_x_0
    (
        .C(clk_BUFGP),
        .CE(col1_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col1_x_mux0000<9>),
        .Q(col1_x<0>)
    );
    FDCE col1_x_1
    (
        .C(clk_BUFGP),
        .CE(col1_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col1_x_mux0000<8>),
        .Q(col1_x<1>)
    );
    FDCE col1_x_2
    (
        .C(clk_BUFGP),
        .CE(col1_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col1_x_mux0000<7>),
        .Q(col1_x<2>)
    );
    FDCE col1_x_3
    (
        .C(clk_BUFGP),
        .CE(col1_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col1_x_mux0000<6>),
        .Q(col1_x<3>)
    );
    FDCE col1_x_4
    (
        .C(clk_BUFGP),
        .CE(col1_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col1_x_mux0000<5>),
        .Q(col1_x<4>)
    );
    FDCE col1_x_5
    (
        .C(clk_BUFGP),
        .CE(col1_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col1_x_mux0000<4>),
        .Q(col1_x<5>)
    );
    FDCE col1_x_6
    (
        .C(clk_BUFGP),
        .CE(col1_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col1_x_mux0000<3>),
        .Q(col1_x<6>)
    );
    FDCE col1_x_7
    (
        .C(clk_BUFGP),
        .CE(col1_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col1_x_mux0000<2>),
        .Q(col1_x<7>)
    );
    FDCE col1_x_8
    (
        .C(clk_BUFGP),
        .CE(col1_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col1_x_mux0000<1>),
        .Q(col1_x<8>)
    );
    FDCE col1_x_9
    (
        .C(clk_BUFGP),
        .CE(col1_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col1_x_mux0000<0>),
        .Q(col1_x<9>)
    );
    FDE vgaGreen_0
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(rgb<2>),
        .Q(vgaGreen_0)
    );
    FDE vgaGreen_1
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(rgb<3>),
        .Q(vgaGreen_1)
    );
    FDE vgaGreen_2
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(rgb<4>),
        .Q(vgaGreen_2)
    );
    FDCE col2_x_0
    (
        .C(clk_BUFGP),
        .CE(col2_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col2_x_mux0000<9>),
        .Q(col2_x<0>)
    );
    FDCE col2_x_1
    (
        .C(clk_BUFGP),
        .CE(col2_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col2_x_mux0000<8>),
        .Q(col2_x<1>)
    );
    FDCE col2_x_2
    (
        .C(clk_BUFGP),
        .CE(col2_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col2_x_mux0000<7>),
        .Q(col2_x<2>)
    );
    FDCE col2_x_3
    (
        .C(clk_BUFGP),
        .CE(col2_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col2_x_mux0000<6>),
        .Q(col2_x<3>)
    );
    FDCE col2_x_4
    (
        .C(clk_BUFGP),
        .CE(col2_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col2_x_mux0000<5>),
        .Q(col2_x<4>)
    );
    FDCE col2_x_5
    (
        .C(clk_BUFGP),
        .CE(col2_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col2_x_mux0000<4>),
        .Q(col2_x<5>)
    );
    FDCE col2_x_6
    (
        .C(clk_BUFGP),
        .CE(col2_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col2_x_mux0000<3>),
        .Q(col2_x<6>)
    );
    FDCE col2_x_7
    (
        .C(clk_BUFGP),
        .CE(col2_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col2_x_mux0000<2>),
        .Q(col2_x<7>)
    );
    FDCE col2_x_8
    (
        .C(clk_BUFGP),
        .CE(col2_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col2_x_mux0000<1>),
        .Q(col2_x<8>)
    );
    FDCE col2_x_9
    (
        .C(clk_BUFGP),
        .CE(col2_x_not0001),
        .CLR(btn_3_IBUF),
        .D(col2_x_mux0000<0>),
        .Q(col2_x<9>)
    );
    FDE Vsync
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(VS),
        .Q(Vsync_OBUF)
    );
    FDCE highscore_0
    (
        .C(clk_BUFGP),
        .CE(highscore_and0000),
        .CLR(btn_3_IBUF),
        .D(scoreOnes<0>),
        .Q(highscore<0>)
    );
    FDCE highscore_1
    (
        .C(clk_BUFGP),
        .CE(highscore_and0000),
        .CLR(btn_3_IBUF),
        .D(scoreOnes<1>),
        .Q(highscore<1>)
    );
    FDCE highscore_2
    (
        .C(clk_BUFGP),
        .CE(highscore_and0000),
        .CLR(btn_3_IBUF),
        .D(scoreOnes<2>),
        .Q(highscore<2>)
    );
    FDCE highscore_3
    (
        .C(clk_BUFGP),
        .CE(highscore_and0000),
        .CLR(btn_3_IBUF),
        .D(scoreOnes<3>),
        .Q(highscore<3>)
    );
    FDCE highscore_4
    (
        .C(clk_BUFGP),
        .CE(highscore_and0000),
        .CLR(btn_3_IBUF),
        .D(scoreTens<0>),
        .Q(highscore<4>)
    );
    FDCE highscore_5
    (
        .C(clk_BUFGP),
        .CE(highscore_and0000),
        .CLR(btn_3_IBUF),
        .D(scoreTens<1>),
        .Q(highscore<5>)
    );
    FDCE highscore_6
    (
        .C(clk_BUFGP),
        .CE(highscore_and0000),
        .CLR(btn_3_IBUF),
        .D(scoreTens<2>),
        .Q(highscore<6>)
    );
    FDCE highscore_7
    (
        .C(clk_BUFGP),
        .CE(highscore_and0000),
        .CLR(btn_3_IBUF),
        .D(scoreTens<3>),
        .Q(highscore<7>)
    );
    FDE Hsync
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(HS),
        .Q(Hsync_OBUF)
    );
    FDE right_seven_seg_data_0
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(scoreOnes<0>),
        .Q(right_seven_seg_data<0>)
    );
    FDE right_seven_seg_data_1
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(scoreOnes<1>),
        .Q(right_seven_seg_data<1>)
    );
    FDE right_seven_seg_data_2
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(scoreOnes<2>),
        .Q(right_seven_seg_data<2>)
    );
    FDE right_seven_seg_data_3
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(scoreOnes<3>),
        .Q(right_seven_seg_data<3>)
    );
    FDE right_seven_seg_data_4
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(scoreTens<0>),
        .Q(right_seven_seg_data<4>)
    );
    FDE right_seven_seg_data_5
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(scoreTens<1>),
        .Q(right_seven_seg_data<5>)
    );
    FDE right_seven_seg_data_6
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(scoreTens<2>),
        .Q(right_seven_seg_data<6>)
    );
    FDE right_seven_seg_data_7
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(scoreTens<3>),
        .Q(right_seven_seg_data<7>)
    );
    FDE jump_reg_0
    (
        .C(clk_BUFGP),
        .CE(jump_reg_and0001),
        .D(jump_reg_mux0001<4>),
        .Q(jump_reg<0>)
    );
    FDE jump_reg_1
    (
        .C(clk_BUFGP),
        .CE(jump_reg_and0001),
        .D(jump_reg_mux0001<3>),
        .Q(jump_reg<1>)
    );
    FDE jump_reg_2
    (
        .C(clk_BUFGP),
        .CE(jump_reg_and0001),
        .D(jump_reg_mux0001<2>),
        .Q(jump_reg<2>)
    );
    FDE jump_reg_3
    (
        .C(clk_BUFGP),
        .CE(jump_reg_and0001),
        .D(jump_reg_mux0001<1>),
        .Q(jump_reg<3>)
    );
    FDE jump_reg_4
    (
        .C(clk_BUFGP),
        .CE(jump_reg_and0001),
        .D(debouncer/state_reg_FSM_FFd2),
        .Q(jump_reg<4>)
    );
    FDE left_seven_seg_data_0
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(highscore<0>),
        .Q(left_seven_seg_data<0>)
    );
    FDE left_seven_seg_data_1
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(highscore<1>),
        .Q(left_seven_seg_data<1>)
    );
    FDE left_seven_seg_data_2
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(highscore<2>),
        .Q(left_seven_seg_data<2>)
    );
    FDE left_seven_seg_data_3
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(highscore<3>),
        .Q(left_seven_seg_data<3>)
    );
    FDE left_seven_seg_data_4
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(highscore<4>),
        .Q(left_seven_seg_data<4>)
    );
    FDE left_seven_seg_data_5
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(highscore<5>),
        .Q(left_seven_seg_data<5>)
    );
    FDE left_seven_seg_data_6
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(highscore<6>),
        .Q(left_seven_seg_data<6>)
    );
    FDE left_seven_seg_data_7
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(highscore<7>),
        .Q(left_seven_seg_data<7>)
    );
    FD random_0
    (
        .C(clk_BUFGP),
        .D(Msub_bird_top_temp_addsub0000_lut<9>),
        .Q(random<0>)
    );
    FD random_4
    (
        .C(clk_BUFGP),
        .D(random_next<4>),
        .Q(random<4>)
    );
    FD random_5
    (
        .C(clk_BUFGP),
        .D(random_next<5>),
        .Q(random<5>)
    );
    FD random_6
    (
        .C(clk_BUFGP),
        .D(random<5>),
        .Q(random<6>)
    );
    FD random_7
    (
        .C(clk_BUFGP),
        .D(random<6>),
        .Q(random<7>)
    );
    FDE col3_y_0
    (
        .C(clk_BUFGP),
        .CE(col3_y_and0000),
        .D(random<0>),
        .Q(col3_y<0>)
    );
    FDE col3_y_4
    (
        .C(clk_BUFGP),
        .CE(col3_y_and0000),
        .D(random<4>),
        .Q(col3_y<4>)
    );
    FDE col3_y_5
    (
        .C(clk_BUFGP),
        .CE(col3_y_and0000),
        .D(random<5>),
        .Q(col3_y<5>)
    );
    FDE col3_y_6
    (
        .C(clk_BUFGP),
        .CE(col3_y_and0000),
        .D(random<6>),
        .Q(col3_y<6>)
    );
    FDE col3_y_7
    (
        .C(clk_BUFGP),
        .CE(col3_y_and0000),
        .D(random<7>),
        .Q(col3_y<7>)
    );
    FDE col3_y_8
    (
        .C(clk_BUFGP),
        .CE(col3_y_and0000),
        .D(Madd_bird_color_on_add0002_lut<9>),
        .Q(col3_y<8>)
    );
    FDE col1_y_0
    (
        .C(clk_BUFGP),
        .CE(col1_y_and0000),
        .D(random<0>),
        .Q(col1_y<0>)
    );
    FDE col1_y_4
    (
        .C(clk_BUFGP),
        .CE(col1_y_and0000),
        .D(random<4>),
        .Q(col1_y<4>)
    );
    FDE col1_y_5
    (
        .C(clk_BUFGP),
        .CE(col1_y_and0000),
        .D(random<5>),
        .Q(col1_y<5>)
    );
    FDE col1_y_6
    (
        .C(clk_BUFGP),
        .CE(col1_y_and0000),
        .D(random<6>),
        .Q(col1_y<6>)
    );
    FDE col1_y_7
    (
        .C(clk_BUFGP),
        .CE(col1_y_and0000),
        .D(random<7>),
        .Q(col1_y<7>)
    );
    FDE col1_y_8
    (
        .C(clk_BUFGP),
        .CE(col1_y_and0000),
        .D(Madd_bird_color_on_add0002_lut<9>),
        .Q(col1_y<8>)
    );
    FDE col2_y_0
    (
        .C(clk_BUFGP),
        .CE(col2_y_and0000),
        .D(random<0>),
        .Q(col2_y<0>)
    );
    FDE col2_y_4
    (
        .C(clk_BUFGP),
        .CE(col2_y_and0000),
        .D(random<4>),
        .Q(col2_y<4>)
    );
    FDE col2_y_5
    (
        .C(clk_BUFGP),
        .CE(col2_y_and0000),
        .D(random<5>),
        .Q(col2_y<5>)
    );
    FDE col2_y_6
    (
        .C(clk_BUFGP),
        .CE(col2_y_and0000),
        .D(random<6>),
        .Q(col2_y<6>)
    );
    FDE col2_y_7
    (
        .C(clk_BUFGP),
        .CE(col2_y_and0000),
        .D(random<7>),
        .Q(col2_y<7>)
    );
    FDE col2_y_8
    (
        .C(clk_BUFGP),
        .CE(col2_y_and0000),
        .D(Madd_bird_color_on_add0002_lut<9>),
        .Q(col2_y<8>)
    );
    FDP debouncer/state_reg_FSM_FFd3
    (
        .C(clk_BUFGP),
        .D(debouncer/state_reg_FSM_FFd3-In),
        .PRE(btn_3_IBUF),
        .Q(debouncer/state_reg_FSM_FFd3)
    );
    FDC debouncer/state_reg_FSM_FFd2
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(debouncer/state_reg_FSM_FFd2-In),
        .Q(debouncer/state_reg_FSM_FFd2)
    );
    FDC bird_delay_0
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<0>),
        .Q(bird_delay<0>)
    );
    FDC bird_delay_1
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<1>),
        .Q(bird_delay<1>)
    );
    FDC bird_delay_2
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<2>),
        .Q(bird_delay<2>)
    );
    FDC bird_delay_3
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<3>),
        .Q(bird_delay<3>)
    );
    FDC bird_delay_4
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<4>),
        .Q(bird_delay<4>)
    );
    FDC bird_delay_5
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<5>),
        .Q(bird_delay<5>)
    );
    FDC bird_delay_6
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<6>),
        .Q(bird_delay<6>)
    );
    FDC bird_delay_7
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<7>),
        .Q(bird_delay<7>)
    );
    FDC bird_delay_8
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<8>),
        .Q(bird_delay<8>)
    );
    FDC bird_delay_9
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<9>),
        .Q(bird_delay<9>)
    );
    FDC bird_delay_10
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<10>),
        .Q(bird_delay<10>)
    );
    FDC bird_delay_11
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<11>),
        .Q(bird_delay<11>)
    );
    FDC bird_delay_12
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<12>),
        .Q(bird_delay<12>)
    );
    FDC bird_delay_13
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<13>),
        .Q(bird_delay<13>)
    );
    FDC bird_delay_14
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<14>),
        .Q(bird_delay<14>)
    );
    FDC bird_delay_15
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<15>),
        .Q(bird_delay<15>)
    );
    FDC bird_delay_16
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<16>),
        .Q(bird_delay<16>)
    );
    FDC bird_delay_17
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<17>),
        .Q(bird_delay<17>)
    );
    FDC bird_delay_18
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<18>),
        .Q(bird_delay<18>)
    );
    FDC bird_delay_19
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<19>),
        .Q(bird_delay<19>)
    );
    FDC bird_delay_20
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(Result<20>),
        .Q(bird_delay<20>)
    );
    FDCE scoreOnes_0
    (
        .C(clk_BUFGP),
        .CE(scoreOnes_not0001),
        .CLR(btn_3_IBUF),
        .D(Mcount_scoreOnes_eqn_0),
        .Q(scoreOnes<0>)
    );
    FDCE scoreOnes_1
    (
        .C(clk_BUFGP),
        .CE(scoreOnes_not0001),
        .CLR(btn_3_IBUF),
        .D(Mcount_scoreOnes_eqn_1),
        .Q(scoreOnes<1>)
    );
    FDCE scoreOnes_2
    (
        .C(clk_BUFGP),
        .CE(scoreOnes_not0001),
        .CLR(btn_3_IBUF),
        .D(Mcount_scoreOnes_eqn_2),
        .Q(scoreOnes<2>)
    );
    FDCE scoreOnes_3
    (
        .C(clk_BUFGP),
        .CE(scoreOnes_not0001),
        .CLR(btn_3_IBUF),
        .D(Mcount_scoreOnes_eqn_3),
        .Q(scoreOnes<3>)
    );
    FDE debounce_counter_value_0
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<0>2),
        .Q(debounce_counter_value<0>)
    );
    FDE debounce_counter_value_1
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<1>2),
        .Q(debounce_counter_value<1>)
    );
    FDE debounce_counter_value_2
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<2>2),
        .Q(debounce_counter_value<2>)
    );
    FDE debounce_counter_value_3
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<3>2),
        .Q(debounce_counter_value<3>)
    );
    FDE debounce_counter_value_4
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<4>1),
        .Q(debounce_counter_value<4>)
    );
    FDE debounce_counter_value_5
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<5>1),
        .Q(debounce_counter_value<5>)
    );
    FDE debounce_counter_value_6
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<6>1),
        .Q(debounce_counter_value<6>)
    );
    FDE debounce_counter_value_7
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<7>1),
        .Q(debounce_counter_value<7>)
    );
    FDE debounce_counter_value_8
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<8>1),
        .Q(debounce_counter_value<8>)
    );
    FDE debounce_counter_value_9
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<9>1),
        .Q(debounce_counter_value<9>)
    );
    FDE debounce_counter_value_10
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<10>1),
        .Q(debounce_counter_value<10>)
    );
    FDE debounce_counter_value_11
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<11>1),
        .Q(debounce_counter_value<11>)
    );
    FDE debounce_counter_value_12
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<12>1),
        .Q(debounce_counter_value<12>)
    );
    FDE debounce_counter_value_13
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<13>1),
        .Q(debounce_counter_value<13>)
    );
    FDE debounce_counter_value_14
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<14>1),
        .Q(debounce_counter_value<14>)
    );
    FDE debounce_counter_value_15
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<15>1),
        .Q(debounce_counter_value<15>)
    );
    FDE debounce_counter_value_16
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<16>1),
        .Q(debounce_counter_value<16>)
    );
    FDE debounce_counter_value_17
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<17>1),
        .Q(debounce_counter_value<17>)
    );
    FDE debounce_counter_value_18
    (
        .C(clk_BUFGP),
        .CE(btn<3>_inv),
        .D(Result<18>1),
        .Q(debounce_counter_value<18>)
    );
    FDCE scoreTens_0
    (
        .C(clk_BUFGP),
        .CE(scoreTens_not0001),
        .CLR(btn_3_IBUF),
        .D(Mcount_scoreTens),
        .Q(scoreTens<0>)
    );
    FDCE scoreTens_1
    (
        .C(clk_BUFGP),
        .CE(scoreTens_not0001),
        .CLR(btn_3_IBUF),
        .D(Mcount_scoreTens1),
        .Q(scoreTens<1>)
    );
    FDCE scoreTens_2
    (
        .C(clk_BUFGP),
        .CE(scoreTens_not0001),
        .CLR(btn_3_IBUF),
        .D(Mcount_scoreTens2),
        .Q(scoreTens<2>)
    );
    FDCE scoreTens_3
    (
        .C(clk_BUFGP),
        .CE(scoreTens_not0001),
        .CLR(btn_3_IBUF),
        .D(Mcount_scoreTens3),
        .Q(scoreTens<3>)
    );
    FD display/counter_value_0
    (
        .C(clk_BUFGP),
        .D(Result<0>3),
        .Q(display/counter_value<0>)
    );
    FD display/counter_value_1
    (
        .C(clk_BUFGP),
        .D(Result<1>3),
        .Q(display/counter_value<1>)
    );
    FD display/counter_value_2
    (
        .C(clk_BUFGP),
        .D(Result<2>3),
        .Q(display/counter_value<2>)
    );
    FD display/counter_value_3
    (
        .C(clk_BUFGP),
        .D(Result<3>3),
        .Q(display/counter_value<3>)
    );
    FD display/counter_value_4
    (
        .C(clk_BUFGP),
        .D(Result<4>2),
        .Q(display/counter_value<4>)
    );
    FD display/counter_value_5
    (
        .C(clk_BUFGP),
        .D(Result<5>2),
        .Q(display/counter_value<5>)
    );
    FD display/counter_value_6
    (
        .C(clk_BUFGP),
        .D(Result<6>2),
        .Q(display/counter_value<6>)
    );
    FD display/counter_value_7
    (
        .C(clk_BUFGP),
        .D(Result<7>2),
        .Q(display/counter_value<7>)
    );
    FD display/counter_value_8
    (
        .C(clk_BUFGP),
        .D(Result<8>2),
        .Q(display/counter_value<8>)
    );
    FD display/counter_value_9
    (
        .C(clk_BUFGP),
        .D(Result<9>2),
        .Q(display/counter_value<9>)
    );
    FD display/counter_value_10
    (
        .C(clk_BUFGP),
        .D(Result<10>2),
        .Q(display/counter_value<10>)
    );
    FD display/counter_value_11
    (
        .C(clk_BUFGP),
        .D(Result<11>2),
        .Q(display/counter_value<11>)
    );
    FD display/counter_value_12
    (
        .C(clk_BUFGP),
        .D(Result<12>2),
        .Q(display/counter_value<12>)
    );
    FD display/counter_value_13
    (
        .C(clk_BUFGP),
        .D(Result<13>2),
        .Q(display/counter_value<13>)
    );
    FD display/counter_value_14
    (
        .C(clk_BUFGP),
        .D(Result<14>2),
        .Q(display/counter_value<14>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_delay_next_addsub0000_lut<0>),
        .O(Madd_delay_next_addsub0000_cy<0>)
    );
    XORCY Madd_delay_next_addsub0000_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_delay_next_addsub0000_lut<0>),
        .O(delay_next_addsub0000<0>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<1>
    (
        .CI(Madd_delay_next_addsub0000_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<1>_rt),
        .O(Madd_delay_next_addsub0000_cy<1>)
    );
    XORCY Madd_delay_next_addsub0000_xor<1>
    (
        .CI(Madd_delay_next_addsub0000_cy<0>),
        .LI(Madd_delay_next_addsub0000_cy<1>_rt),
        .O(delay_next_addsub0000<1>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<2>
    (
        .CI(Madd_delay_next_addsub0000_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<2>_rt),
        .O(Madd_delay_next_addsub0000_cy<2>)
    );
    XORCY Madd_delay_next_addsub0000_xor<2>
    (
        .CI(Madd_delay_next_addsub0000_cy<1>),
        .LI(Madd_delay_next_addsub0000_cy<2>_rt),
        .O(delay_next_addsub0000<2>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<3>
    (
        .CI(Madd_delay_next_addsub0000_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<3>_rt),
        .O(Madd_delay_next_addsub0000_cy<3>)
    );
    XORCY Madd_delay_next_addsub0000_xor<3>
    (
        .CI(Madd_delay_next_addsub0000_cy<2>),
        .LI(Madd_delay_next_addsub0000_cy<3>_rt),
        .O(delay_next_addsub0000<3>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<4>
    (
        .CI(Madd_delay_next_addsub0000_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<4>_rt),
        .O(Madd_delay_next_addsub0000_cy<4>)
    );
    XORCY Madd_delay_next_addsub0000_xor<4>
    (
        .CI(Madd_delay_next_addsub0000_cy<3>),
        .LI(Madd_delay_next_addsub0000_cy<4>_rt),
        .O(delay_next_addsub0000<4>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<5>
    (
        .CI(Madd_delay_next_addsub0000_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<5>_rt),
        .O(Madd_delay_next_addsub0000_cy<5>)
    );
    XORCY Madd_delay_next_addsub0000_xor<5>
    (
        .CI(Madd_delay_next_addsub0000_cy<4>),
        .LI(Madd_delay_next_addsub0000_cy<5>_rt),
        .O(delay_next_addsub0000<5>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<6>
    (
        .CI(Madd_delay_next_addsub0000_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<6>_rt),
        .O(Madd_delay_next_addsub0000_cy<6>)
    );
    XORCY Madd_delay_next_addsub0000_xor<6>
    (
        .CI(Madd_delay_next_addsub0000_cy<5>),
        .LI(Madd_delay_next_addsub0000_cy<6>_rt),
        .O(delay_next_addsub0000<6>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<7>
    (
        .CI(Madd_delay_next_addsub0000_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<7>_rt),
        .O(Madd_delay_next_addsub0000_cy<7>)
    );
    XORCY Madd_delay_next_addsub0000_xor<7>
    (
        .CI(Madd_delay_next_addsub0000_cy<6>),
        .LI(Madd_delay_next_addsub0000_cy<7>_rt),
        .O(delay_next_addsub0000<7>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<8>
    (
        .CI(Madd_delay_next_addsub0000_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<8>_rt),
        .O(Madd_delay_next_addsub0000_cy<8>)
    );
    XORCY Madd_delay_next_addsub0000_xor<8>
    (
        .CI(Madd_delay_next_addsub0000_cy<7>),
        .LI(Madd_delay_next_addsub0000_cy<8>_rt),
        .O(delay_next_addsub0000<8>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<9>
    (
        .CI(Madd_delay_next_addsub0000_cy<8>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<9>_rt),
        .O(Madd_delay_next_addsub0000_cy<9>)
    );
    XORCY Madd_delay_next_addsub0000_xor<9>
    (
        .CI(Madd_delay_next_addsub0000_cy<8>),
        .LI(Madd_delay_next_addsub0000_cy<9>_rt),
        .O(delay_next_addsub0000<9>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<10>
    (
        .CI(Madd_delay_next_addsub0000_cy<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<10>_rt),
        .O(Madd_delay_next_addsub0000_cy<10>)
    );
    XORCY Madd_delay_next_addsub0000_xor<10>
    (
        .CI(Madd_delay_next_addsub0000_cy<9>),
        .LI(Madd_delay_next_addsub0000_cy<10>_rt),
        .O(delay_next_addsub0000<10>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<11>
    (
        .CI(Madd_delay_next_addsub0000_cy<10>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<11>_rt),
        .O(Madd_delay_next_addsub0000_cy<11>)
    );
    XORCY Madd_delay_next_addsub0000_xor<11>
    (
        .CI(Madd_delay_next_addsub0000_cy<10>),
        .LI(Madd_delay_next_addsub0000_cy<11>_rt),
        .O(delay_next_addsub0000<11>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<12>
    (
        .CI(Madd_delay_next_addsub0000_cy<11>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<12>_rt),
        .O(Madd_delay_next_addsub0000_cy<12>)
    );
    XORCY Madd_delay_next_addsub0000_xor<12>
    (
        .CI(Madd_delay_next_addsub0000_cy<11>),
        .LI(Madd_delay_next_addsub0000_cy<12>_rt),
        .O(delay_next_addsub0000<12>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<13>
    (
        .CI(Madd_delay_next_addsub0000_cy<12>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<13>_rt),
        .O(Madd_delay_next_addsub0000_cy<13>)
    );
    XORCY Madd_delay_next_addsub0000_xor<13>
    (
        .CI(Madd_delay_next_addsub0000_cy<12>),
        .LI(Madd_delay_next_addsub0000_cy<13>_rt),
        .O(delay_next_addsub0000<13>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<14>
    (
        .CI(Madd_delay_next_addsub0000_cy<13>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<14>_rt),
        .O(Madd_delay_next_addsub0000_cy<14>)
    );
    XORCY Madd_delay_next_addsub0000_xor<14>
    (
        .CI(Madd_delay_next_addsub0000_cy<13>),
        .LI(Madd_delay_next_addsub0000_cy<14>_rt),
        .O(delay_next_addsub0000<14>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<15>
    (
        .CI(Madd_delay_next_addsub0000_cy<14>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<15>_rt),
        .O(Madd_delay_next_addsub0000_cy<15>)
    );
    XORCY Madd_delay_next_addsub0000_xor<15>
    (
        .CI(Madd_delay_next_addsub0000_cy<14>),
        .LI(Madd_delay_next_addsub0000_cy<15>_rt),
        .O(delay_next_addsub0000<15>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<16>
    (
        .CI(Madd_delay_next_addsub0000_cy<15>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<16>_rt),
        .O(Madd_delay_next_addsub0000_cy<16>)
    );
    XORCY Madd_delay_next_addsub0000_xor<16>
    (
        .CI(Madd_delay_next_addsub0000_cy<15>),
        .LI(Madd_delay_next_addsub0000_cy<16>_rt),
        .O(delay_next_addsub0000<16>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<17>
    (
        .CI(Madd_delay_next_addsub0000_cy<16>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<17>_rt),
        .O(Madd_delay_next_addsub0000_cy<17>)
    );
    XORCY Madd_delay_next_addsub0000_xor<17>
    (
        .CI(Madd_delay_next_addsub0000_cy<16>),
        .LI(Madd_delay_next_addsub0000_cy<17>_rt),
        .O(delay_next_addsub0000<17>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<18>
    (
        .CI(Madd_delay_next_addsub0000_cy<17>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<18>_rt),
        .O(Madd_delay_next_addsub0000_cy<18>)
    );
    XORCY Madd_delay_next_addsub0000_xor<18>
    (
        .CI(Madd_delay_next_addsub0000_cy<17>),
        .LI(Madd_delay_next_addsub0000_cy<18>_rt),
        .O(delay_next_addsub0000<18>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<19>
    (
        .CI(Madd_delay_next_addsub0000_cy<18>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<19>_rt),
        .O(Madd_delay_next_addsub0000_cy<19>)
    );
    XORCY Madd_delay_next_addsub0000_xor<19>
    (
        .CI(Madd_delay_next_addsub0000_cy<18>),
        .LI(Madd_delay_next_addsub0000_cy<19>_rt),
        .O(delay_next_addsub0000<19>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<20>
    (
        .CI(Madd_delay_next_addsub0000_cy<19>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<20>_rt),
        .O(Madd_delay_next_addsub0000_cy<20>)
    );
    XORCY Madd_delay_next_addsub0000_xor<20>
    (
        .CI(Madd_delay_next_addsub0000_cy<19>),
        .LI(Madd_delay_next_addsub0000_cy<20>_rt),
        .O(delay_next_addsub0000<20>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<21>
    (
        .CI(Madd_delay_next_addsub0000_cy<20>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<21>_rt),
        .O(Madd_delay_next_addsub0000_cy<21>)
    );
    XORCY Madd_delay_next_addsub0000_xor<21>
    (
        .CI(Madd_delay_next_addsub0000_cy<20>),
        .LI(Madd_delay_next_addsub0000_cy<21>_rt),
        .O(delay_next_addsub0000<21>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<22>
    (
        .CI(Madd_delay_next_addsub0000_cy<21>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<22>_rt),
        .O(Madd_delay_next_addsub0000_cy<22>)
    );
    XORCY Madd_delay_next_addsub0000_xor<22>
    (
        .CI(Madd_delay_next_addsub0000_cy<21>),
        .LI(Madd_delay_next_addsub0000_cy<22>_rt),
        .O(delay_next_addsub0000<22>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<23>
    (
        .CI(Madd_delay_next_addsub0000_cy<22>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<23>_rt),
        .O(Madd_delay_next_addsub0000_cy<23>)
    );
    XORCY Madd_delay_next_addsub0000_xor<23>
    (
        .CI(Madd_delay_next_addsub0000_cy<22>),
        .LI(Madd_delay_next_addsub0000_cy<23>_rt),
        .O(delay_next_addsub0000<23>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<24>
    (
        .CI(Madd_delay_next_addsub0000_cy<23>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<24>_rt),
        .O(Madd_delay_next_addsub0000_cy<24>)
    );
    XORCY Madd_delay_next_addsub0000_xor<24>
    (
        .CI(Madd_delay_next_addsub0000_cy<23>),
        .LI(Madd_delay_next_addsub0000_cy<24>_rt),
        .O(delay_next_addsub0000<24>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<25>
    (
        .CI(Madd_delay_next_addsub0000_cy<24>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<25>_rt),
        .O(Madd_delay_next_addsub0000_cy<25>)
    );
    XORCY Madd_delay_next_addsub0000_xor<25>
    (
        .CI(Madd_delay_next_addsub0000_cy<24>),
        .LI(Madd_delay_next_addsub0000_cy<25>_rt),
        .O(delay_next_addsub0000<25>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<26>
    (
        .CI(Madd_delay_next_addsub0000_cy<25>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<26>_rt),
        .O(Madd_delay_next_addsub0000_cy<26>)
    );
    XORCY Madd_delay_next_addsub0000_xor<26>
    (
        .CI(Madd_delay_next_addsub0000_cy<25>),
        .LI(Madd_delay_next_addsub0000_cy<26>_rt),
        .O(delay_next_addsub0000<26>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<27>
    (
        .CI(Madd_delay_next_addsub0000_cy<26>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<27>_rt),
        .O(Madd_delay_next_addsub0000_cy<27>)
    );
    XORCY Madd_delay_next_addsub0000_xor<27>
    (
        .CI(Madd_delay_next_addsub0000_cy<26>),
        .LI(Madd_delay_next_addsub0000_cy<27>_rt),
        .O(delay_next_addsub0000<27>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<28>
    (
        .CI(Madd_delay_next_addsub0000_cy<27>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<28>_rt),
        .O(Madd_delay_next_addsub0000_cy<28>)
    );
    XORCY Madd_delay_next_addsub0000_xor<28>
    (
        .CI(Madd_delay_next_addsub0000_cy<27>),
        .LI(Madd_delay_next_addsub0000_cy<28>_rt),
        .O(delay_next_addsub0000<28>)
    );
    MUXCY Madd_delay_next_addsub0000_cy<29>
    (
        .CI(Madd_delay_next_addsub0000_cy<28>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_delay_next_addsub0000_cy<29>_rt),
        .O(Madd_delay_next_addsub0000_cy<29>)
    );
    XORCY Madd_delay_next_addsub0000_xor<29>
    (
        .CI(Madd_delay_next_addsub0000_cy<28>),
        .LI(Madd_delay_next_addsub0000_cy<29>_rt),
        .O(delay_next_addsub0000<29>)
    );
    XORCY Madd_delay_next_addsub0000_xor<30>
    (
        .CI(Madd_delay_next_addsub0000_cy<29>),
        .LI(Madd_delay_next_addsub0000_xor<30>_rt),
        .O(delay_next_addsub0000<30>)
    );
    MUXCY Msub_col3_x_addsub0000_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Msub_col3_x_addsub0000_cy<0>_rt),
        .O(Msub_col3_x_addsub0000_cy<0>)
    );
    XORCY Msub_col3_x_addsub0000_xor<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .LI(Msub_col3_x_addsub0000_cy<0>_rt),
        .O(col3_x_addsub0000<0>)
    );
    MUXCY Msub_col3_x_addsub0000_cy<1>
    (
        .CI(Msub_col3_x_addsub0000_cy<0>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col3_x_addsub0000_lut<1>),
        .O(Msub_col3_x_addsub0000_cy<1>)
    );
    XORCY Msub_col3_x_addsub0000_xor<1>
    (
        .CI(Msub_col3_x_addsub0000_cy<0>),
        .LI(Msub_col3_x_addsub0000_lut<1>),
        .O(col3_x_addsub0000<1>)
    );
    MUXCY Msub_col3_x_addsub0000_cy<2>
    (
        .CI(Msub_col3_x_addsub0000_cy<1>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col3_x_addsub0000_lut<2>),
        .O(Msub_col3_x_addsub0000_cy<2>)
    );
    XORCY Msub_col3_x_addsub0000_xor<2>
    (
        .CI(Msub_col3_x_addsub0000_cy<1>),
        .LI(Msub_col3_x_addsub0000_lut<2>),
        .O(col3_x_addsub0000<2>)
    );
    MUXCY Msub_col3_x_addsub0000_cy<3>
    (
        .CI(Msub_col3_x_addsub0000_cy<2>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col3_x_addsub0000_lut<3>),
        .O(Msub_col3_x_addsub0000_cy<3>)
    );
    XORCY Msub_col3_x_addsub0000_xor<3>
    (
        .CI(Msub_col3_x_addsub0000_cy<2>),
        .LI(Msub_col3_x_addsub0000_lut<3>),
        .O(col3_x_addsub0000<3>)
    );
    MUXCY Msub_col3_x_addsub0000_cy<4>
    (
        .CI(Msub_col3_x_addsub0000_cy<3>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col3_x_addsub0000_lut<4>1),
        .O(Msub_col3_x_addsub0000_cy<4>)
    );
    XORCY Msub_col3_x_addsub0000_xor<4>
    (
        .CI(Msub_col3_x_addsub0000_cy<3>),
        .LI(Msub_col3_x_addsub0000_lut<4>1),
        .O(col3_x_addsub0000<4>)
    );
    MUXCY Msub_col3_x_addsub0000_cy<5>
    (
        .CI(Msub_col3_x_addsub0000_cy<4>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col3_x_addsub0000_lut<5>),
        .O(Msub_col3_x_addsub0000_cy<5>)
    );
    XORCY Msub_col3_x_addsub0000_xor<5>
    (
        .CI(Msub_col3_x_addsub0000_cy<4>),
        .LI(Msub_col3_x_addsub0000_lut<5>),
        .O(col3_x_addsub0000<5>)
    );
    MUXCY Msub_col3_x_addsub0000_cy<6>
    (
        .CI(Msub_col3_x_addsub0000_cy<5>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col3_x_addsub0000_lut<6>),
        .O(Msub_col3_x_addsub0000_cy<6>)
    );
    XORCY Msub_col3_x_addsub0000_xor<6>
    (
        .CI(Msub_col3_x_addsub0000_cy<5>),
        .LI(Msub_col3_x_addsub0000_lut<6>),
        .O(col3_x_addsub0000<6>)
    );
    MUXCY Msub_col3_x_addsub0000_cy<7>
    (
        .CI(Msub_col3_x_addsub0000_cy<6>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col3_x_addsub0000_lut<7>),
        .O(Msub_col3_x_addsub0000_cy<7>)
    );
    XORCY Msub_col3_x_addsub0000_xor<7>
    (
        .CI(Msub_col3_x_addsub0000_cy<6>),
        .LI(Msub_col3_x_addsub0000_lut<7>),
        .O(col3_x_addsub0000<7>)
    );
    MUXCY Msub_col3_x_addsub0000_cy<8>
    (
        .CI(Msub_col3_x_addsub0000_cy<7>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col3_x_addsub0000_lut<8>),
        .O(Msub_col3_x_addsub0000_cy<8>)
    );
    XORCY Msub_col3_x_addsub0000_xor<8>
    (
        .CI(Msub_col3_x_addsub0000_cy<7>),
        .LI(Msub_col3_x_addsub0000_lut<8>),
        .O(col3_x_addsub0000<8>)
    );
    XORCY Msub_col3_x_addsub0000_xor<9>
    (
        .CI(Msub_col3_x_addsub0000_cy<8>),
        .LI(Msub_col3_x_addsub0000_lut<9>),
        .O(col3_x_addsub0000<9>)
    );
    MUXCY Msub_col1_x_addsub0000_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Msub_col1_x_addsub0000_cy<0>_rt),
        .O(Msub_col1_x_addsub0000_cy<0>)
    );
    XORCY Msub_col1_x_addsub0000_xor<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .LI(Msub_col1_x_addsub0000_cy<0>_rt),
        .O(col1_x_addsub0000<0>)
    );
    MUXCY Msub_col1_x_addsub0000_cy<1>
    (
        .CI(Msub_col1_x_addsub0000_cy<0>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col1_x_addsub0000_lut<1>),
        .O(Msub_col1_x_addsub0000_cy<1>)
    );
    XORCY Msub_col1_x_addsub0000_xor<1>
    (
        .CI(Msub_col1_x_addsub0000_cy<0>),
        .LI(Msub_col1_x_addsub0000_lut<1>),
        .O(col1_x_addsub0000<1>)
    );
    MUXCY Msub_col1_x_addsub0000_cy<2>
    (
        .CI(Msub_col1_x_addsub0000_cy<1>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col1_x_addsub0000_lut<2>),
        .O(Msub_col1_x_addsub0000_cy<2>)
    );
    XORCY Msub_col1_x_addsub0000_xor<2>
    (
        .CI(Msub_col1_x_addsub0000_cy<1>),
        .LI(Msub_col1_x_addsub0000_lut<2>),
        .O(col1_x_addsub0000<2>)
    );
    MUXCY Msub_col1_x_addsub0000_cy<3>
    (
        .CI(Msub_col1_x_addsub0000_cy<2>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col1_x_addsub0000_lut<3>),
        .O(Msub_col1_x_addsub0000_cy<3>)
    );
    XORCY Msub_col1_x_addsub0000_xor<3>
    (
        .CI(Msub_col1_x_addsub0000_cy<2>),
        .LI(Msub_col1_x_addsub0000_lut<3>),
        .O(col1_x_addsub0000<3>)
    );
    MUXCY Msub_col1_x_addsub0000_cy<4>
    (
        .CI(Msub_col1_x_addsub0000_cy<3>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col1_x_addsub0000_lut<4>1),
        .O(Msub_col1_x_addsub0000_cy<4>)
    );
    XORCY Msub_col1_x_addsub0000_xor<4>
    (
        .CI(Msub_col1_x_addsub0000_cy<3>),
        .LI(Msub_col1_x_addsub0000_lut<4>1),
        .O(col1_x_addsub0000<4>)
    );
    MUXCY Msub_col1_x_addsub0000_cy<5>
    (
        .CI(Msub_col1_x_addsub0000_cy<4>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col1_x_addsub0000_lut<5>),
        .O(Msub_col1_x_addsub0000_cy<5>)
    );
    XORCY Msub_col1_x_addsub0000_xor<5>
    (
        .CI(Msub_col1_x_addsub0000_cy<4>),
        .LI(Msub_col1_x_addsub0000_lut<5>),
        .O(col1_x_addsub0000<5>)
    );
    MUXCY Msub_col1_x_addsub0000_cy<6>
    (
        .CI(Msub_col1_x_addsub0000_cy<5>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col1_x_addsub0000_lut<6>),
        .O(Msub_col1_x_addsub0000_cy<6>)
    );
    XORCY Msub_col1_x_addsub0000_xor<6>
    (
        .CI(Msub_col1_x_addsub0000_cy<5>),
        .LI(Msub_col1_x_addsub0000_lut<6>),
        .O(col1_x_addsub0000<6>)
    );
    MUXCY Msub_col1_x_addsub0000_cy<7>
    (
        .CI(Msub_col1_x_addsub0000_cy<6>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col1_x_addsub0000_lut<7>),
        .O(Msub_col1_x_addsub0000_cy<7>)
    );
    XORCY Msub_col1_x_addsub0000_xor<7>
    (
        .CI(Msub_col1_x_addsub0000_cy<6>),
        .LI(Msub_col1_x_addsub0000_lut<7>),
        .O(col1_x_addsub0000<7>)
    );
    MUXCY Msub_col1_x_addsub0000_cy<8>
    (
        .CI(Msub_col1_x_addsub0000_cy<7>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col1_x_addsub0000_lut<8>),
        .O(Msub_col1_x_addsub0000_cy<8>)
    );
    XORCY Msub_col1_x_addsub0000_xor<8>
    (
        .CI(Msub_col1_x_addsub0000_cy<7>),
        .LI(Msub_col1_x_addsub0000_lut<8>),
        .O(col1_x_addsub0000<8>)
    );
    XORCY Msub_col1_x_addsub0000_xor<9>
    (
        .CI(Msub_col1_x_addsub0000_cy<8>),
        .LI(Msub_col1_x_addsub0000_lut<9>),
        .O(col1_x_addsub0000<9>)
    );
    MUXCY Msub_col2_x_addsub0000_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Msub_col2_x_addsub0000_cy<0>_rt),
        .O(Msub_col2_x_addsub0000_cy<0>)
    );
    XORCY Msub_col2_x_addsub0000_xor<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .LI(Msub_col2_x_addsub0000_cy<0>_rt),
        .O(col2_x_addsub0000<0>)
    );
    MUXCY Msub_col2_x_addsub0000_cy<1>
    (
        .CI(Msub_col2_x_addsub0000_cy<0>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col2_x_addsub0000_lut<1>),
        .O(Msub_col2_x_addsub0000_cy<1>)
    );
    XORCY Msub_col2_x_addsub0000_xor<1>
    (
        .CI(Msub_col2_x_addsub0000_cy<0>),
        .LI(Msub_col2_x_addsub0000_lut<1>),
        .O(col2_x_addsub0000<1>)
    );
    MUXCY Msub_col2_x_addsub0000_cy<2>
    (
        .CI(Msub_col2_x_addsub0000_cy<1>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col2_x_addsub0000_lut<2>),
        .O(Msub_col2_x_addsub0000_cy<2>)
    );
    XORCY Msub_col2_x_addsub0000_xor<2>
    (
        .CI(Msub_col2_x_addsub0000_cy<1>),
        .LI(Msub_col2_x_addsub0000_lut<2>),
        .O(col2_x_addsub0000<2>)
    );
    MUXCY Msub_col2_x_addsub0000_cy<3>
    (
        .CI(Msub_col2_x_addsub0000_cy<2>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col2_x_addsub0000_lut<3>),
        .O(Msub_col2_x_addsub0000_cy<3>)
    );
    XORCY Msub_col2_x_addsub0000_xor<3>
    (
        .CI(Msub_col2_x_addsub0000_cy<2>),
        .LI(Msub_col2_x_addsub0000_lut<3>),
        .O(col2_x_addsub0000<3>)
    );
    MUXCY Msub_col2_x_addsub0000_cy<4>
    (
        .CI(Msub_col2_x_addsub0000_cy<3>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col2_x_addsub0000_lut<4>1),
        .O(Msub_col2_x_addsub0000_cy<4>)
    );
    XORCY Msub_col2_x_addsub0000_xor<4>
    (
        .CI(Msub_col2_x_addsub0000_cy<3>),
        .LI(Msub_col2_x_addsub0000_lut<4>1),
        .O(col2_x_addsub0000<4>)
    );
    MUXCY Msub_col2_x_addsub0000_cy<5>
    (
        .CI(Msub_col2_x_addsub0000_cy<4>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col2_x_addsub0000_lut<5>),
        .O(Msub_col2_x_addsub0000_cy<5>)
    );
    XORCY Msub_col2_x_addsub0000_xor<5>
    (
        .CI(Msub_col2_x_addsub0000_cy<4>),
        .LI(Msub_col2_x_addsub0000_lut<5>),
        .O(col2_x_addsub0000<5>)
    );
    MUXCY Msub_col2_x_addsub0000_cy<6>
    (
        .CI(Msub_col2_x_addsub0000_cy<5>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col2_x_addsub0000_lut<6>),
        .O(Msub_col2_x_addsub0000_cy<6>)
    );
    XORCY Msub_col2_x_addsub0000_xor<6>
    (
        .CI(Msub_col2_x_addsub0000_cy<5>),
        .LI(Msub_col2_x_addsub0000_lut<6>),
        .O(col2_x_addsub0000<6>)
    );
    MUXCY Msub_col2_x_addsub0000_cy<7>
    (
        .CI(Msub_col2_x_addsub0000_cy<6>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col2_x_addsub0000_lut<7>),
        .O(Msub_col2_x_addsub0000_cy<7>)
    );
    XORCY Msub_col2_x_addsub0000_xor<7>
    (
        .CI(Msub_col2_x_addsub0000_cy<6>),
        .LI(Msub_col2_x_addsub0000_lut<7>),
        .O(col2_x_addsub0000<7>)
    );
    MUXCY Msub_col2_x_addsub0000_cy<8>
    (
        .CI(Msub_col2_x_addsub0000_cy<7>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_col2_x_addsub0000_lut<8>),
        .O(Msub_col2_x_addsub0000_cy<8>)
    );
    XORCY Msub_col2_x_addsub0000_xor<8>
    (
        .CI(Msub_col2_x_addsub0000_cy<7>),
        .LI(Msub_col2_x_addsub0000_lut<8>),
        .O(col2_x_addsub0000<8>)
    );
    XORCY Msub_col2_x_addsub0000_xor<9>
    (
        .CI(Msub_col2_x_addsub0000_cy<8>),
        .LI(Msub_col2_x_addsub0000_lut<9>),
        .O(col2_x_addsub0000<9>)
    );
    LUT4 Mcompar_delay_next_cmp_gt0000_lut<0>
    (
        .I0(delay<0>),
        .I1(delay<1>),
        .I2(delay<2>),
        .I3(delay<3>),
        .O(Mcompar_delay_next_cmp_gt0000_lut<0>)
    );
    MUXCY Mcompar_delay_next_cmp_gt0000_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_delay_next_cmp_gt0000_lut<0>),
        .O(Mcompar_delay_next_cmp_gt0000_cy<0>)
    );
    LUT3 Mcompar_delay_next_cmp_gt0000_lut<1>
    (
        .I0(delay<4>),
        .I1(delay<5>),
        .I2(delay<6>),
        .O(Mcompar_delay_next_cmp_gt0000_lut<1>)
    );
    MUXCY Mcompar_delay_next_cmp_gt0000_cy<1>
    (
        .CI(Mcompar_delay_next_cmp_gt0000_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_delay_next_cmp_gt0000_lut<1>),
        .O(Mcompar_delay_next_cmp_gt0000_cy<1>)
    );
    MUXCY Mcompar_delay_next_cmp_gt0000_cy<2>
    (
        .CI(Mcompar_delay_next_cmp_gt0000_cy<1>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Mcompar_delay_next_cmp_gt0000_cy<2>_rt),
        .O(Mcompar_delay_next_cmp_gt0000_cy<2>)
    );
    MUXCY Mcompar_delay_next_cmp_gt0000_cy<3>
    (
        .CI(Mcompar_delay_next_cmp_gt0000_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_delay_next_cmp_gt0000_lut<3>),
        .O(Mcompar_delay_next_cmp_gt0000_cy<3>)
    );
    MUXCY Mcompar_delay_next_cmp_gt0000_cy<4>
    (
        .CI(Mcompar_delay_next_cmp_gt0000_cy<3>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Mcompar_delay_next_cmp_gt0000_cy<4>_rt),
        .O(Mcompar_delay_next_cmp_gt0000_cy<4>)
    );
    MUXCY Mcompar_delay_next_cmp_gt0000_cy<5>
    (
        .CI(Mcompar_delay_next_cmp_gt0000_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_delay_next_cmp_gt0000_lut<5>),
        .O(Mcompar_delay_next_cmp_gt0000_cy<5>)
    );
    LUT2 Mcompar_delay_next_cmp_gt0000_lut<6>
    (
        .I0(delay<11>),
        .I1(delay<12>),
        .O(Mcompar_delay_next_cmp_gt0000_lut<6>)
    );
    MUXCY Mcompar_delay_next_cmp_gt0000_cy<6>
    (
        .CI(Mcompar_delay_next_cmp_gt0000_cy<5>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Mcompar_delay_next_cmp_gt0000_lut<6>),
        .O(Mcompar_delay_next_cmp_gt0000_cy<6>)
    );
    LUT4 Mcompar_delay_next_cmp_gt0000_lut<7>
    (
        .I0(delay<13>),
        .I1(delay<14>),
        .I2(delay<15>),
        .I3(delay<16>),
        .O(Mcompar_delay_next_cmp_gt0000_lut<7>)
    );
    MUXCY Mcompar_delay_next_cmp_gt0000_cy<7>
    (
        .CI(Mcompar_delay_next_cmp_gt0000_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_delay_next_cmp_gt0000_lut<7>),
        .O(Mcompar_delay_next_cmp_gt0000_cy<7>)
    );
    LUT2 Mcompar_delay_next_cmp_gt0000_lut<8>
    (
        .I0(delay<17>),
        .I1(delay<18>),
        .O(Mcompar_delay_next_cmp_gt0000_lut<8>)
    );
    MUXCY Mcompar_delay_next_cmp_gt0000_cy<8>
    (
        .CI(Mcompar_delay_next_cmp_gt0000_cy<7>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Mcompar_delay_next_cmp_gt0000_lut<8>),
        .O(Mcompar_delay_next_cmp_gt0000_cy<8>)
    );
    LUT4 Mcompar_delay_next_cmp_gt0000_lut<9>
    (
        .I0(delay<19>),
        .I1(delay<20>),
        .I2(delay<21>),
        .I3(delay<22>),
        .O(Mcompar_delay_next_cmp_gt0000_lut<9>)
    );
    MUXCY Mcompar_delay_next_cmp_gt0000_cy<9>
    (
        .CI(Mcompar_delay_next_cmp_gt0000_cy<8>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_delay_next_cmp_gt0000_lut<9>),
        .O(Mcompar_delay_next_cmp_gt0000_cy<9>)
    );
    LUT4 Mcompar_delay_next_cmp_gt0000_lut<10>
    (
        .I0(delay<23>),
        .I1(delay<24>),
        .I2(delay<25>),
        .I3(delay<26>),
        .O(Mcompar_delay_next_cmp_gt0000_lut<10>)
    );
    MUXCY Mcompar_delay_next_cmp_gt0000_cy<10>
    (
        .CI(Mcompar_delay_next_cmp_gt0000_cy<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_delay_next_cmp_gt0000_lut<10>),
        .O(Mcompar_delay_next_cmp_gt0000_cy<10>)
    );
    LUT4 Mcompar_delay_next_cmp_gt0000_lut<11>
    (
        .I0(delay<27>),
        .I1(delay<28>),
        .I2(delay<29>),
        .I3(delay<30>),
        .O(Mcompar_delay_next_cmp_gt0000_lut<11>)
    );
    MUXCY Mcompar_delay_next_cmp_gt0000_cy<11>
    (
        .CI(Mcompar_delay_next_cmp_gt0000_cy<10>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_delay_next_cmp_gt0000_lut<11>),
        .O(Mcompar_delay_next_cmp_gt0000_cy<11>)
    );
    LUT2 Mcompar_highscore_cmp_gt0000_lut<0>
    (
        .I0(highscore<0>),
        .I1(scoreOnes<0>),
        .O(Mcompar_highscore_cmp_gt0000_lut<0>)
    );
    MUXCY Mcompar_highscore_cmp_gt0000_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(highscore<0>),
        .S(Mcompar_highscore_cmp_gt0000_lut<0>),
        .O(Mcompar_highscore_cmp_gt0000_cy<0>)
    );
    LUT2 Mcompar_highscore_cmp_gt0000_lut<1>
    (
        .I0(highscore<1>),
        .I1(scoreOnes<1>),
        .O(Mcompar_highscore_cmp_gt0000_lut<1>)
    );
    MUXCY Mcompar_highscore_cmp_gt0000_cy<1>
    (
        .CI(Mcompar_highscore_cmp_gt0000_cy<0>),
        .DI(highscore<1>),
        .S(Mcompar_highscore_cmp_gt0000_lut<1>),
        .O(Mcompar_highscore_cmp_gt0000_cy<1>)
    );
    LUT2 Mcompar_highscore_cmp_gt0000_lut<2>
    (
        .I0(highscore<2>),
        .I1(scoreOnes<2>),
        .O(Mcompar_highscore_cmp_gt0000_lut<2>)
    );
    MUXCY Mcompar_highscore_cmp_gt0000_cy<2>
    (
        .CI(Mcompar_highscore_cmp_gt0000_cy<1>),
        .DI(highscore<2>),
        .S(Mcompar_highscore_cmp_gt0000_lut<2>),
        .O(Mcompar_highscore_cmp_gt0000_cy<2>)
    );
    LUT2 Mcompar_highscore_cmp_gt0000_lut<3>
    (
        .I0(highscore<3>),
        .I1(scoreOnes<3>),
        .O(Mcompar_highscore_cmp_gt0000_lut<3>)
    );
    MUXCY Mcompar_highscore_cmp_gt0000_cy<3>
    (
        .CI(Mcompar_highscore_cmp_gt0000_cy<2>),
        .DI(highscore<3>),
        .S(Mcompar_highscore_cmp_gt0000_lut<3>),
        .O(Mcompar_highscore_cmp_gt0000_cy<3>)
    );
    LUT2 Mcompar_highscore_cmp_gt0000_lut<4>
    (
        .I0(highscore<4>),
        .I1(scoreTens<0>),
        .O(Mcompar_highscore_cmp_gt0000_lut<4>)
    );
    MUXCY Mcompar_highscore_cmp_gt0000_cy<4>
    (
        .CI(Mcompar_highscore_cmp_gt0000_cy<3>),
        .DI(highscore<4>),
        .S(Mcompar_highscore_cmp_gt0000_lut<4>),
        .O(Mcompar_highscore_cmp_gt0000_cy<4>)
    );
    LUT2 Mcompar_highscore_cmp_gt0000_lut<5>
    (
        .I0(highscore<5>),
        .I1(scoreTens<1>),
        .O(Mcompar_highscore_cmp_gt0000_lut<5>)
    );
    MUXCY Mcompar_highscore_cmp_gt0000_cy<5>
    (
        .CI(Mcompar_highscore_cmp_gt0000_cy<4>),
        .DI(highscore<5>),
        .S(Mcompar_highscore_cmp_gt0000_lut<5>),
        .O(Mcompar_highscore_cmp_gt0000_cy<5>)
    );
    LUT2 Mcompar_highscore_cmp_gt0000_lut<6>
    (
        .I0(highscore<6>),
        .I1(scoreTens<2>),
        .O(Mcompar_highscore_cmp_gt0000_lut<6>)
    );
    MUXCY Mcompar_highscore_cmp_gt0000_cy<6>
    (
        .CI(Mcompar_highscore_cmp_gt0000_cy<5>),
        .DI(highscore<6>),
        .S(Mcompar_highscore_cmp_gt0000_lut<6>),
        .O(Mcompar_highscore_cmp_gt0000_cy<6>)
    );
    LUT2 Mcompar_highscore_cmp_gt0000_lut<7>
    (
        .I0(highscore<7>),
        .I1(scoreTens<3>),
        .O(Mcompar_highscore_cmp_gt0000_lut<7>)
    );
    MUXCY Mcompar_highscore_cmp_gt0000_cy<7>
    (
        .CI(Mcompar_highscore_cmp_gt0000_cy<6>),
        .DI(highscore<7>),
        .S(Mcompar_highscore_cmp_gt0000_lut<7>),
        .O(Mcompar_highscore_cmp_gt0000_cy<7>)
    );
    MUXF5 display/Mmux_decode_2_f5_2
    (
        .I0(display/Mmux_decode_43),
        .I1(display/Mmux_decode_33),
        .S(display/counter_value<14>),
        .O(display/decode<3>)
    );
    LUT3 display/Mmux_decode_43
    (
        .I0(display/counter_value<13>),
        .I1(right_seven_seg_data<3>),
        .I2(right_seven_seg_data<7>),
        .O(display/Mmux_decode_43)
    );
    LUT3 display/Mmux_decode_33
    (
        .I0(display/counter_value<13>),
        .I1(left_seven_seg_data<3>),
        .I2(left_seven_seg_data<7>),
        .O(display/Mmux_decode_33)
    );
    MUXF5 display/Mmux_decode_2_f5_1
    (
        .I0(display/Mmux_decode_42),
        .I1(display/Mmux_decode_32),
        .S(display/counter_value<14>),
        .O(display/decode<2>)
    );
    LUT3 display/Mmux_decode_42
    (
        .I0(display/counter_value<13>),
        .I1(right_seven_seg_data<2>),
        .I2(right_seven_seg_data<6>),
        .O(display/Mmux_decode_42)
    );
    LUT3 display/Mmux_decode_32
    (
        .I0(display/counter_value<13>),
        .I1(left_seven_seg_data<2>),
        .I2(left_seven_seg_data<6>),
        .O(display/Mmux_decode_32)
    );
    MUXF5 display/Mmux_decode_2_f5_0
    (
        .I0(display/Mmux_decode_41),
        .I1(display/Mmux_decode_31),
        .S(display/counter_value<14>),
        .O(display/decode<1>)
    );
    LUT3 display/Mmux_decode_41
    (
        .I0(display/counter_value<13>),
        .I1(right_seven_seg_data<1>),
        .I2(right_seven_seg_data<5>),
        .O(display/Mmux_decode_41)
    );
    LUT3 display/Mmux_decode_31
    (
        .I0(display/counter_value<13>),
        .I1(left_seven_seg_data<1>),
        .I2(left_seven_seg_data<5>),
        .O(display/Mmux_decode_31)
    );
    MUXF5 display/Mmux_decode_2_f5
    (
        .I0(display/Mmux_decode_4),
        .I1(display/Mmux_decode_3),
        .S(display/counter_value<14>),
        .O(display/decode<0>)
    );
    LUT3 display/Mmux_decode_4
    (
        .I0(display/counter_value<13>),
        .I1(right_seven_seg_data<0>),
        .I2(right_seven_seg_data<4>),
        .O(display/Mmux_decode_4)
    );
    LUT3 display/Mmux_decode_3
    (
        .I0(display/counter_value<13>),
        .I1(left_seven_seg_data<0>),
        .I2(left_seven_seg_data<4>),
        .O(display/Mmux_decode_3)
    );
    MUXCY Mcount_bird_delay_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Mcount_bird_delay_lut<0>),
        .O(Mcount_bird_delay_cy<0>)
    );
    XORCY Mcount_bird_delay_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Mcount_bird_delay_lut<0>),
        .O(Result<0>)
    );
    MUXCY Mcount_bird_delay_cy<1>
    (
        .CI(Mcount_bird_delay_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<1>_rt),
        .O(Mcount_bird_delay_cy<1>)
    );
    XORCY Mcount_bird_delay_xor<1>
    (
        .CI(Mcount_bird_delay_cy<0>),
        .LI(Mcount_bird_delay_cy<1>_rt),
        .O(Result<1>)
    );
    MUXCY Mcount_bird_delay_cy<2>
    (
        .CI(Mcount_bird_delay_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<2>_rt),
        .O(Mcount_bird_delay_cy<2>)
    );
    XORCY Mcount_bird_delay_xor<2>
    (
        .CI(Mcount_bird_delay_cy<1>),
        .LI(Mcount_bird_delay_cy<2>_rt),
        .O(Result<2>)
    );
    MUXCY Mcount_bird_delay_cy<3>
    (
        .CI(Mcount_bird_delay_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<3>_rt),
        .O(Mcount_bird_delay_cy<3>)
    );
    XORCY Mcount_bird_delay_xor<3>
    (
        .CI(Mcount_bird_delay_cy<2>),
        .LI(Mcount_bird_delay_cy<3>_rt),
        .O(Result<3>)
    );
    MUXCY Mcount_bird_delay_cy<4>
    (
        .CI(Mcount_bird_delay_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<4>_rt),
        .O(Mcount_bird_delay_cy<4>)
    );
    XORCY Mcount_bird_delay_xor<4>
    (
        .CI(Mcount_bird_delay_cy<3>),
        .LI(Mcount_bird_delay_cy<4>_rt),
        .O(Result<4>)
    );
    MUXCY Mcount_bird_delay_cy<5>
    (
        .CI(Mcount_bird_delay_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<5>_rt),
        .O(Mcount_bird_delay_cy<5>)
    );
    XORCY Mcount_bird_delay_xor<5>
    (
        .CI(Mcount_bird_delay_cy<4>),
        .LI(Mcount_bird_delay_cy<5>_rt),
        .O(Result<5>)
    );
    MUXCY Mcount_bird_delay_cy<6>
    (
        .CI(Mcount_bird_delay_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<6>_rt),
        .O(Mcount_bird_delay_cy<6>)
    );
    XORCY Mcount_bird_delay_xor<6>
    (
        .CI(Mcount_bird_delay_cy<5>),
        .LI(Mcount_bird_delay_cy<6>_rt),
        .O(Result<6>)
    );
    MUXCY Mcount_bird_delay_cy<7>
    (
        .CI(Mcount_bird_delay_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<7>_rt),
        .O(Mcount_bird_delay_cy<7>)
    );
    XORCY Mcount_bird_delay_xor<7>
    (
        .CI(Mcount_bird_delay_cy<6>),
        .LI(Mcount_bird_delay_cy<7>_rt),
        .O(Result<7>)
    );
    MUXCY Mcount_bird_delay_cy<8>
    (
        .CI(Mcount_bird_delay_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<8>_rt),
        .O(Mcount_bird_delay_cy<8>)
    );
    XORCY Mcount_bird_delay_xor<8>
    (
        .CI(Mcount_bird_delay_cy<7>),
        .LI(Mcount_bird_delay_cy<8>_rt),
        .O(Result<8>)
    );
    MUXCY Mcount_bird_delay_cy<9>
    (
        .CI(Mcount_bird_delay_cy<8>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<9>_rt),
        .O(Mcount_bird_delay_cy<9>)
    );
    XORCY Mcount_bird_delay_xor<9>
    (
        .CI(Mcount_bird_delay_cy<8>),
        .LI(Mcount_bird_delay_cy<9>_rt),
        .O(Result<9>)
    );
    MUXCY Mcount_bird_delay_cy<10>
    (
        .CI(Mcount_bird_delay_cy<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<10>_rt),
        .O(Mcount_bird_delay_cy<10>)
    );
    XORCY Mcount_bird_delay_xor<10>
    (
        .CI(Mcount_bird_delay_cy<9>),
        .LI(Mcount_bird_delay_cy<10>_rt),
        .O(Result<10>)
    );
    MUXCY Mcount_bird_delay_cy<11>
    (
        .CI(Mcount_bird_delay_cy<10>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<11>_rt),
        .O(Mcount_bird_delay_cy<11>)
    );
    XORCY Mcount_bird_delay_xor<11>
    (
        .CI(Mcount_bird_delay_cy<10>),
        .LI(Mcount_bird_delay_cy<11>_rt),
        .O(Result<11>)
    );
    MUXCY Mcount_bird_delay_cy<12>
    (
        .CI(Mcount_bird_delay_cy<11>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<12>_rt),
        .O(Mcount_bird_delay_cy<12>)
    );
    XORCY Mcount_bird_delay_xor<12>
    (
        .CI(Mcount_bird_delay_cy<11>),
        .LI(Mcount_bird_delay_cy<12>_rt),
        .O(Result<12>)
    );
    MUXCY Mcount_bird_delay_cy<13>
    (
        .CI(Mcount_bird_delay_cy<12>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<13>_rt),
        .O(Mcount_bird_delay_cy<13>)
    );
    XORCY Mcount_bird_delay_xor<13>
    (
        .CI(Mcount_bird_delay_cy<12>),
        .LI(Mcount_bird_delay_cy<13>_rt),
        .O(Result<13>)
    );
    MUXCY Mcount_bird_delay_cy<14>
    (
        .CI(Mcount_bird_delay_cy<13>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<14>_rt),
        .O(Mcount_bird_delay_cy<14>)
    );
    XORCY Mcount_bird_delay_xor<14>
    (
        .CI(Mcount_bird_delay_cy<13>),
        .LI(Mcount_bird_delay_cy<14>_rt),
        .O(Result<14>)
    );
    MUXCY Mcount_bird_delay_cy<15>
    (
        .CI(Mcount_bird_delay_cy<14>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<15>_rt),
        .O(Mcount_bird_delay_cy<15>)
    );
    XORCY Mcount_bird_delay_xor<15>
    (
        .CI(Mcount_bird_delay_cy<14>),
        .LI(Mcount_bird_delay_cy<15>_rt),
        .O(Result<15>)
    );
    MUXCY Mcount_bird_delay_cy<16>
    (
        .CI(Mcount_bird_delay_cy<15>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<16>_rt),
        .O(Mcount_bird_delay_cy<16>)
    );
    XORCY Mcount_bird_delay_xor<16>
    (
        .CI(Mcount_bird_delay_cy<15>),
        .LI(Mcount_bird_delay_cy<16>_rt),
        .O(Result<16>)
    );
    MUXCY Mcount_bird_delay_cy<17>
    (
        .CI(Mcount_bird_delay_cy<16>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<17>_rt),
        .O(Mcount_bird_delay_cy<17>)
    );
    XORCY Mcount_bird_delay_xor<17>
    (
        .CI(Mcount_bird_delay_cy<16>),
        .LI(Mcount_bird_delay_cy<17>_rt),
        .O(Result<17>)
    );
    MUXCY Mcount_bird_delay_cy<18>
    (
        .CI(Mcount_bird_delay_cy<17>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<18>_rt),
        .O(Mcount_bird_delay_cy<18>)
    );
    XORCY Mcount_bird_delay_xor<18>
    (
        .CI(Mcount_bird_delay_cy<17>),
        .LI(Mcount_bird_delay_cy<18>_rt),
        .O(Result<18>)
    );
    MUXCY Mcount_bird_delay_cy<19>
    (
        .CI(Mcount_bird_delay_cy<18>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_bird_delay_cy<19>_rt),
        .O(Mcount_bird_delay_cy<19>)
    );
    XORCY Mcount_bird_delay_xor<19>
    (
        .CI(Mcount_bird_delay_cy<18>),
        .LI(Mcount_bird_delay_cy<19>_rt),
        .O(Result<19>)
    );
    XORCY Mcount_bird_delay_xor<20>
    (
        .CI(Mcount_bird_delay_cy<19>),
        .LI(Mcount_bird_delay_xor<20>_rt),
        .O(Result<20>)
    );
    MUXCY display/Mcount_counter_value_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(display/Mcount_counter_value_lut<0>),
        .O(display/Mcount_counter_value_cy<0>)
    );
    XORCY display/Mcount_counter_value_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(display/Mcount_counter_value_lut<0>),
        .O(Result<0>3)
    );
    MUXCY display/Mcount_counter_value_cy<1>
    (
        .CI(display/Mcount_counter_value_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(display/Mcount_counter_value_cy<1>_rt),
        .O(display/Mcount_counter_value_cy<1>)
    );
    XORCY display/Mcount_counter_value_xor<1>
    (
        .CI(display/Mcount_counter_value_cy<0>),
        .LI(display/Mcount_counter_value_cy<1>_rt),
        .O(Result<1>3)
    );
    MUXCY display/Mcount_counter_value_cy<2>
    (
        .CI(display/Mcount_counter_value_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(display/Mcount_counter_value_cy<2>_rt),
        .O(display/Mcount_counter_value_cy<2>)
    );
    XORCY display/Mcount_counter_value_xor<2>
    (
        .CI(display/Mcount_counter_value_cy<1>),
        .LI(display/Mcount_counter_value_cy<2>_rt),
        .O(Result<2>3)
    );
    MUXCY display/Mcount_counter_value_cy<3>
    (
        .CI(display/Mcount_counter_value_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(display/Mcount_counter_value_cy<3>_rt),
        .O(display/Mcount_counter_value_cy<3>)
    );
    XORCY display/Mcount_counter_value_xor<3>
    (
        .CI(display/Mcount_counter_value_cy<2>),
        .LI(display/Mcount_counter_value_cy<3>_rt),
        .O(Result<3>3)
    );
    MUXCY display/Mcount_counter_value_cy<4>
    (
        .CI(display/Mcount_counter_value_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(display/Mcount_counter_value_cy<4>_rt),
        .O(display/Mcount_counter_value_cy<4>)
    );
    XORCY display/Mcount_counter_value_xor<4>
    (
        .CI(display/Mcount_counter_value_cy<3>),
        .LI(display/Mcount_counter_value_cy<4>_rt),
        .O(Result<4>2)
    );
    MUXCY display/Mcount_counter_value_cy<5>
    (
        .CI(display/Mcount_counter_value_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(display/Mcount_counter_value_cy<5>_rt),
        .O(display/Mcount_counter_value_cy<5>)
    );
    XORCY display/Mcount_counter_value_xor<5>
    (
        .CI(display/Mcount_counter_value_cy<4>),
        .LI(display/Mcount_counter_value_cy<5>_rt),
        .O(Result<5>2)
    );
    MUXCY display/Mcount_counter_value_cy<6>
    (
        .CI(display/Mcount_counter_value_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(display/Mcount_counter_value_cy<6>_rt),
        .O(display/Mcount_counter_value_cy<6>)
    );
    XORCY display/Mcount_counter_value_xor<6>
    (
        .CI(display/Mcount_counter_value_cy<5>),
        .LI(display/Mcount_counter_value_cy<6>_rt),
        .O(Result<6>2)
    );
    MUXCY display/Mcount_counter_value_cy<7>
    (
        .CI(display/Mcount_counter_value_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(display/Mcount_counter_value_cy<7>_rt),
        .O(display/Mcount_counter_value_cy<7>)
    );
    XORCY display/Mcount_counter_value_xor<7>
    (
        .CI(display/Mcount_counter_value_cy<6>),
        .LI(display/Mcount_counter_value_cy<7>_rt),
        .O(Result<7>2)
    );
    MUXCY display/Mcount_counter_value_cy<8>
    (
        .CI(display/Mcount_counter_value_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(display/Mcount_counter_value_cy<8>_rt),
        .O(display/Mcount_counter_value_cy<8>)
    );
    XORCY display/Mcount_counter_value_xor<8>
    (
        .CI(display/Mcount_counter_value_cy<7>),
        .LI(display/Mcount_counter_value_cy<8>_rt),
        .O(Result<8>2)
    );
    MUXCY display/Mcount_counter_value_cy<9>
    (
        .CI(display/Mcount_counter_value_cy<8>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(display/Mcount_counter_value_cy<9>_rt),
        .O(display/Mcount_counter_value_cy<9>)
    );
    XORCY display/Mcount_counter_value_xor<9>
    (
        .CI(display/Mcount_counter_value_cy<8>),
        .LI(display/Mcount_counter_value_cy<9>_rt),
        .O(Result<9>2)
    );
    MUXCY display/Mcount_counter_value_cy<10>
    (
        .CI(display/Mcount_counter_value_cy<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(display/Mcount_counter_value_cy<10>_rt),
        .O(display/Mcount_counter_value_cy<10>)
    );
    XORCY display/Mcount_counter_value_xor<10>
    (
        .CI(display/Mcount_counter_value_cy<9>),
        .LI(display/Mcount_counter_value_cy<10>_rt),
        .O(Result<10>2)
    );
    MUXCY display/Mcount_counter_value_cy<11>
    (
        .CI(display/Mcount_counter_value_cy<10>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(display/Mcount_counter_value_cy<11>_rt),
        .O(display/Mcount_counter_value_cy<11>)
    );
    XORCY display/Mcount_counter_value_xor<11>
    (
        .CI(display/Mcount_counter_value_cy<10>),
        .LI(display/Mcount_counter_value_cy<11>_rt),
        .O(Result<11>2)
    );
    MUXCY display/Mcount_counter_value_cy<12>
    (
        .CI(display/Mcount_counter_value_cy<11>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(display/Mcount_counter_value_cy<12>_rt),
        .O(display/Mcount_counter_value_cy<12>)
    );
    XORCY display/Mcount_counter_value_xor<12>
    (
        .CI(display/Mcount_counter_value_cy<11>),
        .LI(display/Mcount_counter_value_cy<12>_rt),
        .O(Result<12>2)
    );
    MUXCY display/Mcount_counter_value_cy<13>
    (
        .CI(display/Mcount_counter_value_cy<12>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(display/Mcount_counter_value_cy<13>_rt),
        .O(display/Mcount_counter_value_cy<13>)
    );
    XORCY display/Mcount_counter_value_xor<13>
    (
        .CI(display/Mcount_counter_value_cy<12>),
        .LI(display/Mcount_counter_value_cy<13>_rt),
        .O(Result<13>2)
    );
    XORCY display/Mcount_counter_value_xor<14>
    (
        .CI(display/Mcount_counter_value_cy<13>),
        .LI(display/Mcount_counter_value_xor<14>_rt),
        .O(Result<14>2)
    );
    MUXCY Mcount_debounce_counter_value_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Mcount_debounce_counter_value_lut<0>),
        .O(Mcount_debounce_counter_value_cy<0>)
    );
    XORCY Mcount_debounce_counter_value_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Mcount_debounce_counter_value_lut<0>),
        .O(Result<0>2)
    );
    MUXCY Mcount_debounce_counter_value_cy<1>
    (
        .CI(Mcount_debounce_counter_value_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_debounce_counter_value_cy<1>_rt),
        .O(Mcount_debounce_counter_value_cy<1>)
    );
    XORCY Mcount_debounce_counter_value_xor<1>
    (
        .CI(Mcount_debounce_counter_value_cy<0>),
        .LI(Mcount_debounce_counter_value_cy<1>_rt),
        .O(Result<1>2)
    );
    MUXCY Mcount_debounce_counter_value_cy<2>
    (
        .CI(Mcount_debounce_counter_value_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_debounce_counter_value_cy<2>_rt),
        .O(Mcount_debounce_counter_value_cy<2>)
    );
    XORCY Mcount_debounce_counter_value_xor<2>
    (
        .CI(Mcount_debounce_counter_value_cy<1>),
        .LI(Mcount_debounce_counter_value_cy<2>_rt),
        .O(Result<2>2)
    );
    MUXCY Mcount_debounce_counter_value_cy<3>
    (
        .CI(Mcount_debounce_counter_value_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_debounce_counter_value_cy<3>_rt),
        .O(Mcount_debounce_counter_value_cy<3>)
    );
    XORCY Mcount_debounce_counter_value_xor<3>
    (
        .CI(Mcount_debounce_counter_value_cy<2>),
        .LI(Mcount_debounce_counter_value_cy<3>_rt),
        .O(Result<3>2)
    );
    MUXCY Mcount_debounce_counter_value_cy<4>
    (
        .CI(Mcount_debounce_counter_value_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_debounce_counter_value_cy<4>_rt),
        .O(Mcount_debounce_counter_value_cy<4>)
    );
    XORCY Mcount_debounce_counter_value_xor<4>
    (
        .CI(Mcount_debounce_counter_value_cy<3>),
        .LI(Mcount_debounce_counter_value_cy<4>_rt),
        .O(Result<4>1)
    );
    MUXCY Mcount_debounce_counter_value_cy<5>
    (
        .CI(Mcount_debounce_counter_value_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_debounce_counter_value_cy<5>_rt),
        .O(Mcount_debounce_counter_value_cy<5>)
    );
    XORCY Mcount_debounce_counter_value_xor<5>
    (
        .CI(Mcount_debounce_counter_value_cy<4>),
        .LI(Mcount_debounce_counter_value_cy<5>_rt),
        .O(Result<5>1)
    );
    MUXCY Mcount_debounce_counter_value_cy<6>
    (
        .CI(Mcount_debounce_counter_value_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_debounce_counter_value_cy<6>_rt),
        .O(Mcount_debounce_counter_value_cy<6>)
    );
    XORCY Mcount_debounce_counter_value_xor<6>
    (
        .CI(Mcount_debounce_counter_value_cy<5>),
        .LI(Mcount_debounce_counter_value_cy<6>_rt),
        .O(Result<6>1)
    );
    MUXCY Mcount_debounce_counter_value_cy<7>
    (
        .CI(Mcount_debounce_counter_value_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_debounce_counter_value_cy<7>_rt),
        .O(Mcount_debounce_counter_value_cy<7>)
    );
    XORCY Mcount_debounce_counter_value_xor<7>
    (
        .CI(Mcount_debounce_counter_value_cy<6>),
        .LI(Mcount_debounce_counter_value_cy<7>_rt),
        .O(Result<7>1)
    );
    MUXCY Mcount_debounce_counter_value_cy<8>
    (
        .CI(Mcount_debounce_counter_value_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_debounce_counter_value_cy<8>_rt),
        .O(Mcount_debounce_counter_value_cy<8>)
    );
    XORCY Mcount_debounce_counter_value_xor<8>
    (
        .CI(Mcount_debounce_counter_value_cy<7>),
        .LI(Mcount_debounce_counter_value_cy<8>_rt),
        .O(Result<8>1)
    );
    MUXCY Mcount_debounce_counter_value_cy<9>
    (
        .CI(Mcount_debounce_counter_value_cy<8>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_debounce_counter_value_cy<9>_rt),
        .O(Mcount_debounce_counter_value_cy<9>)
    );
    XORCY Mcount_debounce_counter_value_xor<9>
    (
        .CI(Mcount_debounce_counter_value_cy<8>),
        .LI(Mcount_debounce_counter_value_cy<9>_rt),
        .O(Result<9>1)
    );
    MUXCY Mcount_debounce_counter_value_cy<10>
    (
        .CI(Mcount_debounce_counter_value_cy<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_debounce_counter_value_cy<10>_rt),
        .O(Mcount_debounce_counter_value_cy<10>)
    );
    XORCY Mcount_debounce_counter_value_xor<10>
    (
        .CI(Mcount_debounce_counter_value_cy<9>),
        .LI(Mcount_debounce_counter_value_cy<10>_rt),
        .O(Result<10>1)
    );
    MUXCY Mcount_debounce_counter_value_cy<11>
    (
        .CI(Mcount_debounce_counter_value_cy<10>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_debounce_counter_value_cy<11>_rt),
        .O(Mcount_debounce_counter_value_cy<11>)
    );
    XORCY Mcount_debounce_counter_value_xor<11>
    (
        .CI(Mcount_debounce_counter_value_cy<10>),
        .LI(Mcount_debounce_counter_value_cy<11>_rt),
        .O(Result<11>1)
    );
    MUXCY Mcount_debounce_counter_value_cy<12>
    (
        .CI(Mcount_debounce_counter_value_cy<11>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_debounce_counter_value_cy<12>_rt),
        .O(Mcount_debounce_counter_value_cy<12>)
    );
    XORCY Mcount_debounce_counter_value_xor<12>
    (
        .CI(Mcount_debounce_counter_value_cy<11>),
        .LI(Mcount_debounce_counter_value_cy<12>_rt),
        .O(Result<12>1)
    );
    MUXCY Mcount_debounce_counter_value_cy<13>
    (
        .CI(Mcount_debounce_counter_value_cy<12>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_debounce_counter_value_cy<13>_rt),
        .O(Mcount_debounce_counter_value_cy<13>)
    );
    XORCY Mcount_debounce_counter_value_xor<13>
    (
        .CI(Mcount_debounce_counter_value_cy<12>),
        .LI(Mcount_debounce_counter_value_cy<13>_rt),
        .O(Result<13>1)
    );
    MUXCY Mcount_debounce_counter_value_cy<14>
    (
        .CI(Mcount_debounce_counter_value_cy<13>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_debounce_counter_value_cy<14>_rt),
        .O(Mcount_debounce_counter_value_cy<14>)
    );
    XORCY Mcount_debounce_counter_value_xor<14>
    (
        .CI(Mcount_debounce_counter_value_cy<13>),
        .LI(Mcount_debounce_counter_value_cy<14>_rt),
        .O(Result<14>1)
    );
    MUXCY Mcount_debounce_counter_value_cy<15>
    (
        .CI(Mcount_debounce_counter_value_cy<14>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_debounce_counter_value_cy<15>_rt),
        .O(Mcount_debounce_counter_value_cy<15>)
    );
    XORCY Mcount_debounce_counter_value_xor<15>
    (
        .CI(Mcount_debounce_counter_value_cy<14>),
        .LI(Mcount_debounce_counter_value_cy<15>_rt),
        .O(Result<15>1)
    );
    MUXCY Mcount_debounce_counter_value_cy<16>
    (
        .CI(Mcount_debounce_counter_value_cy<15>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_debounce_counter_value_cy<16>_rt),
        .O(Mcount_debounce_counter_value_cy<16>)
    );
    XORCY Mcount_debounce_counter_value_xor<16>
    (
        .CI(Mcount_debounce_counter_value_cy<15>),
        .LI(Mcount_debounce_counter_value_cy<16>_rt),
        .O(Result<16>1)
    );
    MUXCY Mcount_debounce_counter_value_cy<17>
    (
        .CI(Mcount_debounce_counter_value_cy<16>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcount_debounce_counter_value_cy<17>_rt),
        .O(Mcount_debounce_counter_value_cy<17>)
    );
    XORCY Mcount_debounce_counter_value_xor<17>
    (
        .CI(Mcount_debounce_counter_value_cy<16>),
        .LI(Mcount_debounce_counter_value_cy<17>_rt),
        .O(Result<17>1)
    );
    XORCY Mcount_debounce_counter_value_xor<18>
    (
        .CI(Mcount_debounce_counter_value_cy<17>),
        .LI(Mcount_debounce_counter_value_xor<18>_rt),
        .O(Result<18>1)
    );
    MUXCY Madd_bird_color_on_add0000_cy<1>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0000_lut<1>),
        .O(Madd_bird_color_on_add0000_cy<1>)
    );
    XORCY Madd_bird_color_on_add0000_xor<1>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_color_on_add0000_lut<1>),
        .O(bird_color_on_add0000<1>)
    );
    MUXCY Madd_bird_color_on_add0000_cy<2>
    (
        .CI(Madd_bird_color_on_add0000_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0000_cy<2>_rt),
        .O(Madd_bird_color_on_add0000_cy<2>)
    );
    XORCY Madd_bird_color_on_add0000_xor<2>
    (
        .CI(Madd_bird_color_on_add0000_cy<1>),
        .LI(Madd_bird_color_on_add0000_cy<2>_rt),
        .O(bird_color_on_add0000<2>)
    );
    MUXCY Madd_bird_color_on_add0000_cy<3>
    (
        .CI(Madd_bird_color_on_add0000_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0000_cy<3>_rt),
        .O(Madd_bird_color_on_add0000_cy<3>)
    );
    XORCY Madd_bird_color_on_add0000_xor<3>
    (
        .CI(Madd_bird_color_on_add0000_cy<2>),
        .LI(Madd_bird_color_on_add0000_cy<3>_rt),
        .O(bird_color_on_add0000<3>)
    );
    MUXCY Madd_bird_color_on_add0000_cy<4>
    (
        .CI(Madd_bird_color_on_add0000_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0000_cy<4>_rt),
        .O(Madd_bird_color_on_add0000_cy<4>)
    );
    XORCY Madd_bird_color_on_add0000_xor<4>
    (
        .CI(Madd_bird_color_on_add0000_cy<3>),
        .LI(Madd_bird_color_on_add0000_cy<4>_rt),
        .O(bird_color_on_add0000<4>)
    );
    MUXCY Madd_bird_color_on_add0000_cy<5>
    (
        .CI(Madd_bird_color_on_add0000_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0000_cy<5>_rt),
        .O(Madd_bird_color_on_add0000_cy<5>)
    );
    XORCY Madd_bird_color_on_add0000_xor<5>
    (
        .CI(Madd_bird_color_on_add0000_cy<4>),
        .LI(Madd_bird_color_on_add0000_cy<5>_rt),
        .O(bird_color_on_add0000<5>)
    );
    MUXCY Madd_bird_color_on_add0000_cy<6>
    (
        .CI(Madd_bird_color_on_add0000_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0000_cy<6>_rt),
        .O(Madd_bird_color_on_add0000_cy<6>)
    );
    XORCY Madd_bird_color_on_add0000_xor<6>
    (
        .CI(Madd_bird_color_on_add0000_cy<5>),
        .LI(Madd_bird_color_on_add0000_cy<6>_rt),
        .O(bird_color_on_add0000<6>)
    );
    MUXCY Madd_bird_color_on_add0000_cy<7>
    (
        .CI(Madd_bird_color_on_add0000_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0000_cy<7>_rt),
        .O(Madd_bird_color_on_add0000_cy<7>)
    );
    XORCY Madd_bird_color_on_add0000_xor<7>
    (
        .CI(Madd_bird_color_on_add0000_cy<6>),
        .LI(Madd_bird_color_on_add0000_cy<7>_rt),
        .O(bird_color_on_add0000<7>)
    );
    MUXCY Madd_bird_color_on_add0000_cy<8>
    (
        .CI(Madd_bird_color_on_add0000_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0000_cy<8>_rt),
        .O(Madd_bird_color_on_add0000_cy<8>)
    );
    XORCY Madd_bird_color_on_add0000_xor<8>
    (
        .CI(Madd_bird_color_on_add0000_cy<7>),
        .LI(Madd_bird_color_on_add0000_cy<8>_rt),
        .O(bird_color_on_add0000<8>)
    );
    XORCY Madd_bird_color_on_add0000_xor<9>
    (
        .CI(Madd_bird_color_on_add0000_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_color_on_add0000<9>)
    );
    MUXCY Madd_bird_color_on_add0001_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0001_lut<0>),
        .O(Madd_bird_color_on_add0001_cy<0>)
    );
    XORCY Madd_bird_color_on_add0001_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_color_on_add0001_lut<0>),
        .O(bird_color_on_add0001<0>)
    );
    MUXCY Madd_bird_color_on_add0001_cy<1>
    (
        .CI(Madd_bird_color_on_add0001_cy<0>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0001_lut<1>),
        .O(Madd_bird_color_on_add0001_cy<1>)
    );
    XORCY Madd_bird_color_on_add0001_xor<1>
    (
        .CI(Madd_bird_color_on_add0001_cy<0>),
        .LI(Madd_bird_color_on_add0001_lut<1>),
        .O(bird_color_on_add0001<1>)
    );
    MUXCY Madd_bird_color_on_add0001_cy<2>
    (
        .CI(Madd_bird_color_on_add0001_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0001_cy<2>_rt),
        .O(Madd_bird_color_on_add0001_cy<2>)
    );
    XORCY Madd_bird_color_on_add0001_xor<2>
    (
        .CI(Madd_bird_color_on_add0001_cy<1>),
        .LI(Madd_bird_color_on_add0001_cy<2>_rt),
        .O(bird_color_on_add0001<2>)
    );
    MUXCY Madd_bird_color_on_add0001_cy<3>
    (
        .CI(Madd_bird_color_on_add0001_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0001_cy<3>_rt),
        .O(Madd_bird_color_on_add0001_cy<3>)
    );
    XORCY Madd_bird_color_on_add0001_xor<3>
    (
        .CI(Madd_bird_color_on_add0001_cy<2>),
        .LI(Madd_bird_color_on_add0001_cy<3>_rt),
        .O(bird_color_on_add0001<3>)
    );
    MUXCY Madd_bird_color_on_add0001_cy<4>
    (
        .CI(Madd_bird_color_on_add0001_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0001_cy<4>_rt),
        .O(Madd_bird_color_on_add0001_cy<4>)
    );
    XORCY Madd_bird_color_on_add0001_xor<4>
    (
        .CI(Madd_bird_color_on_add0001_cy<3>),
        .LI(Madd_bird_color_on_add0001_cy<4>_rt),
        .O(bird_color_on_add0001<4>)
    );
    MUXCY Madd_bird_color_on_add0001_cy<5>
    (
        .CI(Madd_bird_color_on_add0001_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0001_cy<5>_rt),
        .O(Madd_bird_color_on_add0001_cy<5>)
    );
    XORCY Madd_bird_color_on_add0001_xor<5>
    (
        .CI(Madd_bird_color_on_add0001_cy<4>),
        .LI(Madd_bird_color_on_add0001_cy<5>_rt),
        .O(bird_color_on_add0001<5>)
    );
    MUXCY Madd_bird_color_on_add0001_cy<6>
    (
        .CI(Madd_bird_color_on_add0001_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0001_cy<6>_rt),
        .O(Madd_bird_color_on_add0001_cy<6>)
    );
    XORCY Madd_bird_color_on_add0001_xor<6>
    (
        .CI(Madd_bird_color_on_add0001_cy<5>),
        .LI(Madd_bird_color_on_add0001_cy<6>_rt),
        .O(bird_color_on_add0001<6>)
    );
    MUXCY Madd_bird_color_on_add0001_cy<7>
    (
        .CI(Madd_bird_color_on_add0001_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0001_cy<7>_rt),
        .O(Madd_bird_color_on_add0001_cy<7>)
    );
    XORCY Madd_bird_color_on_add0001_xor<7>
    (
        .CI(Madd_bird_color_on_add0001_cy<6>),
        .LI(Madd_bird_color_on_add0001_cy<7>_rt),
        .O(bird_color_on_add0001<7>)
    );
    MUXCY Madd_bird_color_on_add0001_cy<8>
    (
        .CI(Madd_bird_color_on_add0001_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0001_cy<8>_rt),
        .O(Madd_bird_color_on_add0001_cy<8>)
    );
    XORCY Madd_bird_color_on_add0001_xor<8>
    (
        .CI(Madd_bird_color_on_add0001_cy<7>),
        .LI(Madd_bird_color_on_add0001_cy<8>_rt),
        .O(bird_color_on_add0001<8>)
    );
    XORCY Madd_bird_color_on_add0001_xor<9>
    (
        .CI(Madd_bird_color_on_add0001_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_color_on_add0001<9>)
    );
    MUXCY Madd_bird_color_on_add0003_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0003_lut<0>),
        .O(Madd_bird_color_on_add0003_cy<0>)
    );
    XORCY Madd_bird_color_on_add0003_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_color_on_add0003_lut<0>),
        .O(bird_color_on_add0003<0>)
    );
    MUXCY Madd_bird_color_on_add0003_cy<1>
    (
        .CI(Madd_bird_color_on_add0003_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0003_cy<1>_rt),
        .O(Madd_bird_color_on_add0003_cy<1>)
    );
    XORCY Madd_bird_color_on_add0003_xor<1>
    (
        .CI(Madd_bird_color_on_add0003_cy<0>),
        .LI(Madd_bird_color_on_add0003_cy<1>_rt),
        .O(bird_color_on_add0003<1>)
    );
    MUXCY Madd_bird_color_on_add0003_cy<2>
    (
        .CI(Madd_bird_color_on_add0003_cy<1>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0003_lut<2>1),
        .O(Madd_bird_color_on_add0003_cy<2>)
    );
    XORCY Madd_bird_color_on_add0003_xor<2>
    (
        .CI(Madd_bird_color_on_add0003_cy<1>),
        .LI(Madd_bird_color_on_add0003_lut<2>1),
        .O(bird_color_on_add0003<2>)
    );
    MUXCY Madd_bird_color_on_add0003_cy<3>
    (
        .CI(Madd_bird_color_on_add0003_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0003_cy<3>_rt),
        .O(Madd_bird_color_on_add0003_cy<3>)
    );
    XORCY Madd_bird_color_on_add0003_xor<3>
    (
        .CI(Madd_bird_color_on_add0003_cy<2>),
        .LI(Madd_bird_color_on_add0003_cy<3>_rt),
        .O(bird_color_on_add0003<3>)
    );
    MUXCY Madd_bird_color_on_add0003_cy<4>
    (
        .CI(Madd_bird_color_on_add0003_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0003_cy<4>_rt),
        .O(Madd_bird_color_on_add0003_cy<4>)
    );
    XORCY Madd_bird_color_on_add0003_xor<4>
    (
        .CI(Madd_bird_color_on_add0003_cy<3>),
        .LI(Madd_bird_color_on_add0003_cy<4>_rt),
        .O(bird_color_on_add0003<4>)
    );
    MUXCY Madd_bird_color_on_add0003_cy<5>
    (
        .CI(Madd_bird_color_on_add0003_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0003_cy<5>_rt),
        .O(Madd_bird_color_on_add0003_cy<5>)
    );
    XORCY Madd_bird_color_on_add0003_xor<5>
    (
        .CI(Madd_bird_color_on_add0003_cy<4>),
        .LI(Madd_bird_color_on_add0003_cy<5>_rt),
        .O(bird_color_on_add0003<5>)
    );
    MUXCY Madd_bird_color_on_add0003_cy<6>
    (
        .CI(Madd_bird_color_on_add0003_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0003_cy<6>_rt),
        .O(Madd_bird_color_on_add0003_cy<6>)
    );
    XORCY Madd_bird_color_on_add0003_xor<6>
    (
        .CI(Madd_bird_color_on_add0003_cy<5>),
        .LI(Madd_bird_color_on_add0003_cy<6>_rt),
        .O(bird_color_on_add0003<6>)
    );
    MUXCY Madd_bird_color_on_add0003_cy<7>
    (
        .CI(Madd_bird_color_on_add0003_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0003_cy<7>_rt),
        .O(Madd_bird_color_on_add0003_cy<7>)
    );
    XORCY Madd_bird_color_on_add0003_xor<7>
    (
        .CI(Madd_bird_color_on_add0003_cy<6>),
        .LI(Madd_bird_color_on_add0003_cy<7>_rt),
        .O(bird_color_on_add0003<7>)
    );
    MUXCY Madd_bird_color_on_add0003_cy<8>
    (
        .CI(Madd_bird_color_on_add0003_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0003_cy<8>_rt),
        .O(Madd_bird_color_on_add0003_cy<8>)
    );
    XORCY Madd_bird_color_on_add0003_xor<8>
    (
        .CI(Madd_bird_color_on_add0003_cy<7>),
        .LI(Madd_bird_color_on_add0003_cy<8>_rt),
        .O(bird_color_on_add0003<8>)
    );
    XORCY Madd_bird_color_on_add0003_xor<9>
    (
        .CI(Madd_bird_color_on_add0003_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_color_on_add0003<9>)
    );
    MUXCY Madd_bird_color_on_add0004_cy<1>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0004_lut<1>),
        .O(Madd_bird_color_on_add0004_cy<1>)
    );
    XORCY Madd_bird_color_on_add0004_xor<1>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_color_on_add0004_lut<1>),
        .O(bird_color_on_add0004<1>)
    );
    MUXCY Madd_bird_color_on_add0004_cy<2>
    (
        .CI(Madd_bird_color_on_add0004_cy<1>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0004_lut<2>),
        .O(Madd_bird_color_on_add0004_cy<2>)
    );
    XORCY Madd_bird_color_on_add0004_xor<2>
    (
        .CI(Madd_bird_color_on_add0004_cy<1>),
        .LI(Madd_bird_color_on_add0004_lut<2>),
        .O(bird_color_on_add0004<2>)
    );
    MUXCY Madd_bird_color_on_add0004_cy<3>
    (
        .CI(Madd_bird_color_on_add0004_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0004_cy<3>_rt),
        .O(Madd_bird_color_on_add0004_cy<3>)
    );
    XORCY Madd_bird_color_on_add0004_xor<3>
    (
        .CI(Madd_bird_color_on_add0004_cy<2>),
        .LI(Madd_bird_color_on_add0004_cy<3>_rt),
        .O(bird_color_on_add0004<3>)
    );
    MUXCY Madd_bird_color_on_add0004_cy<4>
    (
        .CI(Madd_bird_color_on_add0004_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0004_cy<4>_rt),
        .O(Madd_bird_color_on_add0004_cy<4>)
    );
    XORCY Madd_bird_color_on_add0004_xor<4>
    (
        .CI(Madd_bird_color_on_add0004_cy<3>),
        .LI(Madd_bird_color_on_add0004_cy<4>_rt),
        .O(bird_color_on_add0004<4>)
    );
    MUXCY Madd_bird_color_on_add0004_cy<5>
    (
        .CI(Madd_bird_color_on_add0004_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0004_cy<5>_rt),
        .O(Madd_bird_color_on_add0004_cy<5>)
    );
    XORCY Madd_bird_color_on_add0004_xor<5>
    (
        .CI(Madd_bird_color_on_add0004_cy<4>),
        .LI(Madd_bird_color_on_add0004_cy<5>_rt),
        .O(bird_color_on_add0004<5>)
    );
    MUXCY Madd_bird_color_on_add0004_cy<6>
    (
        .CI(Madd_bird_color_on_add0004_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0004_cy<6>_rt),
        .O(Madd_bird_color_on_add0004_cy<6>)
    );
    XORCY Madd_bird_color_on_add0004_xor<6>
    (
        .CI(Madd_bird_color_on_add0004_cy<5>),
        .LI(Madd_bird_color_on_add0004_cy<6>_rt),
        .O(bird_color_on_add0004<6>)
    );
    MUXCY Madd_bird_color_on_add0004_cy<7>
    (
        .CI(Madd_bird_color_on_add0004_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0004_cy<7>_rt),
        .O(Madd_bird_color_on_add0004_cy<7>)
    );
    XORCY Madd_bird_color_on_add0004_xor<7>
    (
        .CI(Madd_bird_color_on_add0004_cy<6>),
        .LI(Madd_bird_color_on_add0004_cy<7>_rt),
        .O(bird_color_on_add0004<7>)
    );
    MUXCY Madd_bird_color_on_add0004_cy<8>
    (
        .CI(Madd_bird_color_on_add0004_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0004_cy<8>_rt),
        .O(Madd_bird_color_on_add0004_cy<8>)
    );
    XORCY Madd_bird_color_on_add0004_xor<8>
    (
        .CI(Madd_bird_color_on_add0004_cy<7>),
        .LI(Madd_bird_color_on_add0004_cy<8>_rt),
        .O(bird_color_on_add0004<8>)
    );
    XORCY Madd_bird_color_on_add0004_xor<9>
    (
        .CI(Madd_bird_color_on_add0004_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_color_on_add0004<9>)
    );
    MUXCY Madd_bird_color_on_add0005_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0005_lut<0>),
        .O(Madd_bird_color_on_add0005_cy<0>)
    );
    XORCY Madd_bird_color_on_add0005_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_color_on_add0005_lut<0>),
        .O(bird_color_on_add0005<0>)
    );
    MUXCY Madd_bird_color_on_add0005_cy<1>
    (
        .CI(Madd_bird_color_on_add0005_cy<0>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0005_lut<1>),
        .O(Madd_bird_color_on_add0005_cy<1>)
    );
    XORCY Madd_bird_color_on_add0005_xor<1>
    (
        .CI(Madd_bird_color_on_add0005_cy<0>),
        .LI(Madd_bird_color_on_add0005_lut<1>),
        .O(bird_color_on_add0005<1>)
    );
    MUXCY Madd_bird_color_on_add0005_cy<2>
    (
        .CI(Madd_bird_color_on_add0005_cy<1>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0005_lut<2>),
        .O(Madd_bird_color_on_add0005_cy<2>)
    );
    XORCY Madd_bird_color_on_add0005_xor<2>
    (
        .CI(Madd_bird_color_on_add0005_cy<1>),
        .LI(Madd_bird_color_on_add0005_lut<2>),
        .O(bird_color_on_add0005<2>)
    );
    MUXCY Madd_bird_color_on_add0005_cy<3>
    (
        .CI(Madd_bird_color_on_add0005_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0005_cy<3>_rt),
        .O(Madd_bird_color_on_add0005_cy<3>)
    );
    XORCY Madd_bird_color_on_add0005_xor<3>
    (
        .CI(Madd_bird_color_on_add0005_cy<2>),
        .LI(Madd_bird_color_on_add0005_cy<3>_rt),
        .O(bird_color_on_add0005<3>)
    );
    MUXCY Madd_bird_color_on_add0005_cy<4>
    (
        .CI(Madd_bird_color_on_add0005_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0005_cy<4>_rt),
        .O(Madd_bird_color_on_add0005_cy<4>)
    );
    XORCY Madd_bird_color_on_add0005_xor<4>
    (
        .CI(Madd_bird_color_on_add0005_cy<3>),
        .LI(Madd_bird_color_on_add0005_cy<4>_rt),
        .O(bird_color_on_add0005<4>)
    );
    MUXCY Madd_bird_color_on_add0005_cy<5>
    (
        .CI(Madd_bird_color_on_add0005_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0005_cy<5>_rt),
        .O(Madd_bird_color_on_add0005_cy<5>)
    );
    XORCY Madd_bird_color_on_add0005_xor<5>
    (
        .CI(Madd_bird_color_on_add0005_cy<4>),
        .LI(Madd_bird_color_on_add0005_cy<5>_rt),
        .O(bird_color_on_add0005<5>)
    );
    MUXCY Madd_bird_color_on_add0005_cy<6>
    (
        .CI(Madd_bird_color_on_add0005_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0005_cy<6>_rt),
        .O(Madd_bird_color_on_add0005_cy<6>)
    );
    XORCY Madd_bird_color_on_add0005_xor<6>
    (
        .CI(Madd_bird_color_on_add0005_cy<5>),
        .LI(Madd_bird_color_on_add0005_cy<6>_rt),
        .O(bird_color_on_add0005<6>)
    );
    MUXCY Madd_bird_color_on_add0005_cy<7>
    (
        .CI(Madd_bird_color_on_add0005_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0005_cy<7>_rt),
        .O(Madd_bird_color_on_add0005_cy<7>)
    );
    XORCY Madd_bird_color_on_add0005_xor<7>
    (
        .CI(Madd_bird_color_on_add0005_cy<6>),
        .LI(Madd_bird_color_on_add0005_cy<7>_rt),
        .O(bird_color_on_add0005<7>)
    );
    MUXCY Madd_bird_color_on_add0005_cy<8>
    (
        .CI(Madd_bird_color_on_add0005_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0005_cy<8>_rt),
        .O(Madd_bird_color_on_add0005_cy<8>)
    );
    XORCY Madd_bird_color_on_add0005_xor<8>
    (
        .CI(Madd_bird_color_on_add0005_cy<7>),
        .LI(Madd_bird_color_on_add0005_cy<8>_rt),
        .O(bird_color_on_add0005<8>)
    );
    XORCY Madd_bird_color_on_add0005_xor<9>
    (
        .CI(Madd_bird_color_on_add0005_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_color_on_add0005<9>)
    );
    MUXCY Madd_bird_color_on_add0007_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0007_lut<0>),
        .O(Madd_bird_color_on_add0007_cy<0>)
    );
    XORCY Madd_bird_color_on_add0007_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_color_on_add0007_lut<0>),
        .O(bird_color_on_add0007<0>)
    );
    MUXCY Madd_bird_color_on_add0007_cy<1>
    (
        .CI(Madd_bird_color_on_add0007_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0007_cy<1>_rt),
        .O(Madd_bird_color_on_add0007_cy<1>)
    );
    XORCY Madd_bird_color_on_add0007_xor<1>
    (
        .CI(Madd_bird_color_on_add0007_cy<0>),
        .LI(Madd_bird_color_on_add0007_cy<1>_rt),
        .O(bird_color_on_add0007<1>)
    );
    MUXCY Madd_bird_color_on_add0007_cy<2>
    (
        .CI(Madd_bird_color_on_add0007_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0007_cy<2>_rt),
        .O(Madd_bird_color_on_add0007_cy<2>)
    );
    XORCY Madd_bird_color_on_add0007_xor<2>
    (
        .CI(Madd_bird_color_on_add0007_cy<1>),
        .LI(Madd_bird_color_on_add0007_cy<2>_rt),
        .O(bird_color_on_add0007<2>)
    );
    MUXCY Madd_bird_color_on_add0007_cy<3>
    (
        .CI(Madd_bird_color_on_add0007_cy<2>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0007_lut<3>1),
        .O(Madd_bird_color_on_add0007_cy<3>)
    );
    XORCY Madd_bird_color_on_add0007_xor<3>
    (
        .CI(Madd_bird_color_on_add0007_cy<2>),
        .LI(Madd_bird_color_on_add0007_lut<3>1),
        .O(bird_color_on_add0007<3>)
    );
    MUXCY Madd_bird_color_on_add0007_cy<4>
    (
        .CI(Madd_bird_color_on_add0007_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0007_cy<4>_rt),
        .O(Madd_bird_color_on_add0007_cy<4>)
    );
    XORCY Madd_bird_color_on_add0007_xor<4>
    (
        .CI(Madd_bird_color_on_add0007_cy<3>),
        .LI(Madd_bird_color_on_add0007_cy<4>_rt),
        .O(bird_color_on_add0007<4>)
    );
    MUXCY Madd_bird_color_on_add0007_cy<5>
    (
        .CI(Madd_bird_color_on_add0007_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0007_cy<5>_rt),
        .O(Madd_bird_color_on_add0007_cy<5>)
    );
    XORCY Madd_bird_color_on_add0007_xor<5>
    (
        .CI(Madd_bird_color_on_add0007_cy<4>),
        .LI(Madd_bird_color_on_add0007_cy<5>_rt),
        .O(bird_color_on_add0007<5>)
    );
    MUXCY Madd_bird_color_on_add0007_cy<6>
    (
        .CI(Madd_bird_color_on_add0007_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0007_cy<6>_rt),
        .O(Madd_bird_color_on_add0007_cy<6>)
    );
    XORCY Madd_bird_color_on_add0007_xor<6>
    (
        .CI(Madd_bird_color_on_add0007_cy<5>),
        .LI(Madd_bird_color_on_add0007_cy<6>_rt),
        .O(bird_color_on_add0007<6>)
    );
    MUXCY Madd_bird_color_on_add0007_cy<7>
    (
        .CI(Madd_bird_color_on_add0007_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0007_cy<7>_rt),
        .O(Madd_bird_color_on_add0007_cy<7>)
    );
    XORCY Madd_bird_color_on_add0007_xor<7>
    (
        .CI(Madd_bird_color_on_add0007_cy<6>),
        .LI(Madd_bird_color_on_add0007_cy<7>_rt),
        .O(bird_color_on_add0007<7>)
    );
    MUXCY Madd_bird_color_on_add0007_cy<8>
    (
        .CI(Madd_bird_color_on_add0007_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0007_cy<8>_rt),
        .O(Madd_bird_color_on_add0007_cy<8>)
    );
    XORCY Madd_bird_color_on_add0007_xor<8>
    (
        .CI(Madd_bird_color_on_add0007_cy<7>),
        .LI(Madd_bird_color_on_add0007_cy<8>_rt),
        .O(bird_color_on_add0007<8>)
    );
    XORCY Madd_bird_color_on_add0007_xor<9>
    (
        .CI(Madd_bird_color_on_add0007_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_color_on_add0007<9>)
    );
    MUXCY Madd_bird_color_on_add0008_cy<1>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0008_lut<1>),
        .O(Madd_bird_color_on_add0008_cy<1>)
    );
    XORCY Madd_bird_color_on_add0008_xor<1>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_color_on_add0008_lut<1>),
        .O(bird_color_on_add0008<1>)
    );
    MUXCY Madd_bird_color_on_add0008_cy<2>
    (
        .CI(Madd_bird_color_on_add0008_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0008_cy<2>_rt),
        .O(Madd_bird_color_on_add0008_cy<2>)
    );
    XORCY Madd_bird_color_on_add0008_xor<2>
    (
        .CI(Madd_bird_color_on_add0008_cy<1>),
        .LI(Madd_bird_color_on_add0008_cy<2>_rt),
        .O(bird_color_on_add0008<2>)
    );
    MUXCY Madd_bird_color_on_add0008_cy<3>
    (
        .CI(Madd_bird_color_on_add0008_cy<2>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0008_lut<3>),
        .O(Madd_bird_color_on_add0008_cy<3>)
    );
    XORCY Madd_bird_color_on_add0008_xor<3>
    (
        .CI(Madd_bird_color_on_add0008_cy<2>),
        .LI(Madd_bird_color_on_add0008_lut<3>),
        .O(bird_color_on_add0008<3>)
    );
    MUXCY Madd_bird_color_on_add0008_cy<4>
    (
        .CI(Madd_bird_color_on_add0008_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0008_cy<4>_rt),
        .O(Madd_bird_color_on_add0008_cy<4>)
    );
    XORCY Madd_bird_color_on_add0008_xor<4>
    (
        .CI(Madd_bird_color_on_add0008_cy<3>),
        .LI(Madd_bird_color_on_add0008_cy<4>_rt),
        .O(bird_color_on_add0008<4>)
    );
    MUXCY Madd_bird_color_on_add0008_cy<5>
    (
        .CI(Madd_bird_color_on_add0008_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0008_cy<5>_rt),
        .O(Madd_bird_color_on_add0008_cy<5>)
    );
    XORCY Madd_bird_color_on_add0008_xor<5>
    (
        .CI(Madd_bird_color_on_add0008_cy<4>),
        .LI(Madd_bird_color_on_add0008_cy<5>_rt),
        .O(bird_color_on_add0008<5>)
    );
    MUXCY Madd_bird_color_on_add0008_cy<6>
    (
        .CI(Madd_bird_color_on_add0008_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0008_cy<6>_rt),
        .O(Madd_bird_color_on_add0008_cy<6>)
    );
    XORCY Madd_bird_color_on_add0008_xor<6>
    (
        .CI(Madd_bird_color_on_add0008_cy<5>),
        .LI(Madd_bird_color_on_add0008_cy<6>_rt),
        .O(bird_color_on_add0008<6>)
    );
    MUXCY Madd_bird_color_on_add0008_cy<7>
    (
        .CI(Madd_bird_color_on_add0008_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0008_cy<7>_rt),
        .O(Madd_bird_color_on_add0008_cy<7>)
    );
    XORCY Madd_bird_color_on_add0008_xor<7>
    (
        .CI(Madd_bird_color_on_add0008_cy<6>),
        .LI(Madd_bird_color_on_add0008_cy<7>_rt),
        .O(bird_color_on_add0008<7>)
    );
    MUXCY Madd_bird_color_on_add0008_cy<8>
    (
        .CI(Madd_bird_color_on_add0008_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0008_cy<8>_rt),
        .O(Madd_bird_color_on_add0008_cy<8>)
    );
    XORCY Madd_bird_color_on_add0008_xor<8>
    (
        .CI(Madd_bird_color_on_add0008_cy<7>),
        .LI(Madd_bird_color_on_add0008_cy<8>_rt),
        .O(bird_color_on_add0008<8>)
    );
    XORCY Madd_bird_color_on_add0008_xor<9>
    (
        .CI(Madd_bird_color_on_add0008_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_color_on_add0008<9>)
    );
    MUXCY Madd_bird_color_on_add0009_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0009_lut<0>),
        .O(Madd_bird_color_on_add0009_cy<0>)
    );
    XORCY Madd_bird_color_on_add0009_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_color_on_add0009_lut<0>),
        .O(bird_color_on_add0009<0>)
    );
    MUXCY Madd_bird_color_on_add0009_cy<1>
    (
        .CI(Madd_bird_color_on_add0009_cy<0>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0009_lut<1>),
        .O(Madd_bird_color_on_add0009_cy<1>)
    );
    XORCY Madd_bird_color_on_add0009_xor<1>
    (
        .CI(Madd_bird_color_on_add0009_cy<0>),
        .LI(Madd_bird_color_on_add0009_lut<1>),
        .O(bird_color_on_add0009<1>)
    );
    MUXCY Madd_bird_color_on_add0009_cy<2>
    (
        .CI(Madd_bird_color_on_add0009_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0009_cy<2>_rt),
        .O(Madd_bird_color_on_add0009_cy<2>)
    );
    XORCY Madd_bird_color_on_add0009_xor<2>
    (
        .CI(Madd_bird_color_on_add0009_cy<1>),
        .LI(Madd_bird_color_on_add0009_cy<2>_rt),
        .O(bird_color_on_add0009<2>)
    );
    MUXCY Madd_bird_color_on_add0009_cy<3>
    (
        .CI(Madd_bird_color_on_add0009_cy<2>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0009_lut<3>),
        .O(Madd_bird_color_on_add0009_cy<3>)
    );
    XORCY Madd_bird_color_on_add0009_xor<3>
    (
        .CI(Madd_bird_color_on_add0009_cy<2>),
        .LI(Madd_bird_color_on_add0009_lut<3>),
        .O(bird_color_on_add0009<3>)
    );
    MUXCY Madd_bird_color_on_add0009_cy<4>
    (
        .CI(Madd_bird_color_on_add0009_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0009_cy<4>_rt),
        .O(Madd_bird_color_on_add0009_cy<4>)
    );
    XORCY Madd_bird_color_on_add0009_xor<4>
    (
        .CI(Madd_bird_color_on_add0009_cy<3>),
        .LI(Madd_bird_color_on_add0009_cy<4>_rt),
        .O(bird_color_on_add0009<4>)
    );
    MUXCY Madd_bird_color_on_add0009_cy<5>
    (
        .CI(Madd_bird_color_on_add0009_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0009_cy<5>_rt),
        .O(Madd_bird_color_on_add0009_cy<5>)
    );
    XORCY Madd_bird_color_on_add0009_xor<5>
    (
        .CI(Madd_bird_color_on_add0009_cy<4>),
        .LI(Madd_bird_color_on_add0009_cy<5>_rt),
        .O(bird_color_on_add0009<5>)
    );
    MUXCY Madd_bird_color_on_add0009_cy<6>
    (
        .CI(Madd_bird_color_on_add0009_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0009_cy<6>_rt),
        .O(Madd_bird_color_on_add0009_cy<6>)
    );
    XORCY Madd_bird_color_on_add0009_xor<6>
    (
        .CI(Madd_bird_color_on_add0009_cy<5>),
        .LI(Madd_bird_color_on_add0009_cy<6>_rt),
        .O(bird_color_on_add0009<6>)
    );
    MUXCY Madd_bird_color_on_add0009_cy<7>
    (
        .CI(Madd_bird_color_on_add0009_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0009_cy<7>_rt),
        .O(Madd_bird_color_on_add0009_cy<7>)
    );
    XORCY Madd_bird_color_on_add0009_xor<7>
    (
        .CI(Madd_bird_color_on_add0009_cy<6>),
        .LI(Madd_bird_color_on_add0009_cy<7>_rt),
        .O(bird_color_on_add0009<7>)
    );
    MUXCY Madd_bird_color_on_add0009_cy<8>
    (
        .CI(Madd_bird_color_on_add0009_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0009_cy<8>_rt),
        .O(Madd_bird_color_on_add0009_cy<8>)
    );
    XORCY Madd_bird_color_on_add0009_xor<8>
    (
        .CI(Madd_bird_color_on_add0009_cy<7>),
        .LI(Madd_bird_color_on_add0009_cy<8>_rt),
        .O(bird_color_on_add0009<8>)
    );
    XORCY Madd_bird_color_on_add0009_xor<9>
    (
        .CI(Madd_bird_color_on_add0009_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_color_on_add0009<9>)
    );
    MUXCY Madd_bird_color_on_add0012_cy<1>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0012_lut<1>),
        .O(Madd_bird_color_on_add0012_cy<1>)
    );
    XORCY Madd_bird_color_on_add0012_xor<1>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_color_on_add0012_lut<1>),
        .O(bird_color_on_add0012<1>)
    );
    MUXCY Madd_bird_color_on_add0012_cy<2>
    (
        .CI(Madd_bird_color_on_add0012_cy<1>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0012_lut<2>),
        .O(Madd_bird_color_on_add0012_cy<2>)
    );
    XORCY Madd_bird_color_on_add0012_xor<2>
    (
        .CI(Madd_bird_color_on_add0012_cy<1>),
        .LI(Madd_bird_color_on_add0012_lut<2>),
        .O(bird_color_on_add0012<2>)
    );
    MUXCY Madd_bird_color_on_add0012_cy<3>
    (
        .CI(Madd_bird_color_on_add0012_cy<2>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0012_lut<3>),
        .O(Madd_bird_color_on_add0012_cy<3>)
    );
    XORCY Madd_bird_color_on_add0012_xor<3>
    (
        .CI(Madd_bird_color_on_add0012_cy<2>),
        .LI(Madd_bird_color_on_add0012_lut<3>),
        .O(bird_color_on_add0012<3>)
    );
    MUXCY Madd_bird_color_on_add0012_cy<4>
    (
        .CI(Madd_bird_color_on_add0012_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0012_cy<4>_rt),
        .O(Madd_bird_color_on_add0012_cy<4>)
    );
    XORCY Madd_bird_color_on_add0012_xor<4>
    (
        .CI(Madd_bird_color_on_add0012_cy<3>),
        .LI(Madd_bird_color_on_add0012_cy<4>_rt),
        .O(bird_color_on_add0012<4>)
    );
    MUXCY Madd_bird_color_on_add0012_cy<5>
    (
        .CI(Madd_bird_color_on_add0012_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0012_cy<5>_rt),
        .O(Madd_bird_color_on_add0012_cy<5>)
    );
    XORCY Madd_bird_color_on_add0012_xor<5>
    (
        .CI(Madd_bird_color_on_add0012_cy<4>),
        .LI(Madd_bird_color_on_add0012_cy<5>_rt),
        .O(bird_color_on_add0012<5>)
    );
    MUXCY Madd_bird_color_on_add0012_cy<6>
    (
        .CI(Madd_bird_color_on_add0012_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0012_cy<6>_rt),
        .O(Madd_bird_color_on_add0012_cy<6>)
    );
    XORCY Madd_bird_color_on_add0012_xor<6>
    (
        .CI(Madd_bird_color_on_add0012_cy<5>),
        .LI(Madd_bird_color_on_add0012_cy<6>_rt),
        .O(bird_color_on_add0012<6>)
    );
    MUXCY Madd_bird_color_on_add0012_cy<7>
    (
        .CI(Madd_bird_color_on_add0012_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0012_cy<7>_rt),
        .O(Madd_bird_color_on_add0012_cy<7>)
    );
    XORCY Madd_bird_color_on_add0012_xor<7>
    (
        .CI(Madd_bird_color_on_add0012_cy<6>),
        .LI(Madd_bird_color_on_add0012_cy<7>_rt),
        .O(bird_color_on_add0012<7>)
    );
    MUXCY Madd_bird_color_on_add0012_cy<8>
    (
        .CI(Madd_bird_color_on_add0012_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0012_cy<8>_rt),
        .O(Madd_bird_color_on_add0012_cy<8>)
    );
    XORCY Madd_bird_color_on_add0012_xor<8>
    (
        .CI(Madd_bird_color_on_add0012_cy<7>),
        .LI(Madd_bird_color_on_add0012_cy<8>_rt),
        .O(bird_color_on_add0012<8>)
    );
    XORCY Madd_bird_color_on_add0012_xor<9>
    (
        .CI(Madd_bird_color_on_add0012_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_color_on_add0012<9>)
    );
    MUXCY Madd_bird_color_on_add0011_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0011_lut<0>),
        .O(Madd_bird_color_on_add0011_cy<0>)
    );
    XORCY Madd_bird_color_on_add0011_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_color_on_add0011_lut<0>),
        .O(bird_color_on_add0011<0>)
    );
    MUXCY Madd_bird_color_on_add0011_cy<1>
    (
        .CI(Madd_bird_color_on_add0011_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0011_cy<1>_rt),
        .O(Madd_bird_color_on_add0011_cy<1>)
    );
    XORCY Madd_bird_color_on_add0011_xor<1>
    (
        .CI(Madd_bird_color_on_add0011_cy<0>),
        .LI(Madd_bird_color_on_add0011_cy<1>_rt),
        .O(bird_color_on_add0011<1>)
    );
    MUXCY Madd_bird_color_on_add0011_cy<2>
    (
        .CI(Madd_bird_color_on_add0011_cy<1>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0011_lut<2>),
        .O(Madd_bird_color_on_add0011_cy<2>)
    );
    XORCY Madd_bird_color_on_add0011_xor<2>
    (
        .CI(Madd_bird_color_on_add0011_cy<1>),
        .LI(Madd_bird_color_on_add0011_lut<2>),
        .O(bird_color_on_add0011<2>)
    );
    MUXCY Madd_bird_color_on_add0011_cy<3>
    (
        .CI(Madd_bird_color_on_add0011_cy<2>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0011_lut<3>),
        .O(Madd_bird_color_on_add0011_cy<3>)
    );
    XORCY Madd_bird_color_on_add0011_xor<3>
    (
        .CI(Madd_bird_color_on_add0011_cy<2>),
        .LI(Madd_bird_color_on_add0011_lut<3>),
        .O(bird_color_on_add0011<3>)
    );
    MUXCY Madd_bird_color_on_add0011_cy<4>
    (
        .CI(Madd_bird_color_on_add0011_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0011_cy<4>_rt),
        .O(Madd_bird_color_on_add0011_cy<4>)
    );
    XORCY Madd_bird_color_on_add0011_xor<4>
    (
        .CI(Madd_bird_color_on_add0011_cy<3>),
        .LI(Madd_bird_color_on_add0011_cy<4>_rt),
        .O(bird_color_on_add0011<4>)
    );
    MUXCY Madd_bird_color_on_add0011_cy<5>
    (
        .CI(Madd_bird_color_on_add0011_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0011_cy<5>_rt),
        .O(Madd_bird_color_on_add0011_cy<5>)
    );
    XORCY Madd_bird_color_on_add0011_xor<5>
    (
        .CI(Madd_bird_color_on_add0011_cy<4>),
        .LI(Madd_bird_color_on_add0011_cy<5>_rt),
        .O(bird_color_on_add0011<5>)
    );
    MUXCY Madd_bird_color_on_add0011_cy<6>
    (
        .CI(Madd_bird_color_on_add0011_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0011_cy<6>_rt),
        .O(Madd_bird_color_on_add0011_cy<6>)
    );
    XORCY Madd_bird_color_on_add0011_xor<6>
    (
        .CI(Madd_bird_color_on_add0011_cy<5>),
        .LI(Madd_bird_color_on_add0011_cy<6>_rt),
        .O(bird_color_on_add0011<6>)
    );
    MUXCY Madd_bird_color_on_add0011_cy<7>
    (
        .CI(Madd_bird_color_on_add0011_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0011_cy<7>_rt),
        .O(Madd_bird_color_on_add0011_cy<7>)
    );
    XORCY Madd_bird_color_on_add0011_xor<7>
    (
        .CI(Madd_bird_color_on_add0011_cy<6>),
        .LI(Madd_bird_color_on_add0011_cy<7>_rt),
        .O(bird_color_on_add0011<7>)
    );
    MUXCY Madd_bird_color_on_add0011_cy<8>
    (
        .CI(Madd_bird_color_on_add0011_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0011_cy<8>_rt),
        .O(Madd_bird_color_on_add0011_cy<8>)
    );
    XORCY Madd_bird_color_on_add0011_xor<8>
    (
        .CI(Madd_bird_color_on_add0011_cy<7>),
        .LI(Madd_bird_color_on_add0011_cy<8>_rt),
        .O(bird_color_on_add0011<8>)
    );
    XORCY Madd_bird_color_on_add0011_xor<9>
    (
        .CI(Madd_bird_color_on_add0011_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_color_on_add0011<9>)
    );
    MUXCY Madd_bird_color_on_add0013_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0013_lut<0>),
        .O(Madd_bird_color_on_add0013_cy<0>)
    );
    XORCY Madd_bird_color_on_add0013_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_color_on_add0013_lut<0>),
        .O(bird_color_on_add0013<0>)
    );
    MUXCY Madd_bird_color_on_add0013_cy<1>
    (
        .CI(Madd_bird_color_on_add0013_cy<0>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0013_lut<1>),
        .O(Madd_bird_color_on_add0013_cy<1>)
    );
    XORCY Madd_bird_color_on_add0013_xor<1>
    (
        .CI(Madd_bird_color_on_add0013_cy<0>),
        .LI(Madd_bird_color_on_add0013_lut<1>),
        .O(bird_color_on_add0013<1>)
    );
    MUXCY Madd_bird_color_on_add0013_cy<2>
    (
        .CI(Madd_bird_color_on_add0013_cy<1>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0013_lut<2>),
        .O(Madd_bird_color_on_add0013_cy<2>)
    );
    XORCY Madd_bird_color_on_add0013_xor<2>
    (
        .CI(Madd_bird_color_on_add0013_cy<1>),
        .LI(Madd_bird_color_on_add0013_lut<2>),
        .O(bird_color_on_add0013<2>)
    );
    MUXCY Madd_bird_color_on_add0013_cy<3>
    (
        .CI(Madd_bird_color_on_add0013_cy<2>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0013_lut<3>),
        .O(Madd_bird_color_on_add0013_cy<3>)
    );
    XORCY Madd_bird_color_on_add0013_xor<3>
    (
        .CI(Madd_bird_color_on_add0013_cy<2>),
        .LI(Madd_bird_color_on_add0013_lut<3>),
        .O(bird_color_on_add0013<3>)
    );
    MUXCY Madd_bird_color_on_add0013_cy<4>
    (
        .CI(Madd_bird_color_on_add0013_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0013_cy<4>_rt),
        .O(Madd_bird_color_on_add0013_cy<4>)
    );
    XORCY Madd_bird_color_on_add0013_xor<4>
    (
        .CI(Madd_bird_color_on_add0013_cy<3>),
        .LI(Madd_bird_color_on_add0013_cy<4>_rt),
        .O(bird_color_on_add0013<4>)
    );
    MUXCY Madd_bird_color_on_add0013_cy<5>
    (
        .CI(Madd_bird_color_on_add0013_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0013_cy<5>_rt),
        .O(Madd_bird_color_on_add0013_cy<5>)
    );
    XORCY Madd_bird_color_on_add0013_xor<5>
    (
        .CI(Madd_bird_color_on_add0013_cy<4>),
        .LI(Madd_bird_color_on_add0013_cy<5>_rt),
        .O(bird_color_on_add0013<5>)
    );
    MUXCY Madd_bird_color_on_add0013_cy<6>
    (
        .CI(Madd_bird_color_on_add0013_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0013_cy<6>_rt),
        .O(Madd_bird_color_on_add0013_cy<6>)
    );
    XORCY Madd_bird_color_on_add0013_xor<6>
    (
        .CI(Madd_bird_color_on_add0013_cy<5>),
        .LI(Madd_bird_color_on_add0013_cy<6>_rt),
        .O(bird_color_on_add0013<6>)
    );
    MUXCY Madd_bird_color_on_add0013_cy<7>
    (
        .CI(Madd_bird_color_on_add0013_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0013_cy<7>_rt),
        .O(Madd_bird_color_on_add0013_cy<7>)
    );
    XORCY Madd_bird_color_on_add0013_xor<7>
    (
        .CI(Madd_bird_color_on_add0013_cy<6>),
        .LI(Madd_bird_color_on_add0013_cy<7>_rt),
        .O(bird_color_on_add0013<7>)
    );
    MUXCY Madd_bird_color_on_add0013_cy<8>
    (
        .CI(Madd_bird_color_on_add0013_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0013_cy<8>_rt),
        .O(Madd_bird_color_on_add0013_cy<8>)
    );
    XORCY Madd_bird_color_on_add0013_xor<8>
    (
        .CI(Madd_bird_color_on_add0013_cy<7>),
        .LI(Madd_bird_color_on_add0013_cy<8>_rt),
        .O(bird_color_on_add0013<8>)
    );
    XORCY Madd_bird_color_on_add0013_xor<9>
    (
        .CI(Madd_bird_color_on_add0013_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_color_on_add0013<9>)
    );
    MUXCY Madd_bird_color_on_add0015_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0015_lut<0>),
        .O(Madd_bird_color_on_add0015_cy<0>)
    );
    XORCY Madd_bird_color_on_add0015_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_color_on_add0015_lut<0>),
        .O(bird_color_on_add0015<0>)
    );
    MUXCY Madd_bird_color_on_add0015_cy<1>
    (
        .CI(Madd_bird_color_on_add0015_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0015_cy<1>_rt),
        .O(Madd_bird_color_on_add0015_cy<1>)
    );
    XORCY Madd_bird_color_on_add0015_xor<1>
    (
        .CI(Madd_bird_color_on_add0015_cy<0>),
        .LI(Madd_bird_color_on_add0015_cy<1>_rt),
        .O(bird_color_on_add0015<1>)
    );
    MUXCY Madd_bird_color_on_add0015_cy<2>
    (
        .CI(Madd_bird_color_on_add0015_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0015_cy<2>_rt),
        .O(Madd_bird_color_on_add0015_cy<2>)
    );
    XORCY Madd_bird_color_on_add0015_xor<2>
    (
        .CI(Madd_bird_color_on_add0015_cy<1>),
        .LI(Madd_bird_color_on_add0015_cy<2>_rt),
        .O(bird_color_on_add0015<2>)
    );
    MUXCY Madd_bird_color_on_add0015_cy<3>
    (
        .CI(Madd_bird_color_on_add0015_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0015_cy<3>_rt),
        .O(Madd_bird_color_on_add0015_cy<3>)
    );
    XORCY Madd_bird_color_on_add0015_xor<3>
    (
        .CI(Madd_bird_color_on_add0015_cy<2>),
        .LI(Madd_bird_color_on_add0015_cy<3>_rt),
        .O(bird_color_on_add0015<3>)
    );
    MUXCY Madd_bird_color_on_add0015_cy<4>
    (
        .CI(Madd_bird_color_on_add0015_cy<3>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0015_lut<4>1),
        .O(Madd_bird_color_on_add0015_cy<4>)
    );
    XORCY Madd_bird_color_on_add0015_xor<4>
    (
        .CI(Madd_bird_color_on_add0015_cy<3>),
        .LI(Madd_bird_color_on_add0015_lut<4>1),
        .O(bird_color_on_add0015<4>)
    );
    MUXCY Madd_bird_color_on_add0015_cy<5>
    (
        .CI(Madd_bird_color_on_add0015_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0015_cy<5>_rt),
        .O(Madd_bird_color_on_add0015_cy<5>)
    );
    XORCY Madd_bird_color_on_add0015_xor<5>
    (
        .CI(Madd_bird_color_on_add0015_cy<4>),
        .LI(Madd_bird_color_on_add0015_cy<5>_rt),
        .O(bird_color_on_add0015<5>)
    );
    MUXCY Madd_bird_color_on_add0015_cy<6>
    (
        .CI(Madd_bird_color_on_add0015_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0015_cy<6>_rt),
        .O(Madd_bird_color_on_add0015_cy<6>)
    );
    XORCY Madd_bird_color_on_add0015_xor<6>
    (
        .CI(Madd_bird_color_on_add0015_cy<5>),
        .LI(Madd_bird_color_on_add0015_cy<6>_rt),
        .O(bird_color_on_add0015<6>)
    );
    MUXCY Madd_bird_color_on_add0015_cy<7>
    (
        .CI(Madd_bird_color_on_add0015_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0015_cy<7>_rt),
        .O(Madd_bird_color_on_add0015_cy<7>)
    );
    XORCY Madd_bird_color_on_add0015_xor<7>
    (
        .CI(Madd_bird_color_on_add0015_cy<6>),
        .LI(Madd_bird_color_on_add0015_cy<7>_rt),
        .O(bird_color_on_add0015<7>)
    );
    MUXCY Madd_bird_color_on_add0015_cy<8>
    (
        .CI(Madd_bird_color_on_add0015_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0015_cy<8>_rt),
        .O(Madd_bird_color_on_add0015_cy<8>)
    );
    XORCY Madd_bird_color_on_add0015_xor<8>
    (
        .CI(Madd_bird_color_on_add0015_cy<7>),
        .LI(Madd_bird_color_on_add0015_cy<8>_rt),
        .O(bird_color_on_add0015<8>)
    );
    XORCY Madd_bird_color_on_add0015_xor<9>
    (
        .CI(Madd_bird_color_on_add0015_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_color_on_add0015<9>)
    );
    MUXCY Madd_bird_color_on_add0016_cy<1>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0016_lut<1>),
        .O(Madd_bird_color_on_add0016_cy<1>)
    );
    XORCY Madd_bird_color_on_add0016_xor<1>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_color_on_add0016_lut<1>),
        .O(bird_color_on_add0016<1>)
    );
    MUXCY Madd_bird_color_on_add0016_cy<2>
    (
        .CI(Madd_bird_color_on_add0016_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0016_cy<2>_rt),
        .O(Madd_bird_color_on_add0016_cy<2>)
    );
    XORCY Madd_bird_color_on_add0016_xor<2>
    (
        .CI(Madd_bird_color_on_add0016_cy<1>),
        .LI(Madd_bird_color_on_add0016_cy<2>_rt),
        .O(bird_color_on_add0016<2>)
    );
    MUXCY Madd_bird_color_on_add0016_cy<3>
    (
        .CI(Madd_bird_color_on_add0016_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0016_cy<3>_rt),
        .O(Madd_bird_color_on_add0016_cy<3>)
    );
    XORCY Madd_bird_color_on_add0016_xor<3>
    (
        .CI(Madd_bird_color_on_add0016_cy<2>),
        .LI(Madd_bird_color_on_add0016_cy<3>_rt),
        .O(bird_color_on_add0016<3>)
    );
    MUXCY Madd_bird_color_on_add0016_cy<4>
    (
        .CI(Madd_bird_color_on_add0016_cy<3>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0016_lut<4>),
        .O(Madd_bird_color_on_add0016_cy<4>)
    );
    XORCY Madd_bird_color_on_add0016_xor<4>
    (
        .CI(Madd_bird_color_on_add0016_cy<3>),
        .LI(Madd_bird_color_on_add0016_lut<4>),
        .O(bird_color_on_add0016<4>)
    );
    MUXCY Madd_bird_color_on_add0016_cy<5>
    (
        .CI(Madd_bird_color_on_add0016_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0016_cy<5>_rt),
        .O(Madd_bird_color_on_add0016_cy<5>)
    );
    XORCY Madd_bird_color_on_add0016_xor<5>
    (
        .CI(Madd_bird_color_on_add0016_cy<4>),
        .LI(Madd_bird_color_on_add0016_cy<5>_rt),
        .O(bird_color_on_add0016<5>)
    );
    MUXCY Madd_bird_color_on_add0016_cy<6>
    (
        .CI(Madd_bird_color_on_add0016_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0016_cy<6>_rt),
        .O(Madd_bird_color_on_add0016_cy<6>)
    );
    XORCY Madd_bird_color_on_add0016_xor<6>
    (
        .CI(Madd_bird_color_on_add0016_cy<5>),
        .LI(Madd_bird_color_on_add0016_cy<6>_rt),
        .O(bird_color_on_add0016<6>)
    );
    MUXCY Madd_bird_color_on_add0016_cy<7>
    (
        .CI(Madd_bird_color_on_add0016_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0016_cy<7>_rt),
        .O(Madd_bird_color_on_add0016_cy<7>)
    );
    XORCY Madd_bird_color_on_add0016_xor<7>
    (
        .CI(Madd_bird_color_on_add0016_cy<6>),
        .LI(Madd_bird_color_on_add0016_cy<7>_rt),
        .O(bird_color_on_add0016<7>)
    );
    MUXCY Madd_bird_color_on_add0016_cy<8>
    (
        .CI(Madd_bird_color_on_add0016_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0016_cy<8>_rt),
        .O(Madd_bird_color_on_add0016_cy<8>)
    );
    XORCY Madd_bird_color_on_add0016_xor<8>
    (
        .CI(Madd_bird_color_on_add0016_cy<7>),
        .LI(Madd_bird_color_on_add0016_cy<8>_rt),
        .O(bird_color_on_add0016<8>)
    );
    XORCY Madd_bird_color_on_add0016_xor<9>
    (
        .CI(Madd_bird_color_on_add0016_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_color_on_add0016<9>)
    );
    MUXCY Madd_bird_color_on_add0017_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0017_lut<0>),
        .O(Madd_bird_color_on_add0017_cy<0>)
    );
    XORCY Madd_bird_color_on_add0017_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_color_on_add0017_lut<0>),
        .O(bird_color_on_add0017<0>)
    );
    MUXCY Madd_bird_color_on_add0017_cy<1>
    (
        .CI(Madd_bird_color_on_add0017_cy<0>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0017_lut<1>),
        .O(Madd_bird_color_on_add0017_cy<1>)
    );
    XORCY Madd_bird_color_on_add0017_xor<1>
    (
        .CI(Madd_bird_color_on_add0017_cy<0>),
        .LI(Madd_bird_color_on_add0017_lut<1>),
        .O(bird_color_on_add0017<1>)
    );
    MUXCY Madd_bird_color_on_add0017_cy<2>
    (
        .CI(Madd_bird_color_on_add0017_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0017_cy<2>_rt),
        .O(Madd_bird_color_on_add0017_cy<2>)
    );
    XORCY Madd_bird_color_on_add0017_xor<2>
    (
        .CI(Madd_bird_color_on_add0017_cy<1>),
        .LI(Madd_bird_color_on_add0017_cy<2>_rt),
        .O(bird_color_on_add0017<2>)
    );
    MUXCY Madd_bird_color_on_add0017_cy<3>
    (
        .CI(Madd_bird_color_on_add0017_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0017_cy<3>_rt),
        .O(Madd_bird_color_on_add0017_cy<3>)
    );
    XORCY Madd_bird_color_on_add0017_xor<3>
    (
        .CI(Madd_bird_color_on_add0017_cy<2>),
        .LI(Madd_bird_color_on_add0017_cy<3>_rt),
        .O(bird_color_on_add0017<3>)
    );
    MUXCY Madd_bird_color_on_add0017_cy<4>
    (
        .CI(Madd_bird_color_on_add0017_cy<3>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0017_lut<4>),
        .O(Madd_bird_color_on_add0017_cy<4>)
    );
    XORCY Madd_bird_color_on_add0017_xor<4>
    (
        .CI(Madd_bird_color_on_add0017_cy<3>),
        .LI(Madd_bird_color_on_add0017_lut<4>),
        .O(bird_color_on_add0017<4>)
    );
    MUXCY Madd_bird_color_on_add0017_cy<5>
    (
        .CI(Madd_bird_color_on_add0017_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0017_cy<5>_rt),
        .O(Madd_bird_color_on_add0017_cy<5>)
    );
    XORCY Madd_bird_color_on_add0017_xor<5>
    (
        .CI(Madd_bird_color_on_add0017_cy<4>),
        .LI(Madd_bird_color_on_add0017_cy<5>_rt),
        .O(bird_color_on_add0017<5>)
    );
    MUXCY Madd_bird_color_on_add0017_cy<6>
    (
        .CI(Madd_bird_color_on_add0017_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0017_cy<6>_rt),
        .O(Madd_bird_color_on_add0017_cy<6>)
    );
    XORCY Madd_bird_color_on_add0017_xor<6>
    (
        .CI(Madd_bird_color_on_add0017_cy<5>),
        .LI(Madd_bird_color_on_add0017_cy<6>_rt),
        .O(bird_color_on_add0017<6>)
    );
    MUXCY Madd_bird_color_on_add0017_cy<7>
    (
        .CI(Madd_bird_color_on_add0017_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0017_cy<7>_rt),
        .O(Madd_bird_color_on_add0017_cy<7>)
    );
    XORCY Madd_bird_color_on_add0017_xor<7>
    (
        .CI(Madd_bird_color_on_add0017_cy<6>),
        .LI(Madd_bird_color_on_add0017_cy<7>_rt),
        .O(bird_color_on_add0017<7>)
    );
    MUXCY Madd_bird_color_on_add0017_cy<8>
    (
        .CI(Madd_bird_color_on_add0017_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0017_cy<8>_rt),
        .O(Madd_bird_color_on_add0017_cy<8>)
    );
    XORCY Madd_bird_color_on_add0017_xor<8>
    (
        .CI(Madd_bird_color_on_add0017_cy<7>),
        .LI(Madd_bird_color_on_add0017_cy<8>_rt),
        .O(bird_color_on_add0017<8>)
    );
    XORCY Madd_bird_color_on_add0017_xor<9>
    (
        .CI(Madd_bird_color_on_add0017_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_color_on_add0017<9>)
    );
    MUXCY Madd_bird_color_on_add0019_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0019_lut<0>),
        .O(Madd_bird_color_on_add0019_cy<0>)
    );
    XORCY Madd_bird_color_on_add0019_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_color_on_add0019_lut<0>),
        .O(bird_color_on_add0019<0>)
    );
    MUXCY Madd_bird_color_on_add0019_cy<1>
    (
        .CI(Madd_bird_color_on_add0019_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0019_cy<1>_rt),
        .O(Madd_bird_color_on_add0019_cy<1>)
    );
    XORCY Madd_bird_color_on_add0019_xor<1>
    (
        .CI(Madd_bird_color_on_add0019_cy<0>),
        .LI(Madd_bird_color_on_add0019_cy<1>_rt),
        .O(bird_color_on_add0019<1>)
    );
    MUXCY Madd_bird_color_on_add0019_cy<2>
    (
        .CI(Madd_bird_color_on_add0019_cy<1>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0019_lut<2>),
        .O(Madd_bird_color_on_add0019_cy<2>)
    );
    XORCY Madd_bird_color_on_add0019_xor<2>
    (
        .CI(Madd_bird_color_on_add0019_cy<1>),
        .LI(Madd_bird_color_on_add0019_lut<2>),
        .O(bird_color_on_add0019<2>)
    );
    MUXCY Madd_bird_color_on_add0019_cy<3>
    (
        .CI(Madd_bird_color_on_add0019_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0019_cy<3>_rt),
        .O(Madd_bird_color_on_add0019_cy<3>)
    );
    XORCY Madd_bird_color_on_add0019_xor<3>
    (
        .CI(Madd_bird_color_on_add0019_cy<2>),
        .LI(Madd_bird_color_on_add0019_cy<3>_rt),
        .O(bird_color_on_add0019<3>)
    );
    MUXCY Madd_bird_color_on_add0019_cy<4>
    (
        .CI(Madd_bird_color_on_add0019_cy<3>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0019_lut<4>),
        .O(Madd_bird_color_on_add0019_cy<4>)
    );
    XORCY Madd_bird_color_on_add0019_xor<4>
    (
        .CI(Madd_bird_color_on_add0019_cy<3>),
        .LI(Madd_bird_color_on_add0019_lut<4>),
        .O(bird_color_on_add0019<4>)
    );
    MUXCY Madd_bird_color_on_add0019_cy<5>
    (
        .CI(Madd_bird_color_on_add0019_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0019_cy<5>_rt),
        .O(Madd_bird_color_on_add0019_cy<5>)
    );
    XORCY Madd_bird_color_on_add0019_xor<5>
    (
        .CI(Madd_bird_color_on_add0019_cy<4>),
        .LI(Madd_bird_color_on_add0019_cy<5>_rt),
        .O(bird_color_on_add0019<5>)
    );
    MUXCY Madd_bird_color_on_add0019_cy<6>
    (
        .CI(Madd_bird_color_on_add0019_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0019_cy<6>_rt),
        .O(Madd_bird_color_on_add0019_cy<6>)
    );
    XORCY Madd_bird_color_on_add0019_xor<6>
    (
        .CI(Madd_bird_color_on_add0019_cy<5>),
        .LI(Madd_bird_color_on_add0019_cy<6>_rt),
        .O(bird_color_on_add0019<6>)
    );
    MUXCY Madd_bird_color_on_add0019_cy<7>
    (
        .CI(Madd_bird_color_on_add0019_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0019_cy<7>_rt),
        .O(Madd_bird_color_on_add0019_cy<7>)
    );
    XORCY Madd_bird_color_on_add0019_xor<7>
    (
        .CI(Madd_bird_color_on_add0019_cy<6>),
        .LI(Madd_bird_color_on_add0019_cy<7>_rt),
        .O(bird_color_on_add0019<7>)
    );
    MUXCY Madd_bird_color_on_add0019_cy<8>
    (
        .CI(Madd_bird_color_on_add0019_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0019_cy<8>_rt),
        .O(Madd_bird_color_on_add0019_cy<8>)
    );
    XORCY Madd_bird_color_on_add0019_xor<8>
    (
        .CI(Madd_bird_color_on_add0019_cy<7>),
        .LI(Madd_bird_color_on_add0019_cy<8>_rt),
        .O(bird_color_on_add0019<8>)
    );
    XORCY Madd_bird_color_on_add0019_xor<9>
    (
        .CI(Madd_bird_color_on_add0019_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_color_on_add0019<9>)
    );
    MUXCY Madd_bird_color_on_add0020_cy<1>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0020_lut<1>),
        .O(Madd_bird_color_on_add0020_cy<1>)
    );
    XORCY Madd_bird_color_on_add0020_xor<1>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_color_on_add0020_lut<1>),
        .O(bird_color_on_add0020<1>)
    );
    MUXCY Madd_bird_color_on_add0020_cy<2>
    (
        .CI(Madd_bird_color_on_add0020_cy<1>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0020_lut<2>),
        .O(Madd_bird_color_on_add0020_cy<2>)
    );
    XORCY Madd_bird_color_on_add0020_xor<2>
    (
        .CI(Madd_bird_color_on_add0020_cy<1>),
        .LI(Madd_bird_color_on_add0020_lut<2>),
        .O(bird_color_on_add0020<2>)
    );
    MUXCY Madd_bird_color_on_add0020_cy<3>
    (
        .CI(Madd_bird_color_on_add0020_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0020_cy<3>_rt),
        .O(Madd_bird_color_on_add0020_cy<3>)
    );
    XORCY Madd_bird_color_on_add0020_xor<3>
    (
        .CI(Madd_bird_color_on_add0020_cy<2>),
        .LI(Madd_bird_color_on_add0020_cy<3>_rt),
        .O(bird_color_on_add0020<3>)
    );
    MUXCY Madd_bird_color_on_add0020_cy<4>
    (
        .CI(Madd_bird_color_on_add0020_cy<3>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0020_lut<4>),
        .O(Madd_bird_color_on_add0020_cy<4>)
    );
    XORCY Madd_bird_color_on_add0020_xor<4>
    (
        .CI(Madd_bird_color_on_add0020_cy<3>),
        .LI(Madd_bird_color_on_add0020_lut<4>),
        .O(bird_color_on_add0020<4>)
    );
    MUXCY Madd_bird_color_on_add0020_cy<5>
    (
        .CI(Madd_bird_color_on_add0020_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0020_cy<5>_rt),
        .O(Madd_bird_color_on_add0020_cy<5>)
    );
    XORCY Madd_bird_color_on_add0020_xor<5>
    (
        .CI(Madd_bird_color_on_add0020_cy<4>),
        .LI(Madd_bird_color_on_add0020_cy<5>_rt),
        .O(bird_color_on_add0020<5>)
    );
    MUXCY Madd_bird_color_on_add0020_cy<6>
    (
        .CI(Madd_bird_color_on_add0020_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0020_cy<6>_rt),
        .O(Madd_bird_color_on_add0020_cy<6>)
    );
    XORCY Madd_bird_color_on_add0020_xor<6>
    (
        .CI(Madd_bird_color_on_add0020_cy<5>),
        .LI(Madd_bird_color_on_add0020_cy<6>_rt),
        .O(bird_color_on_add0020<6>)
    );
    MUXCY Madd_bird_color_on_add0020_cy<7>
    (
        .CI(Madd_bird_color_on_add0020_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0020_cy<7>_rt),
        .O(Madd_bird_color_on_add0020_cy<7>)
    );
    XORCY Madd_bird_color_on_add0020_xor<7>
    (
        .CI(Madd_bird_color_on_add0020_cy<6>),
        .LI(Madd_bird_color_on_add0020_cy<7>_rt),
        .O(bird_color_on_add0020<7>)
    );
    MUXCY Madd_bird_color_on_add0020_cy<8>
    (
        .CI(Madd_bird_color_on_add0020_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0020_cy<8>_rt),
        .O(Madd_bird_color_on_add0020_cy<8>)
    );
    XORCY Madd_bird_color_on_add0020_xor<8>
    (
        .CI(Madd_bird_color_on_add0020_cy<7>),
        .LI(Madd_bird_color_on_add0020_cy<8>_rt),
        .O(bird_color_on_add0020<8>)
    );
    XORCY Madd_bird_color_on_add0020_xor<9>
    (
        .CI(Madd_bird_color_on_add0020_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_color_on_add0020<9>)
    );
    MUXCY Madd_bird_color_on_add0021_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0021_lut<0>),
        .O(Madd_bird_color_on_add0021_cy<0>)
    );
    XORCY Madd_bird_color_on_add0021_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_color_on_add0021_lut<0>),
        .O(bird_color_on_add0021<0>)
    );
    MUXCY Madd_bird_color_on_add0021_cy<1>
    (
        .CI(Madd_bird_color_on_add0021_cy<0>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0021_lut<1>),
        .O(Madd_bird_color_on_add0021_cy<1>)
    );
    XORCY Madd_bird_color_on_add0021_xor<1>
    (
        .CI(Madd_bird_color_on_add0021_cy<0>),
        .LI(Madd_bird_color_on_add0021_lut<1>),
        .O(bird_color_on_add0021<1>)
    );
    MUXCY Madd_bird_color_on_add0021_cy<2>
    (
        .CI(Madd_bird_color_on_add0021_cy<1>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0021_lut<2>),
        .O(Madd_bird_color_on_add0021_cy<2>)
    );
    XORCY Madd_bird_color_on_add0021_xor<2>
    (
        .CI(Madd_bird_color_on_add0021_cy<1>),
        .LI(Madd_bird_color_on_add0021_lut<2>),
        .O(bird_color_on_add0021<2>)
    );
    MUXCY Madd_bird_color_on_add0021_cy<3>
    (
        .CI(Madd_bird_color_on_add0021_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0021_cy<3>_rt),
        .O(Madd_bird_color_on_add0021_cy<3>)
    );
    XORCY Madd_bird_color_on_add0021_xor<3>
    (
        .CI(Madd_bird_color_on_add0021_cy<2>),
        .LI(Madd_bird_color_on_add0021_cy<3>_rt),
        .O(bird_color_on_add0021<3>)
    );
    MUXCY Madd_bird_color_on_add0021_cy<4>
    (
        .CI(Madd_bird_color_on_add0021_cy<3>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_color_on_add0021_lut<4>),
        .O(Madd_bird_color_on_add0021_cy<4>)
    );
    XORCY Madd_bird_color_on_add0021_xor<4>
    (
        .CI(Madd_bird_color_on_add0021_cy<3>),
        .LI(Madd_bird_color_on_add0021_lut<4>),
        .O(bird_color_on_add0021<4>)
    );
    MUXCY Madd_bird_color_on_add0021_cy<5>
    (
        .CI(Madd_bird_color_on_add0021_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0021_cy<5>_rt),
        .O(Madd_bird_color_on_add0021_cy<5>)
    );
    XORCY Madd_bird_color_on_add0021_xor<5>
    (
        .CI(Madd_bird_color_on_add0021_cy<4>),
        .LI(Madd_bird_color_on_add0021_cy<5>_rt),
        .O(bird_color_on_add0021<5>)
    );
    MUXCY Madd_bird_color_on_add0021_cy<6>
    (
        .CI(Madd_bird_color_on_add0021_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0021_cy<6>_rt),
        .O(Madd_bird_color_on_add0021_cy<6>)
    );
    XORCY Madd_bird_color_on_add0021_xor<6>
    (
        .CI(Madd_bird_color_on_add0021_cy<5>),
        .LI(Madd_bird_color_on_add0021_cy<6>_rt),
        .O(bird_color_on_add0021<6>)
    );
    MUXCY Madd_bird_color_on_add0021_cy<7>
    (
        .CI(Madd_bird_color_on_add0021_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0021_cy<7>_rt),
        .O(Madd_bird_color_on_add0021_cy<7>)
    );
    XORCY Madd_bird_color_on_add0021_xor<7>
    (
        .CI(Madd_bird_color_on_add0021_cy<6>),
        .LI(Madd_bird_color_on_add0021_cy<7>_rt),
        .O(bird_color_on_add0021<7>)
    );
    MUXCY Madd_bird_color_on_add0021_cy<8>
    (
        .CI(Madd_bird_color_on_add0021_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_color_on_add0021_cy<8>_rt),
        .O(Madd_bird_color_on_add0021_cy<8>)
    );
    XORCY Madd_bird_color_on_add0021_xor<8>
    (
        .CI(Madd_bird_color_on_add0021_cy<7>),
        .LI(Madd_bird_color_on_add0021_cy<8>_rt),
        .O(bird_color_on_add0021<8>)
    );
    XORCY Madd_bird_color_on_add0021_xor<9>
    (
        .CI(Madd_bird_color_on_add0021_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_color_on_add0021<9>)
    );
    MUXCY Madd_bird_outline_on_addsub0000_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_outline_on_addsub0000_lut<0>),
        .O(Madd_bird_outline_on_addsub0000_cy<0>)
    );
    XORCY Madd_bird_outline_on_addsub0000_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_outline_on_addsub0000_lut<0>),
        .O(bird_outline_on_addsub0000<0>)
    );
    MUXCY Madd_bird_outline_on_addsub0000_cy<1>
    (
        .CI(Madd_bird_outline_on_addsub0000_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_outline_on_addsub0000_cy<1>_rt),
        .O(Madd_bird_outline_on_addsub0000_cy<1>)
    );
    XORCY Madd_bird_outline_on_addsub0000_xor<1>
    (
        .CI(Madd_bird_outline_on_addsub0000_cy<0>),
        .LI(Madd_bird_outline_on_addsub0000_cy<1>_rt),
        .O(bird_outline_on_addsub0000<1>)
    );
    MUXCY Madd_bird_outline_on_addsub0000_cy<2>
    (
        .CI(Madd_bird_outline_on_addsub0000_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_outline_on_addsub0000_cy<2>_rt),
        .O(Madd_bird_outline_on_addsub0000_cy<2>)
    );
    XORCY Madd_bird_outline_on_addsub0000_xor<2>
    (
        .CI(Madd_bird_outline_on_addsub0000_cy<1>),
        .LI(Madd_bird_outline_on_addsub0000_cy<2>_rt),
        .O(bird_outline_on_addsub0000<2>)
    );
    MUXCY Madd_bird_outline_on_addsub0000_cy<3>
    (
        .CI(Madd_bird_outline_on_addsub0000_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_outline_on_addsub0000_cy<3>_rt),
        .O(Madd_bird_outline_on_addsub0000_cy<3>)
    );
    XORCY Madd_bird_outline_on_addsub0000_xor<3>
    (
        .CI(Madd_bird_outline_on_addsub0000_cy<2>),
        .LI(Madd_bird_outline_on_addsub0000_cy<3>_rt),
        .O(bird_outline_on_addsub0000<3>)
    );
    MUXCY Madd_bird_outline_on_addsub0000_cy<4>
    (
        .CI(Madd_bird_outline_on_addsub0000_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_outline_on_addsub0000_cy<4>_rt),
        .O(Madd_bird_outline_on_addsub0000_cy<4>)
    );
    XORCY Madd_bird_outline_on_addsub0000_xor<4>
    (
        .CI(Madd_bird_outline_on_addsub0000_cy<3>),
        .LI(Madd_bird_outline_on_addsub0000_cy<4>_rt),
        .O(bird_outline_on_addsub0000<4>)
    );
    MUXCY Madd_bird_outline_on_addsub0000_cy<5>
    (
        .CI(Madd_bird_outline_on_addsub0000_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_outline_on_addsub0000_cy<5>_rt),
        .O(Madd_bird_outline_on_addsub0000_cy<5>)
    );
    XORCY Madd_bird_outline_on_addsub0000_xor<5>
    (
        .CI(Madd_bird_outline_on_addsub0000_cy<4>),
        .LI(Madd_bird_outline_on_addsub0000_cy<5>_rt),
        .O(bird_outline_on_addsub0000<5>)
    );
    MUXCY Madd_bird_outline_on_addsub0000_cy<6>
    (
        .CI(Madd_bird_outline_on_addsub0000_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_outline_on_addsub0000_cy<6>_rt),
        .O(Madd_bird_outline_on_addsub0000_cy<6>)
    );
    XORCY Madd_bird_outline_on_addsub0000_xor<6>
    (
        .CI(Madd_bird_outline_on_addsub0000_cy<5>),
        .LI(Madd_bird_outline_on_addsub0000_cy<6>_rt),
        .O(bird_outline_on_addsub0000<6>)
    );
    MUXCY Madd_bird_outline_on_addsub0000_cy<7>
    (
        .CI(Madd_bird_outline_on_addsub0000_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_outline_on_addsub0000_cy<7>_rt),
        .O(Madd_bird_outline_on_addsub0000_cy<7>)
    );
    XORCY Madd_bird_outline_on_addsub0000_xor<7>
    (
        .CI(Madd_bird_outline_on_addsub0000_cy<6>),
        .LI(Madd_bird_outline_on_addsub0000_cy<7>_rt),
        .O(bird_outline_on_addsub0000<7>)
    );
    MUXCY Madd_bird_outline_on_addsub0000_cy<8>
    (
        .CI(Madd_bird_outline_on_addsub0000_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_outline_on_addsub0000_cy<8>_rt),
        .O(Madd_bird_outline_on_addsub0000_cy<8>)
    );
    XORCY Madd_bird_outline_on_addsub0000_xor<8>
    (
        .CI(Madd_bird_outline_on_addsub0000_cy<7>),
        .LI(Madd_bird_outline_on_addsub0000_cy<8>_rt),
        .O(bird_outline_on_addsub0000<8>)
    );
    XORCY Madd_bird_outline_on_addsub0000_xor<9>
    (
        .CI(Madd_bird_outline_on_addsub0000_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_outline_on_addsub0000<9>)
    );
    MUXCY Madd_bird_outline_on_addsub0002_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_outline_on_addsub0002_lut<0>),
        .O(Madd_bird_outline_on_addsub0002_cy<0>)
    );
    XORCY Madd_bird_outline_on_addsub0002_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_outline_on_addsub0002_lut<0>),
        .O(bird_outline_on_addsub0002<0>)
    );
    MUXCY Madd_bird_outline_on_addsub0002_cy<1>
    (
        .CI(Madd_bird_outline_on_addsub0002_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_outline_on_addsub0002_cy<1>_rt),
        .O(Madd_bird_outline_on_addsub0002_cy<1>)
    );
    XORCY Madd_bird_outline_on_addsub0002_xor<1>
    (
        .CI(Madd_bird_outline_on_addsub0002_cy<0>),
        .LI(Madd_bird_outline_on_addsub0002_cy<1>_rt),
        .O(bird_outline_on_addsub0002<1>)
    );
    MUXCY Madd_bird_outline_on_addsub0002_cy<2>
    (
        .CI(Madd_bird_outline_on_addsub0002_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_outline_on_addsub0002_cy<2>_rt),
        .O(Madd_bird_outline_on_addsub0002_cy<2>)
    );
    XORCY Madd_bird_outline_on_addsub0002_xor<2>
    (
        .CI(Madd_bird_outline_on_addsub0002_cy<1>),
        .LI(Madd_bird_outline_on_addsub0002_cy<2>_rt),
        .O(bird_outline_on_addsub0002<2>)
    );
    MUXCY Madd_bird_outline_on_addsub0002_cy<3>
    (
        .CI(Madd_bird_outline_on_addsub0002_cy<2>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_outline_on_addsub0002_lut<3>),
        .O(Madd_bird_outline_on_addsub0002_cy<3>)
    );
    XORCY Madd_bird_outline_on_addsub0002_xor<3>
    (
        .CI(Madd_bird_outline_on_addsub0002_cy<2>),
        .LI(Madd_bird_outline_on_addsub0002_lut<3>),
        .O(bird_outline_on_addsub0002<3>)
    );
    MUXCY Madd_bird_outline_on_addsub0002_cy<4>
    (
        .CI(Madd_bird_outline_on_addsub0002_cy<3>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Madd_bird_outline_on_addsub0002_lut<4>),
        .O(Madd_bird_outline_on_addsub0002_cy<4>)
    );
    XORCY Madd_bird_outline_on_addsub0002_xor<4>
    (
        .CI(Madd_bird_outline_on_addsub0002_cy<3>),
        .LI(Madd_bird_outline_on_addsub0002_lut<4>),
        .O(bird_outline_on_addsub0002<4>)
    );
    MUXCY Madd_bird_outline_on_addsub0002_cy<5>
    (
        .CI(Madd_bird_outline_on_addsub0002_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_outline_on_addsub0002_cy<5>_rt),
        .O(Madd_bird_outline_on_addsub0002_cy<5>)
    );
    XORCY Madd_bird_outline_on_addsub0002_xor<5>
    (
        .CI(Madd_bird_outline_on_addsub0002_cy<4>),
        .LI(Madd_bird_outline_on_addsub0002_cy<5>_rt),
        .O(bird_outline_on_addsub0002<5>)
    );
    MUXCY Madd_bird_outline_on_addsub0002_cy<6>
    (
        .CI(Madd_bird_outline_on_addsub0002_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_outline_on_addsub0002_cy<6>_rt),
        .O(Madd_bird_outline_on_addsub0002_cy<6>)
    );
    XORCY Madd_bird_outline_on_addsub0002_xor<6>
    (
        .CI(Madd_bird_outline_on_addsub0002_cy<5>),
        .LI(Madd_bird_outline_on_addsub0002_cy<6>_rt),
        .O(bird_outline_on_addsub0002<6>)
    );
    MUXCY Madd_bird_outline_on_addsub0002_cy<7>
    (
        .CI(Madd_bird_outline_on_addsub0002_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_outline_on_addsub0002_cy<7>_rt),
        .O(Madd_bird_outline_on_addsub0002_cy<7>)
    );
    XORCY Madd_bird_outline_on_addsub0002_xor<7>
    (
        .CI(Madd_bird_outline_on_addsub0002_cy<6>),
        .LI(Madd_bird_outline_on_addsub0002_cy<7>_rt),
        .O(bird_outline_on_addsub0002<7>)
    );
    MUXCY Madd_bird_outline_on_addsub0002_cy<8>
    (
        .CI(Madd_bird_outline_on_addsub0002_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_outline_on_addsub0002_cy<8>_rt),
        .O(Madd_bird_outline_on_addsub0002_cy<8>)
    );
    XORCY Madd_bird_outline_on_addsub0002_xor<8>
    (
        .CI(Madd_bird_outline_on_addsub0002_cy<7>),
        .LI(Madd_bird_outline_on_addsub0002_cy<8>_rt),
        .O(bird_outline_on_addsub0002<8>)
    );
    XORCY Madd_bird_outline_on_addsub0002_xor<9>
    (
        .CI(Madd_bird_outline_on_addsub0002_cy<8>),
        .LI(Madd_bird_color_on_add0002_lut<9>),
        .O(bird_outline_on_addsub0002<9>)
    );
    LUT2 Msub_bird_top_temp_addsub0000_lut<0>
    (
        .I0(jump_reg<0>),
        .I1(bird_top_0_1),
        .O(Msub_bird_top_temp_addsub0000_lut<0>)
    );
    MUXCY Msub_bird_top_temp_addsub0000_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(bird_top_0_1),
        .S(Msub_bird_top_temp_addsub0000_lut<0>),
        .O(Msub_bird_top_temp_addsub0000_cy<0>)
    );
    XORCY Msub_bird_top_temp_addsub0000_xor<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .LI(Msub_bird_top_temp_addsub0000_lut<0>),
        .O(bird_top_temp_addsub0000<0>)
    );
    LUT2 Msub_bird_top_temp_addsub0000_lut<1>
    (
        .I0(jump_reg<1>),
        .I1(bird_top_1_1),
        .O(Msub_bird_top_temp_addsub0000_lut<1>)
    );
    MUXCY Msub_bird_top_temp_addsub0000_cy<1>
    (
        .CI(Msub_bird_top_temp_addsub0000_cy<0>),
        .DI(bird_top_1_1),
        .S(Msub_bird_top_temp_addsub0000_lut<1>),
        .O(Msub_bird_top_temp_addsub0000_cy<1>)
    );
    XORCY Msub_bird_top_temp_addsub0000_xor<1>
    (
        .CI(Msub_bird_top_temp_addsub0000_cy<0>),
        .LI(Msub_bird_top_temp_addsub0000_lut<1>),
        .O(bird_top_temp_addsub0000<1>)
    );
    LUT2 Msub_bird_top_temp_addsub0000_lut<2>
    (
        .I0(jump_reg<2>),
        .I1(bird_top_2_1),
        .O(Msub_bird_top_temp_addsub0000_lut<2>)
    );
    MUXCY Msub_bird_top_temp_addsub0000_cy<2>
    (
        .CI(Msub_bird_top_temp_addsub0000_cy<1>),
        .DI(bird_top_2_1),
        .S(Msub_bird_top_temp_addsub0000_lut<2>),
        .O(Msub_bird_top_temp_addsub0000_cy<2>)
    );
    XORCY Msub_bird_top_temp_addsub0000_xor<2>
    (
        .CI(Msub_bird_top_temp_addsub0000_cy<1>),
        .LI(Msub_bird_top_temp_addsub0000_lut<2>),
        .O(bird_top_temp_addsub0000<2>)
    );
    LUT2 Msub_bird_top_temp_addsub0000_lut<3>
    (
        .I0(jump_reg<3>),
        .I1(bird_top<3>),
        .O(Msub_bird_top_temp_addsub0000_lut<3>)
    );
    MUXCY Msub_bird_top_temp_addsub0000_cy<3>
    (
        .CI(Msub_bird_top_temp_addsub0000_cy<2>),
        .DI(bird_top<3>),
        .S(Msub_bird_top_temp_addsub0000_lut<3>),
        .O(Msub_bird_top_temp_addsub0000_cy<3>)
    );
    XORCY Msub_bird_top_temp_addsub0000_xor<3>
    (
        .CI(Msub_bird_top_temp_addsub0000_cy<2>),
        .LI(Msub_bird_top_temp_addsub0000_lut<3>),
        .O(bird_top_temp_addsub0000<3>)
    );
    LUT2 Msub_bird_top_temp_addsub0000_lut<4>
    (
        .I0(jump_reg<4>),
        .I1(bird_top<4>),
        .O(Msub_bird_top_temp_addsub0000_lut<4>)
    );
    MUXCY Msub_bird_top_temp_addsub0000_cy<4>
    (
        .CI(Msub_bird_top_temp_addsub0000_cy<3>),
        .DI(bird_top<4>),
        .S(Msub_bird_top_temp_addsub0000_lut<4>),
        .O(Msub_bird_top_temp_addsub0000_cy<4>)
    );
    XORCY Msub_bird_top_temp_addsub0000_xor<4>
    (
        .CI(Msub_bird_top_temp_addsub0000_cy<3>),
        .LI(Msub_bird_top_temp_addsub0000_lut<4>),
        .O(bird_top_temp_addsub0000<4>)
    );
    MUXCY Msub_bird_top_temp_addsub0000_cy<5>
    (
        .CI(Msub_bird_top_temp_addsub0000_cy<4>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_bird_top_temp_addsub0000_lut<5>),
        .O(Msub_bird_top_temp_addsub0000_cy<5>)
    );
    XORCY Msub_bird_top_temp_addsub0000_xor<5>
    (
        .CI(Msub_bird_top_temp_addsub0000_cy<4>),
        .LI(Msub_bird_top_temp_addsub0000_lut<5>),
        .O(bird_top_temp_addsub0000<5>)
    );
    MUXCY Msub_bird_top_temp_addsub0000_cy<6>
    (
        .CI(Msub_bird_top_temp_addsub0000_cy<5>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_bird_top_temp_addsub0000_lut<6>),
        .O(Msub_bird_top_temp_addsub0000_cy<6>)
    );
    XORCY Msub_bird_top_temp_addsub0000_xor<6>
    (
        .CI(Msub_bird_top_temp_addsub0000_cy<5>),
        .LI(Msub_bird_top_temp_addsub0000_lut<6>),
        .O(bird_top_temp_addsub0000<6>)
    );
    MUXCY Msub_bird_top_temp_addsub0000_cy<7>
    (
        .CI(Msub_bird_top_temp_addsub0000_cy<6>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_bird_top_temp_addsub0000_lut<7>),
        .O(Msub_bird_top_temp_addsub0000_cy<7>)
    );
    XORCY Msub_bird_top_temp_addsub0000_xor<7>
    (
        .CI(Msub_bird_top_temp_addsub0000_cy<6>),
        .LI(Msub_bird_top_temp_addsub0000_lut<7>),
        .O(bird_top_temp_addsub0000<7>)
    );
    MUXCY Msub_bird_top_temp_addsub0000_cy<8>
    (
        .CI(Msub_bird_top_temp_addsub0000_cy<7>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(Msub_bird_top_temp_addsub0000_lut<8>),
        .O(Msub_bird_top_temp_addsub0000_cy<8>)
    );
    XORCY Msub_bird_top_temp_addsub0000_xor<8>
    (
        .CI(Msub_bird_top_temp_addsub0000_cy<7>),
        .LI(Msub_bird_top_temp_addsub0000_lut<8>),
        .O(bird_top_temp_addsub0000<8>)
    );
    XORCY Msub_bird_top_temp_addsub0000_xor<9>
    (
        .CI(Msub_bird_top_temp_addsub0000_cy<8>),
        .LI(Msub_bird_top_temp_addsub0000_lut<9>),
        .O(bird_top_temp_addsub0000<9>)
    );
    LUT2 Mcompar_pipe_on_cmp_ge0000_lut<0>
    (
        .I0(vga_timer/horizontal_pixel_counter<0>),
        .I1(col1_x<0>),
        .O(Mcompar_pipe_on_cmp_ge0000_lut<0>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0000_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(vga_timer/horizontal_pixel_counter<0>),
        .S(Mcompar_pipe_on_cmp_ge0000_lut<0>),
        .O(Mcompar_pipe_on_cmp_ge0000_cy<0>)
    );
    LUT2 Mcompar_pipe_on_cmp_ge0000_lut<1>
    (
        .I0(vga_timer/horizontal_pixel_counter<1>),
        .I1(col1_x<1>),
        .O(Mcompar_pipe_on_cmp_ge0000_lut<1>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0000_cy<1>
    (
        .CI(Mcompar_pipe_on_cmp_ge0000_cy<0>),
        .DI(vga_timer/horizontal_pixel_counter<1>),
        .S(Mcompar_pipe_on_cmp_ge0000_lut<1>),
        .O(Mcompar_pipe_on_cmp_ge0000_cy<1>)
    );
    LUT2 Mcompar_pipe_on_cmp_ge0000_lut<2>
    (
        .I0(vga_timer/horizontal_pixel_counter<2>),
        .I1(col1_x<2>),
        .O(Mcompar_pipe_on_cmp_ge0000_lut<2>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0000_cy<2>
    (
        .CI(Mcompar_pipe_on_cmp_ge0000_cy<1>),
        .DI(vga_timer/horizontal_pixel_counter<2>),
        .S(Mcompar_pipe_on_cmp_ge0000_lut<2>),
        .O(Mcompar_pipe_on_cmp_ge0000_cy<2>)
    );
    LUT2 Mcompar_pipe_on_cmp_ge0000_lut<3>
    (
        .I0(vga_timer/horizontal_pixel_counter<3>),
        .I1(col1_x<3>),
        .O(Mcompar_pipe_on_cmp_ge0000_lut<3>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0000_cy<3>
    (
        .CI(Mcompar_pipe_on_cmp_ge0000_cy<2>),
        .DI(vga_timer/horizontal_pixel_counter<3>),
        .S(Mcompar_pipe_on_cmp_ge0000_lut<3>),
        .O(Mcompar_pipe_on_cmp_ge0000_cy<3>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0000_cy<4>
    (
        .CI(Mcompar_pipe_on_cmp_ge0000_cy<3>),
        .DI(vga_timer/horizontal_pixel_counter<4>),
        .S(Mcompar_pipe_on_cmp_ge0000_lut<4>),
        .O(Mcompar_pipe_on_cmp_ge0000_cy<4>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0000_cy<5>
    (
        .CI(Mcompar_pipe_on_cmp_ge0000_cy<4>),
        .DI(vga_timer/horizontal_pixel_counter<5>),
        .S(Mcompar_pipe_on_cmp_ge0000_lut<5>),
        .O(Mcompar_pipe_on_cmp_ge0000_cy<5>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0000_cy<6>
    (
        .CI(Mcompar_pipe_on_cmp_ge0000_cy<5>),
        .DI(vga_timer/horizontal_pixel_counter<6>),
        .S(Mcompar_pipe_on_cmp_ge0000_lut<6>),
        .O(Mcompar_pipe_on_cmp_ge0000_cy<6>)
    );
    LUT2 Mcompar_pipe_on_cmp_ge0000_lut<7>
    (
        .I0(vga_timer/horizontal_pixel_counter<7>),
        .I1(pipe_on_addsub0000<7>),
        .O(Mcompar_pipe_on_cmp_ge0000_lut<7>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0000_cy<7>
    (
        .CI(Mcompar_pipe_on_cmp_ge0000_cy<6>),
        .DI(vga_timer/horizontal_pixel_counter<7>),
        .S(Mcompar_pipe_on_cmp_ge0000_lut<7>),
        .O(Mcompar_pipe_on_cmp_ge0000_cy<7>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0000_cy<8>
    (
        .CI(Mcompar_pipe_on_cmp_ge0000_cy<7>),
        .DI(vga_timer/horizontal_pixel_counter<8>),
        .S(Mcompar_pipe_on_cmp_ge0000_lut<8>),
        .O(Mcompar_pipe_on_cmp_ge0000_cy<8>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0000_cy<9>
    (
        .CI(Mcompar_pipe_on_cmp_ge0000_cy<8>),
        .DI(vga_timer/horizontal_pixel_counter<9>),
        .S(Mcompar_pipe_on_cmp_ge0000_lut<9>),
        .O(pipe_on_cmp_ge0000)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0000_lut<0>
    (
        .I0(vga_timer/horizontal_pixel_counter<0>),
        .I1(col1_x<0>),
        .O(Mcompar_pipe_on_cmp_lt0000_lut<0>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0000_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(vga_timer/horizontal_pixel_counter<0>),
        .S(Mcompar_pipe_on_cmp_lt0000_lut<0>),
        .O(Mcompar_pipe_on_cmp_lt0000_cy<0>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0000_lut<1>
    (
        .I0(vga_timer/horizontal_pixel_counter<1>),
        .I1(col1_x<1>),
        .O(Mcompar_pipe_on_cmp_lt0000_lut<1>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0000_cy<1>
    (
        .CI(Mcompar_pipe_on_cmp_lt0000_cy<0>),
        .DI(vga_timer/horizontal_pixel_counter<1>),
        .S(Mcompar_pipe_on_cmp_lt0000_lut<1>),
        .O(Mcompar_pipe_on_cmp_lt0000_cy<1>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0000_lut<2>
    (
        .I0(vga_timer/horizontal_pixel_counter<2>),
        .I1(col1_x<2>),
        .O(Mcompar_pipe_on_cmp_lt0000_lut<2>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0000_cy<2>
    (
        .CI(Mcompar_pipe_on_cmp_lt0000_cy<1>),
        .DI(vga_timer/horizontal_pixel_counter<2>),
        .S(Mcompar_pipe_on_cmp_lt0000_lut<2>),
        .O(Mcompar_pipe_on_cmp_lt0000_cy<2>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0000_lut<3>
    (
        .I0(vga_timer/horizontal_pixel_counter<3>),
        .I1(col1_x<3>),
        .O(Mcompar_pipe_on_cmp_lt0000_lut<3>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0000_cy<3>
    (
        .CI(Mcompar_pipe_on_cmp_lt0000_cy<2>),
        .DI(vga_timer/horizontal_pixel_counter<3>),
        .S(Mcompar_pipe_on_cmp_lt0000_lut<3>),
        .O(Mcompar_pipe_on_cmp_lt0000_cy<3>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0000_lut<4>
    (
        .I0(vga_timer/horizontal_pixel_counter<4>),
        .I1(col1_x<4>),
        .O(Mcompar_pipe_on_cmp_lt0000_lut<4>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0000_cy<4>
    (
        .CI(Mcompar_pipe_on_cmp_lt0000_cy<3>),
        .DI(vga_timer/horizontal_pixel_counter<4>),
        .S(Mcompar_pipe_on_cmp_lt0000_lut<4>),
        .O(Mcompar_pipe_on_cmp_lt0000_cy<4>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0000_lut<5>
    (
        .I0(vga_timer/horizontal_pixel_counter<5>),
        .I1(col1_x<5>),
        .O(Mcompar_pipe_on_cmp_lt0000_lut<5>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0000_cy<5>
    (
        .CI(Mcompar_pipe_on_cmp_lt0000_cy<4>),
        .DI(vga_timer/horizontal_pixel_counter<5>),
        .S(Mcompar_pipe_on_cmp_lt0000_lut<5>),
        .O(Mcompar_pipe_on_cmp_lt0000_cy<5>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0000_lut<6>
    (
        .I0(vga_timer/horizontal_pixel_counter<6>),
        .I1(col1_x<6>),
        .O(Mcompar_pipe_on_cmp_lt0000_lut<6>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0000_cy<6>
    (
        .CI(Mcompar_pipe_on_cmp_lt0000_cy<5>),
        .DI(vga_timer/horizontal_pixel_counter<6>),
        .S(Mcompar_pipe_on_cmp_lt0000_lut<6>),
        .O(Mcompar_pipe_on_cmp_lt0000_cy<6>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0000_lut<7>
    (
        .I0(vga_timer/horizontal_pixel_counter<7>),
        .I1(col1_x<7>),
        .O(Mcompar_pipe_on_cmp_lt0000_lut<7>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0000_cy<7>
    (
        .CI(Mcompar_pipe_on_cmp_lt0000_cy<6>),
        .DI(vga_timer/horizontal_pixel_counter<7>),
        .S(Mcompar_pipe_on_cmp_lt0000_lut<7>),
        .O(Mcompar_pipe_on_cmp_lt0000_cy<7>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0000_lut<8>
    (
        .I0(vga_timer/horizontal_pixel_counter<8>),
        .I1(col1_x<8>),
        .O(Mcompar_pipe_on_cmp_lt0000_lut<8>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0000_cy<8>
    (
        .CI(Mcompar_pipe_on_cmp_lt0000_cy<7>),
        .DI(vga_timer/horizontal_pixel_counter<8>),
        .S(Mcompar_pipe_on_cmp_lt0000_lut<8>),
        .O(Mcompar_pipe_on_cmp_lt0000_cy<8>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0000_lut<9>
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(col1_x<9>),
        .O(Mcompar_pipe_on_cmp_lt0000_lut<9>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0000_cy<9>
    (
        .CI(Mcompar_pipe_on_cmp_lt0000_cy<8>),
        .DI(vga_timer/horizontal_pixel_counter<9>),
        .S(Mcompar_pipe_on_cmp_lt0000_lut<9>),
        .O(Mcompar_pipe_on_cmp_lt0000_cy<9>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0001_lut<0>
    (
        .I0(col1_y<0>),
        .I1(vga_timer/vertical_pixel_counter<0>),
        .O(Mcompar_pipe_on_cmp_le0001_lut<0>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0001_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(col1_y<0>),
        .S(Mcompar_pipe_on_cmp_le0001_lut<0>),
        .O(Mcompar_pipe_on_cmp_le0001_cy<0>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0001_lut<1>
    (
        .I0(col1_y<0>),
        .I1(vga_timer/vertical_pixel_counter<1>),
        .O(Mcompar_pipe_on_cmp_le0001_lut<1>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0001_cy<1>
    (
        .CI(Mcompar_pipe_on_cmp_le0001_cy<0>),
        .DI(col1_y<0>),
        .S(Mcompar_pipe_on_cmp_le0001_lut<1>),
        .O(Mcompar_pipe_on_cmp_le0001_cy<1>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0001_lut<2>
    (
        .I0(col1_y<0>),
        .I1(vga_timer/vertical_pixel_counter<2>),
        .O(Mcompar_pipe_on_cmp_le0001_lut<2>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0001_cy<2>
    (
        .CI(Mcompar_pipe_on_cmp_le0001_cy<1>),
        .DI(col1_y<0>),
        .S(Mcompar_pipe_on_cmp_le0001_lut<2>),
        .O(Mcompar_pipe_on_cmp_le0001_cy<2>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0001_lut<3>
    (
        .I0(col1_y<0>),
        .I1(vga_timer/vertical_pixel_counter<3>),
        .O(Mcompar_pipe_on_cmp_le0001_lut<3>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0001_cy<3>
    (
        .CI(Mcompar_pipe_on_cmp_le0001_cy<2>),
        .DI(col1_y<0>),
        .S(Mcompar_pipe_on_cmp_le0001_lut<3>),
        .O(Mcompar_pipe_on_cmp_le0001_cy<3>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0001_lut<4>
    (
        .I0(col1_y<4>),
        .I1(vga_timer/vertical_pixel_counter<4>),
        .O(Mcompar_pipe_on_cmp_le0001_lut<4>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0001_cy<4>
    (
        .CI(Mcompar_pipe_on_cmp_le0001_cy<3>),
        .DI(col1_y<4>),
        .S(Mcompar_pipe_on_cmp_le0001_lut<4>),
        .O(Mcompar_pipe_on_cmp_le0001_cy<4>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0001_lut<5>
    (
        .I0(col1_y<5>),
        .I1(vga_timer/vertical_pixel_counter<5>),
        .O(Mcompar_pipe_on_cmp_le0001_lut<5>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0001_cy<5>
    (
        .CI(Mcompar_pipe_on_cmp_le0001_cy<4>),
        .DI(col1_y<5>),
        .S(Mcompar_pipe_on_cmp_le0001_lut<5>),
        .O(Mcompar_pipe_on_cmp_le0001_cy<5>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0001_lut<6>
    (
        .I0(col1_y<6>),
        .I1(vga_timer/vertical_pixel_counter<6>),
        .O(Mcompar_pipe_on_cmp_le0001_lut<6>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0001_cy<6>
    (
        .CI(Mcompar_pipe_on_cmp_le0001_cy<5>),
        .DI(col1_y<6>),
        .S(Mcompar_pipe_on_cmp_le0001_lut<6>),
        .O(Mcompar_pipe_on_cmp_le0001_cy<6>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0001_lut<7>
    (
        .I0(col1_y<7>),
        .I1(vga_timer/vertical_pixel_counter<7>),
        .O(Mcompar_pipe_on_cmp_le0001_lut<7>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0001_cy<7>
    (
        .CI(Mcompar_pipe_on_cmp_le0001_cy<6>),
        .DI(col1_y<7>),
        .S(Mcompar_pipe_on_cmp_le0001_lut<7>),
        .O(Mcompar_pipe_on_cmp_le0001_cy<7>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0001_lut<8>
    (
        .I0(col1_y<8>),
        .I1(vga_timer/vertical_pixel_counter<8>),
        .O(Mcompar_pipe_on_cmp_le0001_lut<8>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0001_cy<8>
    (
        .CI(Mcompar_pipe_on_cmp_le0001_cy<7>),
        .DI(col1_y<8>),
        .S(Mcompar_pipe_on_cmp_le0001_lut<8>),
        .O(Mcompar_pipe_on_cmp_le0001_cy<8>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0001_lut<9>
    (
        .I0(col1_y<8>),
        .I1(vga_timer/vertical_pixel_counter<9>),
        .O(Mcompar_pipe_on_cmp_le0001_lut<9>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0001_cy<9>
    (
        .CI(Mcompar_pipe_on_cmp_le0001_cy<8>),
        .DI(col1_y<8>),
        .S(Mcompar_pipe_on_cmp_le0001_lut<9>),
        .O(pipe_on_cmp_le0001)
    );
    LUT2 Mcompar_pipe_on_cmp_gt0000_lut<0>
    (
        .I0(col1_y<0>),
        .I1(vga_timer/vertical_pixel_counter<0>),
        .O(Mcompar_pipe_on_cmp_gt0000_lut<0>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0000_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(col1_y<0>),
        .S(Mcompar_pipe_on_cmp_gt0000_lut<0>),
        .O(Mcompar_pipe_on_cmp_gt0000_cy<0>)
    );
    LUT2 Mcompar_pipe_on_cmp_gt0000_lut<1>
    (
        .I0(col1_y<0>),
        .I1(vga_timer/vertical_pixel_counter<1>),
        .O(Mcompar_pipe_on_cmp_gt0000_lut<1>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0000_cy<1>
    (
        .CI(Mcompar_pipe_on_cmp_gt0000_cy<0>),
        .DI(col1_y<0>),
        .S(Mcompar_pipe_on_cmp_gt0000_lut<1>),
        .O(Mcompar_pipe_on_cmp_gt0000_cy<1>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0000_cy<2>
    (
        .CI(Mcompar_pipe_on_cmp_gt0000_cy<1>),
        .DI(pipe_on_addsub0001<2>),
        .S(Mcompar_pipe_on_cmp_gt0000_lut<2>),
        .O(Mcompar_pipe_on_cmp_gt0000_cy<2>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0000_cy<3>
    (
        .CI(Mcompar_pipe_on_cmp_gt0000_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_pipe_on_cmp_gt0000_lut<3>),
        .O(Mcompar_pipe_on_cmp_gt0000_cy<3>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0000_cy<4>
    (
        .CI(Mcompar_pipe_on_cmp_gt0000_cy<3>),
        .DI(pipe_on_addsub0001<4>),
        .S(Mcompar_pipe_on_cmp_gt0000_lut<4>),
        .O(Mcompar_pipe_on_cmp_gt0000_cy<4>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0000_cy<5>
    (
        .CI(Mcompar_pipe_on_cmp_gt0000_cy<4>),
        .DI(pipe_on_addsub0001<5>),
        .S(Mcompar_pipe_on_cmp_gt0000_lut<5>),
        .O(Mcompar_pipe_on_cmp_gt0000_cy<5>)
    );
    LUT2 Mcompar_pipe_on_cmp_gt0000_lut<6>
    (
        .I0(pipe_on_addsub0001<6>),
        .I1(vga_timer/vertical_pixel_counter<6>),
        .O(Mcompar_pipe_on_cmp_gt0000_lut<6>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0000_cy<6>
    (
        .CI(Mcompar_pipe_on_cmp_gt0000_cy<5>),
        .DI(pipe_on_addsub0001<6>),
        .S(Mcompar_pipe_on_cmp_gt0000_lut<6>),
        .O(Mcompar_pipe_on_cmp_gt0000_cy<6>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0000_cy<7>
    (
        .CI(Mcompar_pipe_on_cmp_gt0000_cy<6>),
        .DI(pipe_on_addsub0001<7>),
        .S(Mcompar_pipe_on_cmp_gt0000_lut<7>),
        .O(Mcompar_pipe_on_cmp_gt0000_cy<7>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0000_cy<8>
    (
        .CI(Mcompar_pipe_on_cmp_gt0000_cy<7>),
        .DI(pipe_on_addsub0001<8>),
        .S(Mcompar_pipe_on_cmp_gt0000_lut<8>),
        .O(Mcompar_pipe_on_cmp_gt0000_cy<8>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0000_cy<9>
    (
        .CI(Mcompar_pipe_on_cmp_gt0000_cy<8>),
        .DI(pipe_on_addsub0001<9>),
        .S(Mcompar_pipe_on_cmp_gt0000_lut<9>),
        .O(Mcompar_pipe_on_cmp_gt0000_cy<9>)
    );
    LUT2 Mcompar_pipe_on_cmp_ge0001_lut<0>
    (
        .I0(vga_timer/horizontal_pixel_counter<0>),
        .I1(col2_x<0>),
        .O(Mcompar_pipe_on_cmp_ge0001_lut<0>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0001_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(vga_timer/horizontal_pixel_counter<0>),
        .S(Mcompar_pipe_on_cmp_ge0001_lut<0>),
        .O(Mcompar_pipe_on_cmp_ge0001_cy<0>)
    );
    LUT2 Mcompar_pipe_on_cmp_ge0001_lut<1>
    (
        .I0(vga_timer/horizontal_pixel_counter<1>),
        .I1(col2_x<1>),
        .O(Mcompar_pipe_on_cmp_ge0001_lut<1>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0001_cy<1>
    (
        .CI(Mcompar_pipe_on_cmp_ge0001_cy<0>),
        .DI(vga_timer/horizontal_pixel_counter<1>),
        .S(Mcompar_pipe_on_cmp_ge0001_lut<1>),
        .O(Mcompar_pipe_on_cmp_ge0001_cy<1>)
    );
    LUT2 Mcompar_pipe_on_cmp_ge0001_lut<2>
    (
        .I0(vga_timer/horizontal_pixel_counter<2>),
        .I1(col2_x<2>),
        .O(Mcompar_pipe_on_cmp_ge0001_lut<2>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0001_cy<2>
    (
        .CI(Mcompar_pipe_on_cmp_ge0001_cy<1>),
        .DI(vga_timer/horizontal_pixel_counter<2>),
        .S(Mcompar_pipe_on_cmp_ge0001_lut<2>),
        .O(Mcompar_pipe_on_cmp_ge0001_cy<2>)
    );
    LUT2 Mcompar_pipe_on_cmp_ge0001_lut<3>
    (
        .I0(vga_timer/horizontal_pixel_counter<3>),
        .I1(col2_x<3>),
        .O(Mcompar_pipe_on_cmp_ge0001_lut<3>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0001_cy<3>
    (
        .CI(Mcompar_pipe_on_cmp_ge0001_cy<2>),
        .DI(vga_timer/horizontal_pixel_counter<3>),
        .S(Mcompar_pipe_on_cmp_ge0001_lut<3>),
        .O(Mcompar_pipe_on_cmp_ge0001_cy<3>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0001_cy<4>
    (
        .CI(Mcompar_pipe_on_cmp_ge0001_cy<3>),
        .DI(vga_timer/horizontal_pixel_counter<4>),
        .S(Mcompar_pipe_on_cmp_ge0001_lut<4>),
        .O(Mcompar_pipe_on_cmp_ge0001_cy<4>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0001_cy<5>
    (
        .CI(Mcompar_pipe_on_cmp_ge0001_cy<4>),
        .DI(vga_timer/horizontal_pixel_counter<5>),
        .S(Mcompar_pipe_on_cmp_ge0001_lut<5>),
        .O(Mcompar_pipe_on_cmp_ge0001_cy<5>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0001_cy<6>
    (
        .CI(Mcompar_pipe_on_cmp_ge0001_cy<5>),
        .DI(vga_timer/horizontal_pixel_counter<6>),
        .S(Mcompar_pipe_on_cmp_ge0001_lut<6>),
        .O(Mcompar_pipe_on_cmp_ge0001_cy<6>)
    );
    LUT2 Mcompar_pipe_on_cmp_ge0001_lut<7>
    (
        .I0(vga_timer/horizontal_pixel_counter<7>),
        .I1(pipe_on_addsub0002<7>),
        .O(Mcompar_pipe_on_cmp_ge0001_lut<7>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0001_cy<7>
    (
        .CI(Mcompar_pipe_on_cmp_ge0001_cy<6>),
        .DI(vga_timer/horizontal_pixel_counter<7>),
        .S(Mcompar_pipe_on_cmp_ge0001_lut<7>),
        .O(Mcompar_pipe_on_cmp_ge0001_cy<7>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0001_cy<8>
    (
        .CI(Mcompar_pipe_on_cmp_ge0001_cy<7>),
        .DI(vga_timer/horizontal_pixel_counter<8>),
        .S(Mcompar_pipe_on_cmp_ge0001_lut<8>),
        .O(Mcompar_pipe_on_cmp_ge0001_cy<8>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0001_cy<9>
    (
        .CI(Mcompar_pipe_on_cmp_ge0001_cy<8>),
        .DI(vga_timer/horizontal_pixel_counter<9>),
        .S(Mcompar_pipe_on_cmp_ge0001_lut<9>),
        .O(pipe_on_cmp_ge0001)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0001_lut<0>
    (
        .I0(vga_timer/horizontal_pixel_counter<0>),
        .I1(col2_x<0>),
        .O(Mcompar_pipe_on_cmp_lt0001_lut<0>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0001_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(vga_timer/horizontal_pixel_counter<0>),
        .S(Mcompar_pipe_on_cmp_lt0001_lut<0>),
        .O(Mcompar_pipe_on_cmp_lt0001_cy<0>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0001_lut<1>
    (
        .I0(vga_timer/horizontal_pixel_counter<1>),
        .I1(col2_x<1>),
        .O(Mcompar_pipe_on_cmp_lt0001_lut<1>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0001_cy<1>
    (
        .CI(Mcompar_pipe_on_cmp_lt0001_cy<0>),
        .DI(vga_timer/horizontal_pixel_counter<1>),
        .S(Mcompar_pipe_on_cmp_lt0001_lut<1>),
        .O(Mcompar_pipe_on_cmp_lt0001_cy<1>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0001_lut<2>
    (
        .I0(vga_timer/horizontal_pixel_counter<2>),
        .I1(col2_x<2>),
        .O(Mcompar_pipe_on_cmp_lt0001_lut<2>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0001_cy<2>
    (
        .CI(Mcompar_pipe_on_cmp_lt0001_cy<1>),
        .DI(vga_timer/horizontal_pixel_counter<2>),
        .S(Mcompar_pipe_on_cmp_lt0001_lut<2>),
        .O(Mcompar_pipe_on_cmp_lt0001_cy<2>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0001_lut<3>
    (
        .I0(vga_timer/horizontal_pixel_counter<3>),
        .I1(col2_x<3>),
        .O(Mcompar_pipe_on_cmp_lt0001_lut<3>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0001_cy<3>
    (
        .CI(Mcompar_pipe_on_cmp_lt0001_cy<2>),
        .DI(vga_timer/horizontal_pixel_counter<3>),
        .S(Mcompar_pipe_on_cmp_lt0001_lut<3>),
        .O(Mcompar_pipe_on_cmp_lt0001_cy<3>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0001_lut<4>
    (
        .I0(vga_timer/horizontal_pixel_counter<4>),
        .I1(col2_x<4>),
        .O(Mcompar_pipe_on_cmp_lt0001_lut<4>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0001_cy<4>
    (
        .CI(Mcompar_pipe_on_cmp_lt0001_cy<3>),
        .DI(vga_timer/horizontal_pixel_counter<4>),
        .S(Mcompar_pipe_on_cmp_lt0001_lut<4>),
        .O(Mcompar_pipe_on_cmp_lt0001_cy<4>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0001_lut<5>
    (
        .I0(vga_timer/horizontal_pixel_counter<5>),
        .I1(col2_x<5>),
        .O(Mcompar_pipe_on_cmp_lt0001_lut<5>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0001_cy<5>
    (
        .CI(Mcompar_pipe_on_cmp_lt0001_cy<4>),
        .DI(vga_timer/horizontal_pixel_counter<5>),
        .S(Mcompar_pipe_on_cmp_lt0001_lut<5>),
        .O(Mcompar_pipe_on_cmp_lt0001_cy<5>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0001_lut<6>
    (
        .I0(vga_timer/horizontal_pixel_counter<6>),
        .I1(col2_x<6>),
        .O(Mcompar_pipe_on_cmp_lt0001_lut<6>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0001_cy<6>
    (
        .CI(Mcompar_pipe_on_cmp_lt0001_cy<5>),
        .DI(vga_timer/horizontal_pixel_counter<6>),
        .S(Mcompar_pipe_on_cmp_lt0001_lut<6>),
        .O(Mcompar_pipe_on_cmp_lt0001_cy<6>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0001_lut<7>
    (
        .I0(vga_timer/horizontal_pixel_counter<7>),
        .I1(col2_x<7>),
        .O(Mcompar_pipe_on_cmp_lt0001_lut<7>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0001_cy<7>
    (
        .CI(Mcompar_pipe_on_cmp_lt0001_cy<6>),
        .DI(vga_timer/horizontal_pixel_counter<7>),
        .S(Mcompar_pipe_on_cmp_lt0001_lut<7>),
        .O(Mcompar_pipe_on_cmp_lt0001_cy<7>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0001_lut<8>
    (
        .I0(vga_timer/horizontal_pixel_counter<8>),
        .I1(col2_x<8>),
        .O(Mcompar_pipe_on_cmp_lt0001_lut<8>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0001_cy<8>
    (
        .CI(Mcompar_pipe_on_cmp_lt0001_cy<7>),
        .DI(vga_timer/horizontal_pixel_counter<8>),
        .S(Mcompar_pipe_on_cmp_lt0001_lut<8>),
        .O(Mcompar_pipe_on_cmp_lt0001_cy<8>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0001_lut<9>
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(col2_x<9>),
        .O(Mcompar_pipe_on_cmp_lt0001_lut<9>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0001_cy<9>
    (
        .CI(Mcompar_pipe_on_cmp_lt0001_cy<8>),
        .DI(vga_timer/horizontal_pixel_counter<9>),
        .S(Mcompar_pipe_on_cmp_lt0001_lut<9>),
        .O(Mcompar_pipe_on_cmp_lt0001_cy<9>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0003_lut<0>
    (
        .I0(col2_y<0>),
        .I1(vga_timer/vertical_pixel_counter<0>),
        .O(Mcompar_pipe_on_cmp_le0003_lut<0>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0003_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(col2_y<0>),
        .S(Mcompar_pipe_on_cmp_le0003_lut<0>),
        .O(Mcompar_pipe_on_cmp_le0003_cy<0>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0003_lut<1>
    (
        .I0(col2_y<0>),
        .I1(vga_timer/vertical_pixel_counter<1>),
        .O(Mcompar_pipe_on_cmp_le0003_lut<1>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0003_cy<1>
    (
        .CI(Mcompar_pipe_on_cmp_le0003_cy<0>),
        .DI(col2_y<0>),
        .S(Mcompar_pipe_on_cmp_le0003_lut<1>),
        .O(Mcompar_pipe_on_cmp_le0003_cy<1>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0003_lut<2>
    (
        .I0(col2_y<0>),
        .I1(vga_timer/vertical_pixel_counter<2>),
        .O(Mcompar_pipe_on_cmp_le0003_lut<2>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0003_cy<2>
    (
        .CI(Mcompar_pipe_on_cmp_le0003_cy<1>),
        .DI(col2_y<0>),
        .S(Mcompar_pipe_on_cmp_le0003_lut<2>),
        .O(Mcompar_pipe_on_cmp_le0003_cy<2>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0003_lut<3>
    (
        .I0(col2_y<0>),
        .I1(vga_timer/vertical_pixel_counter<3>),
        .O(Mcompar_pipe_on_cmp_le0003_lut<3>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0003_cy<3>
    (
        .CI(Mcompar_pipe_on_cmp_le0003_cy<2>),
        .DI(col2_y<0>),
        .S(Mcompar_pipe_on_cmp_le0003_lut<3>),
        .O(Mcompar_pipe_on_cmp_le0003_cy<3>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0003_lut<4>
    (
        .I0(col2_y<4>),
        .I1(vga_timer/vertical_pixel_counter<4>),
        .O(Mcompar_pipe_on_cmp_le0003_lut<4>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0003_cy<4>
    (
        .CI(Mcompar_pipe_on_cmp_le0003_cy<3>),
        .DI(col2_y<4>),
        .S(Mcompar_pipe_on_cmp_le0003_lut<4>),
        .O(Mcompar_pipe_on_cmp_le0003_cy<4>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0003_lut<5>
    (
        .I0(col2_y<5>),
        .I1(vga_timer/vertical_pixel_counter<5>),
        .O(Mcompar_pipe_on_cmp_le0003_lut<5>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0003_cy<5>
    (
        .CI(Mcompar_pipe_on_cmp_le0003_cy<4>),
        .DI(col2_y<5>),
        .S(Mcompar_pipe_on_cmp_le0003_lut<5>),
        .O(Mcompar_pipe_on_cmp_le0003_cy<5>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0003_lut<6>
    (
        .I0(col2_y<6>),
        .I1(vga_timer/vertical_pixel_counter<6>),
        .O(Mcompar_pipe_on_cmp_le0003_lut<6>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0003_cy<6>
    (
        .CI(Mcompar_pipe_on_cmp_le0003_cy<5>),
        .DI(col2_y<6>),
        .S(Mcompar_pipe_on_cmp_le0003_lut<6>),
        .O(Mcompar_pipe_on_cmp_le0003_cy<6>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0003_lut<7>
    (
        .I0(col2_y<7>),
        .I1(vga_timer/vertical_pixel_counter<7>),
        .O(Mcompar_pipe_on_cmp_le0003_lut<7>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0003_cy<7>
    (
        .CI(Mcompar_pipe_on_cmp_le0003_cy<6>),
        .DI(col2_y<7>),
        .S(Mcompar_pipe_on_cmp_le0003_lut<7>),
        .O(Mcompar_pipe_on_cmp_le0003_cy<7>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0003_lut<8>
    (
        .I0(col2_y<8>),
        .I1(vga_timer/vertical_pixel_counter<8>),
        .O(Mcompar_pipe_on_cmp_le0003_lut<8>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0003_cy<8>
    (
        .CI(Mcompar_pipe_on_cmp_le0003_cy<7>),
        .DI(col2_y<8>),
        .S(Mcompar_pipe_on_cmp_le0003_lut<8>),
        .O(Mcompar_pipe_on_cmp_le0003_cy<8>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0003_lut<9>
    (
        .I0(col2_y<8>),
        .I1(vga_timer/vertical_pixel_counter<9>),
        .O(Mcompar_pipe_on_cmp_le0003_lut<9>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0003_cy<9>
    (
        .CI(Mcompar_pipe_on_cmp_le0003_cy<8>),
        .DI(col2_y<8>),
        .S(Mcompar_pipe_on_cmp_le0003_lut<9>),
        .O(pipe_on_cmp_le0003)
    );
    LUT2 Mcompar_pipe_on_cmp_gt0001_lut<0>
    (
        .I0(col2_y<0>),
        .I1(vga_timer/vertical_pixel_counter<0>),
        .O(Mcompar_pipe_on_cmp_gt0001_lut<0>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0001_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(col2_y<0>),
        .S(Mcompar_pipe_on_cmp_gt0001_lut<0>),
        .O(Mcompar_pipe_on_cmp_gt0001_cy<0>)
    );
    LUT2 Mcompar_pipe_on_cmp_gt0001_lut<1>
    (
        .I0(col2_y<0>),
        .I1(vga_timer/vertical_pixel_counter<1>),
        .O(Mcompar_pipe_on_cmp_gt0001_lut<1>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0001_cy<1>
    (
        .CI(Mcompar_pipe_on_cmp_gt0001_cy<0>),
        .DI(col2_y<0>),
        .S(Mcompar_pipe_on_cmp_gt0001_lut<1>),
        .O(Mcompar_pipe_on_cmp_gt0001_cy<1>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0001_cy<2>
    (
        .CI(Mcompar_pipe_on_cmp_gt0001_cy<1>),
        .DI(pipe_on_addsub0003<2>),
        .S(Mcompar_pipe_on_cmp_gt0001_lut<2>),
        .O(Mcompar_pipe_on_cmp_gt0001_cy<2>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0001_cy<3>
    (
        .CI(Mcompar_pipe_on_cmp_gt0001_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_pipe_on_cmp_gt0001_lut<3>),
        .O(Mcompar_pipe_on_cmp_gt0001_cy<3>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0001_cy<4>
    (
        .CI(Mcompar_pipe_on_cmp_gt0001_cy<3>),
        .DI(pipe_on_addsub0003<4>),
        .S(Mcompar_pipe_on_cmp_gt0001_lut<4>),
        .O(Mcompar_pipe_on_cmp_gt0001_cy<4>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0001_cy<5>
    (
        .CI(Mcompar_pipe_on_cmp_gt0001_cy<4>),
        .DI(pipe_on_addsub0003<5>),
        .S(Mcompar_pipe_on_cmp_gt0001_lut<5>),
        .O(Mcompar_pipe_on_cmp_gt0001_cy<5>)
    );
    LUT2 Mcompar_pipe_on_cmp_gt0001_lut<6>
    (
        .I0(pipe_on_addsub0003<6>),
        .I1(vga_timer/vertical_pixel_counter<6>),
        .O(Mcompar_pipe_on_cmp_gt0001_lut<6>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0001_cy<6>
    (
        .CI(Mcompar_pipe_on_cmp_gt0001_cy<5>),
        .DI(pipe_on_addsub0003<6>),
        .S(Mcompar_pipe_on_cmp_gt0001_lut<6>),
        .O(Mcompar_pipe_on_cmp_gt0001_cy<6>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0001_cy<7>
    (
        .CI(Mcompar_pipe_on_cmp_gt0001_cy<6>),
        .DI(pipe_on_addsub0003<7>),
        .S(Mcompar_pipe_on_cmp_gt0001_lut<7>),
        .O(Mcompar_pipe_on_cmp_gt0001_cy<7>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0001_cy<8>
    (
        .CI(Mcompar_pipe_on_cmp_gt0001_cy<7>),
        .DI(pipe_on_addsub0003<8>),
        .S(Mcompar_pipe_on_cmp_gt0001_lut<8>),
        .O(Mcompar_pipe_on_cmp_gt0001_cy<8>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0001_cy<9>
    (
        .CI(Mcompar_pipe_on_cmp_gt0001_cy<8>),
        .DI(pipe_on_addsub0003<9>),
        .S(Mcompar_pipe_on_cmp_gt0001_lut<9>),
        .O(Mcompar_pipe_on_cmp_gt0001_cy<9>)
    );
    LUT2 Mcompar_pipe_on_cmp_ge0002_lut<0>
    (
        .I0(vga_timer/horizontal_pixel_counter<0>),
        .I1(col3_x<0>),
        .O(Mcompar_pipe_on_cmp_ge0002_lut<0>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0002_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(vga_timer/horizontal_pixel_counter<0>),
        .S(Mcompar_pipe_on_cmp_ge0002_lut<0>),
        .O(Mcompar_pipe_on_cmp_ge0002_cy<0>)
    );
    LUT2 Mcompar_pipe_on_cmp_ge0002_lut<1>
    (
        .I0(vga_timer/horizontal_pixel_counter<1>),
        .I1(col3_x<1>),
        .O(Mcompar_pipe_on_cmp_ge0002_lut<1>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0002_cy<1>
    (
        .CI(Mcompar_pipe_on_cmp_ge0002_cy<0>),
        .DI(vga_timer/horizontal_pixel_counter<1>),
        .S(Mcompar_pipe_on_cmp_ge0002_lut<1>),
        .O(Mcompar_pipe_on_cmp_ge0002_cy<1>)
    );
    LUT2 Mcompar_pipe_on_cmp_ge0002_lut<2>
    (
        .I0(vga_timer/horizontal_pixel_counter<2>),
        .I1(col3_x<2>),
        .O(Mcompar_pipe_on_cmp_ge0002_lut<2>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0002_cy<2>
    (
        .CI(Mcompar_pipe_on_cmp_ge0002_cy<1>),
        .DI(vga_timer/horizontal_pixel_counter<2>),
        .S(Mcompar_pipe_on_cmp_ge0002_lut<2>),
        .O(Mcompar_pipe_on_cmp_ge0002_cy<2>)
    );
    LUT2 Mcompar_pipe_on_cmp_ge0002_lut<3>
    (
        .I0(vga_timer/horizontal_pixel_counter<3>),
        .I1(col3_x<3>),
        .O(Mcompar_pipe_on_cmp_ge0002_lut<3>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0002_cy<3>
    (
        .CI(Mcompar_pipe_on_cmp_ge0002_cy<2>),
        .DI(vga_timer/horizontal_pixel_counter<3>),
        .S(Mcompar_pipe_on_cmp_ge0002_lut<3>),
        .O(Mcompar_pipe_on_cmp_ge0002_cy<3>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0002_cy<4>
    (
        .CI(Mcompar_pipe_on_cmp_ge0002_cy<3>),
        .DI(vga_timer/horizontal_pixel_counter<4>),
        .S(Mcompar_pipe_on_cmp_ge0002_lut<4>),
        .O(Mcompar_pipe_on_cmp_ge0002_cy<4>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0002_cy<5>
    (
        .CI(Mcompar_pipe_on_cmp_ge0002_cy<4>),
        .DI(vga_timer/horizontal_pixel_counter<5>),
        .S(Mcompar_pipe_on_cmp_ge0002_lut<5>),
        .O(Mcompar_pipe_on_cmp_ge0002_cy<5>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0002_cy<6>
    (
        .CI(Mcompar_pipe_on_cmp_ge0002_cy<5>),
        .DI(vga_timer/horizontal_pixel_counter<6>),
        .S(Mcompar_pipe_on_cmp_ge0002_lut<6>),
        .O(Mcompar_pipe_on_cmp_ge0002_cy<6>)
    );
    LUT2 Mcompar_pipe_on_cmp_ge0002_lut<7>
    (
        .I0(vga_timer/horizontal_pixel_counter<7>),
        .I1(pipe_on_addsub0004<7>),
        .O(Mcompar_pipe_on_cmp_ge0002_lut<7>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0002_cy<7>
    (
        .CI(Mcompar_pipe_on_cmp_ge0002_cy<6>),
        .DI(vga_timer/horizontal_pixel_counter<7>),
        .S(Mcompar_pipe_on_cmp_ge0002_lut<7>),
        .O(Mcompar_pipe_on_cmp_ge0002_cy<7>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0002_cy<8>
    (
        .CI(Mcompar_pipe_on_cmp_ge0002_cy<7>),
        .DI(vga_timer/horizontal_pixel_counter<8>),
        .S(Mcompar_pipe_on_cmp_ge0002_lut<8>),
        .O(Mcompar_pipe_on_cmp_ge0002_cy<8>)
    );
    MUXCY Mcompar_pipe_on_cmp_ge0002_cy<9>
    (
        .CI(Mcompar_pipe_on_cmp_ge0002_cy<8>),
        .DI(vga_timer/horizontal_pixel_counter<9>),
        .S(Mcompar_pipe_on_cmp_ge0002_lut<9>),
        .O(pipe_on_cmp_ge0002)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0002_lut<0>
    (
        .I0(vga_timer/horizontal_pixel_counter<0>),
        .I1(col3_x<0>),
        .O(Mcompar_pipe_on_cmp_lt0002_lut<0>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0002_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(vga_timer/horizontal_pixel_counter<0>),
        .S(Mcompar_pipe_on_cmp_lt0002_lut<0>),
        .O(Mcompar_pipe_on_cmp_lt0002_cy<0>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0002_lut<1>
    (
        .I0(vga_timer/horizontal_pixel_counter<1>),
        .I1(col3_x<1>),
        .O(Mcompar_pipe_on_cmp_lt0002_lut<1>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0002_cy<1>
    (
        .CI(Mcompar_pipe_on_cmp_lt0002_cy<0>),
        .DI(vga_timer/horizontal_pixel_counter<1>),
        .S(Mcompar_pipe_on_cmp_lt0002_lut<1>),
        .O(Mcompar_pipe_on_cmp_lt0002_cy<1>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0002_lut<2>
    (
        .I0(vga_timer/horizontal_pixel_counter<2>),
        .I1(col3_x<2>),
        .O(Mcompar_pipe_on_cmp_lt0002_lut<2>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0002_cy<2>
    (
        .CI(Mcompar_pipe_on_cmp_lt0002_cy<1>),
        .DI(vga_timer/horizontal_pixel_counter<2>),
        .S(Mcompar_pipe_on_cmp_lt0002_lut<2>),
        .O(Mcompar_pipe_on_cmp_lt0002_cy<2>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0002_lut<3>
    (
        .I0(vga_timer/horizontal_pixel_counter<3>),
        .I1(col3_x<3>),
        .O(Mcompar_pipe_on_cmp_lt0002_lut<3>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0002_cy<3>
    (
        .CI(Mcompar_pipe_on_cmp_lt0002_cy<2>),
        .DI(vga_timer/horizontal_pixel_counter<3>),
        .S(Mcompar_pipe_on_cmp_lt0002_lut<3>),
        .O(Mcompar_pipe_on_cmp_lt0002_cy<3>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0002_lut<4>
    (
        .I0(vga_timer/horizontal_pixel_counter<4>),
        .I1(col3_x<4>),
        .O(Mcompar_pipe_on_cmp_lt0002_lut<4>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0002_cy<4>
    (
        .CI(Mcompar_pipe_on_cmp_lt0002_cy<3>),
        .DI(vga_timer/horizontal_pixel_counter<4>),
        .S(Mcompar_pipe_on_cmp_lt0002_lut<4>),
        .O(Mcompar_pipe_on_cmp_lt0002_cy<4>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0002_lut<5>
    (
        .I0(vga_timer/horizontal_pixel_counter<5>),
        .I1(col3_x<5>),
        .O(Mcompar_pipe_on_cmp_lt0002_lut<5>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0002_cy<5>
    (
        .CI(Mcompar_pipe_on_cmp_lt0002_cy<4>),
        .DI(vga_timer/horizontal_pixel_counter<5>),
        .S(Mcompar_pipe_on_cmp_lt0002_lut<5>),
        .O(Mcompar_pipe_on_cmp_lt0002_cy<5>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0002_lut<6>
    (
        .I0(vga_timer/horizontal_pixel_counter<6>),
        .I1(col3_x<6>),
        .O(Mcompar_pipe_on_cmp_lt0002_lut<6>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0002_cy<6>
    (
        .CI(Mcompar_pipe_on_cmp_lt0002_cy<5>),
        .DI(vga_timer/horizontal_pixel_counter<6>),
        .S(Mcompar_pipe_on_cmp_lt0002_lut<6>),
        .O(Mcompar_pipe_on_cmp_lt0002_cy<6>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0002_lut<7>
    (
        .I0(vga_timer/horizontal_pixel_counter<7>),
        .I1(col3_x<7>),
        .O(Mcompar_pipe_on_cmp_lt0002_lut<7>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0002_cy<7>
    (
        .CI(Mcompar_pipe_on_cmp_lt0002_cy<6>),
        .DI(vga_timer/horizontal_pixel_counter<7>),
        .S(Mcompar_pipe_on_cmp_lt0002_lut<7>),
        .O(Mcompar_pipe_on_cmp_lt0002_cy<7>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0002_lut<8>
    (
        .I0(vga_timer/horizontal_pixel_counter<8>),
        .I1(col3_x<8>),
        .O(Mcompar_pipe_on_cmp_lt0002_lut<8>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0002_cy<8>
    (
        .CI(Mcompar_pipe_on_cmp_lt0002_cy<7>),
        .DI(vga_timer/horizontal_pixel_counter<8>),
        .S(Mcompar_pipe_on_cmp_lt0002_lut<8>),
        .O(Mcompar_pipe_on_cmp_lt0002_cy<8>)
    );
    LUT2 Mcompar_pipe_on_cmp_lt0002_lut<9>
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(col3_x<9>),
        .O(Mcompar_pipe_on_cmp_lt0002_lut<9>)
    );
    MUXCY Mcompar_pipe_on_cmp_lt0002_cy<9>
    (
        .CI(Mcompar_pipe_on_cmp_lt0002_cy<8>),
        .DI(vga_timer/horizontal_pixel_counter<9>),
        .S(Mcompar_pipe_on_cmp_lt0002_lut<9>),
        .O(Mcompar_pipe_on_cmp_lt0002_cy<9>)
    );
    LUT2 Mcompar_pipe_on_cmp_gt0002_lut<0>
    (
        .I0(col3_y<0>),
        .I1(vga_timer/vertical_pixel_counter<0>),
        .O(Mcompar_pipe_on_cmp_gt0002_lut<0>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0002_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(col3_y<0>),
        .S(Mcompar_pipe_on_cmp_gt0002_lut<0>),
        .O(Mcompar_pipe_on_cmp_gt0002_cy<0>)
    );
    LUT2 Mcompar_pipe_on_cmp_gt0002_lut<1>
    (
        .I0(col3_y<0>),
        .I1(vga_timer/vertical_pixel_counter<1>),
        .O(Mcompar_pipe_on_cmp_gt0002_lut<1>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0002_cy<1>
    (
        .CI(Mcompar_pipe_on_cmp_gt0002_cy<0>),
        .DI(col3_y<0>),
        .S(Mcompar_pipe_on_cmp_gt0002_lut<1>),
        .O(Mcompar_pipe_on_cmp_gt0002_cy<1>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0002_cy<2>
    (
        .CI(Mcompar_pipe_on_cmp_gt0002_cy<1>),
        .DI(pipe_on_addsub0005<2>),
        .S(Mcompar_pipe_on_cmp_gt0002_lut<2>),
        .O(Mcompar_pipe_on_cmp_gt0002_cy<2>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0002_cy<3>
    (
        .CI(Mcompar_pipe_on_cmp_gt0002_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_pipe_on_cmp_gt0002_lut<3>),
        .O(Mcompar_pipe_on_cmp_gt0002_cy<3>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0002_cy<4>
    (
        .CI(Mcompar_pipe_on_cmp_gt0002_cy<3>),
        .DI(pipe_on_addsub0005<4>),
        .S(Mcompar_pipe_on_cmp_gt0002_lut<4>),
        .O(Mcompar_pipe_on_cmp_gt0002_cy<4>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0002_cy<5>
    (
        .CI(Mcompar_pipe_on_cmp_gt0002_cy<4>),
        .DI(pipe_on_addsub0005<5>),
        .S(Mcompar_pipe_on_cmp_gt0002_lut<5>),
        .O(Mcompar_pipe_on_cmp_gt0002_cy<5>)
    );
    LUT2 Mcompar_pipe_on_cmp_gt0002_lut<6>
    (
        .I0(pipe_on_addsub0005<6>),
        .I1(vga_timer/vertical_pixel_counter<6>),
        .O(Mcompar_pipe_on_cmp_gt0002_lut<6>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0002_cy<6>
    (
        .CI(Mcompar_pipe_on_cmp_gt0002_cy<5>),
        .DI(pipe_on_addsub0005<6>),
        .S(Mcompar_pipe_on_cmp_gt0002_lut<6>),
        .O(Mcompar_pipe_on_cmp_gt0002_cy<6>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0002_cy<7>
    (
        .CI(Mcompar_pipe_on_cmp_gt0002_cy<6>),
        .DI(pipe_on_addsub0005<7>),
        .S(Mcompar_pipe_on_cmp_gt0002_lut<7>),
        .O(Mcompar_pipe_on_cmp_gt0002_cy<7>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0002_cy<8>
    (
        .CI(Mcompar_pipe_on_cmp_gt0002_cy<7>),
        .DI(pipe_on_addsub0005<8>),
        .S(Mcompar_pipe_on_cmp_gt0002_lut<8>),
        .O(Mcompar_pipe_on_cmp_gt0002_cy<8>)
    );
    MUXCY Mcompar_pipe_on_cmp_gt0002_cy<9>
    (
        .CI(Mcompar_pipe_on_cmp_gt0002_cy<8>),
        .DI(pipe_on_addsub0005<9>),
        .S(Mcompar_pipe_on_cmp_gt0002_lut<9>),
        .O(Mcompar_pipe_on_cmp_gt0002_cy<9>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0005_lut<0>
    (
        .I0(col3_y<0>),
        .I1(vga_timer/vertical_pixel_counter<0>),
        .O(Mcompar_pipe_on_cmp_le0005_lut<0>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0005_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(col3_y<0>),
        .S(Mcompar_pipe_on_cmp_le0005_lut<0>),
        .O(Mcompar_pipe_on_cmp_le0005_cy<0>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0005_lut<1>
    (
        .I0(col3_y<0>),
        .I1(vga_timer/vertical_pixel_counter<1>),
        .O(Mcompar_pipe_on_cmp_le0005_lut<1>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0005_cy<1>
    (
        .CI(Mcompar_pipe_on_cmp_le0005_cy<0>),
        .DI(col3_y<0>),
        .S(Mcompar_pipe_on_cmp_le0005_lut<1>),
        .O(Mcompar_pipe_on_cmp_le0005_cy<1>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0005_lut<2>
    (
        .I0(col3_y<0>),
        .I1(vga_timer/vertical_pixel_counter<2>),
        .O(Mcompar_pipe_on_cmp_le0005_lut<2>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0005_cy<2>
    (
        .CI(Mcompar_pipe_on_cmp_le0005_cy<1>),
        .DI(col3_y<0>),
        .S(Mcompar_pipe_on_cmp_le0005_lut<2>),
        .O(Mcompar_pipe_on_cmp_le0005_cy<2>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0005_lut<3>
    (
        .I0(col3_y<0>),
        .I1(vga_timer/vertical_pixel_counter<3>),
        .O(Mcompar_pipe_on_cmp_le0005_lut<3>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0005_cy<3>
    (
        .CI(Mcompar_pipe_on_cmp_le0005_cy<2>),
        .DI(col3_y<0>),
        .S(Mcompar_pipe_on_cmp_le0005_lut<3>),
        .O(Mcompar_pipe_on_cmp_le0005_cy<3>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0005_lut<4>
    (
        .I0(col3_y<4>),
        .I1(vga_timer/vertical_pixel_counter<4>),
        .O(Mcompar_pipe_on_cmp_le0005_lut<4>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0005_cy<4>
    (
        .CI(Mcompar_pipe_on_cmp_le0005_cy<3>),
        .DI(col3_y<4>),
        .S(Mcompar_pipe_on_cmp_le0005_lut<4>),
        .O(Mcompar_pipe_on_cmp_le0005_cy<4>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0005_lut<5>
    (
        .I0(col3_y<5>),
        .I1(vga_timer/vertical_pixel_counter<5>),
        .O(Mcompar_pipe_on_cmp_le0005_lut<5>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0005_cy<5>
    (
        .CI(Mcompar_pipe_on_cmp_le0005_cy<4>),
        .DI(col3_y<5>),
        .S(Mcompar_pipe_on_cmp_le0005_lut<5>),
        .O(Mcompar_pipe_on_cmp_le0005_cy<5>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0005_lut<6>
    (
        .I0(col3_y<6>),
        .I1(vga_timer/vertical_pixel_counter<6>),
        .O(Mcompar_pipe_on_cmp_le0005_lut<6>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0005_cy<6>
    (
        .CI(Mcompar_pipe_on_cmp_le0005_cy<5>),
        .DI(col3_y<6>),
        .S(Mcompar_pipe_on_cmp_le0005_lut<6>),
        .O(Mcompar_pipe_on_cmp_le0005_cy<6>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0005_lut<7>
    (
        .I0(col3_y<7>),
        .I1(vga_timer/vertical_pixel_counter<7>),
        .O(Mcompar_pipe_on_cmp_le0005_lut<7>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0005_cy<7>
    (
        .CI(Mcompar_pipe_on_cmp_le0005_cy<6>),
        .DI(col3_y<7>),
        .S(Mcompar_pipe_on_cmp_le0005_lut<7>),
        .O(Mcompar_pipe_on_cmp_le0005_cy<7>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0005_lut<8>
    (
        .I0(col3_y<8>),
        .I1(vga_timer/vertical_pixel_counter<8>),
        .O(Mcompar_pipe_on_cmp_le0005_lut<8>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0005_cy<8>
    (
        .CI(Mcompar_pipe_on_cmp_le0005_cy<7>),
        .DI(col3_y<8>),
        .S(Mcompar_pipe_on_cmp_le0005_lut<8>),
        .O(Mcompar_pipe_on_cmp_le0005_cy<8>)
    );
    LUT2 Mcompar_pipe_on_cmp_le0005_lut<9>
    (
        .I0(col3_y<8>),
        .I1(vga_timer/vertical_pixel_counter<9>),
        .O(Mcompar_pipe_on_cmp_le0005_lut<9>)
    );
    MUXCY Mcompar_pipe_on_cmp_le0005_cy<9>
    (
        .CI(Mcompar_pipe_on_cmp_le0005_cy<8>),
        .DI(col3_y<8>),
        .S(Mcompar_pipe_on_cmp_le0005_lut<9>),
        .O(pipe_on_cmp_le0005)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0000_lut<0>
    (
        .I0(bird_top<1>),
        .I1(bird_top<0>),
        .I2(vga_timer/vertical_pixel_counter<0>),
        .I3(vga_timer/vertical_pixel_counter<1>),
        .O(Mcompar_bird_outline_on_cmp_eq0000_lut<0>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0000_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0000_lut<0>),
        .O(Mcompar_bird_outline_on_cmp_eq0000_cy<0>)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0000_lut<1>
    (
        .I0(bird_top<2>),
        .I1(vga_timer/vertical_pixel_counter<3>),
        .I2(vga_timer/vertical_pixel_counter<2>),
        .I3(bird_top<3>),
        .O(Mcompar_bird_outline_on_cmp_eq0000_lut<1>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0000_cy<1>
    (
        .CI(Mcompar_bird_outline_on_cmp_eq0000_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0000_lut<1>),
        .O(Mcompar_bird_outline_on_cmp_eq0000_cy<1>)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0000_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_top<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_top<5>),
        .O(Mcompar_bird_outline_on_cmp_eq0000_lut<2>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0000_cy<2>
    (
        .CI(Mcompar_bird_outline_on_cmp_eq0000_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0000_lut<2>),
        .O(Mcompar_bird_outline_on_cmp_eq0000_cy<2>)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0000_lut<3>
    (
        .I0(bird_top<6>),
        .I1(bird_top<7>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(vga_timer/vertical_pixel_counter<6>),
        .O(Mcompar_bird_outline_on_cmp_eq0000_lut<3>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0000_cy<3>
    (
        .CI(Mcompar_bird_outline_on_cmp_eq0000_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0000_lut<3>),
        .O(Mcompar_bird_outline_on_cmp_eq0000_cy<3>)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0000_lut<4>
    (
        .I0(Madd_bird_color_on_add0002_lut<9>),
        .I1(bird_top<8>),
        .I2(vga_timer/vertical_pixel_counter<8>),
        .I3(vga_timer/vertical_pixel_counter<9>),
        .O(Mcompar_bird_outline_on_cmp_eq0000_lut<4>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0000_cy<4>
    (
        .CI(Mcompar_bird_outline_on_cmp_eq0000_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0000_lut<4>),
        .O(Mcompar_bird_outline_on_cmp_eq0000_cy<4>)
    );
    LUT2 Madd_bird_top_temp_addsub0001_lut<0>
    (
        .I0(fall_reg<0>),
        .I1(bird_top_temp_addsub0000<0>),
        .O(Madd_bird_top_temp_addsub0001_lut<0>)
    );
    MUXCY Madd_bird_top_temp_addsub0001_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(bird_top_temp_addsub0000<0>),
        .S(Madd_bird_top_temp_addsub0001_lut<0>),
        .O(Madd_bird_top_temp_addsub0001_cy<0>)
    );
    XORCY Madd_bird_top_temp_addsub0001_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(Madd_bird_top_temp_addsub0001_lut<0>),
        .O(bird_top_temp_addsub0001<0>)
    );
    LUT2 Madd_bird_top_temp_addsub0001_lut<1>
    (
        .I0(fall_reg<1>),
        .I1(bird_top_temp_addsub0000<1>),
        .O(Madd_bird_top_temp_addsub0001_lut<1>)
    );
    MUXCY Madd_bird_top_temp_addsub0001_cy<1>
    (
        .CI(Madd_bird_top_temp_addsub0001_cy<0>),
        .DI(bird_top_temp_addsub0000<1>),
        .S(Madd_bird_top_temp_addsub0001_lut<1>),
        .O(Madd_bird_top_temp_addsub0001_cy<1>)
    );
    XORCY Madd_bird_top_temp_addsub0001_xor<1>
    (
        .CI(Madd_bird_top_temp_addsub0001_cy<0>),
        .LI(Madd_bird_top_temp_addsub0001_lut<1>),
        .O(bird_top_temp_addsub0001<1>)
    );
    LUT2 Madd_bird_top_temp_addsub0001_lut<2>
    (
        .I0(fall_reg<2>),
        .I1(bird_top_temp_addsub0000<2>),
        .O(Madd_bird_top_temp_addsub0001_lut<2>)
    );
    MUXCY Madd_bird_top_temp_addsub0001_cy<2>
    (
        .CI(Madd_bird_top_temp_addsub0001_cy<1>),
        .DI(bird_top_temp_addsub0000<2>),
        .S(Madd_bird_top_temp_addsub0001_lut<2>),
        .O(Madd_bird_top_temp_addsub0001_cy<2>)
    );
    XORCY Madd_bird_top_temp_addsub0001_xor<2>
    (
        .CI(Madd_bird_top_temp_addsub0001_cy<1>),
        .LI(Madd_bird_top_temp_addsub0001_lut<2>),
        .O(bird_top_temp_addsub0001<2>)
    );
    LUT2 Madd_bird_top_temp_addsub0001_lut<3>
    (
        .I0(fall_reg<3>),
        .I1(bird_top_temp_addsub0000<3>),
        .O(Madd_bird_top_temp_addsub0001_lut<3>)
    );
    MUXCY Madd_bird_top_temp_addsub0001_cy<3>
    (
        .CI(Madd_bird_top_temp_addsub0001_cy<2>),
        .DI(bird_top_temp_addsub0000<3>),
        .S(Madd_bird_top_temp_addsub0001_lut<3>),
        .O(Madd_bird_top_temp_addsub0001_cy<3>)
    );
    XORCY Madd_bird_top_temp_addsub0001_xor<3>
    (
        .CI(Madd_bird_top_temp_addsub0001_cy<2>),
        .LI(Madd_bird_top_temp_addsub0001_lut<3>),
        .O(bird_top_temp_addsub0001<3>)
    );
    MUXCY Madd_bird_top_temp_addsub0001_cy<4>
    (
        .CI(Madd_bird_top_temp_addsub0001_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_top_temp_addsub0001_cy<4>_rt),
        .O(Madd_bird_top_temp_addsub0001_cy<4>)
    );
    XORCY Madd_bird_top_temp_addsub0001_xor<4>
    (
        .CI(Madd_bird_top_temp_addsub0001_cy<3>),
        .LI(Madd_bird_top_temp_addsub0001_cy<4>_rt),
        .O(bird_top_temp_addsub0001<4>)
    );
    MUXCY Madd_bird_top_temp_addsub0001_cy<5>
    (
        .CI(Madd_bird_top_temp_addsub0001_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_top_temp_addsub0001_cy<5>_rt),
        .O(Madd_bird_top_temp_addsub0001_cy<5>)
    );
    XORCY Madd_bird_top_temp_addsub0001_xor<5>
    (
        .CI(Madd_bird_top_temp_addsub0001_cy<4>),
        .LI(Madd_bird_top_temp_addsub0001_cy<5>_rt),
        .O(bird_top_temp_addsub0001<5>)
    );
    MUXCY Madd_bird_top_temp_addsub0001_cy<6>
    (
        .CI(Madd_bird_top_temp_addsub0001_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_top_temp_addsub0001_cy<6>_rt),
        .O(Madd_bird_top_temp_addsub0001_cy<6>)
    );
    XORCY Madd_bird_top_temp_addsub0001_xor<6>
    (
        .CI(Madd_bird_top_temp_addsub0001_cy<5>),
        .LI(Madd_bird_top_temp_addsub0001_cy<6>_rt),
        .O(bird_top_temp_addsub0001<6>)
    );
    MUXCY Madd_bird_top_temp_addsub0001_cy<7>
    (
        .CI(Madd_bird_top_temp_addsub0001_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_top_temp_addsub0001_cy<7>_rt),
        .O(Madd_bird_top_temp_addsub0001_cy<7>)
    );
    XORCY Madd_bird_top_temp_addsub0001_xor<7>
    (
        .CI(Madd_bird_top_temp_addsub0001_cy<6>),
        .LI(Madd_bird_top_temp_addsub0001_cy<7>_rt),
        .O(bird_top_temp_addsub0001<7>)
    );
    MUXCY Madd_bird_top_temp_addsub0001_cy<8>
    (
        .CI(Madd_bird_top_temp_addsub0001_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Madd_bird_top_temp_addsub0001_cy<8>_rt),
        .O(Madd_bird_top_temp_addsub0001_cy<8>)
    );
    XORCY Madd_bird_top_temp_addsub0001_xor<8>
    (
        .CI(Madd_bird_top_temp_addsub0001_cy<7>),
        .LI(Madd_bird_top_temp_addsub0001_cy<8>_rt),
        .O(bird_top_temp_addsub0001<8>)
    );
    XORCY Madd_bird_top_temp_addsub0001_xor<9>
    (
        .CI(Madd_bird_top_temp_addsub0001_cy<8>),
        .LI(bird_top_temp_addsub0000<9>),
        .O(bird_top_temp_addsub0001<9>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0000_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_top<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_color_on_add0000<1>),
        .O(Mcompar_bird_color_on_cmp_eq0000_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0000_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0000_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0000_cy<0>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0000_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_color_on_add0000<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_color_on_add0000<3>),
        .O(Mcompar_bird_color_on_cmp_eq0000_lut<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0000_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0000_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0000_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0000_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0000_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_color_on_add0000<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_color_on_add0000<5>),
        .O(Mcompar_bird_color_on_cmp_eq0000_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0000_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0000_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0000_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0000_cy<2>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0000_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_color_on_add0000<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_color_on_add0000<7>),
        .O(Mcompar_bird_color_on_cmp_eq0000_lut<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0000_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0000_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0000_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0000_cy<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0000_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_color_on_add0000<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_color_on_add0000<9>),
        .O(Mcompar_bird_color_on_cmp_eq0000_lut<4>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0000_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0000_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0000_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0000_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0001_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_color_on_add0001<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_color_on_add0001<1>),
        .O(Mcompar_bird_color_on_cmp_eq0001_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0001_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0001_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0001_cy<0>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0001_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_color_on_add0001<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_color_on_add0001<3>),
        .O(Mcompar_bird_color_on_cmp_eq0001_lut<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0001_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0001_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0001_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0001_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0001_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_color_on_add0001<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_color_on_add0001<5>),
        .O(Mcompar_bird_color_on_cmp_eq0001_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0001_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0001_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0001_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0001_cy<2>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0001_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_color_on_add0001<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_color_on_add0001<7>),
        .O(Mcompar_bird_color_on_cmp_eq0001_lut<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0001_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0001_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0001_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0001_cy<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0001_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_color_on_add0001<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_color_on_add0001<9>),
        .O(Mcompar_bird_color_on_cmp_eq0001_lut<4>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0001_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0001_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0001_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0001_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0002_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_top<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_top<1>),
        .O(Mcompar_bird_color_on_cmp_eq0002_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0002_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0002_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0002_cy<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0002_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0002_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0002_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0002_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0002_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<5>),
        .I1(vga_timer/vertical_pixel_counter<4>),
        .I2(bird_color_on_add0002<5>),
        .I3(bird_color_on_add0002<4>),
        .O(Mcompar_bird_color_on_cmp_eq0002_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0002_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0002_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0002_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0002_cy<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0002_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0002_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0002_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0002_cy<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0002_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0002_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0002_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0002_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0003_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_color_on_add0003<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_color_on_add0003<1>),
        .O(Mcompar_bird_color_on_cmp_eq0003_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0003_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0003_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0003_cy<0>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0003_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_color_on_add0003<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_color_on_add0003<3>),
        .O(Mcompar_bird_color_on_cmp_eq0003_lut<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0003_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0003_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0003_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0003_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0003_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_color_on_add0003<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_color_on_add0003<5>),
        .O(Mcompar_bird_color_on_cmp_eq0003_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0003_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0003_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0003_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0003_cy<2>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0003_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_color_on_add0003<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_color_on_add0003<7>),
        .O(Mcompar_bird_color_on_cmp_eq0003_lut<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0003_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0003_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0003_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0003_cy<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0003_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_color_on_add0003<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_color_on_add0003<9>),
        .O(Mcompar_bird_color_on_cmp_eq0003_lut<4>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0003_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0003_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0003_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0003_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0004_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_top<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_color_on_add0004<1>),
        .O(Mcompar_bird_color_on_cmp_eq0004_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0004_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0004_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0004_cy<0>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0004_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_color_on_add0004<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_color_on_add0004<3>),
        .O(Mcompar_bird_color_on_cmp_eq0004_lut<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0004_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0004_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0004_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0004_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0004_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_color_on_add0004<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_color_on_add0004<5>),
        .O(Mcompar_bird_color_on_cmp_eq0004_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0004_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0004_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0004_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0004_cy<2>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0004_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_color_on_add0004<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_color_on_add0004<7>),
        .O(Mcompar_bird_color_on_cmp_eq0004_lut<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0004_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0004_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0004_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0004_cy<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0004_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_color_on_add0004<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_color_on_add0004<9>),
        .O(Mcompar_bird_color_on_cmp_eq0004_lut<4>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0004_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0004_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0004_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0004_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0005_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_color_on_add0005<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_color_on_add0005<1>),
        .O(Mcompar_bird_color_on_cmp_eq0005_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0005_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0005_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0005_cy<0>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0005_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_color_on_add0005<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_color_on_add0005<3>),
        .O(Mcompar_bird_color_on_cmp_eq0005_lut<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0005_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0005_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0005_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0005_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0005_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_color_on_add0005<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_color_on_add0005<5>),
        .O(Mcompar_bird_color_on_cmp_eq0005_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0005_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0005_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0005_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0005_cy<2>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0005_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_color_on_add0005<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_color_on_add0005<7>),
        .O(Mcompar_bird_color_on_cmp_eq0005_lut<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0005_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0005_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0005_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0005_cy<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0005_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_color_on_add0005<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_color_on_add0005<9>),
        .O(Mcompar_bird_color_on_cmp_eq0005_lut<4>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0005_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0005_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0005_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0005_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0006_lut<0>
    (
        .I0(bird_top<1>),
        .I1(bird_top<0>),
        .I2(vga_timer/vertical_pixel_counter<0>),
        .I3(vga_timer/vertical_pixel_counter<1>),
        .O(Mcompar_bird_color_on_cmp_eq0006_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0006_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0006_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0006_cy<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0006_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0006_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0006_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0006_cy<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0006_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0006_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0006_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0006_cy<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0006_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0006_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0006_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0006_cy<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0006_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0006_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0006_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0006_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0007_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_color_on_add0007<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_color_on_add0007<1>),
        .O(Mcompar_bird_color_on_cmp_eq0007_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0007_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0007_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0007_cy<0>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0007_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_color_on_add0007<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_color_on_add0007<3>),
        .O(Mcompar_bird_color_on_cmp_eq0007_lut<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0007_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0007_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0007_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0007_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0007_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_color_on_add0007<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_color_on_add0007<5>),
        .O(Mcompar_bird_color_on_cmp_eq0007_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0007_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0007_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0007_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0007_cy<2>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0007_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_color_on_add0007<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_color_on_add0007<7>),
        .O(Mcompar_bird_color_on_cmp_eq0007_lut<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0007_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0007_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0007_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0007_cy<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0007_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_color_on_add0007<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_color_on_add0007<9>),
        .O(Mcompar_bird_color_on_cmp_eq0007_lut<4>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0007_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0007_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0007_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0007_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0009_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_color_on_add0009<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_color_on_add0009<1>),
        .O(Mcompar_bird_color_on_cmp_eq0009_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0009_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0009_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0009_cy<0>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0009_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_color_on_add0009<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_color_on_add0009<3>),
        .O(Mcompar_bird_color_on_cmp_eq0009_lut<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0009_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0009_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0009_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0009_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0009_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_color_on_add0009<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_color_on_add0009<5>),
        .O(Mcompar_bird_color_on_cmp_eq0009_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0009_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0009_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0009_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0009_cy<2>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0009_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_color_on_add0009<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_color_on_add0009<7>),
        .O(Mcompar_bird_color_on_cmp_eq0009_lut<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0009_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0009_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0009_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0009_cy<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0009_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_color_on_add0009<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_color_on_add0009<9>),
        .O(Mcompar_bird_color_on_cmp_eq0009_lut<4>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0009_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0009_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0009_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0009_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0008_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_top<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_color_on_add0008<1>),
        .O(Mcompar_bird_color_on_cmp_eq0008_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0008_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0008_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0008_cy<0>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0008_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_color_on_add0008<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_color_on_add0008<3>),
        .O(Mcompar_bird_color_on_cmp_eq0008_lut<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0008_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0008_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0008_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0008_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0008_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_color_on_add0008<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_color_on_add0008<5>),
        .O(Mcompar_bird_color_on_cmp_eq0008_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0008_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0008_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0008_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0008_cy<2>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0008_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_color_on_add0008<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_color_on_add0008<7>),
        .O(Mcompar_bird_color_on_cmp_eq0008_lut<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0008_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0008_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0008_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0008_cy<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0008_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_color_on_add0008<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_color_on_add0008<9>),
        .O(Mcompar_bird_color_on_cmp_eq0008_lut<4>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0008_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0008_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0008_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0008_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0012_lut<0>
    (
        .I0(bird_top<1>),
        .I1(bird_top<0>),
        .I2(vga_timer/vertical_pixel_counter<0>),
        .I3(vga_timer/vertical_pixel_counter<1>),
        .O(Mcompar_bird_color_on_cmp_eq0012_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0012_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0012_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0012_cy<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0012_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0012_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0012_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0012_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0012_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<5>),
        .I1(vga_timer/vertical_pixel_counter<4>),
        .I2(bird_color_on_add0010<5>),
        .I3(bird_color_on_add0010<4>),
        .O(Mcompar_bird_color_on_cmp_eq0012_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0012_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0012_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0012_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0012_cy<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0012_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0012_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0012_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0012_cy<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0012_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0012_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0012_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0012_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0013_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_color_on_add0011<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_color_on_add0011<1>),
        .O(Mcompar_bird_color_on_cmp_eq0013_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0013_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0013_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0013_cy<0>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0013_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_color_on_add0011<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_color_on_add0011<3>),
        .O(Mcompar_bird_color_on_cmp_eq0013_lut<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0013_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0013_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0013_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0013_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0013_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_color_on_add0011<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_color_on_add0011<5>),
        .O(Mcompar_bird_color_on_cmp_eq0013_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0013_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0013_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0013_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0013_cy<2>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0013_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_color_on_add0011<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_color_on_add0011<7>),
        .O(Mcompar_bird_color_on_cmp_eq0013_lut<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0013_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0013_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0013_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0013_cy<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0013_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_color_on_add0011<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_color_on_add0011<9>),
        .O(Mcompar_bird_color_on_cmp_eq0013_lut<4>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0013_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0013_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0013_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0013_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0014_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_top<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_color_on_add0012<1>),
        .O(Mcompar_bird_color_on_cmp_eq0014_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0014_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0014_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0014_cy<0>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0014_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_color_on_add0012<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_color_on_add0012<3>),
        .O(Mcompar_bird_color_on_cmp_eq0014_lut<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0014_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0014_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0014_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0014_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0014_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_color_on_add0012<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_color_on_add0012<5>),
        .O(Mcompar_bird_color_on_cmp_eq0014_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0014_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0014_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0014_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0014_cy<2>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0014_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_color_on_add0012<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_color_on_add0012<7>),
        .O(Mcompar_bird_color_on_cmp_eq0014_lut<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0014_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0014_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0014_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0014_cy<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0014_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_color_on_add0012<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_color_on_add0012<9>),
        .O(Mcompar_bird_color_on_cmp_eq0014_lut<4>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0014_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0014_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0014_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0014_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0015_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_color_on_add0013<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_color_on_add0013<1>),
        .O(Mcompar_bird_color_on_cmp_eq0015_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0015_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0015_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0015_cy<0>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0015_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_color_on_add0013<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_color_on_add0013<3>),
        .O(Mcompar_bird_color_on_cmp_eq0015_lut<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0015_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0015_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0015_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0015_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0015_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_color_on_add0013<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_color_on_add0013<5>),
        .O(Mcompar_bird_color_on_cmp_eq0015_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0015_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0015_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0015_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0015_cy<2>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0015_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_color_on_add0013<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_color_on_add0013<7>),
        .O(Mcompar_bird_color_on_cmp_eq0015_lut<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0015_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0015_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0015_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0015_cy<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0015_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_color_on_add0013<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_color_on_add0013<9>),
        .O(Mcompar_bird_color_on_cmp_eq0015_lut<4>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0015_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0015_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0015_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0015_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0016_lut<0>
    (
        .I0(bird_top<1>),
        .I1(bird_top<0>),
        .I2(vga_timer/vertical_pixel_counter<0>),
        .I3(vga_timer/vertical_pixel_counter<1>),
        .O(Mcompar_bird_color_on_cmp_eq0016_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0016_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0016_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0016_cy<0>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0016_lut<1>
    (
        .I0(bird_top<2>),
        .I1(vga_timer/vertical_pixel_counter<3>),
        .I2(vga_timer/vertical_pixel_counter<2>),
        .I3(bird_top<3>),
        .O(Mcompar_bird_color_on_cmp_eq0016_lut<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0016_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0016_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0016_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0016_cy<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0016_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0016_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0016_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0016_cy<2>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0016_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<7>),
        .I1(vga_timer/vertical_pixel_counter<6>),
        .I2(bird_color_on_add0014<7>),
        .I3(bird_color_on_add0014<6>),
        .O(Mcompar_bird_color_on_cmp_eq0016_lut<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0016_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0016_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0016_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0016_cy<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0016_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0016_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0016_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0016_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0017_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_color_on_add0015<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_color_on_add0015<1>),
        .O(Mcompar_bird_color_on_cmp_eq0017_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0017_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0017_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0017_cy<0>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0017_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_color_on_add0015<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_color_on_add0015<3>),
        .O(Mcompar_bird_color_on_cmp_eq0017_lut<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0017_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0017_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0017_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0017_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0017_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_color_on_add0015<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_color_on_add0015<5>),
        .O(Mcompar_bird_color_on_cmp_eq0017_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0017_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0017_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0017_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0017_cy<2>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0017_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_color_on_add0015<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_color_on_add0015<7>),
        .O(Mcompar_bird_color_on_cmp_eq0017_lut<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0017_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0017_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0017_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0017_cy<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0017_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_color_on_add0015<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_color_on_add0015<9>),
        .O(Mcompar_bird_color_on_cmp_eq0017_lut<4>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0017_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0017_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0017_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0017_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0018_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_top<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_color_on_add0016<1>),
        .O(Mcompar_bird_color_on_cmp_eq0018_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0018_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0018_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0018_cy<0>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0018_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_color_on_add0016<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_color_on_add0016<3>),
        .O(Mcompar_bird_color_on_cmp_eq0018_lut<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0018_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0018_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0018_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0018_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0018_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_color_on_add0016<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_color_on_add0016<5>),
        .O(Mcompar_bird_color_on_cmp_eq0018_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0018_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0018_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0018_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0018_cy<2>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0018_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_color_on_add0016<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_color_on_add0016<7>),
        .O(Mcompar_bird_color_on_cmp_eq0018_lut<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0018_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0018_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0018_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0018_cy<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0018_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_color_on_add0016<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_color_on_add0016<9>),
        .O(Mcompar_bird_color_on_cmp_eq0018_lut<4>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0018_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0018_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0018_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0018_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0019_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_color_on_add0017<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_color_on_add0017<1>),
        .O(Mcompar_bird_color_on_cmp_eq0019_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0019_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0019_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0019_cy<0>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0019_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_color_on_add0017<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_color_on_add0017<3>),
        .O(Mcompar_bird_color_on_cmp_eq0019_lut<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0019_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0019_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0019_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0019_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0019_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_color_on_add0017<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_color_on_add0017<5>),
        .O(Mcompar_bird_color_on_cmp_eq0019_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0019_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0019_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0019_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0019_cy<2>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0019_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_color_on_add0017<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_color_on_add0017<7>),
        .O(Mcompar_bird_color_on_cmp_eq0019_lut<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0019_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0019_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0019_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0019_cy<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0019_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_color_on_add0017<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_color_on_add0017<9>),
        .O(Mcompar_bird_color_on_cmp_eq0019_lut<4>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0019_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0019_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0019_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0019_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0020_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_top<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_top<1>),
        .O(Mcompar_bird_color_on_cmp_eq0020_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0020_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0020_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0020_cy<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0020_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0020_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0020_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0020_cy<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0020_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0020_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0020_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0020_cy<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0020_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0020_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0020_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0020_cy<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0020_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0020_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0020_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0020_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0021_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_color_on_add0019<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_color_on_add0019<1>),
        .O(Mcompar_bird_color_on_cmp_eq0021_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0021_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0021_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0021_cy<0>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0021_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_color_on_add0019<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_color_on_add0019<3>),
        .O(Mcompar_bird_color_on_cmp_eq0021_lut<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0021_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0021_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0021_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0021_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0021_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_color_on_add0019<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_color_on_add0019<5>),
        .O(Mcompar_bird_color_on_cmp_eq0021_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0021_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0021_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0021_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0021_cy<2>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0021_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_color_on_add0019<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_color_on_add0019<7>),
        .O(Mcompar_bird_color_on_cmp_eq0021_lut<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0021_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0021_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0021_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0021_cy<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0021_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_color_on_add0019<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_color_on_add0019<9>),
        .O(Mcompar_bird_color_on_cmp_eq0021_lut<4>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0021_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0021_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0021_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0021_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0023_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_color_on_add0021<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_color_on_add0021<1>),
        .O(Mcompar_bird_color_on_cmp_eq0023_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0023_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0023_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0023_cy<0>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0023_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_color_on_add0021<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_color_on_add0021<3>),
        .O(Mcompar_bird_color_on_cmp_eq0023_lut<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0023_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0023_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0023_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0023_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0023_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_color_on_add0021<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_color_on_add0021<5>),
        .O(Mcompar_bird_color_on_cmp_eq0023_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0023_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0023_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0023_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0023_cy<2>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0023_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_color_on_add0021<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_color_on_add0021<7>),
        .O(Mcompar_bird_color_on_cmp_eq0023_lut<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0023_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0023_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0023_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0023_cy<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0023_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_color_on_add0021<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_color_on_add0021<9>),
        .O(Mcompar_bird_color_on_cmp_eq0023_lut<4>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0023_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0023_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0023_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0023_cy<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0022_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_top<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_color_on_add0020<1>),
        .O(Mcompar_bird_color_on_cmp_eq0022_lut<0>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0022_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0022_lut<0>),
        .O(Mcompar_bird_color_on_cmp_eq0022_cy<0>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0022_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_color_on_add0020<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_color_on_add0020<3>),
        .O(Mcompar_bird_color_on_cmp_eq0022_lut<1>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0022_cy<1>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0022_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0022_lut<1>),
        .O(Mcompar_bird_color_on_cmp_eq0022_cy<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0022_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_color_on_add0020<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_color_on_add0020<5>),
        .O(Mcompar_bird_color_on_cmp_eq0022_lut<2>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0022_cy<2>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0022_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0022_lut<2>),
        .O(Mcompar_bird_color_on_cmp_eq0022_cy<2>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0022_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_color_on_add0020<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_color_on_add0020<7>),
        .O(Mcompar_bird_color_on_cmp_eq0022_lut<3>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0022_cy<3>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0022_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0022_lut<3>),
        .O(Mcompar_bird_color_on_cmp_eq0022_cy<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0022_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_color_on_add0020<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_color_on_add0020<9>),
        .O(Mcompar_bird_color_on_cmp_eq0022_lut<4>)
    );
    MUXCY Mcompar_bird_color_on_cmp_eq0022_cy<4>
    (
        .CI(Mcompar_bird_color_on_cmp_eq0022_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_color_on_cmp_eq0022_lut<4>),
        .O(Mcompar_bird_color_on_cmp_eq0022_cy<4>)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0001_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_outline_on_addsub0000<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_outline_on_addsub0000<1>),
        .O(Mcompar_bird_outline_on_cmp_eq0001_lut<0>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0001_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0001_lut<0>),
        .O(Mcompar_bird_outline_on_cmp_eq0001_cy<0>)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0001_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_outline_on_addsub0000<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_outline_on_addsub0000<3>),
        .O(Mcompar_bird_outline_on_cmp_eq0001_lut<1>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0001_cy<1>
    (
        .CI(Mcompar_bird_outline_on_cmp_eq0001_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0001_lut<1>),
        .O(Mcompar_bird_outline_on_cmp_eq0001_cy<1>)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0001_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_outline_on_addsub0000<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_outline_on_addsub0000<5>),
        .O(Mcompar_bird_outline_on_cmp_eq0001_lut<2>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0001_cy<2>
    (
        .CI(Mcompar_bird_outline_on_cmp_eq0001_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0001_lut<2>),
        .O(Mcompar_bird_outline_on_cmp_eq0001_cy<2>)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0001_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_outline_on_addsub0000<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_outline_on_addsub0000<7>),
        .O(Mcompar_bird_outline_on_cmp_eq0001_lut<3>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0001_cy<3>
    (
        .CI(Mcompar_bird_outline_on_cmp_eq0001_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0001_lut<3>),
        .O(Mcompar_bird_outline_on_cmp_eq0001_cy<3>)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0001_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_outline_on_addsub0000<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_outline_on_addsub0000<9>),
        .O(Mcompar_bird_outline_on_cmp_eq0001_lut<4>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0001_cy<4>
    (
        .CI(Mcompar_bird_outline_on_cmp_eq0001_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0001_lut<4>),
        .O(Mcompar_bird_outline_on_cmp_eq0001_cy<4>)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0030_lut<0>
    (
        .I0(bird_top<1>),
        .I1(bird_top<0>),
        .I2(vga_timer/vertical_pixel_counter<0>),
        .I3(vga_timer/vertical_pixel_counter<1>),
        .O(Mcompar_bird_outline_on_cmp_eq0030_lut<0>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0030_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0030_lut<0>),
        .O(Mcompar_bird_outline_on_cmp_eq0030_cy<0>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0030_cy<1>
    (
        .CI(Mcompar_bird_outline_on_cmp_eq0030_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0030_lut<1>),
        .O(Mcompar_bird_outline_on_cmp_eq0030_cy<1>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0030_cy<2>
    (
        .CI(Mcompar_bird_outline_on_cmp_eq0030_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0030_lut<2>),
        .O(Mcompar_bird_outline_on_cmp_eq0030_cy<2>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0030_cy<3>
    (
        .CI(Mcompar_bird_outline_on_cmp_eq0030_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0030_lut<3>),
        .O(Mcompar_bird_outline_on_cmp_eq0030_cy<3>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0030_cy<4>
    (
        .CI(Mcompar_bird_outline_on_cmp_eq0030_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0030_lut<4>),
        .O(Mcompar_bird_outline_on_cmp_eq0030_cy<4>)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0031_lut<0>
    (
        .I0(vga_timer/vertical_pixel_counter<0>),
        .I1(bird_outline_on_addsub0002<0>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(bird_outline_on_addsub0002<1>),
        .O(Mcompar_bird_outline_on_cmp_eq0031_lut<0>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0031_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0031_lut<0>),
        .O(Mcompar_bird_outline_on_cmp_eq0031_cy<0>)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0031_lut<1>
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(bird_outline_on_addsub0002<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_outline_on_addsub0002<3>),
        .O(Mcompar_bird_outline_on_cmp_eq0031_lut<1>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0031_cy<1>
    (
        .CI(Mcompar_bird_outline_on_cmp_eq0031_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0031_lut<1>),
        .O(Mcompar_bird_outline_on_cmp_eq0031_cy<1>)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0031_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_outline_on_addsub0002<4>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(bird_outline_on_addsub0002<5>),
        .O(Mcompar_bird_outline_on_cmp_eq0031_lut<2>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0031_cy<2>
    (
        .CI(Mcompar_bird_outline_on_cmp_eq0031_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0031_lut<2>),
        .O(Mcompar_bird_outline_on_cmp_eq0031_cy<2>)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0031_lut<3>
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(bird_outline_on_addsub0002<6>),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .I3(bird_outline_on_addsub0002<7>),
        .O(Mcompar_bird_outline_on_cmp_eq0031_lut<3>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0031_cy<3>
    (
        .CI(Mcompar_bird_outline_on_cmp_eq0031_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0031_lut<3>),
        .O(Mcompar_bird_outline_on_cmp_eq0031_cy<3>)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0031_lut<4>
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(bird_outline_on_addsub0002<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_outline_on_addsub0002<9>),
        .O(Mcompar_bird_outline_on_cmp_eq0031_lut<4>)
    );
    MUXCY Mcompar_bird_outline_on_cmp_eq0031_cy<4>
    (
        .CI(Mcompar_bird_outline_on_cmp_eq0031_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(Mcompar_bird_outline_on_cmp_eq0031_lut<4>),
        .O(Mcompar_bird_outline_on_cmp_eq0031_cy<4>)
    );
    FDC bird_top_8
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(bird_top_next<8>),
        .Q(bird_top<8>)
    );
    FDP bird_top_6
    (
        .C(clk_BUFGP),
        .D(bird_top_next<6>),
        .PRE(btn_3_IBUF),
        .Q(bird_top<6>)
    );
    FDC bird_top_5
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(bird_top_next<5>),
        .Q(bird_top<5>)
    );
    FDP bird_top_7
    (
        .C(clk_BUFGP),
        .D(bird_top_next<7>),
        .PRE(btn_3_IBUF),
        .Q(bird_top<7>)
    );
    FDC bird_top_4
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(bird_top_next<4>),
        .Q(bird_top<4>)
    );
    FDP bird_top_3
    (
        .C(clk_BUFGP),
        .D(bird_top_next<3>),
        .PRE(btn_3_IBUF),
        .Q(bird_top<3>)
    );
    FDC bird_top_1
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(bird_top_next<1>),
        .Q(bird_top<1>)
    );
    FDC bird_top_0
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(bird_top_next<0>),
        .Q(bird_top<0>)
    );
    FDC bird_top_2
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(bird_top_next<2>),
        .Q(bird_top<2>)
    );
    XORCY vga_timer/Mcount_vertical_pixel_counter_xor<9>
    (
        .CI(vga_timer/Mcount_vertical_pixel_counter_cy<8>),
        .LI(vga_timer/Mcount_vertical_pixel_counter_xor<9>_rt),
        .O(vga_timer/Result<9>1)
    );
    XORCY vga_timer/Mcount_vertical_pixel_counter_xor<8>
    (
        .CI(vga_timer/Mcount_vertical_pixel_counter_cy<7>),
        .LI(vga_timer/Mcount_vertical_pixel_counter_cy<8>_rt),
        .O(vga_timer/Result<8>1)
    );
    MUXCY vga_timer/Mcount_vertical_pixel_counter_cy<8>
    (
        .CI(vga_timer/Mcount_vertical_pixel_counter_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(vga_timer/Mcount_vertical_pixel_counter_cy<8>_rt),
        .O(vga_timer/Mcount_vertical_pixel_counter_cy<8>)
    );
    XORCY vga_timer/Mcount_vertical_pixel_counter_xor<7>
    (
        .CI(vga_timer/Mcount_vertical_pixel_counter_cy<6>),
        .LI(vga_timer/Mcount_vertical_pixel_counter_cy<7>_rt),
        .O(vga_timer/Result<7>1)
    );
    MUXCY vga_timer/Mcount_vertical_pixel_counter_cy<7>
    (
        .CI(vga_timer/Mcount_vertical_pixel_counter_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(vga_timer/Mcount_vertical_pixel_counter_cy<7>_rt),
        .O(vga_timer/Mcount_vertical_pixel_counter_cy<7>)
    );
    XORCY vga_timer/Mcount_vertical_pixel_counter_xor<6>
    (
        .CI(vga_timer/Mcount_vertical_pixel_counter_cy<5>),
        .LI(vga_timer/Mcount_vertical_pixel_counter_cy<6>_rt),
        .O(vga_timer/Result<6>1)
    );
    MUXCY vga_timer/Mcount_vertical_pixel_counter_cy<6>
    (
        .CI(vga_timer/Mcount_vertical_pixel_counter_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(vga_timer/Mcount_vertical_pixel_counter_cy<6>_rt),
        .O(vga_timer/Mcount_vertical_pixel_counter_cy<6>)
    );
    XORCY vga_timer/Mcount_vertical_pixel_counter_xor<5>
    (
        .CI(vga_timer/Mcount_vertical_pixel_counter_cy<4>),
        .LI(vga_timer/Mcount_vertical_pixel_counter_cy<5>_rt),
        .O(vga_timer/Result<5>1)
    );
    MUXCY vga_timer/Mcount_vertical_pixel_counter_cy<5>
    (
        .CI(vga_timer/Mcount_vertical_pixel_counter_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(vga_timer/Mcount_vertical_pixel_counter_cy<5>_rt),
        .O(vga_timer/Mcount_vertical_pixel_counter_cy<5>)
    );
    XORCY vga_timer/Mcount_vertical_pixel_counter_xor<4>
    (
        .CI(vga_timer/Mcount_vertical_pixel_counter_cy<3>),
        .LI(vga_timer/Mcount_vertical_pixel_counter_cy<4>_rt),
        .O(vga_timer/Result<4>1)
    );
    MUXCY vga_timer/Mcount_vertical_pixel_counter_cy<4>
    (
        .CI(vga_timer/Mcount_vertical_pixel_counter_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(vga_timer/Mcount_vertical_pixel_counter_cy<4>_rt),
        .O(vga_timer/Mcount_vertical_pixel_counter_cy<4>)
    );
    XORCY vga_timer/Mcount_vertical_pixel_counter_xor<3>
    (
        .CI(vga_timer/Mcount_vertical_pixel_counter_cy<2>),
        .LI(vga_timer/Mcount_vertical_pixel_counter_cy<3>_rt),
        .O(vga_timer/Result<3>1)
    );
    MUXCY vga_timer/Mcount_vertical_pixel_counter_cy<3>
    (
        .CI(vga_timer/Mcount_vertical_pixel_counter_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(vga_timer/Mcount_vertical_pixel_counter_cy<3>_rt),
        .O(vga_timer/Mcount_vertical_pixel_counter_cy<3>)
    );
    XORCY vga_timer/Mcount_vertical_pixel_counter_xor<2>
    (
        .CI(vga_timer/Mcount_vertical_pixel_counter_cy<1>),
        .LI(vga_timer/Mcount_vertical_pixel_counter_cy<2>_rt),
        .O(vga_timer/Result<2>1)
    );
    MUXCY vga_timer/Mcount_vertical_pixel_counter_cy<2>
    (
        .CI(vga_timer/Mcount_vertical_pixel_counter_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(vga_timer/Mcount_vertical_pixel_counter_cy<2>_rt),
        .O(vga_timer/Mcount_vertical_pixel_counter_cy<2>)
    );
    XORCY vga_timer/Mcount_vertical_pixel_counter_xor<1>
    (
        .CI(vga_timer/Mcount_vertical_pixel_counter_cy<0>),
        .LI(vga_timer/Mcount_vertical_pixel_counter_cy<1>_rt),
        .O(vga_timer/Result<1>1)
    );
    MUXCY vga_timer/Mcount_vertical_pixel_counter_cy<1>
    (
        .CI(vga_timer/Mcount_vertical_pixel_counter_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(vga_timer/Mcount_vertical_pixel_counter_cy<1>_rt),
        .O(vga_timer/Mcount_vertical_pixel_counter_cy<1>)
    );
    XORCY vga_timer/Mcount_vertical_pixel_counter_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(vga_timer/Mcount_vertical_pixel_counter_lut<0>),
        .O(vga_timer/Result<0>1)
    );
    MUXCY vga_timer/Mcount_vertical_pixel_counter_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(vga_timer/Mcount_vertical_pixel_counter_lut<0>),
        .O(vga_timer/Mcount_vertical_pixel_counter_cy<0>)
    );
    XORCY vga_timer/Mcount_horizontal_pixel_counter_xor<9>
    (
        .CI(vga_timer/Mcount_horizontal_pixel_counter_cy<8>),
        .LI(vga_timer/Mcount_horizontal_pixel_counter_xor<9>_rt),
        .O(vga_timer/Result<9>)
    );
    XORCY vga_timer/Mcount_horizontal_pixel_counter_xor<8>
    (
        .CI(vga_timer/Mcount_horizontal_pixel_counter_cy<7>),
        .LI(vga_timer/Mcount_horizontal_pixel_counter_cy<8>_rt),
        .O(vga_timer/Result<8>)
    );
    MUXCY vga_timer/Mcount_horizontal_pixel_counter_cy<8>
    (
        .CI(vga_timer/Mcount_horizontal_pixel_counter_cy<7>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(vga_timer/Mcount_horizontal_pixel_counter_cy<8>_rt),
        .O(vga_timer/Mcount_horizontal_pixel_counter_cy<8>)
    );
    XORCY vga_timer/Mcount_horizontal_pixel_counter_xor<7>
    (
        .CI(vga_timer/Mcount_horizontal_pixel_counter_cy<6>),
        .LI(vga_timer/Mcount_horizontal_pixel_counter_cy<7>_rt),
        .O(vga_timer/Result<7>)
    );
    MUXCY vga_timer/Mcount_horizontal_pixel_counter_cy<7>
    (
        .CI(vga_timer/Mcount_horizontal_pixel_counter_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(vga_timer/Mcount_horizontal_pixel_counter_cy<7>_rt),
        .O(vga_timer/Mcount_horizontal_pixel_counter_cy<7>)
    );
    XORCY vga_timer/Mcount_horizontal_pixel_counter_xor<6>
    (
        .CI(vga_timer/Mcount_horizontal_pixel_counter_cy<5>),
        .LI(vga_timer/Mcount_horizontal_pixel_counter_cy<6>_rt),
        .O(vga_timer/Result<6>)
    );
    MUXCY vga_timer/Mcount_horizontal_pixel_counter_cy<6>
    (
        .CI(vga_timer/Mcount_horizontal_pixel_counter_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(vga_timer/Mcount_horizontal_pixel_counter_cy<6>_rt),
        .O(vga_timer/Mcount_horizontal_pixel_counter_cy<6>)
    );
    XORCY vga_timer/Mcount_horizontal_pixel_counter_xor<5>
    (
        .CI(vga_timer/Mcount_horizontal_pixel_counter_cy<4>),
        .LI(vga_timer/Mcount_horizontal_pixel_counter_cy<5>_rt),
        .O(vga_timer/Result<5>)
    );
    MUXCY vga_timer/Mcount_horizontal_pixel_counter_cy<5>
    (
        .CI(vga_timer/Mcount_horizontal_pixel_counter_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(vga_timer/Mcount_horizontal_pixel_counter_cy<5>_rt),
        .O(vga_timer/Mcount_horizontal_pixel_counter_cy<5>)
    );
    XORCY vga_timer/Mcount_horizontal_pixel_counter_xor<4>
    (
        .CI(vga_timer/Mcount_horizontal_pixel_counter_cy<3>),
        .LI(vga_timer/Mcount_horizontal_pixel_counter_cy<4>_rt),
        .O(vga_timer/Result<4>)
    );
    MUXCY vga_timer/Mcount_horizontal_pixel_counter_cy<4>
    (
        .CI(vga_timer/Mcount_horizontal_pixel_counter_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(vga_timer/Mcount_horizontal_pixel_counter_cy<4>_rt),
        .O(vga_timer/Mcount_horizontal_pixel_counter_cy<4>)
    );
    XORCY vga_timer/Mcount_horizontal_pixel_counter_xor<3>
    (
        .CI(vga_timer/Mcount_horizontal_pixel_counter_cy<2>),
        .LI(vga_timer/Mcount_horizontal_pixel_counter_cy<3>_rt),
        .O(vga_timer/Result<3>)
    );
    MUXCY vga_timer/Mcount_horizontal_pixel_counter_cy<3>
    (
        .CI(vga_timer/Mcount_horizontal_pixel_counter_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(vga_timer/Mcount_horizontal_pixel_counter_cy<3>_rt),
        .O(vga_timer/Mcount_horizontal_pixel_counter_cy<3>)
    );
    XORCY vga_timer/Mcount_horizontal_pixel_counter_xor<2>
    (
        .CI(vga_timer/Mcount_horizontal_pixel_counter_cy<1>),
        .LI(vga_timer/Mcount_horizontal_pixel_counter_cy<2>_rt),
        .O(vga_timer/Result<2>)
    );
    MUXCY vga_timer/Mcount_horizontal_pixel_counter_cy<2>
    (
        .CI(vga_timer/Mcount_horizontal_pixel_counter_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(vga_timer/Mcount_horizontal_pixel_counter_cy<2>_rt),
        .O(vga_timer/Mcount_horizontal_pixel_counter_cy<2>)
    );
    XORCY vga_timer/Mcount_horizontal_pixel_counter_xor<1>
    (
        .CI(vga_timer/Mcount_horizontal_pixel_counter_cy<0>),
        .LI(vga_timer/Mcount_horizontal_pixel_counter_cy<1>_rt),
        .O(vga_timer/Result<1>)
    );
    MUXCY vga_timer/Mcount_horizontal_pixel_counter_cy<1>
    (
        .CI(vga_timer/Mcount_horizontal_pixel_counter_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(vga_timer/Mcount_horizontal_pixel_counter_cy<1>_rt),
        .O(vga_timer/Mcount_horizontal_pixel_counter_cy<1>)
    );
    XORCY vga_timer/Mcount_horizontal_pixel_counter_xor<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .LI(vga_timer/Mcount_horizontal_pixel_counter_lut<0>),
        .O(vga_timer/Result<0>)
    );
    MUXCY vga_timer/Mcount_horizontal_pixel_counter_cy<0>
    (
        .CI(Madd_bird_color_on_add0002_lut<9>),
        .DI(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(vga_timer/Mcount_horizontal_pixel_counter_lut<0>),
        .O(vga_timer/Mcount_horizontal_pixel_counter_cy<0>)
    );
    FDCE vga_timer/vertical_pixel_counter_9
    (
        .C(clk_BUFGP),
        .CE(vga_timer/vertical_pixel_counter_not0001),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_vertical_pixel_counter_eqn_9),
        .Q(vga_timer/vertical_pixel_counter<9>)
    );
    FDCE vga_timer/vertical_pixel_counter_8
    (
        .C(clk_BUFGP),
        .CE(vga_timer/vertical_pixel_counter_not0001),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_vertical_pixel_counter_eqn_8),
        .Q(vga_timer/vertical_pixel_counter<8>)
    );
    FDCE vga_timer/vertical_pixel_counter_7
    (
        .C(clk_BUFGP),
        .CE(vga_timer/vertical_pixel_counter_not0001),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_vertical_pixel_counter_eqn_7),
        .Q(vga_timer/vertical_pixel_counter<7>)
    );
    FDCE vga_timer/vertical_pixel_counter_6
    (
        .C(clk_BUFGP),
        .CE(vga_timer/vertical_pixel_counter_not0001),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_vertical_pixel_counter_eqn_6),
        .Q(vga_timer/vertical_pixel_counter<6>)
    );
    FDCE vga_timer/vertical_pixel_counter_5
    (
        .C(clk_BUFGP),
        .CE(vga_timer/vertical_pixel_counter_not0001),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_vertical_pixel_counter_eqn_5),
        .Q(vga_timer/vertical_pixel_counter<5>)
    );
    FDCE vga_timer/vertical_pixel_counter_4
    (
        .C(clk_BUFGP),
        .CE(vga_timer/vertical_pixel_counter_not0001),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_vertical_pixel_counter_eqn_4),
        .Q(vga_timer/vertical_pixel_counter<4>)
    );
    FDCE vga_timer/vertical_pixel_counter_3
    (
        .C(clk_BUFGP),
        .CE(vga_timer/vertical_pixel_counter_not0001),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_vertical_pixel_counter_eqn_3),
        .Q(vga_timer/vertical_pixel_counter<3>)
    );
    FDCE vga_timer/vertical_pixel_counter_2
    (
        .C(clk_BUFGP),
        .CE(vga_timer/vertical_pixel_counter_not0001),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_vertical_pixel_counter_eqn_2),
        .Q(vga_timer/vertical_pixel_counter<2>)
    );
    FDCE vga_timer/vertical_pixel_counter_1
    (
        .C(clk_BUFGP),
        .CE(vga_timer/vertical_pixel_counter_not0001),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_vertical_pixel_counter_eqn_1),
        .Q(vga_timer/vertical_pixel_counter<1>)
    );
    FDCE vga_timer/vertical_pixel_counter_0
    (
        .C(clk_BUFGP),
        .CE(vga_timer/vertical_pixel_counter_not0001),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_vertical_pixel_counter_eqn_0),
        .Q(vga_timer/vertical_pixel_counter<0>)
    );
    FDCE vga_timer/horizontal_pixel_counter_9
    (
        .C(clk_BUFGP),
        .CE(vga_timer/pixel_en),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_horizontal_pixel_counter_eqn_9),
        .Q(vga_timer/horizontal_pixel_counter<9>)
    );
    FDCE vga_timer/horizontal_pixel_counter_8
    (
        .C(clk_BUFGP),
        .CE(vga_timer/pixel_en),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_horizontal_pixel_counter_eqn_8),
        .Q(vga_timer/horizontal_pixel_counter<8>)
    );
    FDCE vga_timer/horizontal_pixel_counter_7
    (
        .C(clk_BUFGP),
        .CE(vga_timer/pixel_en),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_horizontal_pixel_counter_eqn_7),
        .Q(vga_timer/horizontal_pixel_counter<7>)
    );
    FDCE vga_timer/horizontal_pixel_counter_6
    (
        .C(clk_BUFGP),
        .CE(vga_timer/pixel_en),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_horizontal_pixel_counter_eqn_6),
        .Q(vga_timer/horizontal_pixel_counter<6>)
    );
    FDCE vga_timer/horizontal_pixel_counter_5
    (
        .C(clk_BUFGP),
        .CE(vga_timer/pixel_en),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_horizontal_pixel_counter_eqn_5),
        .Q(vga_timer/horizontal_pixel_counter<5>)
    );
    FDCE vga_timer/horizontal_pixel_counter_4
    (
        .C(clk_BUFGP),
        .CE(vga_timer/pixel_en),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_horizontal_pixel_counter_eqn_4),
        .Q(vga_timer/horizontal_pixel_counter<4>)
    );
    FDCE vga_timer/horizontal_pixel_counter_3
    (
        .C(clk_BUFGP),
        .CE(vga_timer/pixel_en),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_horizontal_pixel_counter_eqn_3),
        .Q(vga_timer/horizontal_pixel_counter<3>)
    );
    FDCE vga_timer/horizontal_pixel_counter_2
    (
        .C(clk_BUFGP),
        .CE(vga_timer/pixel_en),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_horizontal_pixel_counter_eqn_2),
        .Q(vga_timer/horizontal_pixel_counter<2>)
    );
    FDCE vga_timer/horizontal_pixel_counter_1
    (
        .C(clk_BUFGP),
        .CE(vga_timer/pixel_en),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_horizontal_pixel_counter_eqn_1),
        .Q(vga_timer/horizontal_pixel_counter<1>)
    );
    FDCE vga_timer/horizontal_pixel_counter_0
    (
        .C(clk_BUFGP),
        .CE(vga_timer/pixel_en),
        .CLR(btn_3_IBUF),
        .D(vga_timer/Mcount_horizontal_pixel_counter_eqn_0),
        .Q(vga_timer/horizontal_pixel_counter<0>)
    );
    FDC vga_timer/pixel_en
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(vga_timer/pixel_en_not0001),
        .Q(vga_timer/pixel_en)
    );
    MUXCY bird_top_temp_cmp_eq0000_wg_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(bird_top_temp_cmp_eq0000_wg_lut<0>),
        .O(bird_top_temp_cmp_eq0000_wg_cy<0>)
    );
    LUT4 bird_top_temp_cmp_eq0000_wg_lut<1>
    (
        .I0(bird_delay<8>),
        .I1(bird_delay<6>),
        .I2(bird_delay<3>),
        .I3(bird_delay<7>),
        .O(bird_top_temp_cmp_eq0000_wg_lut<1>)
    );
    MUXCY bird_top_temp_cmp_eq0000_wg_cy<1>
    (
        .CI(bird_top_temp_cmp_eq0000_wg_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(bird_top_temp_cmp_eq0000_wg_lut<1>),
        .O(bird_top_temp_cmp_eq0000_wg_cy<1>)
    );
    LUT4 bird_top_temp_cmp_eq0000_wg_lut<2>
    (
        .I0(bird_delay<9>),
        .I1(bird_delay<10>),
        .I2(bird_delay<5>),
        .I3(bird_delay<13>),
        .O(bird_top_temp_cmp_eq0000_wg_lut<2>)
    );
    MUXCY bird_top_temp_cmp_eq0000_wg_cy<2>
    (
        .CI(bird_top_temp_cmp_eq0000_wg_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(bird_top_temp_cmp_eq0000_wg_lut<2>),
        .O(bird_top_temp_cmp_eq0000_wg_cy<2>)
    );
    LUT4 bird_top_temp_cmp_eq0000_wg_lut<3>
    (
        .I0(bird_delay<11>),
        .I1(bird_delay<12>),
        .I2(bird_delay<1>),
        .I3(bird_delay<14>),
        .O(bird_top_temp_cmp_eq0000_wg_lut<3>)
    );
    MUXCY bird_top_temp_cmp_eq0000_wg_cy<3>
    (
        .CI(bird_top_temp_cmp_eq0000_wg_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(bird_top_temp_cmp_eq0000_wg_lut<3>),
        .O(bird_top_temp_cmp_eq0000_wg_cy<3>)
    );
    LUT4 bird_top_temp_cmp_eq0000_wg_lut<4>
    (
        .I0(bird_delay<15>),
        .I1(bird_delay<18>),
        .I2(bird_delay<0>),
        .I3(bird_delay<16>),
        .O(bird_top_temp_cmp_eq0000_wg_lut<4>)
    );
    MUXCY bird_top_temp_cmp_eq0000_wg_cy<4>
    (
        .CI(bird_top_temp_cmp_eq0000_wg_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(bird_top_temp_cmp_eq0000_wg_lut<4>),
        .O(bird_top_temp_cmp_eq0000_wg_cy<4>)
    );
    LUT4 bird_top_temp_cmp_eq0000_wg_lut<5>
    (
        .I0(bird_delay<17>),
        .I1(bird_delay<19>),
        .I2(bird_delay<2>),
        .I3(bird_delay<20>),
        .O(bird_top_temp_cmp_eq0000_wg_lut<5>)
    );
    MUXCY bird_top_temp_cmp_eq0000_wg_cy<5>
    (
        .CI(bird_top_temp_cmp_eq0000_wg_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(bird_top_temp_cmp_eq0000_wg_lut<5>),
        .O(bird_top_temp_cmp_eq0000)
    );
    LUT3 moveEN_cmp_eq0000_wg_lut<0>
    (
        .I0(delay<8>),
        .I1(delay<7>),
        .I2(delay<9>),
        .O(moveEN_cmp_eq0000_wg_lut<0>)
    );
    MUXCY moveEN_cmp_eq0000_wg_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(moveEN_cmp_eq0000_wg_lut<0>),
        .O(moveEN_cmp_eq0000_wg_cy<0>)
    );
    LUT4 moveEN_cmp_eq0000_wg_lut<1>
    (
        .I0(delay<10>),
        .I1(delay<11>),
        .I2(delay<6>),
        .I3(delay<12>),
        .O(moveEN_cmp_eq0000_wg_lut<1>)
    );
    MUXCY moveEN_cmp_eq0000_wg_cy<1>
    (
        .CI(moveEN_cmp_eq0000_wg_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(moveEN_cmp_eq0000_wg_lut<1>),
        .O(moveEN_cmp_eq0000_wg_cy<1>)
    );
    LUT4 moveEN_cmp_eq0000_wg_lut<2>
    (
        .I0(delay<13>),
        .I1(delay<14>),
        .I2(delay<5>),
        .I3(delay<15>),
        .O(moveEN_cmp_eq0000_wg_lut<2>)
    );
    MUXCY moveEN_cmp_eq0000_wg_cy<2>
    (
        .CI(moveEN_cmp_eq0000_wg_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(moveEN_cmp_eq0000_wg_lut<2>),
        .O(moveEN_cmp_eq0000_wg_cy<2>)
    );
    LUT4 moveEN_cmp_eq0000_wg_lut<3>
    (
        .I0(delay<16>),
        .I1(delay<17>),
        .I2(delay<4>),
        .I3(delay<18>),
        .O(moveEN_cmp_eq0000_wg_lut<3>)
    );
    MUXCY moveEN_cmp_eq0000_wg_cy<3>
    (
        .CI(moveEN_cmp_eq0000_wg_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(moveEN_cmp_eq0000_wg_lut<3>),
        .O(moveEN_cmp_eq0000_wg_cy<3>)
    );
    LUT4 moveEN_cmp_eq0000_wg_lut<4>
    (
        .I0(delay<19>),
        .I1(delay<20>),
        .I2(delay<3>),
        .I3(delay<21>),
        .O(moveEN_cmp_eq0000_wg_lut<4>)
    );
    MUXCY moveEN_cmp_eq0000_wg_cy<4>
    (
        .CI(moveEN_cmp_eq0000_wg_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(moveEN_cmp_eq0000_wg_lut<4>),
        .O(moveEN_cmp_eq0000_wg_cy<4>)
    );
    LUT4 moveEN_cmp_eq0000_wg_lut<5>
    (
        .I0(delay<22>),
        .I1(delay<23>),
        .I2(delay<2>),
        .I3(delay<24>),
        .O(moveEN_cmp_eq0000_wg_lut<5>)
    );
    MUXCY moveEN_cmp_eq0000_wg_cy<5>
    (
        .CI(moveEN_cmp_eq0000_wg_cy<4>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(moveEN_cmp_eq0000_wg_lut<5>),
        .O(moveEN_cmp_eq0000_wg_cy<5>)
    );
    LUT4 moveEN_cmp_eq0000_wg_lut<6>
    (
        .I0(delay<25>),
        .I1(delay<26>),
        .I2(delay<1>),
        .I3(delay<27>),
        .O(moveEN_cmp_eq0000_wg_lut<6>)
    );
    MUXCY moveEN_cmp_eq0000_wg_cy<6>
    (
        .CI(moveEN_cmp_eq0000_wg_cy<5>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(moveEN_cmp_eq0000_wg_lut<6>),
        .O(moveEN_cmp_eq0000_wg_cy<6>)
    );
    LUT4 moveEN_cmp_eq0000_wg_lut<7>
    (
        .I0(delay<30>),
        .I1(delay<28>),
        .I2(delay<0>),
        .I3(delay<29>),
        .O(moveEN_cmp_eq0000_wg_lut<7>)
    );
    MUXCY moveEN_cmp_eq0000_wg_cy<7>
    (
        .CI(moveEN_cmp_eq0000_wg_cy<6>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(moveEN_cmp_eq0000_wg_lut<7>),
        .O(moveEN)
    );
    LUT3 button0_cmp_eq0000_wg_lut<0>
    (
        .I0(debounce_counter_value<7>),
        .I1(debounce_counter_value<4>),
        .I2(debounce_counter_value<5>),
        .O(button0_cmp_eq0000_wg_lut<0>)
    );
    MUXCY button0_cmp_eq0000_wg_cy<0>
    (
        .CI(Msub_bird_top_temp_addsub0000_lut<9>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(button0_cmp_eq0000_wg_lut<0>),
        .O(button0_cmp_eq0000_wg_cy<0>)
    );
    LUT4 button0_cmp_eq0000_wg_lut<1>
    (
        .I0(debounce_counter_value<6>),
        .I1(debounce_counter_value<8>),
        .I2(debounce_counter_value<3>),
        .I3(debounce_counter_value<9>),
        .O(button0_cmp_eq0000_wg_lut<1>)
    );
    MUXCY button0_cmp_eq0000_wg_cy<1>
    (
        .CI(button0_cmp_eq0000_wg_cy<0>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(button0_cmp_eq0000_wg_lut<1>),
        .O(button0_cmp_eq0000_wg_cy<1>)
    );
    LUT4 button0_cmp_eq0000_wg_lut<2>
    (
        .I0(debounce_counter_value<12>),
        .I1(debounce_counter_value<10>),
        .I2(debounce_counter_value<1>),
        .I3(debounce_counter_value<11>),
        .O(button0_cmp_eq0000_wg_lut<2>)
    );
    MUXCY button0_cmp_eq0000_wg_cy<2>
    (
        .CI(button0_cmp_eq0000_wg_cy<1>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(button0_cmp_eq0000_wg_lut<2>),
        .O(button0_cmp_eq0000_wg_cy<2>)
    );
    LUT4 button0_cmp_eq0000_wg_lut<3>
    (
        .I0(debounce_counter_value<13>),
        .I1(debounce_counter_value<14>),
        .I2(debounce_counter_value<0>),
        .I3(debounce_counter_value<15>),
        .O(button0_cmp_eq0000_wg_lut<3>)
    );
    MUXCY button0_cmp_eq0000_wg_cy<3>
    (
        .CI(button0_cmp_eq0000_wg_cy<2>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(button0_cmp_eq0000_wg_lut<3>),
        .O(button0_cmp_eq0000_wg_cy<3>)
    );
    LUT4 button0_cmp_eq0000_wg_lut<4>
    (
        .I0(debounce_counter_value<16>),
        .I1(debounce_counter_value<17>),
        .I2(debounce_counter_value<2>),
        .I3(debounce_counter_value<18>),
        .O(button0_cmp_eq0000_wg_lut<4>)
    );
    MUXCY button0_cmp_eq0000_wg_cy<4>
    (
        .CI(button0_cmp_eq0000_wg_cy<3>),
        .DI(Madd_bird_color_on_add0002_lut<9>),
        .S(button0_cmp_eq0000_wg_lut<4>),
        .O(button0_cmp_eq0000)
    );
    LUT2 dp1
    (
        .I0(display/counter_value<14>),
        .I1(display/counter_value<13>),
        .O(dp_OBUF)
    );
    LUT2 display/Mdecod_an31
    (
        .I0(display/counter_value<13>),
        .I1(display/counter_value<14>),
        .O(an_3_OBUF)
    );
    LUT2 display/Mdecod_an11
    (
        .I0(display/counter_value<13>),
        .I1(display/counter_value<14>),
        .O(an_1_OBUF)
    );
    LUT2 display/Mdecod_an01
    (
        .I0(display/counter_value<13>),
        .I1(display/counter_value<14>),
        .O(an_0_OBUF)
    );
    LUT2 jump_reg_mux0001<4>1
    (
        .I0(jump_reg<1>),
        .I1(debouncer/state_reg_FSM_FFd2),
        .O(jump_reg_mux0001<4>)
    );
    LUT2 jump_reg_mux0001<3>1
    (
        .I0(jump_reg<2>),
        .I1(debouncer/state_reg_FSM_FFd2),
        .O(jump_reg_mux0001<3>)
    );
    LUT2 jump_reg_mux0001<2>1
    (
        .I0(jump_reg<3>),
        .I1(debouncer/state_reg_FSM_FFd2),
        .O(jump_reg_mux0001<2>)
    );
    LUT2 jump_reg_mux0001<1>1
    (
        .I0(debouncer/state_reg_FSM_FFd2),
        .I1(jump_reg<4>),
        .O(jump_reg_mux0001<1>)
    );
    LUT2 fall_reg_mux0001<2>1
    (
        .I0(debouncer/state_reg_FSM_FFd2),
        .I1(fall_reg<0>),
        .O(fall_reg_mux0001<2>)
    );
    LUT2 fall_reg_mux0001<1>1
    (
        .I0(debouncer/state_reg_FSM_FFd2),
        .I1(fall_reg<1>),
        .O(fall_reg_mux0001<1>)
    );
    LUT2 fall_reg_mux0001<0>1
    (
        .I0(debouncer/state_reg_FSM_FFd2),
        .I1(fall_reg<2>),
        .O(fall_reg_mux0001<0>)
    );
    LUT2 debouncer/state_reg_FSM_FFd3-In1
    (
        .I0(button0),
        .I1(debouncer/state_reg_FSM_FFd2),
        .O(debouncer/state_reg_FSM_FFd3-In)
    );
    LUT2 debouncer/state_reg_FSM_FFd2-In1
    (
        .I0(button0),
        .I1(debouncer/state_reg_FSM_FFd3),
        .O(debouncer/state_reg_FSM_FFd2-In)
    );
    LUT2 Mxor_random_temp_xor0000_Result<2>1
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(vga_timer/horizontal_pixel_counter<3>),
        .O(random_next<5>)
    );
    LUT2 Mxor_random_temp_xor0000_Result<1>1
    (
        .I0(vga_timer/vertical_pixel_counter<7>),
        .I1(vga_timer/horizontal_pixel_counter<2>),
        .O(random_next<4>)
    );
    LUT4 Mcount_scoreTens_xor<1>11
    (
        .I0(scoreTens<0>),
        .I1(scoreTens<1>),
        .I2(bird_top_temp_and0000),
        .I3(scoreOnes_cmp_eq0003),
        .O(Mcount_scoreTens1)
    );
    LUT3 vga_timer/HS_SW0
    (
        .I0(vga_timer/horizontal_pixel_counter<6>),
        .I1(vga_timer/horizontal_pixel_counter<5>),
        .I2(vga_timer/horizontal_pixel_counter<4>),
        .O(N2)
    );
    LUT4 vga_timer/HS
    (
        .I0(vga_timer/horizontal_pixel_counter<7>),
        .I1(N2),
        .I2(vga_timer/horizontal_pixel_counter<8>),
        .I3(vga_timer/horizontal_pixel_counter<9>),
        .O(HS)
    );
    LUT4 display/Mrom_seg41
    (
        .I0(display/decode<3>),
        .I1(display/decode<0>),
        .I2(display/decode<2>),
        .I3(display/decode<1>),
        .O(seg_4_OBUF)
    );
    LUT4 display/Mrom_seg21
    (
        .I0(display/decode<1>),
        .I1(display/decode<2>),
        .I2(display/decode<3>),
        .I3(display/decode<0>),
        .O(seg_2_OBUF)
    );
    LUT4 display/Mrom_seg61
    (
        .I0(display/decode<1>),
        .I1(display/decode<3>),
        .I2(display/decode<2>),
        .I3(display/decode<0>),
        .O(seg_6_OBUF)
    );
    LUT4 display/Mrom_seg51
    (
        .I0(display/decode<3>),
        .I1(display/decode<1>),
        .I2(display/decode<0>),
        .I3(display/decode<2>),
        .O(seg_5_OBUF)
    );
    LUT4 display/Mrom_seg111
    (
        .I0(display/decode<3>),
        .I1(display/decode<2>),
        .I2(display/decode<0>),
        .I3(display/decode<1>),
        .O(seg_1_OBUF)
    );
    LUT4 display/Mrom_seg31
    (
        .I0(display/decode<0>),
        .I1(display/decode<2>),
        .I2(display/decode<3>),
        .I3(display/decode<1>),
        .O(seg_3_OBUF)
    );
    LUT4 display/Mrom_seg11
    (
        .I0(display/decode<1>),
        .I1(display/decode<0>),
        .I2(display/decode<3>),
        .I3(display/decode<2>),
        .O(seg_0_OBUF)
    );
    LUT3 col2_x_mux0000<9>1
    (
        .I0(col2_x_cmp_eq0000),
        .I1(col2_x_addsub0000<0>),
        .I2(state_reg<0>),
        .O(col2_x_mux0000<9>)
    );
    LUT3 col2_x_mux0000<8>1
    (
        .I0(state_reg<0>),
        .I1(col2_x_cmp_eq0000),
        .I2(col2_x_addsub0000<1>),
        .O(col2_x_mux0000<8>)
    );
    LUT3 col2_y_and00001
    (
        .I0(btn_3_IBUF),
        .I1(state_reg<0>),
        .I2(col2_x_cmp_eq0000),
        .O(col2_y_and0000)
    );
    LUT4 scoreOnes_cmp_eq00031
    (
        .I0(scoreOnes<1>),
        .I1(scoreOnes<3>),
        .I2(scoreOnes<2>),
        .I3(scoreOnes<0>),
        .O(scoreOnes_cmp_eq0003)
    );
    LUT3 col2_x_mux0000<7>1
    (
        .I0(state_reg<0>),
        .I1(col2_x_cmp_eq0000),
        .I2(col2_x_addsub0000<2>),
        .O(col2_x_mux0000<7>)
    );
    LUT2 vga_timer/Mcount_vertical_pixel_counter_eqn_11
    (
        .I0(vga_timer/vertical_pixel_counter_and0000),
        .I1(vga_timer/Result<1>1),
        .O(vga_timer/Mcount_vertical_pixel_counter_eqn_1)
    );
    LUT2 vga_timer/Mcount_vertical_pixel_counter_eqn_01
    (
        .I0(vga_timer/vertical_pixel_counter_and0000),
        .I1(vga_timer/Result<0>1),
        .O(vga_timer/Mcount_vertical_pixel_counter_eqn_0)
    );
    LUT4 vga_timer/vertical_pixel_counter_and000014
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .I1(vga_timer/vertical_pixel_counter<1>),
        .I2(vga_timer/vertical_pixel_counter<0>),
        .I3(vga_timer/vertical_pixel_counter<3>),
        .O(vga_timer/vertical_pixel_counter_and000014)
    );
    LUT4 vga_timer/vertical_pixel_counter_and000035
    (
        .I0(vga_timer/vertical_pixel_counter<7>),
        .I1(vga_timer/vertical_pixel_counter<6>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(vga_timer/vertical_pixel_counter<4>),
        .O(vga_timer/vertical_pixel_counter_and000035)
    );
    LUT4 vga_timer/Mcount_horizontal_pixel_counter_eqn_0110
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(vga_timer/horizontal_pixel_counter<7>),
        .I2(vga_timer/horizontal_pixel_counter<6>),
        .I3(vga_timer/horizontal_pixel_counter<8>),
        .O(vga_timer/Mcount_horizontal_pixel_counter_eqn_0110)
    );
    LUT3 vga_timer/Mcount_horizontal_pixel_counter_eqn_0118
    (
        .I0(vga_timer/pixel_en),
        .I1(vga_timer/horizontal_pixel_counter<0>),
        .I2(vga_timer/horizontal_pixel_counter<5>),
        .O(vga_timer/Mcount_horizontal_pixel_counter_eqn_0118)
    );
    LUT2 vga_timer/Mcount_vertical_pixel_counter_eqn_21
    (
        .I0(vga_timer/vertical_pixel_counter_and0000),
        .I1(vga_timer/Result<2>1),
        .O(vga_timer/Mcount_vertical_pixel_counter_eqn_2)
    );
    LUT3 col2_x_mux0000<6>1
    (
        .I0(state_reg<0>),
        .I1(col2_x_cmp_eq0000),
        .I2(col2_x_addsub0000<3>),
        .O(col2_x_mux0000<6>)
    );
    LUT2 vga_timer/Mcount_vertical_pixel_counter_eqn_31
    (
        .I0(vga_timer/vertical_pixel_counter_and0000),
        .I1(vga_timer/Result<3>1),
        .O(vga_timer/Mcount_vertical_pixel_counter_eqn_3)
    );
    LUT3 col2_x_mux0000<5>1
    (
        .I0(col2_x_cmp_eq0000),
        .I1(col2_x_addsub0000<4>),
        .I2(state_reg<0>),
        .O(col2_x_mux0000<5>)
    );
    LUT2 vga_timer/Mcount_vertical_pixel_counter_eqn_41
    (
        .I0(vga_timer/vertical_pixel_counter_and0000),
        .I1(vga_timer/Result<4>1),
        .O(vga_timer/Mcount_vertical_pixel_counter_eqn_4)
    );
    LUT3 col2_x_mux0000<4>1
    (
        .I0(col2_x_cmp_eq0000),
        .I1(col2_x_addsub0000<5>),
        .I2(state_reg<0>),
        .O(col2_x_mux0000<4>)
    );
    LUT2 vga_timer/Mcount_vertical_pixel_counter_eqn_51
    (
        .I0(vga_timer/vertical_pixel_counter_and0000),
        .I1(vga_timer/Result<5>1),
        .O(vga_timer/Mcount_vertical_pixel_counter_eqn_5)
    );
    LUT3 col2_x_mux0000<3>1
    (
        .I0(state_reg<0>),
        .I1(col2_x_cmp_eq0000),
        .I2(col2_x_addsub0000<6>),
        .O(col2_x_mux0000<3>)
    );
    LUT2 vga_timer/Mcount_vertical_pixel_counter_eqn_61
    (
        .I0(vga_timer/vertical_pixel_counter_and0000),
        .I1(vga_timer/Result<6>1),
        .O(vga_timer/Mcount_vertical_pixel_counter_eqn_6)
    );
    LUT3 col2_x_mux0000<2>1
    (
        .I0(state_reg<0>),
        .I1(col2_x_cmp_eq0000),
        .I2(col2_x_addsub0000<7>),
        .O(col2_x_mux0000<2>)
    );
    LUT4 col3_x_cmp_eq00008
    (
        .I0(N99),
        .I1(col2_x<7>),
        .I2(col2_x<1>),
        .I3(col2_x<4>),
        .O(col3_x_cmp_eq00008)
    );
    LUT4 col3_x_cmp_eq000019
    (
        .I0(col2_x<5>),
        .I1(col2_x<8>),
        .I2(col2_x<9>),
        .I3(col2_x<6>),
        .O(col3_x_cmp_eq000019)
    );
    LUT2 col3_x_cmp_eq000020
    (
        .I0(col3_x_cmp_eq00008),
        .I1(col3_x_cmp_eq000019),
        .O(col3_x_cmp_eq0000)
    );
    LUT4 col1_x_cmp_eq00008
    (
        .I0(N196),
        .I1(col3_x<7>),
        .I2(col3_x<1>),
        .I3(col3_x<4>),
        .O(col1_x_cmp_eq00008)
    );
    LUT4 col1_x_cmp_eq000019
    (
        .I0(col3_x<5>),
        .I1(col3_x<8>),
        .I2(col3_x<9>),
        .I3(col3_x<6>),
        .O(col1_x_cmp_eq000019)
    );
    LUT2 col1_x_cmp_eq000020
    (
        .I0(col1_x_cmp_eq00008),
        .I1(col1_x_cmp_eq000019),
        .O(col1_x_cmp_eq0000)
    );
    LUT4 col2_x_cmp_eq000010
    (
        .I0(col1_x<9>),
        .I1(col1_x<8>),
        .I2(col1_x<4>),
        .I3(col1_x<6>),
        .O(col2_x_cmp_eq000010)
    );
    LUT4 col2_x_cmp_eq000021
    (
        .I0(col1_x<5>),
        .I1(col1_x<1>),
        .I2(col1_x<2>),
        .I3(col1_x<7>),
        .O(col2_x_cmp_eq000021)
    );
    LUT2 button0_and00021
    (
        .I0(btn_0_IBUF),
        .I1(button0_cmp_eq0000),
        .O(button0_and0002)
    );
    LUT2 vga_timer/Mcount_vertical_pixel_counter_eqn_71
    (
        .I0(vga_timer/vertical_pixel_counter_and0000),
        .I1(vga_timer/Result<7>1),
        .O(vga_timer/Mcount_vertical_pixel_counter_eqn_7)
    );
    LUT3 col2_x_mux0000<1>1
    (
        .I0(col2_x_cmp_eq0000),
        .I1(col2_x_addsub0000<8>),
        .I2(state_reg<0>),
        .O(col2_x_mux0000<1>)
    );
    LUT2 vga_timer/Mcount_vertical_pixel_counter_eqn_81
    (
        .I0(vga_timer/vertical_pixel_counter_and0000),
        .I1(vga_timer/Result<8>1),
        .O(vga_timer/Mcount_vertical_pixel_counter_eqn_8)
    );
    LUT3 col2_x_mux0000<0>1
    (
        .I0(state_reg<0>),
        .I1(col2_x_cmp_eq0000),
        .I2(col2_x_addsub0000<9>),
        .O(col2_x_mux0000<0>)
    );
    LUT2 vga_timer/Mcount_vertical_pixel_counter_eqn_91
    (
        .I0(vga_timer/vertical_pixel_counter_and0000),
        .I1(vga_timer/Result<9>1),
        .O(vga_timer/Mcount_vertical_pixel_counter_eqn_9)
    );
    LUT4 vga_timer/blank_or00004
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(vga_timer/vertical_pixel_counter<5>),
        .I2(vga_timer/vertical_pixel_counter<8>),
        .I3(vga_timer/vertical_pixel_counter<7>),
        .O(vga_timer/blank_or00004)
    );
    LUT3 vga_timer/blank_or000011
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(vga_timer/horizontal_pixel_counter<7>),
        .I2(vga_timer/horizontal_pixel_counter<8>),
        .O(vga_timer/blank_or000011)
    );
    LUT3 vga_timer/blank_or000013
    (
        .I0(vga_timer/vertical_pixel_counter<9>),
        .I1(vga_timer/blank_or00004),
        .I2(vga_timer/blank_or000011),
        .O(blank)
    );
    LUT2 button0_and00001
    (
        .I0(btn_3_IBUF),
        .I1(button0_cmp_eq0000),
        .O(button0_and0000)
    );
    LUT3 jump_reg_and00011
    (
        .I0(btn_3_IBUF),
        .I1(bird_top_temp_cmp_eq0000),
        .I2(debouncer/state_reg_FSM_FFd2),
        .O(jump_reg_and0001)
    );
    LUT2 Mcount_scoreOnes_eqn_3_SW0
    (
        .I0(scoreOnes<1>),
        .I1(scoreOnes<2>),
        .O(N6)
    );
    LUT4 Mcount_scoreOnes_eqn_3
    (
        .I0(scoreOnes_and0000),
        .I1(scoreOnes<3>),
        .I2(N6),
        .I3(scoreOnes<0>),
        .O(Mcount_scoreOnes_eqn_3)
    );
    LUT4 fall_reg_and000041
    (
        .I0(btn_3_IBUF),
        .I1(fall_reg_and000017),
        .I2(bird_top_temp_cmp_eq0000),
        .I3(debouncer/state_reg_FSM_FFd2),
        .O(fall_reg_and0000)
    );
    LUT2 Mcount_scoreOnes_eqn_01
    (
        .I0(scoreOnes_and0000),
        .I1(scoreOnes<0>),
        .O(Mcount_scoreOnes_eqn_0)
    );
    LUT3 Mcount_scoreOnes_eqn_11
    (
        .I0(scoreOnes_and0000),
        .I1(scoreOnes<1>),
        .I2(scoreOnes<0>),
        .O(Mcount_scoreOnes_eqn_1)
    );
    LUT4 Mcount_scoreOnes_eqn_21
    (
        .I0(scoreOnes_and0000),
        .I1(scoreOnes<2>),
        .I2(scoreOnes<0>),
        .I3(scoreOnes<1>),
        .O(Mcount_scoreOnes_eqn_2)
    );
    LUT3 col3_x_not0001_SW0
    (
        .I0(moveEN),
        .I1(col3_on_cmp_le0000),
        .I2(col3_on_cmp_gt0000),
        .O(N8)
    );
    LUT3 col1_x_not0001_SW0
    (
        .I0(moveEN),
        .I1(col1_on_cmp_le0000),
        .I2(col1_on_cmp_gt0000),
        .O(N13)
    );
    LUT4 scoreOnes_and00001
    (
        .I0(moveEN),
        .I1(bird_top_temp_and0000),
        .I2(scoreOnes_or0000),
        .I3(scoreOnes_cmp_eq0003),
        .O(scoreOnes_and0000)
    );
    LUT4 scoreOnes_or000014
    (
        .I0(col3_x<3>),
        .I1(col3_x<1>),
        .I2(col3_x<0>),
        .I3(col3_x<2>),
        .O(scoreOnes_or000014)
    );
    LUT4 scoreOnes_or000034
    (
        .I0(col3_x<7>),
        .I1(col3_x<9>),
        .I2(col3_x<8>),
        .I3(col3_x<5>),
        .O(scoreOnes_or000034)
    );
    LUT4 scoreOnes_or000063
    (
        .I0(col2_x<3>),
        .I1(col2_x<1>),
        .I2(col2_x<0>),
        .I3(col2_x<2>),
        .O(scoreOnes_or000063)
    );
    LUT4 scoreOnes_or000083
    (
        .I0(col2_x<7>),
        .I1(col2_x<9>),
        .I2(col2_x<8>),
        .I3(col2_x<5>),
        .O(scoreOnes_or000083)
    );
    LUT4 scoreOnes_or0000122
    (
        .I0(col1_x<9>),
        .I1(col1_x<4>),
        .I2(col1_x<8>),
        .I3(col1_x<6>),
        .O(scoreOnes_or0000122)
    );
    LUT4 scoreOnes_or0000133
    (
        .I0(col1_x<7>),
        .I1(col1_x<2>),
        .I2(col1_x<1>),
        .I3(col1_x<5>),
        .O(scoreOnes_or0000133)
    );
    LUT3 scoreOnes_or0000161
    (
        .I0(scoreOnes_or000036),
        .I1(scoreOnes_or000085),
        .I2(scoreOnes_or0000147),
        .O(scoreOnes_or0000)
    );
    LUT2 ground_border_on_cmp_lt000023
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(vga_timer/vertical_pixel_counter<7>),
        .O(ground_border_on_cmp_lt000023)
    );
    LUT4 ground_border_on_cmp_lt0000219
    (
        .I0(vga_timer/vertical_pixel_counter<1>),
        .I1(vga_timer/vertical_pixel_counter<4>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(vga_timer/vertical_pixel_counter<2>),
        .O(ground_border_on_cmp_lt0000219)
    );
    LUT4 ground_border_on_cmp_lt0000244
    (
        .I0(ground_border_on_cmp_lt0000219),
        .I1(vga_timer/vertical_pixel_counter<6>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(ground_border_on_cmp_lt000023),
        .O(ground_border_on_cmp_lt0000244)
    );
    LUT2 ground_border_on_cmp_lt0000255
    (
        .I0(vga_timer/vertical_pixel_counter<9>),
        .I1(ground_border_on_cmp_lt0000244),
        .O(ground_border_on_cmp_lt0000)
    );
    LUT4 col3_on_cmp_le00001
    (
        .I0(col3_x<9>),
        .I1(col3_x<7>),
        .I2(col3_x<8>),
        .I3(N15),
        .O(col3_on_cmp_le0000)
    );
    LUT4 ground_border_on_cmp_ge0000217
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(vga_timer/vertical_pixel_counter<5>),
        .I2(ground_border_on_cmp_ge000025),
        .I3(vga_timer/vertical_pixel_counter<6>),
        .O(ground_border_on_cmp_ge0000217)
    );
    LUT4 col3_on_cmp_gt0000210
    (
        .I0(col3_x<6>),
        .I1(col3_x<5>),
        .I2(col3_x<8>),
        .I3(col3_x<9>),
        .O(col3_on_cmp_gt0000210)
    );
    LUT4 Msub_pipe_on_addsub0004_xor<7>11
    (
        .I0(col3_x<5>),
        .I1(col3_x<6>),
        .I2(col3_x<7>),
        .I3(col3_x<4>),
        .O(pipe_on_addsub0004<7>)
    );
    LUT4 col2_on_cmp_le00001
    (
        .I0(col2_x<9>),
        .I1(col2_x<7>),
        .I2(col2_x<8>),
        .I3(N17),
        .O(col2_on_cmp_le0000)
    );
    LUT4 col1_on_cmp_le00001
    (
        .I0(col1_x<9>),
        .I1(col1_x<7>),
        .I2(col1_x<8>),
        .I3(N19),
        .O(col1_on_cmp_le0000)
    );
    LUT4 col1_on_cmp_gt0000210
    (
        .I0(col1_x<6>),
        .I1(col1_x<5>),
        .I2(col1_x<8>),
        .I3(col1_x<9>),
        .O(col1_on_cmp_gt0000210)
    );
    LUT4 Msub_pipe_on_addsub0002_xor<7>11
    (
        .I0(col2_x<5>),
        .I1(col2_x<6>),
        .I2(col2_x<7>),
        .I3(col2_x<4>),
        .O(pipe_on_addsub0002<7>)
    );
    LUT4 Msub_pipe_on_addsub0000_xor<7>11
    (
        .I0(col1_x<5>),
        .I1(col1_x<6>),
        .I2(col1_x<7>),
        .I3(col1_x<4>),
        .O(pipe_on_addsub0000<7>)
    );
    LUT4 pipe_on_addsub0000<8>11
    (
        .I0(col1_x<7>),
        .I1(col1_x<5>),
        .I2(col1_x<4>),
        .I3(col1_x<6>),
        .O(pipe_on_addsub0000<8>_bdd0)
    );
    LUT4 Madd_pipe_on_addsub0001_xor<6>11
    (
        .I0(col1_y<4>),
        .I1(col1_y<6>),
        .I2(col1_y<5>),
        .I3(col1_y<0>),
        .O(pipe_on_addsub0001<6>)
    );
    LUT3 Madd_pipe_on_addsub0001_xor<5>11
    (
        .I0(col1_y<0>),
        .I1(col1_y<5>),
        .I2(col1_y<4>),
        .O(pipe_on_addsub0001<5>)
    );
    LUT4 pipe_on_addsub0004<8>11
    (
        .I0(col3_x<7>),
        .I1(col3_x<5>),
        .I2(col3_x<4>),
        .I3(col3_x<6>),
        .O(pipe_on_addsub0004<8>_bdd0)
    );
    LUT4 pipe_on_addsub0002<8>11
    (
        .I0(col2_x<7>),
        .I1(col2_x<5>),
        .I2(col2_x<4>),
        .I3(col2_x<6>),
        .O(pipe_on_addsub0002<8>_bdd0)
    );
    LUT2 bird_color_on_or001271
    (
        .I0(vga_timer/horizontal_pixel_counter<1>),
        .I1(vga_timer/horizontal_pixel_counter<2>),
        .O(N104)
    );
    LUT2 Madd_pipe_on_addsub0001_xor<4>11
    (
        .I0(col1_y<4>),
        .I1(col1_y<0>),
        .O(pipe_on_addsub0001<4>)
    );
    LUT4 Madd_pipe_on_addsub0005_xor<6>11
    (
        .I0(col3_y<4>),
        .I1(col3_y<6>),
        .I2(col3_y<5>),
        .I3(col3_y<0>),
        .O(pipe_on_addsub0005<6>)
    );
    LUT4 Madd_pipe_on_addsub0003_xor<6>11
    (
        .I0(col2_y<4>),
        .I1(col2_y<6>),
        .I2(col2_y<5>),
        .I3(col2_y<0>),
        .O(pipe_on_addsub0003<6>)
    );
    LUT3 Madd_pipe_on_addsub0005_xor<5>11
    (
        .I0(col3_y<0>),
        .I1(col3_y<5>),
        .I2(col3_y<4>),
        .O(pipe_on_addsub0005<5>)
    );
    LUT3 Madd_pipe_on_addsub0003_xor<5>11
    (
        .I0(col2_y<0>),
        .I1(col2_y<5>),
        .I2(col2_y<4>),
        .O(pipe_on_addsub0003<5>)
    );
    LUT4 bird_outline_on_cmp_le00022
    (
        .I0(N96),
        .I1(N29),
        .I2(vga_timer/horizontal_pixel_counter<9>),
        .I3(N211),
        .O(bird_outline_on_cmp_le0002)
    );
    LUT2 Madd_pipe_on_addsub0005_xor<4>11
    (
        .I0(col3_y<4>),
        .I1(col3_y<0>),
        .O(pipe_on_addsub0005<4>)
    );
    LUT2 Madd_pipe_on_addsub0003_xor<4>11
    (
        .I0(col2_y<4>),
        .I1(col2_y<0>),
        .O(pipe_on_addsub0003<4>)
    );
    LUT4 bird_top_temp<6>1
    (
        .I0(bird_top_temp_and0000),
        .I1(bird_top_temp_and0001),
        .I2(bird_top_temp_addsub0001<6>),
        .I3(bird_top<6>),
        .O(bird_top_temp<6>)
    );
    LUT3 pipe_on_addsub0001<9>1
    (
        .I0(col1_y<7>),
        .I1(col1_y<8>),
        .I2(pipe_on_addsub0001<7>_bdd0),
        .O(pipe_on_addsub0001<9>)
    );
    LUT3 pipe_on_addsub0001<8>1
    (
        .I0(N201),
        .I1(col1_y<8>),
        .I2(col1_y<7>),
        .O(pipe_on_addsub0001<8>)
    );
    LUT2 pipe_on_addsub0001<7>2
    (
        .I0(col1_y<7>),
        .I1(pipe_on_addsub0001<7>_bdd0),
        .O(pipe_on_addsub0001<7>)
    );
    LUT4 bird_color_on_cmp_ge000011
    (
        .I0(vga_timer/horizontal_pixel_counter<7>),
        .I1(vga_timer/horizontal_pixel_counter<8>),
        .I2(vga_timer/horizontal_pixel_counter<9>),
        .I3(N206),
        .O(bird_color_on_cmp_ge0000)
    );
    LUT4 bird_outline_on_cmp_ge00002
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(N29),
        .I2(bird_color_on_cmp_ge000116),
        .I3(N204),
        .O(bird_outline_on_cmp_ge0000)
    );
    LUT4 bird_color_on_cmp_le00022
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(N224),
        .I2(N179),
        .I3(N26),
        .O(bird_color_on_cmp_le0002)
    );
    LUT4 bird_color_on_cmp_ge00031_SW0
    (
        .I0(vga_timer/horizontal_pixel_counter<4>),
        .I1(vga_timer/horizontal_pixel_counter<5>),
        .I2(vga_timer/horizontal_pixel_counter<3>),
        .I3(vga_timer/horizontal_pixel_counter<2>),
        .O(N331)
    );
    LUT2 bird_color_on_cmp_ge000110
    (
        .I0(vga_timer/horizontal_pixel_counter<7>),
        .I1(vga_timer/horizontal_pixel_counter<9>),
        .O(bird_color_on_cmp_ge000110)
    );
    LUT3 pipe_on_addsub0005<9>1
    (
        .I0(col3_y<7>),
        .I1(col3_y<8>),
        .I2(pipe_on_addsub0005<7>_bdd0),
        .O(pipe_on_addsub0005<9>)
    );
    LUT3 pipe_on_addsub0003<9>1
    (
        .I0(col2_y<7>),
        .I1(col2_y<8>),
        .I2(pipe_on_addsub0003<7>_bdd0),
        .O(pipe_on_addsub0003<9>)
    );
    LUT4 bird_top_temp<0>1
    (
        .I0(N194),
        .I1(bird_top_temp_and0001),
        .I2(bird_top<0>),
        .I3(bird_top_temp_addsub0001<0>),
        .O(bird_top_temp<0>)
    );
    LUT3 pipe_on_addsub0005<8>1
    (
        .I0(N209),
        .I1(col3_y<8>),
        .I2(col3_y<7>),
        .O(pipe_on_addsub0005<8>)
    );
    LUT3 pipe_on_addsub0003<8>1
    (
        .I0(N210),
        .I1(col2_y<8>),
        .I2(col2_y<7>),
        .O(pipe_on_addsub0003<8>)
    );
    LUT2 pipe_on_addsub0005<7>2
    (
        .I0(col3_y<7>),
        .I1(pipe_on_addsub0005<7>_bdd0),
        .O(pipe_on_addsub0005<7>)
    );
    LUT2 pipe_on_addsub0003<7>2
    (
        .I0(col2_y<7>),
        .I1(pipe_on_addsub0003<7>_bdd0),
        .O(pipe_on_addsub0003<7>)
    );
    LUT4 pipe_on_or000615
    (
        .I0(col2_x<4>),
        .I1(col2_x<5>),
        .I2(N195),
        .I3(col2_x<1>),
        .O(pipe_on_or000615)
    );
    LUT3 pipe_on_or000633
    (
        .I0(col2_x<8>),
        .I1(col2_x<7>),
        .I2(col2_x<9>),
        .O(pipe_on_or000633)
    );
    LUT3 pipe_on_or0006129
    (
        .I0(col3_x<8>),
        .I1(col3_x<7>),
        .I2(col3_x<9>),
        .O(pipe_on_or0006129)
    );
    LUT4 pipe_on_or0006146
    (
        .I0(pipe_on_or0006111),
        .I1(pipe_on_or0006129),
        .I2(col3_x<6>),
        .I3(pipe_on_cmp_ge0002),
        .O(pipe_on_or0006146)
    );
    LUT3 pipe_on_or0006229
    (
        .I0(col1_x<5>),
        .I1(col1_x<4>),
        .I2(pipe_on_or0006216),
        .O(pipe_on_or0006229)
    );
    LUT3 pipe_on_or0006255
    (
        .I0(col1_x<8>),
        .I1(col1_x<7>),
        .I2(col1_x<9>),
        .O(pipe_on_or0006255)
    );
    LUT4 pipe_on_or0006324
    (
        .I0(pipe_on_or0006179),
        .I1(pipe_on_or0006310),
        .I2(pipe_on_or00060),
        .I3(pipe_on_or000666),
        .O(pipe_on)
    );
    LUT2 bird_outline_on_or0013161
    (
        .I0(vga_timer/horizontal_pixel_counter<1>),
        .I1(vga_timer/horizontal_pixel_counter<2>),
        .O(N33)
    );
    LUT4 bird_outline_on_cmp_le000021
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(N24),
        .I2(N26),
        .I3(N193),
        .O(bird_outline_on_cmp_le0000)
    );
    LUT4 bird_color_on_cmp_ge00042
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(N32),
        .I2(N203),
        .I3(N39),
        .O(bird_color_on_cmp_ge0004)
    );
    LUT4 Madd_bird_outline_on_addsub0001_cy<8>21
    (
        .I0(bird_top<6>),
        .I1(bird_top<5>),
        .I2(bird_top<4>),
        .I3(bird_top<3>),
        .O(Madd_bird_outline_on_addsub0001_cy<8>_bdd0)
    );
    LUT4 bird_top_temp<1>1
    (
        .I0(bird_top_temp_and0000),
        .I1(N202),
        .I2(bird_top<1>),
        .I3(bird_top_temp_addsub0001<1>),
        .O(bird_top_temp<1>)
    );
    LUT2 bird_top_next<8>1
    (
        .I0(bird_top_temp<8>),
        .I1(N215),
        .O(bird_top_next<8>)
    );
    LUT2 bird_top_next<7>1
    (
        .I0(bird_top_temp<7>),
        .I1(bird_top_next_cmp_lt0000),
        .O(bird_top_next<7>)
    );
    LUT2 bird_top_next<5>1
    (
        .I0(bird_top_temp<5>),
        .I1(bird_top_next_cmp_lt0000),
        .O(bird_top_next<5>)
    );
    LUT2 bird_top_next<4>1
    (
        .I0(N212),
        .I1(bird_top_next_cmp_lt0000),
        .O(bird_top_next<4>)
    );
    LUT2 bird_top_next<3>1
    (
        .I0(N213),
        .I1(bird_top_next_cmp_lt0000),
        .O(bird_top_next<3>)
    );
    LUT2 bird_top_next<2>1
    (
        .I0(bird_top_temp<2>),
        .I1(bird_top_next_cmp_lt0000),
        .O(bird_top_next<2>)
    );
    LUT2 bird_top_next<1>1
    (
        .I0(bird_top_temp<1>),
        .I1(bird_top_next_cmp_lt0000),
        .O(bird_top_next<1>)
    );
    LUT2 bird_top_next<0>1
    (
        .I0(bird_top_temp<0>),
        .I1(bird_top_next_cmp_lt0000),
        .O(bird_top_next<0>)
    );
    LUT2 bird_top_next_cmp_lt0000211
    (
        .I0(N199),
        .I1(bird_top_temp<8>),
        .O(bird_top_next_cmp_lt0000211)
    );
    LUT3 bird_top_next_cmp_lt0000220
    (
        .I0(bird_top_temp<1>),
        .I1(bird_top_temp<0>),
        .I2(N214),
        .O(bird_top_next_cmp_lt0000220)
    );
    LUT4 bird_top_next_cmp_lt0000243
    (
        .I0(bird_top_temp<3>),
        .I1(bird_top_temp<4>),
        .I2(N208),
        .I3(bird_top_next_cmp_lt0000220),
        .O(bird_top_next_cmp_lt0000243)
    );
    LUT4 Madd_bird_color_on_add0014_xor<7>11
    (
        .I0(bird_top<6>),
        .I1(bird_top<5>),
        .I2(bird_top<7>),
        .I3(bird_top<4>),
        .O(bird_color_on_add0014<7>)
    );
    LUT3 Madd_bird_color_on_add0014_xor<6>11
    (
        .I0(bird_top<6>),
        .I1(bird_top<5>),
        .I2(bird_top<4>),
        .O(bird_color_on_add0014<6>)
    );
    LUT4 Madd_bird_color_on_add0010_xor<5>11
    (
        .I0(bird_top<2>),
        .I1(bird_top<5>),
        .I2(bird_top<4>),
        .I3(bird_top<3>),
        .O(bird_color_on_add0010<5>)
    );
    LUT3 Madd_bird_color_on_add0010_xor<4>11
    (
        .I0(bird_top<2>),
        .I1(bird_top<4>),
        .I2(bird_top<3>),
        .O(bird_color_on_add0010<4>)
    );
    LUT4 Madd_bird_color_on_add0014_cy<8>21
    (
        .I0(bird_top<6>),
        .I1(bird_top<5>),
        .I2(bird_top<7>),
        .I3(bird_top<4>),
        .O(Madd_bird_color_on_add0014_cy<8>_bdd0)
    );
    LUT4 Madd_bird_color_on_add0018_cy<6>11
    (
        .I0(bird_top<6>),
        .I1(bird_top<5>),
        .I2(bird_top<4>),
        .I3(Madd_bird_color_on_add0002_cy<3>),
        .O(Madd_bird_color_on_add0018_cy<6>)
    );
    LUT4 Madd_bird_color_on_add0010_cy<8>21
    (
        .I0(bird_top<2>),
        .I1(bird_top<5>),
        .I2(bird_top<4>),
        .I3(bird_top<3>),
        .O(Madd_bird_color_on_add0010_cy<8>_bdd0)
    );
    LUT2 bird_color_on_or00101
    (
        .I0(Mcompar_bird_color_on_cmp_eq0020_cy<4>),
        .I1(Mcompar_bird_color_on_cmp_eq0021_cy<4>),
        .O(bird_color_on_or0010)
    );
    LUT2 bird_outline_on_or001331
    (
        .I0(Mcompar_bird_color_on_cmp_eq0022_cy<4>),
        .I1(Mcompar_bird_color_on_cmp_eq0023_cy<4>),
        .O(N16)
    );
    LUT4 state_next_0_mux0000
    (
        .I0(state_reg<0>),
        .I1(bird_top_temp_and0000),
        .I2(N43),
        .I3(bird_outline_on),
        .O(state_next)
    );
    LUT4 rgb<3>14
    (
        .I0(pipe_on),
        .I1(rgb<3>0),
        .I2(bird_color_on),
        .I3(N217),
        .O(rgb<3>14)
    );
    LUT4 rgb<3>40
    (
        .I0(rgb<3>36),
        .I1(ground_border_on_cmp_ge0000),
        .I2(rgb<3>14),
        .I3(bird_outline_on),
        .O(rgb<3>)
    );
    LUT4 rgb<2>37
    (
        .I0(blank),
        .I1(rgb<2>5),
        .I2(rgb<2>14),
        .I3(bird_outline_on),
        .O(rgb<2>)
    );
    LUT4 bird_white_on_or00047
    (
        .I0(bird_outline_on_cmp_ge0001),
        .I1(bird_outline_on_cmp_le0000),
        .I2(bird_white_on_or00041),
        .I3(bird_color_on_or0000),
        .O(bird_white_on_or00047)
    );
    LUT2 bird_white_on_or000427
    (
        .I0(bird_white_on_cmp_le0002),
        .I1(bird_white_on_or000426),
        .O(bird_white_on_or000427)
    );
    LUT4 bird_white_on_or000468
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(bird_white_on_or000456),
        .I2(N26),
        .I3(N24),
        .O(bird_white_on_or000468)
    );
    LUT4 bird_white_on_or0004110
    (
        .I0(N32),
        .I1(vga_timer/horizontal_pixel_counter<3>),
        .I2(N20),
        .I3(vga_timer/horizontal_pixel_counter<9>),
        .O(bird_white_on_or0004110)
    );
    LUT4 bird_white_on_or0004153
    (
        .I0(N26),
        .I1(vga_timer/horizontal_pixel_counter<6>),
        .I2(vga_timer/horizontal_pixel_counter<9>),
        .I3(bird_white_on_or0004128),
        .O(bird_white_on_or0004153)
    );
    LUT4 Madd_bird_color_on_add0006_cy<8>21
    (
        .I0(bird_top<6>),
        .I1(bird_top<5>),
        .I2(bird_top<4>),
        .I3(bird_top<3>),
        .O(Madd_bird_color_on_add0006_cy<8>_bdd0)
    );
    LUT4 bird_color_on_or001265
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(bird_color_on_or001249),
        .I2(N26),
        .I3(N24),
        .O(bird_color_on_or001265)
    );
    LUT4 bird_color_on_or0012123
    (
        .I0(vga_timer/horizontal_pixel_counter<5>),
        .I1(vga_timer/horizontal_pixel_counter<6>),
        .I2(vga_timer/horizontal_pixel_counter<3>),
        .I3(vga_timer/horizontal_pixel_counter<4>),
        .O(bird_color_on_or0012123)
    );
    LUT3 bird_color_on_or0012143
    (
        .I0(bird_color_on_or001271),
        .I1(bird_color_on_or001220),
        .I2(N220),
        .O(bird_color_on)
    );
    LUT2 bird_color_on_or00011
    (
        .I0(Mcompar_bird_color_on_cmp_eq0002_cy<4>),
        .I1(Mcompar_bird_color_on_cmp_eq0003_cy<4>),
        .O(bird_color_on_or0001)
    );
    LUT2 bird_color_on_or00031
    (
        .I0(Mcompar_bird_color_on_cmp_eq0006_cy<4>),
        .I1(Mcompar_bird_color_on_cmp_eq0007_cy<4>),
        .O(bird_color_on_or0003)
    );
    LUT4 bird_outline_on_or001344
    (
        .I0(bird_outline_on_cmp_le0001),
        .I1(bird_outline_on_or00139),
        .I2(bird_outline_on_or001337),
        .I3(bird_outline_on_or00134),
        .O(bird_outline_on_or001344)
    );
    LUT2 bird_outline_on_or00131011
    (
        .I0(vga_timer/horizontal_pixel_counter<2>),
        .I1(vga_timer/horizontal_pixel_counter<1>),
        .O(bird_outline_on_or0013101)
    );
    LUT4 bird_outline_on_or0013129
    (
        .I0(N205),
        .I1(N101),
        .I2(vga_timer/horizontal_pixel_counter<7>),
        .I3(vga_timer/horizontal_pixel_counter<9>),
        .O(bird_outline_on_or0013129)
    );
    LUT4 bird_outline_on_or0013145
    (
        .I0(bird_outline_on_or0013129),
        .I1(bird_outline_on_or001344),
        .I2(bird_outline_on_or001362),
        .I3(bird_outline_on_or0013109),
        .O(bird_outline_on_or0013145)
    );
    LUT2 bird_outline_on_or0013178
    (
        .I0(vga_timer/horizontal_pixel_counter<3>),
        .I1(vga_timer/horizontal_pixel_counter<4>),
        .O(bird_outline_on_or0013178)
    );
    LUT4 bird_outline_on_or0013190
    (
        .I0(N104),
        .I1(N18),
        .I2(bird_outline_on_or0013178),
        .I3(bird_outline_on_or0013176),
        .O(bird_outline_on_or0013190)
    );
    LUT4 bird_outline_on_or0013255
    (
        .I0(bird_outline_on_or0013166),
        .I1(bird_outline_on_or0013233),
        .I2(N33),
        .I3(bird_outline_on_or0013190),
        .O(bird_outline_on_or0013255)
    );
    LUT4 bird_outline_on_or0013294
    (
        .I0(N18),
        .I1(vga_timer/horizontal_pixel_counter<2>),
        .I2(bird_outline_on_or0013286),
        .I3(bird_outline_on_or0013285),
        .O(bird_outline_on_or0013294)
    );
    LUT2 bird_outline_on_or0013302
    (
        .I0(vga_timer/horizontal_pixel_counter<3>),
        .I1(vga_timer/horizontal_pixel_counter<4>),
        .O(bird_outline_on_or0013302)
    );
    LUT4 bird_outline_on_or0013329
    (
        .I0(vga_timer/horizontal_pixel_counter<1>),
        .I1(bird_outline_on_or0013302),
        .I2(bird_outline_on_or0013274),
        .I3(bird_outline_on_or0013294),
        .O(bird_outline_on_or0013329)
    );
    IBUF btn_3_IBUF
    (
        .I(btn<3>),
        .O(btn_3_IBUF)
    );
    IBUF btn_0_IBUF
    (
        .I(btn<0>),
        .O(btn_0_IBUF)
    );
    IBUF sw_7_IBUF
    (
        .I(sw<7>),
        .O(led_7_OBUF)
    );
    IBUF sw_6_IBUF
    (
        .I(sw<6>),
        .O(led_6_OBUF)
    );
    IBUF sw_5_IBUF
    (
        .I(sw<5>),
        .O(led_5_OBUF)
    );
    IBUF sw_4_IBUF
    (
        .I(sw<4>),
        .O(led_4_OBUF)
    );
    IBUF sw_3_IBUF
    (
        .I(sw<3>),
        .O(led_3_OBUF)
    );
    IBUF sw_2_IBUF
    (
        .I(sw<2>),
        .O(led_2_OBUF)
    );
    IBUF sw_1_IBUF
    (
        .I(sw<1>),
        .O(led_1_OBUF)
    );
    IBUF sw_0_IBUF
    (
        .I(sw<0>),
        .O(led_0_OBUF)
    );
    OBUF Vsync_OBUF
    (
        .I(Vsync_OBUF),
        .O(Vsync)
    );
    OBUF dp_OBUF
    (
        .I(dp_OBUF),
        .O(dp)
    );
    OBUF Hsync_OBUF
    (
        .I(Hsync_OBUF),
        .O(Hsync)
    );
    OBUF an_3_OBUF
    (
        .I(an_3_OBUF),
        .O(an<3>)
    );
    OBUF an_2_OBUF
    (
        .I(dp_OBUF),
        .O(an<2>)
    );
    OBUF an_1_OBUF
    (
        .I(an_1_OBUF),
        .O(an<1>)
    );
    OBUF an_0_OBUF
    (
        .I(an_0_OBUF),
        .O(an<0>)
    );
    OBUF vgaRed_2_OBUF
    (
        .I(vgaRed_2),
        .O(vgaRed<2>)
    );
    OBUF vgaRed_1_OBUF
    (
        .I(vgaRed_1),
        .O(vgaRed<1>)
    );
    OBUF vgaRed_0_OBUF
    (
        .I(vgaRed_0),
        .O(vgaRed<0>)
    );
    OBUF vgaBlue_1_OBUF
    (
        .I(vgaBlue_1),
        .O(vgaBlue<1>)
    );
    OBUF vgaBlue_0_OBUF
    (
        .I(vgaBlue_0),
        .O(vgaBlue<0>)
    );
    OBUF vgaGreen_2_OBUF
    (
        .I(vgaGreen_2),
        .O(vgaGreen<2>)
    );
    OBUF vgaGreen_1_OBUF
    (
        .I(vgaGreen_1),
        .O(vgaGreen<1>)
    );
    OBUF vgaGreen_0_OBUF
    (
        .I(vgaGreen_0),
        .O(vgaGreen<0>)
    );
    OBUF seg_6_OBUF
    (
        .I(seg_6_OBUF),
        .O(seg<6>)
    );
    OBUF seg_5_OBUF
    (
        .I(seg_5_OBUF),
        .O(seg<5>)
    );
    OBUF seg_4_OBUF
    (
        .I(seg_4_OBUF),
        .O(seg<4>)
    );
    OBUF seg_3_OBUF
    (
        .I(seg_3_OBUF),
        .O(seg<3>)
    );
    OBUF seg_2_OBUF
    (
        .I(seg_2_OBUF),
        .O(seg<2>)
    );
    OBUF seg_1_OBUF
    (
        .I(seg_1_OBUF),
        .O(seg<1>)
    );
    OBUF seg_0_OBUF
    (
        .I(seg_0_OBUF),
        .O(seg<0>)
    );
    OBUF led_7_OBUF
    (
        .I(led_7_OBUF),
        .O(led<7>)
    );
    OBUF led_6_OBUF
    (
        .I(led_6_OBUF),
        .O(led<6>)
    );
    OBUF led_5_OBUF
    (
        .I(led_5_OBUF),
        .O(led<5>)
    );
    OBUF led_4_OBUF
    (
        .I(led_4_OBUF),
        .O(led<4>)
    );
    OBUF led_3_OBUF
    (
        .I(led_3_OBUF),
        .O(led<3>)
    );
    OBUF led_2_OBUF
    (
        .I(led_2_OBUF),
        .O(led<2>)
    );
    OBUF led_1_OBUF
    (
        .I(led_1_OBUF),
        .O(led<1>)
    );
    OBUF led_0_OBUF
    (
        .I(led_0_OBUF),
        .O(led<0>)
    );
    LUT1 Madd_delay_next_addsub0000_cy<1>_rt
    (
        .I0(delay<1>),
        .O(Madd_delay_next_addsub0000_cy<1>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<2>_rt
    (
        .I0(delay<2>),
        .O(Madd_delay_next_addsub0000_cy<2>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<3>_rt
    (
        .I0(delay<3>),
        .O(Madd_delay_next_addsub0000_cy<3>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<4>_rt
    (
        .I0(delay<4>),
        .O(Madd_delay_next_addsub0000_cy<4>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<5>_rt
    (
        .I0(delay<5>),
        .O(Madd_delay_next_addsub0000_cy<5>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<6>_rt
    (
        .I0(delay<6>),
        .O(Madd_delay_next_addsub0000_cy<6>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<7>_rt
    (
        .I0(delay<7>),
        .O(Madd_delay_next_addsub0000_cy<7>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<8>_rt
    (
        .I0(delay<8>),
        .O(Madd_delay_next_addsub0000_cy<8>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<9>_rt
    (
        .I0(delay<9>),
        .O(Madd_delay_next_addsub0000_cy<9>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<10>_rt
    (
        .I0(delay<10>),
        .O(Madd_delay_next_addsub0000_cy<10>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<11>_rt
    (
        .I0(delay<11>),
        .O(Madd_delay_next_addsub0000_cy<11>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<12>_rt
    (
        .I0(delay<12>),
        .O(Madd_delay_next_addsub0000_cy<12>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<13>_rt
    (
        .I0(delay<13>),
        .O(Madd_delay_next_addsub0000_cy<13>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<14>_rt
    (
        .I0(delay<14>),
        .O(Madd_delay_next_addsub0000_cy<14>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<15>_rt
    (
        .I0(delay<15>),
        .O(Madd_delay_next_addsub0000_cy<15>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<16>_rt
    (
        .I0(delay<16>),
        .O(Madd_delay_next_addsub0000_cy<16>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<17>_rt
    (
        .I0(delay<17>),
        .O(Madd_delay_next_addsub0000_cy<17>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<18>_rt
    (
        .I0(delay<18>),
        .O(Madd_delay_next_addsub0000_cy<18>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<19>_rt
    (
        .I0(delay<19>),
        .O(Madd_delay_next_addsub0000_cy<19>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<20>_rt
    (
        .I0(delay<20>),
        .O(Madd_delay_next_addsub0000_cy<20>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<21>_rt
    (
        .I0(delay<21>),
        .O(Madd_delay_next_addsub0000_cy<21>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<22>_rt
    (
        .I0(delay<22>),
        .O(Madd_delay_next_addsub0000_cy<22>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<23>_rt
    (
        .I0(delay<23>),
        .O(Madd_delay_next_addsub0000_cy<23>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<24>_rt
    (
        .I0(delay<24>),
        .O(Madd_delay_next_addsub0000_cy<24>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<25>_rt
    (
        .I0(delay<25>),
        .O(Madd_delay_next_addsub0000_cy<25>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<26>_rt
    (
        .I0(delay<26>),
        .O(Madd_delay_next_addsub0000_cy<26>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<27>_rt
    (
        .I0(delay<27>),
        .O(Madd_delay_next_addsub0000_cy<27>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<28>_rt
    (
        .I0(delay<28>),
        .O(Madd_delay_next_addsub0000_cy<28>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_cy<29>_rt
    (
        .I0(delay<29>),
        .O(Madd_delay_next_addsub0000_cy<29>_rt)
    );
    LUT1 Msub_col3_x_addsub0000_cy<0>_rt
    (
        .I0(col3_x<0>),
        .O(Msub_col3_x_addsub0000_cy<0>_rt)
    );
    LUT1 Msub_col1_x_addsub0000_cy<0>_rt
    (
        .I0(col1_x<0>),
        .O(Msub_col1_x_addsub0000_cy<0>_rt)
    );
    LUT1 Msub_col2_x_addsub0000_cy<0>_rt
    (
        .I0(col2_x<0>),
        .O(Msub_col2_x_addsub0000_cy<0>_rt)
    );
    LUT1 Mcompar_delay_next_cmp_gt0000_cy<2>_rt
    (
        .I0(delay<7>),
        .O(Mcompar_delay_next_cmp_gt0000_cy<2>_rt)
    );
    LUT1 Mcompar_delay_next_cmp_gt0000_cy<4>_rt
    (
        .I0(delay<9>),
        .O(Mcompar_delay_next_cmp_gt0000_cy<4>_rt)
    );
    LUT1 Mcount_bird_delay_cy<1>_rt
    (
        .I0(bird_delay<1>),
        .O(Mcount_bird_delay_cy<1>_rt)
    );
    LUT1 Mcount_bird_delay_cy<2>_rt
    (
        .I0(bird_delay<2>),
        .O(Mcount_bird_delay_cy<2>_rt)
    );
    LUT1 Mcount_bird_delay_cy<3>_rt
    (
        .I0(bird_delay<3>),
        .O(Mcount_bird_delay_cy<3>_rt)
    );
    LUT1 Mcount_bird_delay_cy<4>_rt
    (
        .I0(bird_delay<4>),
        .O(Mcount_bird_delay_cy<4>_rt)
    );
    LUT1 Mcount_bird_delay_cy<5>_rt
    (
        .I0(bird_delay<5>),
        .O(Mcount_bird_delay_cy<5>_rt)
    );
    LUT1 Mcount_bird_delay_cy<6>_rt
    (
        .I0(bird_delay<6>),
        .O(Mcount_bird_delay_cy<6>_rt)
    );
    LUT1 Mcount_bird_delay_cy<7>_rt
    (
        .I0(bird_delay<7>),
        .O(Mcount_bird_delay_cy<7>_rt)
    );
    LUT1 Mcount_bird_delay_cy<8>_rt
    (
        .I0(bird_delay<8>),
        .O(Mcount_bird_delay_cy<8>_rt)
    );
    LUT1 Mcount_bird_delay_cy<9>_rt
    (
        .I0(bird_delay<9>),
        .O(Mcount_bird_delay_cy<9>_rt)
    );
    LUT1 Mcount_bird_delay_cy<10>_rt
    (
        .I0(bird_delay<10>),
        .O(Mcount_bird_delay_cy<10>_rt)
    );
    LUT1 Mcount_bird_delay_cy<11>_rt
    (
        .I0(bird_delay<11>),
        .O(Mcount_bird_delay_cy<11>_rt)
    );
    LUT1 Mcount_bird_delay_cy<12>_rt
    (
        .I0(bird_delay<12>),
        .O(Mcount_bird_delay_cy<12>_rt)
    );
    LUT1 Mcount_bird_delay_cy<13>_rt
    (
        .I0(bird_delay<13>),
        .O(Mcount_bird_delay_cy<13>_rt)
    );
    LUT1 Mcount_bird_delay_cy<14>_rt
    (
        .I0(bird_delay<14>),
        .O(Mcount_bird_delay_cy<14>_rt)
    );
    LUT1 Mcount_bird_delay_cy<15>_rt
    (
        .I0(bird_delay<15>),
        .O(Mcount_bird_delay_cy<15>_rt)
    );
    LUT1 Mcount_bird_delay_cy<16>_rt
    (
        .I0(bird_delay<16>),
        .O(Mcount_bird_delay_cy<16>_rt)
    );
    LUT1 Mcount_bird_delay_cy<17>_rt
    (
        .I0(bird_delay<17>),
        .O(Mcount_bird_delay_cy<17>_rt)
    );
    LUT1 Mcount_bird_delay_cy<18>_rt
    (
        .I0(bird_delay<18>),
        .O(Mcount_bird_delay_cy<18>_rt)
    );
    LUT1 Mcount_bird_delay_cy<19>_rt
    (
        .I0(bird_delay<19>),
        .O(Mcount_bird_delay_cy<19>_rt)
    );
    LUT1 display/Mcount_counter_value_cy<1>_rt
    (
        .I0(display/counter_value<1>),
        .O(display/Mcount_counter_value_cy<1>_rt)
    );
    LUT1 display/Mcount_counter_value_cy<2>_rt
    (
        .I0(display/counter_value<2>),
        .O(display/Mcount_counter_value_cy<2>_rt)
    );
    LUT1 display/Mcount_counter_value_cy<3>_rt
    (
        .I0(display/counter_value<3>),
        .O(display/Mcount_counter_value_cy<3>_rt)
    );
    LUT1 display/Mcount_counter_value_cy<4>_rt
    (
        .I0(display/counter_value<4>),
        .O(display/Mcount_counter_value_cy<4>_rt)
    );
    LUT1 display/Mcount_counter_value_cy<5>_rt
    (
        .I0(display/counter_value<5>),
        .O(display/Mcount_counter_value_cy<5>_rt)
    );
    LUT1 display/Mcount_counter_value_cy<6>_rt
    (
        .I0(display/counter_value<6>),
        .O(display/Mcount_counter_value_cy<6>_rt)
    );
    LUT1 display/Mcount_counter_value_cy<7>_rt
    (
        .I0(display/counter_value<7>),
        .O(display/Mcount_counter_value_cy<7>_rt)
    );
    LUT1 display/Mcount_counter_value_cy<8>_rt
    (
        .I0(display/counter_value<8>),
        .O(display/Mcount_counter_value_cy<8>_rt)
    );
    LUT1 display/Mcount_counter_value_cy<9>_rt
    (
        .I0(display/counter_value<9>),
        .O(display/Mcount_counter_value_cy<9>_rt)
    );
    LUT1 display/Mcount_counter_value_cy<10>_rt
    (
        .I0(display/counter_value<10>),
        .O(display/Mcount_counter_value_cy<10>_rt)
    );
    LUT1 display/Mcount_counter_value_cy<11>_rt
    (
        .I0(display/counter_value<11>),
        .O(display/Mcount_counter_value_cy<11>_rt)
    );
    LUT1 display/Mcount_counter_value_cy<12>_rt
    (
        .I0(display/counter_value<12>),
        .O(display/Mcount_counter_value_cy<12>_rt)
    );
    LUT1 display/Mcount_counter_value_cy<13>_rt
    (
        .I0(display/counter_value<13>),
        .O(display/Mcount_counter_value_cy<13>_rt)
    );
    LUT1 Mcount_debounce_counter_value_cy<1>_rt
    (
        .I0(debounce_counter_value<1>),
        .O(Mcount_debounce_counter_value_cy<1>_rt)
    );
    LUT1 Mcount_debounce_counter_value_cy<2>_rt
    (
        .I0(debounce_counter_value<2>),
        .O(Mcount_debounce_counter_value_cy<2>_rt)
    );
    LUT1 Mcount_debounce_counter_value_cy<3>_rt
    (
        .I0(debounce_counter_value<3>),
        .O(Mcount_debounce_counter_value_cy<3>_rt)
    );
    LUT1 Mcount_debounce_counter_value_cy<4>_rt
    (
        .I0(debounce_counter_value<4>),
        .O(Mcount_debounce_counter_value_cy<4>_rt)
    );
    LUT1 Mcount_debounce_counter_value_cy<5>_rt
    (
        .I0(debounce_counter_value<5>),
        .O(Mcount_debounce_counter_value_cy<5>_rt)
    );
    LUT1 Mcount_debounce_counter_value_cy<6>_rt
    (
        .I0(debounce_counter_value<6>),
        .O(Mcount_debounce_counter_value_cy<6>_rt)
    );
    LUT1 Mcount_debounce_counter_value_cy<7>_rt
    (
        .I0(debounce_counter_value<7>),
        .O(Mcount_debounce_counter_value_cy<7>_rt)
    );
    LUT1 Mcount_debounce_counter_value_cy<8>_rt
    (
        .I0(debounce_counter_value<8>),
        .O(Mcount_debounce_counter_value_cy<8>_rt)
    );
    LUT1 Mcount_debounce_counter_value_cy<9>_rt
    (
        .I0(debounce_counter_value<9>),
        .O(Mcount_debounce_counter_value_cy<9>_rt)
    );
    LUT1 Mcount_debounce_counter_value_cy<10>_rt
    (
        .I0(debounce_counter_value<10>),
        .O(Mcount_debounce_counter_value_cy<10>_rt)
    );
    LUT1 Mcount_debounce_counter_value_cy<11>_rt
    (
        .I0(debounce_counter_value<11>),
        .O(Mcount_debounce_counter_value_cy<11>_rt)
    );
    LUT1 Mcount_debounce_counter_value_cy<12>_rt
    (
        .I0(debounce_counter_value<12>),
        .O(Mcount_debounce_counter_value_cy<12>_rt)
    );
    LUT1 Mcount_debounce_counter_value_cy<13>_rt
    (
        .I0(debounce_counter_value<13>),
        .O(Mcount_debounce_counter_value_cy<13>_rt)
    );
    LUT1 Mcount_debounce_counter_value_cy<14>_rt
    (
        .I0(debounce_counter_value<14>),
        .O(Mcount_debounce_counter_value_cy<14>_rt)
    );
    LUT1 Mcount_debounce_counter_value_cy<15>_rt
    (
        .I0(debounce_counter_value<15>),
        .O(Mcount_debounce_counter_value_cy<15>_rt)
    );
    LUT1 Mcount_debounce_counter_value_cy<16>_rt
    (
        .I0(debounce_counter_value<16>),
        .O(Mcount_debounce_counter_value_cy<16>_rt)
    );
    LUT1 Mcount_debounce_counter_value_cy<17>_rt
    (
        .I0(debounce_counter_value<17>),
        .O(Mcount_debounce_counter_value_cy<17>_rt)
    );
    LUT1 Madd_bird_color_on_add0000_cy<2>_rt
    (
        .I0(bird_top_2_1),
        .O(Madd_bird_color_on_add0000_cy<2>_rt)
    );
    LUT1 Madd_bird_color_on_add0000_cy<3>_rt
    (
        .I0(bird_top<3>),
        .O(Madd_bird_color_on_add0000_cy<3>_rt)
    );
    LUT1 Madd_bird_color_on_add0000_cy<4>_rt
    (
        .I0(bird_top<4>),
        .O(Madd_bird_color_on_add0000_cy<4>_rt)
    );
    LUT1 Madd_bird_color_on_add0000_cy<5>_rt
    (
        .I0(bird_top_5_1),
        .O(Madd_bird_color_on_add0000_cy<5>_rt)
    );
    LUT1 Madd_bird_color_on_add0000_cy<6>_rt
    (
        .I0(bird_top_6_1),
        .O(Madd_bird_color_on_add0000_cy<6>_rt)
    );
    LUT1 Madd_bird_color_on_add0000_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_color_on_add0000_cy<7>_rt)
    );
    LUT1 Madd_bird_color_on_add0000_cy<8>_rt
    (
        .I0(bird_top_8_1),
        .O(Madd_bird_color_on_add0000_cy<8>_rt)
    );
    LUT1 Madd_bird_color_on_add0001_cy<2>_rt
    (
        .I0(bird_top_2_1),
        .O(Madd_bird_color_on_add0001_cy<2>_rt)
    );
    LUT1 Madd_bird_color_on_add0001_cy<3>_rt
    (
        .I0(bird_top<3>),
        .O(Madd_bird_color_on_add0001_cy<3>_rt)
    );
    LUT1 Madd_bird_color_on_add0001_cy<4>_rt
    (
        .I0(bird_top<4>),
        .O(Madd_bird_color_on_add0001_cy<4>_rt)
    );
    LUT1 Madd_bird_color_on_add0001_cy<5>_rt
    (
        .I0(bird_top_5_1),
        .O(Madd_bird_color_on_add0001_cy<5>_rt)
    );
    LUT1 Madd_bird_color_on_add0001_cy<6>_rt
    (
        .I0(bird_top_6_1),
        .O(Madd_bird_color_on_add0001_cy<6>_rt)
    );
    LUT1 Madd_bird_color_on_add0001_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_color_on_add0001_cy<7>_rt)
    );
    LUT1 Madd_bird_color_on_add0001_cy<8>_rt
    (
        .I0(bird_top_8_1),
        .O(Madd_bird_color_on_add0001_cy<8>_rt)
    );
    LUT1 Madd_bird_color_on_add0003_cy<1>_rt
    (
        .I0(bird_top<1>),
        .O(Madd_bird_color_on_add0003_cy<1>_rt)
    );
    LUT1 Madd_bird_color_on_add0003_cy<3>_rt
    (
        .I0(bird_top<3>),
        .O(Madd_bird_color_on_add0003_cy<3>_rt)
    );
    LUT1 Madd_bird_color_on_add0003_cy<4>_rt
    (
        .I0(bird_top<4>),
        .O(Madd_bird_color_on_add0003_cy<4>_rt)
    );
    LUT1 Madd_bird_color_on_add0003_cy<5>_rt
    (
        .I0(bird_top<5>),
        .O(Madd_bird_color_on_add0003_cy<5>_rt)
    );
    LUT1 Madd_bird_color_on_add0003_cy<6>_rt
    (
        .I0(bird_top<6>),
        .O(Madd_bird_color_on_add0003_cy<6>_rt)
    );
    LUT1 Madd_bird_color_on_add0003_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_color_on_add0003_cy<7>_rt)
    );
    LUT1 Madd_bird_color_on_add0003_cy<8>_rt
    (
        .I0(bird_top<8>),
        .O(Madd_bird_color_on_add0003_cy<8>_rt)
    );
    LUT1 Madd_bird_color_on_add0004_cy<3>_rt
    (
        .I0(bird_top<3>),
        .O(Madd_bird_color_on_add0004_cy<3>_rt)
    );
    LUT1 Madd_bird_color_on_add0004_cy<4>_rt
    (
        .I0(bird_top<4>),
        .O(Madd_bird_color_on_add0004_cy<4>_rt)
    );
    LUT1 Madd_bird_color_on_add0004_cy<5>_rt
    (
        .I0(bird_top_5_1),
        .O(Madd_bird_color_on_add0004_cy<5>_rt)
    );
    LUT1 Madd_bird_color_on_add0004_cy<6>_rt
    (
        .I0(bird_top_6_1),
        .O(Madd_bird_color_on_add0004_cy<6>_rt)
    );
    LUT1 Madd_bird_color_on_add0004_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_color_on_add0004_cy<7>_rt)
    );
    LUT1 Madd_bird_color_on_add0004_cy<8>_rt
    (
        .I0(bird_top_8_1),
        .O(Madd_bird_color_on_add0004_cy<8>_rt)
    );
    LUT1 Madd_bird_color_on_add0005_cy<3>_rt
    (
        .I0(bird_top<3>),
        .O(Madd_bird_color_on_add0005_cy<3>_rt)
    );
    LUT1 Madd_bird_color_on_add0005_cy<4>_rt
    (
        .I0(bird_top<4>),
        .O(Madd_bird_color_on_add0005_cy<4>_rt)
    );
    LUT1 Madd_bird_color_on_add0005_cy<5>_rt
    (
        .I0(bird_top_5_1),
        .O(Madd_bird_color_on_add0005_cy<5>_rt)
    );
    LUT1 Madd_bird_color_on_add0005_cy<6>_rt
    (
        .I0(bird_top_6_1),
        .O(Madd_bird_color_on_add0005_cy<6>_rt)
    );
    LUT1 Madd_bird_color_on_add0005_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_color_on_add0005_cy<7>_rt)
    );
    LUT1 Madd_bird_color_on_add0005_cy<8>_rt
    (
        .I0(bird_top_8_1),
        .O(Madd_bird_color_on_add0005_cy<8>_rt)
    );
    LUT1 Madd_bird_color_on_add0007_cy<1>_rt
    (
        .I0(bird_top_1_1),
        .O(Madd_bird_color_on_add0007_cy<1>_rt)
    );
    LUT1 Madd_bird_color_on_add0007_cy<2>_rt
    (
        .I0(bird_top_2_1),
        .O(Madd_bird_color_on_add0007_cy<2>_rt)
    );
    LUT1 Madd_bird_color_on_add0007_cy<4>_rt
    (
        .I0(bird_top<4>),
        .O(Madd_bird_color_on_add0007_cy<4>_rt)
    );
    LUT1 Madd_bird_color_on_add0007_cy<5>_rt
    (
        .I0(bird_top_5_1),
        .O(Madd_bird_color_on_add0007_cy<5>_rt)
    );
    LUT1 Madd_bird_color_on_add0007_cy<6>_rt
    (
        .I0(bird_top_6_1),
        .O(Madd_bird_color_on_add0007_cy<6>_rt)
    );
    LUT1 Madd_bird_color_on_add0007_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_color_on_add0007_cy<7>_rt)
    );
    LUT1 Madd_bird_color_on_add0007_cy<8>_rt
    (
        .I0(bird_top_8_1),
        .O(Madd_bird_color_on_add0007_cy<8>_rt)
    );
    LUT1 Madd_bird_color_on_add0008_cy<2>_rt
    (
        .I0(bird_top_2_1),
        .O(Madd_bird_color_on_add0008_cy<2>_rt)
    );
    LUT1 Madd_bird_color_on_add0008_cy<4>_rt
    (
        .I0(bird_top<4>),
        .O(Madd_bird_color_on_add0008_cy<4>_rt)
    );
    LUT1 Madd_bird_color_on_add0008_cy<5>_rt
    (
        .I0(bird_top_5_1),
        .O(Madd_bird_color_on_add0008_cy<5>_rt)
    );
    LUT1 Madd_bird_color_on_add0008_cy<6>_rt
    (
        .I0(bird_top_6_1),
        .O(Madd_bird_color_on_add0008_cy<6>_rt)
    );
    LUT1 Madd_bird_color_on_add0008_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_color_on_add0008_cy<7>_rt)
    );
    LUT1 Madd_bird_color_on_add0008_cy<8>_rt
    (
        .I0(bird_top_8_1),
        .O(Madd_bird_color_on_add0008_cy<8>_rt)
    );
    LUT1 Madd_bird_color_on_add0009_cy<2>_rt
    (
        .I0(bird_top_2_1),
        .O(Madd_bird_color_on_add0009_cy<2>_rt)
    );
    LUT1 Madd_bird_color_on_add0009_cy<4>_rt
    (
        .I0(bird_top<4>),
        .O(Madd_bird_color_on_add0009_cy<4>_rt)
    );
    LUT1 Madd_bird_color_on_add0009_cy<5>_rt
    (
        .I0(bird_top_5_1),
        .O(Madd_bird_color_on_add0009_cy<5>_rt)
    );
    LUT1 Madd_bird_color_on_add0009_cy<6>_rt
    (
        .I0(bird_top_6_1),
        .O(Madd_bird_color_on_add0009_cy<6>_rt)
    );
    LUT1 Madd_bird_color_on_add0009_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_color_on_add0009_cy<7>_rt)
    );
    LUT1 Madd_bird_color_on_add0009_cy<8>_rt
    (
        .I0(bird_top_8_1),
        .O(Madd_bird_color_on_add0009_cy<8>_rt)
    );
    LUT1 Madd_bird_color_on_add0012_cy<4>_rt
    (
        .I0(bird_top<4>),
        .O(Madd_bird_color_on_add0012_cy<4>_rt)
    );
    LUT1 Madd_bird_color_on_add0012_cy<5>_rt
    (
        .I0(bird_top_5_1),
        .O(Madd_bird_color_on_add0012_cy<5>_rt)
    );
    LUT1 Madd_bird_color_on_add0012_cy<6>_rt
    (
        .I0(bird_top_6_1),
        .O(Madd_bird_color_on_add0012_cy<6>_rt)
    );
    LUT1 Madd_bird_color_on_add0012_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_color_on_add0012_cy<7>_rt)
    );
    LUT1 Madd_bird_color_on_add0012_cy<8>_rt
    (
        .I0(bird_top_8_1),
        .O(Madd_bird_color_on_add0012_cy<8>_rt)
    );
    LUT1 Madd_bird_color_on_add0011_cy<1>_rt
    (
        .I0(bird_top_1_1),
        .O(Madd_bird_color_on_add0011_cy<1>_rt)
    );
    LUT1 Madd_bird_color_on_add0011_cy<4>_rt
    (
        .I0(bird_top<4>),
        .O(Madd_bird_color_on_add0011_cy<4>_rt)
    );
    LUT1 Madd_bird_color_on_add0011_cy<5>_rt
    (
        .I0(bird_top_5_1),
        .O(Madd_bird_color_on_add0011_cy<5>_rt)
    );
    LUT1 Madd_bird_color_on_add0011_cy<6>_rt
    (
        .I0(bird_top_6_1),
        .O(Madd_bird_color_on_add0011_cy<6>_rt)
    );
    LUT1 Madd_bird_color_on_add0011_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_color_on_add0011_cy<7>_rt)
    );
    LUT1 Madd_bird_color_on_add0011_cy<8>_rt
    (
        .I0(bird_top_8_1),
        .O(Madd_bird_color_on_add0011_cy<8>_rt)
    );
    LUT1 Madd_bird_color_on_add0013_cy<4>_rt
    (
        .I0(bird_top<4>),
        .O(Madd_bird_color_on_add0013_cy<4>_rt)
    );
    LUT1 Madd_bird_color_on_add0013_cy<5>_rt
    (
        .I0(bird_top_5_1),
        .O(Madd_bird_color_on_add0013_cy<5>_rt)
    );
    LUT1 Madd_bird_color_on_add0013_cy<6>_rt
    (
        .I0(bird_top_6_1),
        .O(Madd_bird_color_on_add0013_cy<6>_rt)
    );
    LUT1 Madd_bird_color_on_add0013_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_color_on_add0013_cy<7>_rt)
    );
    LUT1 Madd_bird_color_on_add0013_cy<8>_rt
    (
        .I0(bird_top_8_1),
        .O(Madd_bird_color_on_add0013_cy<8>_rt)
    );
    LUT1 Madd_bird_color_on_add0015_cy<1>_rt
    (
        .I0(bird_top_1_1),
        .O(Madd_bird_color_on_add0015_cy<1>_rt)
    );
    LUT1 Madd_bird_color_on_add0015_cy<2>_rt
    (
        .I0(bird_top_2_1),
        .O(Madd_bird_color_on_add0015_cy<2>_rt)
    );
    LUT1 Madd_bird_color_on_add0015_cy<3>_rt
    (
        .I0(bird_top<3>),
        .O(Madd_bird_color_on_add0015_cy<3>_rt)
    );
    LUT1 Madd_bird_color_on_add0015_cy<5>_rt
    (
        .I0(bird_top_5_1),
        .O(Madd_bird_color_on_add0015_cy<5>_rt)
    );
    LUT1 Madd_bird_color_on_add0015_cy<6>_rt
    (
        .I0(bird_top_6_1),
        .O(Madd_bird_color_on_add0015_cy<6>_rt)
    );
    LUT1 Madd_bird_color_on_add0015_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_color_on_add0015_cy<7>_rt)
    );
    LUT1 Madd_bird_color_on_add0015_cy<8>_rt
    (
        .I0(bird_top_8_1),
        .O(Madd_bird_color_on_add0015_cy<8>_rt)
    );
    LUT1 Madd_bird_color_on_add0016_cy<2>_rt
    (
        .I0(bird_top_2_1),
        .O(Madd_bird_color_on_add0016_cy<2>_rt)
    );
    LUT1 Madd_bird_color_on_add0016_cy<3>_rt
    (
        .I0(bird_top<3>),
        .O(Madd_bird_color_on_add0016_cy<3>_rt)
    );
    LUT1 Madd_bird_color_on_add0016_cy<5>_rt
    (
        .I0(bird_top_5_1),
        .O(Madd_bird_color_on_add0016_cy<5>_rt)
    );
    LUT1 Madd_bird_color_on_add0016_cy<6>_rt
    (
        .I0(bird_top_6_1),
        .O(Madd_bird_color_on_add0016_cy<6>_rt)
    );
    LUT1 Madd_bird_color_on_add0016_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_color_on_add0016_cy<7>_rt)
    );
    LUT1 Madd_bird_color_on_add0016_cy<8>_rt
    (
        .I0(bird_top_8_1),
        .O(Madd_bird_color_on_add0016_cy<8>_rt)
    );
    LUT1 Madd_bird_color_on_add0017_cy<2>_rt
    (
        .I0(bird_top<2>),
        .O(Madd_bird_color_on_add0017_cy<2>_rt)
    );
    LUT1 Madd_bird_color_on_add0017_cy<3>_rt
    (
        .I0(bird_top<3>),
        .O(Madd_bird_color_on_add0017_cy<3>_rt)
    );
    LUT1 Madd_bird_color_on_add0017_cy<5>_rt
    (
        .I0(bird_top<5>),
        .O(Madd_bird_color_on_add0017_cy<5>_rt)
    );
    LUT1 Madd_bird_color_on_add0017_cy<6>_rt
    (
        .I0(bird_top<6>),
        .O(Madd_bird_color_on_add0017_cy<6>_rt)
    );
    LUT1 Madd_bird_color_on_add0017_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_color_on_add0017_cy<7>_rt)
    );
    LUT1 Madd_bird_color_on_add0017_cy<8>_rt
    (
        .I0(bird_top<8>),
        .O(Madd_bird_color_on_add0017_cy<8>_rt)
    );
    LUT1 Madd_bird_color_on_add0019_cy<1>_rt
    (
        .I0(bird_top<1>),
        .O(Madd_bird_color_on_add0019_cy<1>_rt)
    );
    LUT1 Madd_bird_color_on_add0019_cy<3>_rt
    (
        .I0(bird_top<3>),
        .O(Madd_bird_color_on_add0019_cy<3>_rt)
    );
    LUT1 Madd_bird_color_on_add0019_cy<5>_rt
    (
        .I0(bird_top<5>),
        .O(Madd_bird_color_on_add0019_cy<5>_rt)
    );
    LUT1 Madd_bird_color_on_add0019_cy<6>_rt
    (
        .I0(bird_top<6>),
        .O(Madd_bird_color_on_add0019_cy<6>_rt)
    );
    LUT1 Madd_bird_color_on_add0019_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_color_on_add0019_cy<7>_rt)
    );
    LUT1 Madd_bird_color_on_add0019_cy<8>_rt
    (
        .I0(bird_top<8>),
        .O(Madd_bird_color_on_add0019_cy<8>_rt)
    );
    LUT1 Madd_bird_color_on_add0020_cy<3>_rt
    (
        .I0(bird_top<3>),
        .O(Madd_bird_color_on_add0020_cy<3>_rt)
    );
    LUT1 Madd_bird_color_on_add0020_cy<5>_rt
    (
        .I0(bird_top<5>),
        .O(Madd_bird_color_on_add0020_cy<5>_rt)
    );
    LUT1 Madd_bird_color_on_add0020_cy<6>_rt
    (
        .I0(bird_top<6>),
        .O(Madd_bird_color_on_add0020_cy<6>_rt)
    );
    LUT1 Madd_bird_color_on_add0020_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_color_on_add0020_cy<7>_rt)
    );
    LUT1 Madd_bird_color_on_add0020_cy<8>_rt
    (
        .I0(bird_top<8>),
        .O(Madd_bird_color_on_add0020_cy<8>_rt)
    );
    LUT1 Madd_bird_color_on_add0021_cy<3>_rt
    (
        .I0(bird_top<3>),
        .O(Madd_bird_color_on_add0021_cy<3>_rt)
    );
    LUT1 Madd_bird_color_on_add0021_cy<5>_rt
    (
        .I0(bird_top<5>),
        .O(Madd_bird_color_on_add0021_cy<5>_rt)
    );
    LUT1 Madd_bird_color_on_add0021_cy<6>_rt
    (
        .I0(bird_top<6>),
        .O(Madd_bird_color_on_add0021_cy<6>_rt)
    );
    LUT1 Madd_bird_color_on_add0021_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_color_on_add0021_cy<7>_rt)
    );
    LUT1 Madd_bird_color_on_add0021_cy<8>_rt
    (
        .I0(bird_top<8>),
        .O(Madd_bird_color_on_add0021_cy<8>_rt)
    );
    LUT1 Madd_bird_outline_on_addsub0000_cy<1>_rt
    (
        .I0(bird_top_1_1),
        .O(Madd_bird_outline_on_addsub0000_cy<1>_rt)
    );
    LUT1 Madd_bird_outline_on_addsub0000_cy<2>_rt
    (
        .I0(bird_top_2_1),
        .O(Madd_bird_outline_on_addsub0000_cy<2>_rt)
    );
    LUT1 Madd_bird_outline_on_addsub0000_cy<3>_rt
    (
        .I0(bird_top<3>),
        .O(Madd_bird_outline_on_addsub0000_cy<3>_rt)
    );
    LUT1 Madd_bird_outline_on_addsub0000_cy<4>_rt
    (
        .I0(bird_top<4>),
        .O(Madd_bird_outline_on_addsub0000_cy<4>_rt)
    );
    LUT1 Madd_bird_outline_on_addsub0000_cy<5>_rt
    (
        .I0(bird_top_5_1),
        .O(Madd_bird_outline_on_addsub0000_cy<5>_rt)
    );
    LUT1 Madd_bird_outline_on_addsub0000_cy<6>_rt
    (
        .I0(bird_top_6_1),
        .O(Madd_bird_outline_on_addsub0000_cy<6>_rt)
    );
    LUT1 Madd_bird_outline_on_addsub0000_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_outline_on_addsub0000_cy<7>_rt)
    );
    LUT1 Madd_bird_outline_on_addsub0000_cy<8>_rt
    (
        .I0(bird_top_8_1),
        .O(Madd_bird_outline_on_addsub0000_cy<8>_rt)
    );
    LUT1 Madd_bird_outline_on_addsub0002_cy<1>_rt
    (
        .I0(bird_top_1_1),
        .O(Madd_bird_outline_on_addsub0002_cy<1>_rt)
    );
    LUT1 Madd_bird_outline_on_addsub0002_cy<2>_rt
    (
        .I0(bird_top_2_1),
        .O(Madd_bird_outline_on_addsub0002_cy<2>_rt)
    );
    LUT1 Madd_bird_outline_on_addsub0002_cy<5>_rt
    (
        .I0(bird_top_5_1),
        .O(Madd_bird_outline_on_addsub0002_cy<5>_rt)
    );
    LUT1 Madd_bird_outline_on_addsub0002_cy<6>_rt
    (
        .I0(bird_top_6_1),
        .O(Madd_bird_outline_on_addsub0002_cy<6>_rt)
    );
    LUT1 Madd_bird_outline_on_addsub0002_cy<7>_rt
    (
        .I0(bird_top<7>),
        .O(Madd_bird_outline_on_addsub0002_cy<7>_rt)
    );
    LUT1 Madd_bird_outline_on_addsub0002_cy<8>_rt
    (
        .I0(bird_top_8_1),
        .O(Madd_bird_outline_on_addsub0002_cy<8>_rt)
    );
    LUT1 Madd_bird_top_temp_addsub0001_cy<4>_rt
    (
        .I0(bird_top_temp_addsub0000<4>),
        .O(Madd_bird_top_temp_addsub0001_cy<4>_rt)
    );
    LUT1 Madd_bird_top_temp_addsub0001_cy<5>_rt
    (
        .I0(bird_top_temp_addsub0000<5>),
        .O(Madd_bird_top_temp_addsub0001_cy<5>_rt)
    );
    LUT1 Madd_bird_top_temp_addsub0001_cy<6>_rt
    (
        .I0(bird_top_temp_addsub0000<6>),
        .O(Madd_bird_top_temp_addsub0001_cy<6>_rt)
    );
    LUT1 Madd_bird_top_temp_addsub0001_cy<7>_rt
    (
        .I0(bird_top_temp_addsub0000<7>),
        .O(Madd_bird_top_temp_addsub0001_cy<7>_rt)
    );
    LUT1 Madd_bird_top_temp_addsub0001_cy<8>_rt
    (
        .I0(bird_top_temp_addsub0000<8>),
        .O(Madd_bird_top_temp_addsub0001_cy<8>_rt)
    );
    LUT1 vga_timer/Mcount_vertical_pixel_counter_cy<8>_rt
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .O(vga_timer/Mcount_vertical_pixel_counter_cy<8>_rt)
    );
    LUT1 vga_timer/Mcount_vertical_pixel_counter_cy<7>_rt
    (
        .I0(vga_timer/vertical_pixel_counter<7>),
        .O(vga_timer/Mcount_vertical_pixel_counter_cy<7>_rt)
    );
    LUT1 vga_timer/Mcount_vertical_pixel_counter_cy<6>_rt
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .O(vga_timer/Mcount_vertical_pixel_counter_cy<6>_rt)
    );
    LUT1 vga_timer/Mcount_vertical_pixel_counter_cy<5>_rt
    (
        .I0(vga_timer/vertical_pixel_counter<5>),
        .O(vga_timer/Mcount_vertical_pixel_counter_cy<5>_rt)
    );
    LUT1 vga_timer/Mcount_vertical_pixel_counter_cy<4>_rt
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .O(vga_timer/Mcount_vertical_pixel_counter_cy<4>_rt)
    );
    LUT1 vga_timer/Mcount_vertical_pixel_counter_cy<3>_rt
    (
        .I0(vga_timer/vertical_pixel_counter<3>),
        .O(vga_timer/Mcount_vertical_pixel_counter_cy<3>_rt)
    );
    LUT1 vga_timer/Mcount_vertical_pixel_counter_cy<2>_rt
    (
        .I0(vga_timer/vertical_pixel_counter<2>),
        .O(vga_timer/Mcount_vertical_pixel_counter_cy<2>_rt)
    );
    LUT1 vga_timer/Mcount_vertical_pixel_counter_cy<1>_rt
    (
        .I0(vga_timer/vertical_pixel_counter<1>),
        .O(vga_timer/Mcount_vertical_pixel_counter_cy<1>_rt)
    );
    LUT1 vga_timer/Mcount_horizontal_pixel_counter_cy<8>_rt
    (
        .I0(vga_timer/horizontal_pixel_counter<8>),
        .O(vga_timer/Mcount_horizontal_pixel_counter_cy<8>_rt)
    );
    LUT1 vga_timer/Mcount_horizontal_pixel_counter_cy<7>_rt
    (
        .I0(vga_timer/horizontal_pixel_counter<7>),
        .O(vga_timer/Mcount_horizontal_pixel_counter_cy<7>_rt)
    );
    LUT1 vga_timer/Mcount_horizontal_pixel_counter_cy<6>_rt
    (
        .I0(vga_timer/horizontal_pixel_counter<6>),
        .O(vga_timer/Mcount_horizontal_pixel_counter_cy<6>_rt)
    );
    LUT1 vga_timer/Mcount_horizontal_pixel_counter_cy<5>_rt
    (
        .I0(vga_timer/horizontal_pixel_counter<5>),
        .O(vga_timer/Mcount_horizontal_pixel_counter_cy<5>_rt)
    );
    LUT1 vga_timer/Mcount_horizontal_pixel_counter_cy<4>_rt
    (
        .I0(vga_timer/horizontal_pixel_counter<4>),
        .O(vga_timer/Mcount_horizontal_pixel_counter_cy<4>_rt)
    );
    LUT1 vga_timer/Mcount_horizontal_pixel_counter_cy<3>_rt
    (
        .I0(vga_timer/horizontal_pixel_counter<3>),
        .O(vga_timer/Mcount_horizontal_pixel_counter_cy<3>_rt)
    );
    LUT1 vga_timer/Mcount_horizontal_pixel_counter_cy<2>_rt
    (
        .I0(vga_timer/horizontal_pixel_counter<2>),
        .O(vga_timer/Mcount_horizontal_pixel_counter_cy<2>_rt)
    );
    LUT1 vga_timer/Mcount_horizontal_pixel_counter_cy<1>_rt
    (
        .I0(vga_timer/horizontal_pixel_counter<1>),
        .O(vga_timer/Mcount_horizontal_pixel_counter_cy<1>_rt)
    );
    LUT1 Madd_delay_next_addsub0000_xor<30>_rt
    (
        .I0(delay<30>),
        .O(Madd_delay_next_addsub0000_xor<30>_rt)
    );
    LUT1 Mcount_bird_delay_xor<20>_rt
    (
        .I0(bird_delay<20>),
        .O(Mcount_bird_delay_xor<20>_rt)
    );
    LUT1 display/Mcount_counter_value_xor<14>_rt
    (
        .I0(display/counter_value<14>),
        .O(display/Mcount_counter_value_xor<14>_rt)
    );
    LUT1 Mcount_debounce_counter_value_xor<18>_rt
    (
        .I0(debounce_counter_value<18>),
        .O(Mcount_debounce_counter_value_xor<18>_rt)
    );
    LUT1 vga_timer/Mcount_vertical_pixel_counter_xor<9>_rt
    (
        .I0(vga_timer/vertical_pixel_counter<9>),
        .O(vga_timer/Mcount_vertical_pixel_counter_xor<9>_rt)
    );
    LUT1 vga_timer/Mcount_horizontal_pixel_counter_xor<9>_rt
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .O(vga_timer/Mcount_horizontal_pixel_counter_xor<9>_rt)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0020_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<5>),
        .I1(vga_timer/vertical_pixel_counter<4>),
        .I2(bird_color_on_add0018<5>),
        .I3(bird_color_on_add0002<4>),
        .O(Mcompar_bird_color_on_cmp_eq0020_lut<2>)
    );
    LUT2 Mcompar_bird_color_on_cmp_eq0012_lut<3>_SW0
    (
        .I0(bird_top<7>),
        .I1(vga_timer/vertical_pixel_counter<7>),
        .O(N47)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0012_lut<3>
    (
        .I0(Madd_bird_color_on_add0010_cy<8>_bdd0),
        .I1(bird_top<6>),
        .I2(vga_timer/vertical_pixel_counter<6>),
        .I3(N47),
        .O(Mcompar_bird_color_on_cmp_eq0012_lut<3>)
    );
    LUT4 bird_white_on_or000492
    (
        .I0(bird_outline_on_cmp_ge0000),
        .I1(bird_color_on_or0003),
        .I2(bird_outline_on_cmp_le0001),
        .I3(bird_white_on_or000473),
        .O(bird_white_on_or000492)
    );
    LUT4 bird_outline_on_or0013109
    (
        .I0(N104),
        .I1(bird_color_on_or0010),
        .I2(bird_outline_on_or001386),
        .I3(N52),
        .O(bird_outline_on_or0013109)
    );
    LUT4 highscore_and0000
    (
        .I0(Mcompar_highscore_cmp_gt0000_cy<7>),
        .I1(N41),
        .I2(pipe_on),
        .I3(N219),
        .O(highscore_and0000)
    );
    LUT4 bird_white_on_or000411
    (
        .I0(bird_outline_on_cmp_ge0002),
        .I1(N197),
        .I2(Mcompar_bird_color_on_cmp_eq0016_cy<4>),
        .I3(Mcompar_bird_color_on_cmp_eq0017_cy<4>),
        .O(bird_white_on_or000411)
    );
    LUT3 bird_white_on_or00041
    (
        .I0(N225),
        .I1(Mcompar_bird_color_on_cmp_eq0012_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0013_cy<4>),
        .O(bird_white_on_or00041)
    );
    LUT4 bird_outline_on_or0013170
    (
        .I0(Mcompar_bird_color_on_cmp_eq0012_cy<4>),
        .I1(Mcompar_bird_color_on_cmp_eq0014_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0015_cy<4>),
        .I3(Mcompar_bird_color_on_cmp_eq0013_cy<4>),
        .O(bird_outline_on_or0013170)
    );
    LUT4 bird_outline_on_or0013286
    (
        .I0(Mcompar_bird_color_on_cmp_eq0002_cy<4>),
        .I1(Mcompar_bird_color_on_cmp_eq0003_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0018_cy<4>),
        .I3(Mcompar_bird_color_on_cmp_eq0019_cy<4>),
        .O(bird_outline_on_or0013286)
    );
    LUT4 rgb<7>0
    (
        .I0(bird_lips_on),
        .I1(bird_white_on_or000492),
        .I2(N216),
        .I3(bird_white_on_or0004187),
        .O(rgb<5>0)
    );
    LUT3 Madd_bird_color_on_add0002_xor<4>11
    (
        .I0(bird_top<2>),
        .I1(bird_top<4>),
        .I2(bird_top<3>),
        .O(bird_color_on_add0002<4>)
    );
    LUT3 Mcompar_bird_color_on_cmp_eq0020_lut<4>_SW0
    (
        .I0(bird_top<8>),
        .I1(vga_timer/vertical_pixel_counter<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .O(N61)
    );
    LUT3 Mcompar_bird_color_on_cmp_eq0020_lut<4>_SW1
    (
        .I0(bird_top<8>),
        .I1(vga_timer/vertical_pixel_counter<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .O(N62)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0020_lut<4>
    (
        .I0(bird_top<7>),
        .I1(N62),
        .I2(N61),
        .I3(Madd_bird_color_on_add0018_cy<6>),
        .O(Mcompar_bird_color_on_cmp_eq0020_lut<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0012_lut<4>_SW1
    (
        .I0(bird_top<8>),
        .I1(bird_top<7>),
        .I2(vga_timer/vertical_pixel_counter<8>),
        .I3(vga_timer/vertical_pixel_counter<9>),
        .O(N67)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0012_lut<4>
    (
        .I0(bird_top<6>),
        .I1(N67),
        .I2(Madd_bird_color_on_add0010_cy<8>_bdd0),
        .I3(N61),
        .O(Mcompar_bird_color_on_cmp_eq0012_lut<4>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0006_lut<4>
    (
        .I0(bird_top<7>),
        .I1(Madd_bird_color_on_add0006_cy<8>_bdd0),
        .I2(N62),
        .I3(N61),
        .O(Mcompar_bird_color_on_cmp_eq0006_lut<4>)
    );
    LUT4 rgb<4>5
    (
        .I0(bird_white_on_or000440),
        .I1(bird_white_on_or0004187),
        .I2(bird_white_on_or000492),
        .I3(N72),
        .O(rgb<4>5)
    );
    LUT4 rgb<4>58
    (
        .I0(N74),
        .I1(N75),
        .I2(rgb<4>5),
        .I3(bird_outline_on),
        .O(rgb<4>)
    );
    LUT4 rgb<0>21_SW0
    (
        .I0(ground_border_on_cmp_lt0000),
        .I1(pipe_on),
        .I2(ground_border_on_cmp_ge0000),
        .I3(blank),
        .O(N77)
    );
    LUT4 rgb<1>
    (
        .I0(bird_lips_on),
        .I1(N77),
        .I2(N45),
        .I3(bird_outline_on),
        .O(rgb<1>)
    );
    LUT3 rgb<0>21_SW2
    (
        .I0(pipe_on),
        .I1(ground_border_on_cmp_ge0000),
        .I2(blank),
        .O(N81)
    );
    LUT4 rgb<0>23
    (
        .I0(rgb<0>21),
        .I1(N81),
        .I2(rgb<0>11),
        .I3(bird_outline_on),
        .O(rgb<0>)
    );
    LUT4 bird_color_on_or001220
    (
        .I0(bird_color_on_cmp_le0002),
        .I1(N83),
        .I2(bird_color_on_or0004),
        .I3(bird_color_on_or00124),
        .O(bird_color_on_or001220)
    );
    LUT2 bird_outline_on_or001327_SW0
    (
        .I0(Mcompar_bird_outline_on_cmp_eq0030_cy<4>),
        .I1(Mcompar_bird_outline_on_cmp_eq0031_cy<4>),
        .O(N85)
    );
    LUT4 bird_outline_on_or001337
    (
        .I0(bird_color_on_cmp_le0002),
        .I1(bird_color_on_cmp_ge0000),
        .I2(bird_outline_on_or001330),
        .I3(N85),
        .O(bird_outline_on_or001337)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0016_lut<4>
    (
        .I0(bird_top<8>),
        .I1(vga_timer/vertical_pixel_counter<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(Madd_bird_color_on_add0014_cy<8>_bdd0),
        .O(Mcompar_bird_color_on_cmp_eq0016_lut<4>)
    );
    LUT4 rgb<7>1
    (
        .I0(led_7_OBUF),
        .I1(bird_color_on_or001271),
        .I2(bird_color_on_or001220),
        .I3(bird_color_on_or0012131),
        .O(rgb<7>1)
    );
    LUT4 rgb<5>1
    (
        .I0(led_5_OBUF),
        .I1(bird_color_on_or001271),
        .I2(bird_color_on_or001220),
        .I3(bird_color_on_or0012131),
        .O(rgb<5>1)
    );
    LUT4 rgb<3>0
    (
        .I0(bird_lips_on_or000118),
        .I1(led_3_OBUF),
        .I2(bird_outline_on_cmp_ge0001),
        .I3(bird_lips_on_or00014),
        .O(rgb<3>0)
    );
    LUT4 Madd_bird_color_on_add0018_xor<5>11
    (
        .I0(bird_top<2>),
        .I1(bird_top<5>),
        .I2(bird_top<4>),
        .I3(bird_top<3>),
        .O(bird_color_on_add0018<5>)
    );
    LUT4 Madd_bird_color_on_add0002_xor<5>11
    (
        .I0(bird_top<2>),
        .I1(bird_top<5>),
        .I2(bird_top<4>),
        .I3(bird_top<3>),
        .O(bird_color_on_add0002<5>)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0030_lut<4>
    (
        .I0(bird_top<7>),
        .I1(Madd_bird_outline_on_addsub0001_cy<8>_bdd0),
        .I2(N62),
        .I3(N61),
        .O(Mcompar_bird_outline_on_cmp_eq0030_lut<4>)
    );
    LUT4 rgb<6>4_SW0
    (
        .I0(led_6_OBUF),
        .I1(bird_outline_on_cmp_ge0001),
        .I2(bird_lips_on_or000118),
        .I3(N223),
        .O(N92)
    );
    LUT4 rgb<6>4
    (
        .I0(N92),
        .I1(bird_color_on_or001271),
        .I2(bird_color_on_or001220),
        .I3(bird_color_on_or0012131),
        .O(rgb<6>4)
    );
    LUT4 bird_outline_on_or0013233_SW0
    (
        .I0(vga_timer/horizontal_pixel_counter<4>),
        .I1(N94),
        .I2(Mcompar_bird_color_on_cmp_eq0007_cy<4>),
        .I3(Mcompar_bird_color_on_cmp_eq0017_cy<4>),
        .O(N49)
    );
    LUT4 bird_outline_on_or00139
    (
        .I0(Mcompar_bird_color_on_cmp_eq0019_cy<4>),
        .I1(bird_outline_on_cmp_ge0002),
        .I2(Mcompar_bird_color_on_cmp_eq0018_cy<4>),
        .I3(N961),
        .O(bird_outline_on_or00139)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0002_lut<3>
    (
        .I0(bird_top<6>),
        .I1(vga_timer/vertical_pixel_counter<6>),
        .I2(N981),
        .I3(N47),
        .O(Mcompar_bird_color_on_cmp_eq0002_lut<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0020_lut<3>
    (
        .I0(bird_top<6>),
        .I1(vga_timer/vertical_pixel_counter<6>),
        .I2(N1001),
        .I3(N47),
        .O(Mcompar_bird_color_on_cmp_eq0020_lut<3>)
    );
    LUT4 bird_color_on_or0012711
    (
        .I0(bird_color_on_or001265),
        .I1(bird_color_on_cmp_ge0000),
        .I2(N102),
        .I3(bird_color_on_or001232),
        .O(bird_color_on_or001271)
    );
    LUT4 rgb<6>20
    (
        .I0(rgb<0>21),
        .I1(pipe_on),
        .I2(N1041),
        .I3(bird_outline_on),
        .O(rgb<6>)
    );
    LUT4 bird_white_on_or0004115_SW0
    (
        .I0(N25),
        .I1(bird_white_on_or0004153),
        .I2(bird_color_on_or0001),
        .I3(N221),
        .O(N106)
    );
    LUT4 bird_white_on_or0004187
    (
        .I0(bird_white_on_or0004110),
        .I1(N218),
        .I2(bird_white_on_cmp_le0002),
        .I3(N106),
        .O(bird_white_on_or0004187)
    );
    LUT4 bird_outline_on_or0013233_SW1
    (
        .I0(vga_timer/horizontal_pixel_counter<4>),
        .I1(Mcompar_bird_color_on_cmp_eq0017_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0013_cy<4>),
        .I3(N108),
        .O(N50)
    );
    LUT4 bird_outline_on_or0013285_SW0
    (
        .I0(Mcompar_bird_color_on_cmp_eq0012_cy<4>),
        .I1(Mcompar_bird_color_on_cmp_eq0014_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0015_cy<4>),
        .I3(Mcompar_bird_color_on_cmp_eq0013_cy<4>),
        .O(N110)
    );
    LUT3 bird_color_on_or00124_SW0
    (
        .I0(N207),
        .I1(Mcompar_bird_color_on_cmp_eq0014_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0015_cy<4>),
        .O(N114)
    );
    LUT3 bird_outline_on_or00134_SW0
    (
        .I0(N231),
        .I1(Mcompar_bird_color_on_cmp_eq0000_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0001_cy<4>),
        .O(N116)
    );
    LUT4 bird_color_on_or0012103
    (
        .I0(Mcompar_bird_color_on_cmp_eq0021_cy<4>),
        .I1(bird_color_on_cmp_ge0004),
        .I2(Mcompar_bird_color_on_cmp_eq0020_cy<4>),
        .I3(N118),
        .O(bird_color_on_or0012103)
    );
    LUT3 bird_color_on_or001232_SW0
    (
        .I0(bird_color_on_cmp_ge0001),
        .I1(Mcompar_bird_color_on_cmp_eq0002_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0003_cy<4>),
        .O(N122)
    );
    LUT3 bird_outline_on_or0013176_SW0
    (
        .I0(Mcompar_bird_color_on_cmp_eq0006_cy<4>),
        .I1(Mcompar_bird_color_on_cmp_eq0008_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0007_cy<4>),
        .O(N124)
    );
    LUT3 bird_outline_on_or0013109_SW0_SW0
    (
        .I0(Mcompar_bird_color_on_cmp_eq0012_cy<4>),
        .I1(Mcompar_bird_color_on_cmp_eq0008_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0009_cy<4>),
        .O(N126)
    );
    LUT4 bird_white_on_or000473_SW0
    (
        .I0(Mcompar_bird_color_on_cmp_eq0012_cy<4>),
        .I1(Mcompar_bird_color_on_cmp_eq0008_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0014_cy<4>),
        .I3(Mcompar_bird_color_on_cmp_eq0009_cy<4>),
        .O(N128)
    );
    LUT4 bird_color_on_or001235_SW0
    (
        .I0(Mcompar_bird_color_on_cmp_eq0004_cy<4>),
        .I1(Mcompar_bird_color_on_cmp_eq0005_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0018_cy<4>),
        .I3(Mcompar_bird_color_on_cmp_eq0019_cy<4>),
        .O(N102)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0002_lut<3>_SW0
    (
        .I0(bird_top<2>),
        .I1(bird_top<5>),
        .I2(bird_top<4>),
        .I3(bird_top<3>),
        .O(N981)
    );
    LUT4 rgb<7>15
    (
        .I0(rgb<0>21),
        .I1(pipe_on),
        .I2(N132),
        .I3(bird_outline_on),
        .O(rgb<7>)
    );
    LUT4 rgb<5>15
    (
        .I0(rgb<0>21),
        .I1(pipe_on),
        .I2(N134),
        .I3(bird_outline_on),
        .O(rgb<5>)
    );
    LUT4 bird_outline_on_or001386
    (
        .I0(N33),
        .I1(Mcompar_bird_color_on_cmp_eq0002_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0003_cy<4>),
        .I3(N136),
        .O(bird_outline_on_or001386)
    );
    LUT4 bird_color_on_or001298
    (
        .I0(Mcompar_bird_color_on_cmp_eq0001_cy<4>),
        .I1(bird_color_on_cmp_ge0000),
        .I2(Mcompar_bird_color_on_cmp_eq0000_cy<4>),
        .I3(N138),
        .O(bird_color_on_or001298)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0020_lut<3>_SW0
    (
        .I0(bird_top<2>),
        .I1(bird_top<5>),
        .I2(bird_top<4>),
        .I3(bird_top<3>),
        .O(N1001)
    );
    LUT4 rgb<1>_SW0_SW0
    (
        .I0(led_1_OBUF),
        .I1(bird_color_on_or001271),
        .I2(bird_color_on_or001220),
        .I3(bird_color_on_or0012131),
        .O(N142)
    );
    LUT3 bird_lips_on_or00014_SW0
    (
        .I0(N232),
        .I1(Mcompar_bird_color_on_cmp_eq0020_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0021_cy<4>),
        .O(N144)
    );
    LUT3 bird_lips_on_or00014_SW1
    (
        .I0(bird_outline_on_cmp_le0002),
        .I1(Mcompar_bird_color_on_cmp_eq0016_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0017_cy<4>),
        .O(N146)
    );
    LUT4 bird_lips_on_or000120
    (
        .I0(bird_outline_on_cmp_ge0001),
        .I1(N144),
        .I2(N222),
        .I3(N146),
        .O(bird_lips_on)
    );
    LUT4 bird_outline_on_or001356
    (
        .I0(bird_outline_on_cmp_le0002),
        .I1(Mcompar_bird_color_on_cmp_eq0019_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0015_cy<4>),
        .I3(N148),
        .O(bird_outline_on_or001356)
    );
    LUT4 bird_outline_on_or0013166
    (
        .I0(Mcompar_bird_color_on_cmp_eq0017_cy<4>),
        .I1(bird_outline_on_or0013156),
        .I2(Mcompar_bird_color_on_cmp_eq0016_cy<4>),
        .I3(N150),
        .O(bird_outline_on_or0013166)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0016_lut<2>
    (
        .I0(bird_top<4>),
        .I1(bird_top<5>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(vga_timer/vertical_pixel_counter<4>),
        .O(Mcompar_bird_color_on_cmp_eq0016_lut<2>)
    );
    LUT4 Mcompar_pipe_on_cmp_ge0000_lut<9>
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(col1_x<9>),
        .I2(pipe_on_addsub0000<8>_bdd0),
        .I3(col1_x<8>),
        .O(Mcompar_pipe_on_cmp_ge0000_lut<9>)
    );
    LUT4 Mcompar_pipe_on_cmp_ge0002_lut<9>
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(col3_x<9>),
        .I2(pipe_on_addsub0004<8>_bdd0),
        .I3(col3_x<8>),
        .O(Mcompar_pipe_on_cmp_ge0002_lut<9>)
    );
    LUT3 Mcompar_pipe_on_cmp_ge0000_lut<8>
    (
        .I0(vga_timer/horizontal_pixel_counter<8>),
        .I1(col1_x<8>),
        .I2(pipe_on_addsub0000<8>_bdd0),
        .O(Mcompar_pipe_on_cmp_ge0000_lut<8>)
    );
    LUT3 Mcompar_pipe_on_cmp_ge0002_lut<8>
    (
        .I0(vga_timer/horizontal_pixel_counter<8>),
        .I1(col3_x<8>),
        .I2(pipe_on_addsub0004<8>_bdd0),
        .O(Mcompar_pipe_on_cmp_ge0002_lut<8>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0012_lut<1>
    (
        .I0(bird_top<2>),
        .I1(vga_timer/vertical_pixel_counter<3>),
        .I2(vga_timer/vertical_pixel_counter<2>),
        .I3(bird_top<3>),
        .O(Mcompar_bird_color_on_cmp_eq0012_lut<1>)
    );
    LUT3 pipe_on_or0006159
    (
        .I0(Mcompar_pipe_on_cmp_lt0002_cy<9>),
        .I1(N226),
        .I2(col3_on_cmp_le0000),
        .O(pipe_on_or0006159)
    );
    LUT3 pipe_on_or0006291
    (
        .I0(Mcompar_pipe_on_cmp_lt0000_cy<9>),
        .I1(N227),
        .I2(col1_on_cmp_le0000),
        .O(pipe_on_or0006291)
    );
    LUT2 pipe_on_or00060
    (
        .I0(Mcompar_pipe_on_cmp_gt0001_cy<9>),
        .I1(pipe_on_cmp_le0003),
        .O(pipe_on_or00060)
    );
    LUT4 pipe_on_or0006310
    (
        .I0(pipe_on_or0006275),
        .I1(pipe_on_or0006291),
        .I2(pipe_on_cmp_le0001),
        .I3(Mcompar_pipe_on_cmp_gt0000_cy<9>),
        .O(pipe_on_or0006310)
    );
    LUT2 Mcompar_bird_color_on_cmp_eq0006_lut<2>_SW0
    (
        .I0(bird_top<5>),
        .I1(vga_timer/vertical_pixel_counter<5>),
        .O(N152)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0006_lut<2>
    (
        .I0(bird_top<3>),
        .I1(bird_top<4>),
        .I2(vga_timer/vertical_pixel_counter<4>),
        .I3(N152),
        .O(Mcompar_bird_color_on_cmp_eq0006_lut<2>)
    );
    LUT2 Mcompar_bird_outline_on_cmp_eq0030_lut<2>_SW0
    (
        .I0(bird_top<5>),
        .I1(vga_timer/vertical_pixel_counter<5>),
        .O(N154)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0030_lut<2>
    (
        .I0(vga_timer/vertical_pixel_counter<4>),
        .I1(bird_top<4>),
        .I2(bird_top<3>),
        .I3(N154),
        .O(Mcompar_bird_outline_on_cmp_eq0030_lut<2>)
    );
    LUT4 Mcompar_pipe_on_cmp_gt0000_lut<8>
    (
        .I0(col1_y<8>),
        .I1(vga_timer/vertical_pixel_counter<8>),
        .I2(col1_y<7>),
        .I3(pipe_on_addsub0001<7>_bdd0),
        .O(Mcompar_pipe_on_cmp_gt0000_lut<8>)
    );
    LUT4 Mcompar_pipe_on_cmp_gt0001_lut<8>
    (
        .I0(col2_y<8>),
        .I1(vga_timer/vertical_pixel_counter<8>),
        .I2(col2_y<7>),
        .I3(pipe_on_addsub0003<7>_bdd0),
        .O(Mcompar_pipe_on_cmp_gt0001_lut<8>)
    );
    LUT4 Mcompar_pipe_on_cmp_gt0002_lut<8>
    (
        .I0(col3_y<8>),
        .I1(vga_timer/vertical_pixel_counter<8>),
        .I2(col3_y<7>),
        .I3(pipe_on_addsub0005<7>_bdd0),
        .O(Mcompar_pipe_on_cmp_gt0002_lut<8>)
    );
    LUT4 Mcompar_pipe_on_cmp_gt0000_lut<9>
    (
        .I0(col1_y<8>),
        .I1(pipe_on_addsub0001<7>_bdd0),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(col1_y<7>),
        .O(Mcompar_pipe_on_cmp_gt0000_lut<9>)
    );
    LUT4 Mcompar_pipe_on_cmp_gt0001_lut<9>
    (
        .I0(col2_y<8>),
        .I1(pipe_on_addsub0003<7>_bdd0),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(col2_y<7>),
        .O(Mcompar_pipe_on_cmp_gt0001_lut<9>)
    );
    LUT4 Mcompar_pipe_on_cmp_gt0002_lut<9>
    (
        .I0(col3_y<8>),
        .I1(pipe_on_addsub0005<7>_bdd0),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(col3_y<7>),
        .O(Mcompar_pipe_on_cmp_gt0002_lut<9>)
    );
    LUT3 Mcompar_pipe_on_cmp_gt0000_lut<7>
    (
        .I0(col1_y<7>),
        .I1(pipe_on_addsub0001<7>_bdd0),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .O(Mcompar_pipe_on_cmp_gt0000_lut<7>)
    );
    LUT3 Mcompar_pipe_on_cmp_gt0001_lut<7>
    (
        .I0(col2_y<7>),
        .I1(pipe_on_addsub0003<7>_bdd0),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .O(Mcompar_pipe_on_cmp_gt0001_lut<7>)
    );
    LUT3 Mcompar_pipe_on_cmp_gt0002_lut<7>
    (
        .I0(col3_y<7>),
        .I1(pipe_on_addsub0005<7>_bdd0),
        .I2(vga_timer/vertical_pixel_counter<7>),
        .O(Mcompar_pipe_on_cmp_gt0002_lut<7>)
    );
    LUT4 bird_outline_on_cmp_ge00002_SW0
    (
        .I0(vga_timer/horizontal_pixel_counter<1>),
        .I1(vga_timer/horizontal_pixel_counter<2>),
        .I2(vga_timer/horizontal_pixel_counter<3>),
        .I3(vga_timer/horizontal_pixel_counter<4>),
        .O(N29)
    );
    LUT3 bird_outline_on_or001341
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(vga_timer/horizontal_pixel_counter<8>),
        .I2(vga_timer/horizontal_pixel_counter<7>),
        .O(N25)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0002_lut<1>
    (
        .I0(bird_top<2>),
        .I1(bird_top<3>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(vga_timer/vertical_pixel_counter<2>),
        .O(Mcompar_bird_color_on_cmp_eq0002_lut<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0020_lut<1>
    (
        .I0(bird_top<2>),
        .I1(bird_top<3>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(vga_timer/vertical_pixel_counter<2>),
        .O(Mcompar_bird_color_on_cmp_eq0020_lut<1>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0006_lut<1>
    (
        .I0(bird_top<2>),
        .I1(vga_timer/vertical_pixel_counter<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_top<3>),
        .O(Mcompar_bird_color_on_cmp_eq0006_lut<1>)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0030_lut<1>
    (
        .I0(bird_top<2>),
        .I1(vga_timer/vertical_pixel_counter<2>),
        .I2(vga_timer/vertical_pixel_counter<3>),
        .I3(bird_top<3>),
        .O(Mcompar_bird_outline_on_cmp_eq0030_lut<1>)
    );
    LUT4 rgb<2>5
    (
        .I0(ground_border_on_cmp_lt0000244),
        .I1(vga_timer/vertical_pixel_counter<9>),
        .I2(ground_border_on_cmp_ge0000),
        .I3(pipe_on),
        .O(rgb<2>5)
    );
    LUT3 Mcompar_bird_color_on_cmp_eq0006_lut<3>_SW0
    (
        .I0(bird_top<3>),
        .I1(bird_top<4>),
        .I2(bird_top<5>),
        .O(N156)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0006_lut<3>
    (
        .I0(bird_top<6>),
        .I1(vga_timer/vertical_pixel_counter<6>),
        .I2(N156),
        .I3(N47),
        .O(Mcompar_bird_color_on_cmp_eq0006_lut<3>)
    );
    LUT3 Mcompar_bird_outline_on_cmp_eq0030_lut<3>_SW0
    (
        .I0(bird_top<4>),
        .I1(bird_top<3>),
        .I2(bird_top<5>),
        .O(N158)
    );
    LUT4 Mcompar_bird_outline_on_cmp_eq0030_lut<3>
    (
        .I0(bird_top<6>),
        .I1(vga_timer/vertical_pixel_counter<6>),
        .I2(N158),
        .I3(N47),
        .O(Mcompar_bird_outline_on_cmp_eq0030_lut<3>)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0002_lut<4>_SW3
    (
        .I0(bird_top<8>),
        .I1(vga_timer/vertical_pixel_counter<8>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(bird_top<3>),
        .O(N161)
    );
    LUT4 Mcompar_bird_color_on_cmp_eq0002_lut<4>
    (
        .I0(bird_top<2>),
        .I1(N161),
        .I2(Madd_bird_color_on_add0014_cy<8>_bdd0),
        .I3(N61),
        .O(Mcompar_bird_color_on_cmp_eq0002_lut<4>)
    );
    LUT4 bird_white_on_cmp_le00022_SW0_SW0
    (
        .I0(vga_timer/horizontal_pixel_counter<3>),
        .I1(vga_timer/horizontal_pixel_counter<2>),
        .I2(vga_timer/horizontal_pixel_counter<1>),
        .I3(vga_timer/horizontal_pixel_counter<4>),
        .O(N163)
    );
    LUT3 bird_color_on_cmp_ge00022_SW0_SW0
    (
        .I0(vga_timer/horizontal_pixel_counter<6>),
        .I1(vga_timer/horizontal_pixel_counter<5>),
        .I2(vga_timer/horizontal_pixel_counter<4>),
        .O(N165)
    );
    LUT4 bird_color_on_cmp_ge00022
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(N32),
        .I2(N23),
        .I3(N165),
        .O(bird_color_on_cmp_ge0002)
    );
    MUXF5 rgb<4>24_SW1
    (
        .I0(N167),
        .I1(N168),
        .S(bird_lips_on),
        .O(N75)
    );
    LUT4 rgb<4>24_SW1_G
    (
        .I0(ground_border_on_cmp_ge0000),
        .I1(ground_border_on_cmp_lt0000),
        .I2(pipe_on),
        .I3(blank),
        .O(N168)
    );
    LUT4 pipe_on_or000666
    (
        .I0(N169),
        .I1(col2_on_cmp_gt0000),
        .I2(col2_on_cmp_le0000),
        .I3(Mcompar_pipe_on_cmp_lt0001_cy<9>),
        .O(pipe_on_or000666)
    );
    LUT3 Mcompar_pipe_on_cmp_ge0001_lut<8>
    (
        .I0(vga_timer/horizontal_pixel_counter<8>),
        .I1(col2_x<8>),
        .I2(pipe_on_addsub0002<8>_bdd0),
        .O(Mcompar_pipe_on_cmp_ge0001_lut<8>)
    );
    LUT4 Mcompar_pipe_on_cmp_ge0001_lut<9>
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(col2_x<9>),
        .I2(pipe_on_addsub0002<8>_bdd0),
        .I3(col2_x<8>),
        .O(Mcompar_pipe_on_cmp_ge0001_lut<9>)
    );
    LUT2 Mcompar_pipe_on_cmp_ge0000_lut<4>
    (
        .I0(vga_timer/horizontal_pixel_counter<4>),
        .I1(col1_x<4>),
        .O(Mcompar_pipe_on_cmp_ge0000_lut<4>)
    );
    LUT2 Mcompar_pipe_on_cmp_ge0002_lut<4>
    (
        .I0(vga_timer/horizontal_pixel_counter<4>),
        .I1(col3_x<4>),
        .O(Mcompar_pipe_on_cmp_ge0002_lut<4>)
    );
    LUT3 Mcompar_pipe_on_cmp_ge0000_lut<5>
    (
        .I0(vga_timer/horizontal_pixel_counter<5>),
        .I1(col1_x<5>),
        .I2(col1_x<4>),
        .O(Mcompar_pipe_on_cmp_ge0000_lut<5>)
    );
    LUT3 Mcompar_pipe_on_cmp_ge0002_lut<5>
    (
        .I0(vga_timer/horizontal_pixel_counter<5>),
        .I1(col3_x<5>),
        .I2(col3_x<4>),
        .O(Mcompar_pipe_on_cmp_ge0002_lut<5>)
    );
    LUT4 Mcompar_pipe_on_cmp_ge0000_lut<6>
    (
        .I0(vga_timer/horizontal_pixel_counter<6>),
        .I1(col1_x<6>),
        .I2(col1_x<4>),
        .I3(col1_x<5>),
        .O(Mcompar_pipe_on_cmp_ge0000_lut<6>)
    );
    LUT4 Mcompar_pipe_on_cmp_ge0002_lut<6>
    (
        .I0(vga_timer/horizontal_pixel_counter<6>),
        .I1(col3_x<6>),
        .I2(col3_x<4>),
        .I3(col3_x<5>),
        .O(Mcompar_pipe_on_cmp_ge0002_lut<6>)
    );
    LUT2 Mcompar_pipe_on_cmp_ge0001_lut<4>
    (
        .I0(vga_timer/horizontal_pixel_counter<4>),
        .I1(col2_x<4>),
        .O(Mcompar_pipe_on_cmp_ge0001_lut<4>)
    );
    LUT3 Mcompar_pipe_on_cmp_ge0001_lut<5>
    (
        .I0(vga_timer/horizontal_pixel_counter<5>),
        .I1(col2_x<5>),
        .I2(col2_x<4>),
        .O(Mcompar_pipe_on_cmp_ge0001_lut<5>)
    );
    LUT4 Mcompar_pipe_on_cmp_ge0001_lut<6>
    (
        .I0(vga_timer/horizontal_pixel_counter<6>),
        .I1(col2_x<6>),
        .I2(col2_x<4>),
        .I3(col2_x<5>),
        .O(Mcompar_pipe_on_cmp_ge0001_lut<6>)
    );
    LUT4 col3_on_cmp_gt0000217_SW0
    (
        .I0(col3_x<2>),
        .I1(col3_x<3>),
        .I2(col3_x<4>),
        .I3(col3_x<7>),
        .O(N171)
    );
    LUT4 col2_on_cmp_gt0000217_SW0
    (
        .I0(col2_x<2>),
        .I1(col2_x<3>),
        .I2(col2_x<4>),
        .I3(col2_x<7>),
        .O(N173)
    );
    LUT4 col2_on_cmp_gt0000217
    (
        .I0(col2_on_cmp_gt0000210),
        .I1(col2_x<0>),
        .I2(col2_x<1>),
        .I3(N173),
        .O(col2_on_cmp_gt0000)
    );
    LUT4 col1_on_cmp_gt0000217_SW0
    (
        .I0(col1_x<2>),
        .I1(col1_x<3>),
        .I2(col1_x<4>),
        .I3(col1_x<7>),
        .O(N175)
    );
    LUT4 scoreOnes_or000036
    (
        .I0(scoreOnes_or000034),
        .I1(col3_x<6>),
        .I2(scoreOnes_or000014),
        .I3(col3_x<4>),
        .O(scoreOnes_or000036)
    );
    LUT4 scoreOnes_or000085
    (
        .I0(scoreOnes_or000083),
        .I1(col2_x<6>),
        .I2(scoreOnes_or000063),
        .I3(col2_x<4>),
        .O(scoreOnes_or000085)
    );
    LUT4 col3_x_mux0000<9>1
    (
        .I0(col3_x_cmp_eq000019),
        .I1(col3_x_addsub0000<0>),
        .I2(state_reg<0>),
        .I3(col3_x_cmp_eq00008),
        .O(col3_x_mux0000<9>)
    );
    LUT4 scoreOnes_not00011
    (
        .I0(bird_top_temp_and0000),
        .I1(scoreOnes_cmp_eq0003),
        .I2(scoreOnes_or0000),
        .I3(moveEN),
        .O(scoreOnes_not0001)
    );
    LUT4 col3_y_and00001
    (
        .I0(col3_x_cmp_eq000019),
        .I1(state_reg<0>),
        .I2(col3_x_cmp_eq00008),
        .I3(btn_3_IBUF),
        .O(col3_y_and0000)
    );
    LUT4 bird_outline_on_or0013156
    (
        .I0(vga_timer/horizontal_pixel_counter<3>),
        .I1(vga_timer/horizontal_pixel_counter<1>),
        .I2(vga_timer/horizontal_pixel_counter<4>),
        .I3(vga_timer/horizontal_pixel_counter<2>),
        .O(bird_outline_on_or0013156)
    );
    LUT4 rgb<3>36
    (
        .I0(vga_timer/vertical_pixel_counter<9>),
        .I1(vga_timer/blank_or000011),
        .I2(vga_timer/blank_or00004),
        .I3(ground_border_on_cmp_lt0000244),
        .O(rgb<3>36)
    );
    LUT4 rgb<7>12
    (
        .I0(vga_timer/vertical_pixel_counter<9>),
        .I1(ground_border_on_cmp_lt0000244),
        .I2(vga_timer/blank_or000011),
        .I3(vga_timer/blank_or00004),
        .O(rgb<0>21)
    );
    LUT4 bird_outline_on_cmp_ge00012
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(N32),
        .I2(bird_color_on_cmp_ge000116),
        .I3(N229),
        .O(bird_outline_on_cmp_ge0001)
    );
    LUT4 bird_top_next<6>1
    (
        .I0(N200),
        .I1(bird_top_temp<6>),
        .I2(bird_top_next_cmp_lt000027),
        .I3(bird_top_temp<7>),
        .O(bird_top_next<6>)
    );
    LUT4 bird_color_on_cmp_ge00042_SW0
    (
        .I0(vga_timer/horizontal_pixel_counter<1>),
        .I1(vga_timer/horizontal_pixel_counter<3>),
        .I2(vga_timer/horizontal_pixel_counter<2>),
        .I3(vga_timer/horizontal_pixel_counter<4>),
        .O(N39)
    );
    LUT2 Mcompar_pipe_on_cmp_gt0000_lut<2>
    (
        .I0(col1_y<0>),
        .I1(vga_timer/vertical_pixel_counter<2>),
        .O(Mcompar_pipe_on_cmp_gt0000_lut<2>)
    );
    LUT2 Mcompar_pipe_on_cmp_gt0001_lut<2>
    (
        .I0(col2_y<0>),
        .I1(vga_timer/vertical_pixel_counter<2>),
        .O(Mcompar_pipe_on_cmp_gt0001_lut<2>)
    );
    LUT2 Mcompar_pipe_on_cmp_gt0002_lut<2>
    (
        .I0(col3_y<0>),
        .I1(vga_timer/vertical_pixel_counter<2>),
        .O(Mcompar_pipe_on_cmp_gt0002_lut<2>)
    );
    LUT3 Mcompar_pipe_on_cmp_gt0000_lut<4>
    (
        .I0(col1_y<4>),
        .I1(col1_y<0>),
        .I2(vga_timer/vertical_pixel_counter<4>),
        .O(Mcompar_pipe_on_cmp_gt0000_lut<4>)
    );
    LUT3 Mcompar_pipe_on_cmp_gt0001_lut<4>
    (
        .I0(col2_y<4>),
        .I1(col2_y<0>),
        .I2(vga_timer/vertical_pixel_counter<4>),
        .O(Mcompar_pipe_on_cmp_gt0001_lut<4>)
    );
    LUT3 Mcompar_pipe_on_cmp_gt0002_lut<4>
    (
        .I0(col3_y<4>),
        .I1(col3_y<0>),
        .I2(vga_timer/vertical_pixel_counter<4>),
        .O(Mcompar_pipe_on_cmp_gt0002_lut<4>)
    );
    LUT4 Mcompar_pipe_on_cmp_gt0000_lut<5>
    (
        .I0(col1_y<5>),
        .I1(col1_y<0>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(col1_y<4>),
        .O(Mcompar_pipe_on_cmp_gt0000_lut<5>)
    );
    LUT4 Mcompar_pipe_on_cmp_gt0001_lut<5>
    (
        .I0(col2_y<5>),
        .I1(col2_y<0>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(col2_y<4>),
        .O(Mcompar_pipe_on_cmp_gt0001_lut<5>)
    );
    LUT4 Mcompar_pipe_on_cmp_gt0002_lut<5>
    (
        .I0(col3_y<5>),
        .I1(col3_y<0>),
        .I2(vga_timer/vertical_pixel_counter<5>),
        .I3(col3_y<4>),
        .O(Mcompar_pipe_on_cmp_gt0002_lut<5>)
    );
    LUT3 bird_color_on_or00091_SW0
    (
        .I0(vga_timer/horizontal_pixel_counter<3>),
        .I1(vga_timer/horizontal_pixel_counter<1>),
        .I2(vga_timer/horizontal_pixel_counter<2>),
        .O(N140)
    );
    LUT2 delay_next<9>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<9>),
        .O(delay_next<9>)
    );
    LUT2 delay_next<8>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<8>),
        .O(delay_next<8>)
    );
    LUT2 delay_next<7>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<7>),
        .O(delay_next<7>)
    );
    LUT2 delay_next<6>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<6>),
        .O(delay_next<6>)
    );
    LUT2 delay_next<5>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<5>),
        .O(delay_next<5>)
    );
    LUT2 delay_next<4>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<4>),
        .O(delay_next<4>)
    );
    LUT2 delay_next<3>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<3>),
        .O(delay_next<3>)
    );
    LUT2 delay_next<2>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<2>),
        .O(delay_next<2>)
    );
    LUT2 delay_next<1>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<1>),
        .O(delay_next<1>)
    );
    LUT2 delay_next<0>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<0>),
        .O(delay_next<0>)
    );
    LUT4 col1_x_mux0000<9>1
    (
        .I0(col1_x_cmp_eq00008),
        .I1(col1_x_addsub0000<0>),
        .I2(state_reg<0>),
        .I3(col1_x_cmp_eq000019),
        .O(col1_x_mux0000<9>)
    );
    LUT3 vga_timer/vertical_pixel_counter_not00011
    (
        .I0(vga_timer/Mcount_horizontal_pixel_counter_eqn_0110),
        .I1(vga_timer/Mcount_horizontal_pixel_counter_eqn_0118),
        .I2(bird_outline_on_cmp_le00001),
        .O(vga_timer/vertical_pixel_counter_not0001)
    );
    LUT2 delay_next<10>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<10>),
        .O(delay_next<10>)
    );
    LUT2 delay_next<11>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<11>),
        .O(delay_next<11>)
    );
    LUT2 delay_next<12>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<12>),
        .O(delay_next<12>)
    );
    LUT2 delay_next<13>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<13>),
        .O(delay_next<13>)
    );
    LUT2 delay_next<14>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<14>),
        .O(delay_next<14>)
    );
    LUT4 col3_x_mux0000<8>1
    (
        .I0(col3_x_cmp_eq000019),
        .I1(col3_x_cmp_eq00008),
        .I2(col3_x_addsub0000<1>),
        .I3(state_reg<0>),
        .O(col3_x_mux0000<8>)
    );
    LUT4 col1_x_mux0000<8>1
    (
        .I0(col1_x_cmp_eq000019),
        .I1(col1_x_cmp_eq00008),
        .I2(col1_x_addsub0000<1>),
        .I3(state_reg<0>),
        .O(col1_x_mux0000<8>)
    );
    LUT2 delay_next<15>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<15>),
        .O(delay_next<15>)
    );
    LUT4 col3_x_mux0000<7>1
    (
        .I0(col3_x_cmp_eq000019),
        .I1(col3_x_cmp_eq00008),
        .I2(col3_x_addsub0000<2>),
        .I3(state_reg<0>),
        .O(col3_x_mux0000<7>)
    );
    LUT4 col1_x_mux0000<7>1
    (
        .I0(col1_x_cmp_eq000019),
        .I1(col1_x_cmp_eq00008),
        .I2(col1_x_addsub0000<2>),
        .I3(state_reg<0>),
        .O(col1_x_mux0000<7>)
    );
    LUT2 delay_next<16>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<16>),
        .O(delay_next<16>)
    );
    LUT4 col3_x_mux0000<6>1
    (
        .I0(col3_x_cmp_eq000019),
        .I1(col3_x_cmp_eq00008),
        .I2(col3_x_addsub0000<3>),
        .I3(state_reg<0>),
        .O(col3_x_mux0000<6>)
    );
    LUT4 col1_x_mux0000<6>1
    (
        .I0(col1_x_cmp_eq000019),
        .I1(col1_x_cmp_eq00008),
        .I2(col1_x_addsub0000<3>),
        .I3(state_reg<0>),
        .O(col1_x_mux0000<6>)
    );
    LUT2 delay_next<17>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<17>),
        .O(delay_next<17>)
    );
    LUT4 col3_x_mux0000<5>1
    (
        .I0(col3_x_cmp_eq000019),
        .I1(col3_x_addsub0000<4>),
        .I2(state_reg<0>),
        .I3(col3_x_cmp_eq00008),
        .O(col3_x_mux0000<5>)
    );
    LUT4 col1_x_mux0000<5>1
    (
        .I0(col1_x_cmp_eq00008),
        .I1(col1_x_addsub0000<4>),
        .I2(state_reg<0>),
        .I3(col1_x_cmp_eq000019),
        .O(col1_x_mux0000<5>)
    );
    LUT2 delay_next<18>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<18>),
        .O(delay_next<18>)
    );
    LUT4 vga_timer/Mcount_horizontal_pixel_counter_eqn_02
    (
        .I0(vga_timer/Result<0>),
        .I1(vga_timer/Mcount_horizontal_pixel_counter_eqn_0110),
        .I2(vga_timer/Mcount_horizontal_pixel_counter_eqn_0118),
        .I3(bird_outline_on_cmp_le00001),
        .O(vga_timer/Mcount_horizontal_pixel_counter_eqn_0)
    );
    LUT4 col3_x_mux0000<4>1
    (
        .I0(col3_x_cmp_eq000019),
        .I1(col3_x_addsub0000<5>),
        .I2(state_reg<0>),
        .I3(col3_x_cmp_eq00008),
        .O(col3_x_mux0000<4>)
    );
    LUT4 col1_x_mux0000<4>1
    (
        .I0(col1_x_cmp_eq00008),
        .I1(col1_x_addsub0000<5>),
        .I2(state_reg<0>),
        .I3(col1_x_cmp_eq000019),
        .O(col1_x_mux0000<4>)
    );
    LUT2 delay_next<19>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<19>),
        .O(delay_next<19>)
    );
    LUT4 col3_x_mux0000<3>1
    (
        .I0(col3_x_cmp_eq000019),
        .I1(col3_x_cmp_eq00008),
        .I2(col3_x_addsub0000<6>),
        .I3(state_reg<0>),
        .O(col3_x_mux0000<3>)
    );
    LUT4 col1_x_mux0000<3>1
    (
        .I0(col1_x_cmp_eq000019),
        .I1(col1_x_cmp_eq00008),
        .I2(col1_x_addsub0000<6>),
        .I3(state_reg<0>),
        .O(col1_x_mux0000<3>)
    );
    LUT2 delay_next<20>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<20>),
        .O(delay_next<20>)
    );
    LUT4 col3_x_mux0000<2>1
    (
        .I0(col3_x_cmp_eq000019),
        .I1(col3_x_cmp_eq00008),
        .I2(col3_x_addsub0000<7>),
        .I3(state_reg<0>),
        .O(col3_x_mux0000<2>)
    );
    LUT4 col1_x_mux0000<2>1
    (
        .I0(col1_x_cmp_eq000019),
        .I1(col1_x_cmp_eq00008),
        .I2(col1_x_addsub0000<7>),
        .I3(state_reg<0>),
        .O(col1_x_mux0000<2>)
    );
    LUT2 delay_next<21>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<21>),
        .O(delay_next<21>)
    );
    LUT4 col3_x_mux0000<1>1
    (
        .I0(col3_x_cmp_eq000019),
        .I1(col3_x_addsub0000<8>),
        .I2(state_reg<0>),
        .I3(col3_x_cmp_eq00008),
        .O(col3_x_mux0000<1>)
    );
    LUT4 col1_x_mux0000<1>1
    (
        .I0(col1_x_cmp_eq00008),
        .I1(col1_x_addsub0000<8>),
        .I2(state_reg<0>),
        .I3(col1_x_cmp_eq000019),
        .O(col1_x_mux0000<1>)
    );
    LUT4 col3_x_not0001
    (
        .I0(state_reg<0>),
        .I1(debouncer/state_reg_FSM_FFd2),
        .I2(col3_x_cmp_eq0000),
        .I3(N8),
        .O(col3_x_not0001)
    );
    LUT4 col1_x_not0001
    (
        .I0(state_reg<0>),
        .I1(debouncer/state_reg_FSM_FFd2),
        .I2(col1_x_cmp_eq0000),
        .I3(N13),
        .O(col1_x_not0001)
    );
    LUT4 col1_y_and00001
    (
        .I0(btn_3_IBUF),
        .I1(state_reg<0>),
        .I2(debouncer/state_reg_FSM_FFd2),
        .I3(col1_x_cmp_eq0000),
        .O(col1_y_and0000)
    );
    LUT4 bird_outline_on_or0013351
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(vga_timer/horizontal_pixel_counter<8>),
        .I2(vga_timer/horizontal_pixel_counter<7>),
        .I3(bird_color_on_cmp_ge000116),
        .O(bird_outline_on_or0013351)
    );
    LUT4 Mcount_scoreTens_xor<0>11
    (
        .I0(state_reg<0>),
        .I1(scoreTens<0>),
        .I2(debouncer/state_reg_FSM_FFd2),
        .I3(scoreOnes_cmp_eq0003),
        .O(Mcount_scoreTens)
    );
    LUT2 delay_next<22>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<22>),
        .O(delay_next<22>)
    );
    LUT4 col3_x_mux0000<0>1
    (
        .I0(col3_x_cmp_eq000019),
        .I1(col3_x_cmp_eq00008),
        .I2(col3_x_addsub0000<9>),
        .I3(state_reg<0>),
        .O(col3_x_mux0000<0>)
    );
    LUT4 col1_x_mux0000<0>1
    (
        .I0(col1_x_cmp_eq000019),
        .I1(col1_x_cmp_eq00008),
        .I2(col1_x_addsub0000<9>),
        .I3(state_reg<0>),
        .O(col1_x_mux0000<0>)
    );
    LUT3 highscore_and0000_SW0
    (
        .I0(vga_timer/vertical_pixel_counter<9>),
        .I1(ground_border_on_cmp_lt0000244),
        .I2(N228),
        .O(N41)
    );
    LUT3 scoreTens_not00011
    (
        .I0(debouncer/state_reg_FSM_FFd2),
        .I1(state_reg<0>),
        .I2(scoreOnes_cmp_eq0003),
        .O(scoreTens_not0001)
    );
    LUT2 delay_next<23>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<23>),
        .O(delay_next<23>)
    );
    LUT2 delay_next<30>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<30>),
        .O(delay_next<30>)
    );
    LUT2 delay_next<29>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<29>),
        .O(delay_next<29>)
    );
    LUT4 scoreOnes_or0000147
    (
        .I0(col1_x<3>),
        .I1(scoreOnes_or0000122),
        .I2(col1_x<0>),
        .I3(scoreOnes_or0000133),
        .O(scoreOnes_or0000147)
    );
    LUT2 delay_next<28>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<28>),
        .O(delay_next<28>)
    );
    LUT2 delay_next<27>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<27>),
        .O(delay_next<27>)
    );
    LUT2 delay_next<26>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<26>),
        .O(delay_next<26>)
    );
    LUT2 delay_next<25>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<25>),
        .O(delay_next<25>)
    );
    LUT2 delay_next<24>1
    (
        .I0(Mcompar_delay_next_cmp_gt0000_cy<11>),
        .I1(delay_next_addsub0000<24>),
        .O(delay_next<24>)
    );
    LUT4 col2_x_cmp_eq000035
    (
        .I0(col1_x<3>),
        .I1(col2_x_cmp_eq000010),
        .I2(col1_x<0>),
        .I3(col2_x_cmp_eq000021),
        .O(col2_x_cmp_eq0000)
    );
    LUT4 bird_outline_on_cmp_ge00021
    (
        .I0(vga_timer/horizontal_pixel_counter<7>),
        .I1(vga_timer/horizontal_pixel_counter<8>),
        .I2(vga_timer/horizontal_pixel_counter<9>),
        .I3(N181),
        .O(bird_outline_on_cmp_ge0002)
    );
    LUT4 bird_color_on_cmp_ge0001113_SW0
    (
        .I0(vga_timer/horizontal_pixel_counter<6>),
        .I1(vga_timer/horizontal_pixel_counter<2>),
        .I2(vga_timer/horizontal_pixel_counter<3>),
        .I3(vga_timer/horizontal_pixel_counter<4>),
        .O(N183)
    );
    LUT4 vga_timer/vertical_pixel_counter_and000054_SW0
    (
        .I0(vga_timer/vertical_pixel_counter<9>),
        .I1(vga_timer/vertical_pixel_counter_and000014),
        .I2(vga_timer/vertical_pixel_counter<8>),
        .I3(vga_timer/vertical_pixel_counter_and000035),
        .O(N185)
    );
    LUT4 vga_timer/vertical_pixel_counter_and000054
    (
        .I0(bird_outline_on_cmp_le00001),
        .I1(vga_timer/Mcount_horizontal_pixel_counter_eqn_0110),
        .I2(vga_timer/Mcount_horizontal_pixel_counter_eqn_0118),
        .I3(N185),
        .O(vga_timer/vertical_pixel_counter_and0000)
    );
    LUT4 Mcount_scoreTens_xor<3>1_SW1
    (
        .I0(scoreTens<0>),
        .I1(scoreTens<1>),
        .I2(scoreTens<2>),
        .I3(scoreTens<3>),
        .O(N187)
    );
    LUT4 Mcount_scoreTens_xor<3>1
    (
        .I0(scoreOnes_cmp_eq0003),
        .I1(N187),
        .I2(debouncer/state_reg_FSM_FFd2),
        .I3(state_reg<0>),
        .O(Mcount_scoreTens3)
    );
    LUT4 bird_color_on_or001218_SW0
    (
        .I0(N230),
        .I1(vga_timer/horizontal_pixel_counter<3>),
        .I2(vga_timer/horizontal_pixel_counter<1>),
        .I3(vga_timer/horizontal_pixel_counter<2>),
        .O(N83)
    );
    LUT4 rgb<4>24_SW1_F
    (
        .I0(ground_border_on_cmp_ge0000),
        .I1(ground_border_on_cmp_lt0000244),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(blank),
        .O(N167)
    );
    LUT4 vga_timer/Mcount_horizontal_pixel_counter_eqn_91
    (
        .I0(vga_timer/Result<9>),
        .I1(vga_timer/Mcount_horizontal_pixel_counter_eqn_0110),
        .I2(vga_timer/Mcount_horizontal_pixel_counter_eqn_0118),
        .I3(bird_outline_on_cmp_le00001),
        .O(vga_timer/Mcount_horizontal_pixel_counter_eqn_9)
    );
    LUT4 vga_timer/Mcount_horizontal_pixel_counter_eqn_81
    (
        .I0(vga_timer/Result<8>),
        .I1(vga_timer/Mcount_horizontal_pixel_counter_eqn_0110),
        .I2(vga_timer/Mcount_horizontal_pixel_counter_eqn_0118),
        .I3(bird_outline_on_cmp_le00001),
        .O(vga_timer/Mcount_horizontal_pixel_counter_eqn_8)
    );
    LUT4 vga_timer/Mcount_horizontal_pixel_counter_eqn_71
    (
        .I0(vga_timer/Result<7>),
        .I1(vga_timer/Mcount_horizontal_pixel_counter_eqn_0110),
        .I2(vga_timer/Mcount_horizontal_pixel_counter_eqn_0118),
        .I3(bird_outline_on_cmp_le00001),
        .O(vga_timer/Mcount_horizontal_pixel_counter_eqn_7)
    );
    LUT4 vga_timer/Mcount_horizontal_pixel_counter_eqn_61
    (
        .I0(vga_timer/Result<6>),
        .I1(vga_timer/Mcount_horizontal_pixel_counter_eqn_0110),
        .I2(vga_timer/Mcount_horizontal_pixel_counter_eqn_0118),
        .I3(bird_outline_on_cmp_le00001),
        .O(vga_timer/Mcount_horizontal_pixel_counter_eqn_6)
    );
    LUT4 vga_timer/Mcount_horizontal_pixel_counter_eqn_51
    (
        .I0(vga_timer/Result<5>),
        .I1(vga_timer/Mcount_horizontal_pixel_counter_eqn_0110),
        .I2(vga_timer/Mcount_horizontal_pixel_counter_eqn_0118),
        .I3(bird_outline_on_cmp_le00001),
        .O(vga_timer/Mcount_horizontal_pixel_counter_eqn_5)
    );
    LUT4 vga_timer/Mcount_horizontal_pixel_counter_eqn_41
    (
        .I0(vga_timer/Result<4>),
        .I1(vga_timer/Mcount_horizontal_pixel_counter_eqn_0110),
        .I2(vga_timer/Mcount_horizontal_pixel_counter_eqn_0118),
        .I3(bird_outline_on_cmp_le00001),
        .O(vga_timer/Mcount_horizontal_pixel_counter_eqn_4)
    );
    LUT4 vga_timer/Mcount_horizontal_pixel_counter_eqn_31
    (
        .I0(vga_timer/Result<3>),
        .I1(vga_timer/Mcount_horizontal_pixel_counter_eqn_0110),
        .I2(vga_timer/Mcount_horizontal_pixel_counter_eqn_0118),
        .I3(bird_outline_on_cmp_le00001),
        .O(vga_timer/Mcount_horizontal_pixel_counter_eqn_3)
    );
    LUT4 vga_timer/Mcount_horizontal_pixel_counter_eqn_21
    (
        .I0(vga_timer/Result<2>),
        .I1(vga_timer/Mcount_horizontal_pixel_counter_eqn_0110),
        .I2(vga_timer/Mcount_horizontal_pixel_counter_eqn_0118),
        .I3(bird_outline_on_cmp_le00001),
        .O(vga_timer/Mcount_horizontal_pixel_counter_eqn_2)
    );
    LUT4 vga_timer/Mcount_horizontal_pixel_counter_eqn_11
    (
        .I0(vga_timer/Result<1>),
        .I1(vga_timer/Mcount_horizontal_pixel_counter_eqn_0110),
        .I2(vga_timer/Mcount_horizontal_pixel_counter_eqn_0118),
        .I3(bird_outline_on_cmp_le00001),
        .O(vga_timer/Mcount_horizontal_pixel_counter_eqn_1)
    );
    LUT4 bird_outline_on_cmp_le00031_SW1
    (
        .I0(vga_timer/horizontal_pixel_counter<6>),
        .I1(vga_timer/horizontal_pixel_counter<5>),
        .I2(vga_timer/horizontal_pixel_counter<2>),
        .I3(N198),
        .O(N189)
    );
    LUT3 Mcount_scoreTens_xor<2>1_SW1
    (
        .I0(debouncer/state_reg_FSM_FFd2),
        .I1(scoreOnes_cmp_eq0003),
        .I2(state_reg<0>),
        .O(N191)
    );
    LUT4 Mcount_scoreTens_xor<2>1
    (
        .I0(scoreTens<0>),
        .I1(scoreTens<2>),
        .I2(N191),
        .I3(scoreTens<1>),
        .O(Mcount_scoreTens2)
    );
    LUT3 bird_top_next_cmp_lt000027
    (
        .I0(bird_top_temp_cmp_eq0000),
        .I1(state_reg<0>),
        .I2(bird_top_temp_addsub0001<9>),
        .O(bird_top_next_cmp_lt000027)
    );
    FDC bird_top_0_1
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(bird_top_next<0>),
        .Q(bird_top_0_1)
    );
    FDC bird_top_5_1
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(bird_top_next<5>),
        .Q(bird_top_5_1)
    );
    FDP bird_top_6_1
    (
        .C(clk_BUFGP),
        .D(bird_top_next<6>),
        .PRE(btn_3_IBUF),
        .Q(bird_top_6_1)
    );
    FDC bird_top_1_1
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(bird_top_next<1>),
        .Q(bird_top_1_1)
    );
    FDC bird_top_8_1
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(bird_top_next<8>),
        .Q(bird_top_8_1)
    );
    FDC bird_top_2_1
    (
        .C(clk_BUFGP),
        .CLR(btn_3_IBUF),
        .D(bird_top_next<2>),
        .Q(bird_top_2_1)
    );
    BUFGP clk_BUFGP
    (
        .I(clk),
        .O(clk_BUFGP)
    );
    INV Madd_delay_next_addsub0000_lut<0>_INV_0
    (
        .I(delay<0>),
        .O(Madd_delay_next_addsub0000_lut<0>)
    );
    INV Msub_col3_x_addsub0000_lut<1>_INV_0
    (
        .I(col3_x<1>),
        .O(Msub_col3_x_addsub0000_lut<1>)
    );
    INV Msub_col3_x_addsub0000_lut<2>_INV_0
    (
        .I(col3_x<2>),
        .O(Msub_col3_x_addsub0000_lut<2>)
    );
    INV Msub_col3_x_addsub0000_lut<3>_INV_0
    (
        .I(col3_x<3>),
        .O(Msub_col3_x_addsub0000_lut<3>)
    );
    INV Msub_col3_x_addsub0000_lut<5>_INV_0
    (
        .I(col3_x<5>),
        .O(Msub_col3_x_addsub0000_lut<5>)
    );
    INV Msub_col3_x_addsub0000_lut<6>_INV_0
    (
        .I(col3_x<6>),
        .O(Msub_col3_x_addsub0000_lut<6>)
    );
    INV Msub_col3_x_addsub0000_lut<7>_INV_0
    (
        .I(col3_x<7>),
        .O(Msub_col3_x_addsub0000_lut<7>)
    );
    INV Msub_col3_x_addsub0000_lut<8>_INV_0
    (
        .I(col3_x<8>),
        .O(Msub_col3_x_addsub0000_lut<8>)
    );
    INV Msub_col3_x_addsub0000_lut<9>_INV_0
    (
        .I(col3_x<9>),
        .O(Msub_col3_x_addsub0000_lut<9>)
    );
    INV Msub_col1_x_addsub0000_lut<1>_INV_0
    (
        .I(col1_x<1>),
        .O(Msub_col1_x_addsub0000_lut<1>)
    );
    INV Msub_col1_x_addsub0000_lut<2>_INV_0
    (
        .I(col1_x<2>),
        .O(Msub_col1_x_addsub0000_lut<2>)
    );
    INV Msub_col1_x_addsub0000_lut<3>_INV_0
    (
        .I(col1_x<3>),
        .O(Msub_col1_x_addsub0000_lut<3>)
    );
    INV Msub_col1_x_addsub0000_lut<5>_INV_0
    (
        .I(col1_x<5>),
        .O(Msub_col1_x_addsub0000_lut<5>)
    );
    INV Msub_col1_x_addsub0000_lut<6>_INV_0
    (
        .I(col1_x<6>),
        .O(Msub_col1_x_addsub0000_lut<6>)
    );
    INV Msub_col1_x_addsub0000_lut<7>_INV_0
    (
        .I(col1_x<7>),
        .O(Msub_col1_x_addsub0000_lut<7>)
    );
    INV Msub_col1_x_addsub0000_lut<8>_INV_0
    (
        .I(col1_x<8>),
        .O(Msub_col1_x_addsub0000_lut<8>)
    );
    INV Msub_col1_x_addsub0000_lut<9>_INV_0
    (
        .I(col1_x<9>),
        .O(Msub_col1_x_addsub0000_lut<9>)
    );
    INV Msub_col2_x_addsub0000_lut<1>_INV_0
    (
        .I(col2_x<1>),
        .O(Msub_col2_x_addsub0000_lut<1>)
    );
    INV Msub_col2_x_addsub0000_lut<2>_INV_0
    (
        .I(col2_x<2>),
        .O(Msub_col2_x_addsub0000_lut<2>)
    );
    INV Msub_col2_x_addsub0000_lut<3>_INV_0
    (
        .I(col2_x<3>),
        .O(Msub_col2_x_addsub0000_lut<3>)
    );
    INV Msub_col2_x_addsub0000_lut<5>_INV_0
    (
        .I(col2_x<5>),
        .O(Msub_col2_x_addsub0000_lut<5>)
    );
    INV Msub_col2_x_addsub0000_lut<6>_INV_0
    (
        .I(col2_x<6>),
        .O(Msub_col2_x_addsub0000_lut<6>)
    );
    INV Msub_col2_x_addsub0000_lut<7>_INV_0
    (
        .I(col2_x<7>),
        .O(Msub_col2_x_addsub0000_lut<7>)
    );
    INV Msub_col2_x_addsub0000_lut<8>_INV_0
    (
        .I(col2_x<8>),
        .O(Msub_col2_x_addsub0000_lut<8>)
    );
    INV Msub_col2_x_addsub0000_lut<9>_INV_0
    (
        .I(col2_x<9>),
        .O(Msub_col2_x_addsub0000_lut<9>)
    );
    INV Mcompar_delay_next_cmp_gt0000_lut<3>_INV_0
    (
        .I(delay<8>),
        .O(Mcompar_delay_next_cmp_gt0000_lut<3>)
    );
    INV Mcompar_delay_next_cmp_gt0000_lut<5>_INV_0
    (
        .I(delay<10>),
        .O(Mcompar_delay_next_cmp_gt0000_lut<5>)
    );
    INV Mcount_bird_delay_lut<0>_INV_0
    (
        .I(bird_delay<0>),
        .O(Mcount_bird_delay_lut<0>)
    );
    INV display/Mcount_counter_value_lut<0>_INV_0
    (
        .I(display/counter_value<0>),
        .O(display/Mcount_counter_value_lut<0>)
    );
    INV Mcount_debounce_counter_value_lut<0>_INV_0
    (
        .I(debounce_counter_value<0>),
        .O(Mcount_debounce_counter_value_lut<0>)
    );
    INV Madd_bird_color_on_add0000_lut<1>_INV_0
    (
        .I(bird_top_1_1),
        .O(Madd_bird_color_on_add0000_lut<1>)
    );
    INV Madd_bird_color_on_add0001_lut<0>_INV_0
    (
        .I(bird_top_0_1),
        .O(Madd_bird_color_on_add0001_lut<0>)
    );
    INV Madd_bird_color_on_add0001_lut<1>_INV_0
    (
        .I(bird_top_1_1),
        .O(Madd_bird_color_on_add0001_lut<1>)
    );
    INV Madd_bird_color_on_add0003_lut<0>_INV_0
    (
        .I(bird_top<0>),
        .O(Madd_bird_color_on_add0003_lut<0>)
    );
    INV Madd_bird_color_on_add0004_lut<1>_INV_0
    (
        .I(bird_top_1_1),
        .O(Madd_bird_color_on_add0004_lut<1>)
    );
    INV Madd_bird_color_on_add0004_lut<2>_INV_0
    (
        .I(bird_top_2_1),
        .O(Madd_bird_color_on_add0004_lut<2>)
    );
    INV Madd_bird_color_on_add0005_lut<0>_INV_0
    (
        .I(bird_top_0_1),
        .O(Madd_bird_color_on_add0005_lut<0>)
    );
    INV Madd_bird_color_on_add0005_lut<1>_INV_0
    (
        .I(bird_top_1_1),
        .O(Madd_bird_color_on_add0005_lut<1>)
    );
    INV Madd_bird_color_on_add0005_lut<2>_INV_0
    (
        .I(bird_top_2_1),
        .O(Madd_bird_color_on_add0005_lut<2>)
    );
    INV Madd_bird_color_on_add0007_lut<0>_INV_0
    (
        .I(bird_top_0_1),
        .O(Madd_bird_color_on_add0007_lut<0>)
    );
    INV Madd_bird_color_on_add0008_lut<1>_INV_0
    (
        .I(bird_top_1_1),
        .O(Madd_bird_color_on_add0008_lut<1>)
    );
    INV Madd_bird_color_on_add0008_lut<3>_INV_0
    (
        .I(bird_top<3>),
        .O(Madd_bird_color_on_add0008_lut<3>)
    );
    INV Madd_bird_color_on_add0009_lut<0>_INV_0
    (
        .I(bird_top_0_1),
        .O(Madd_bird_color_on_add0009_lut<0>)
    );
    INV Madd_bird_color_on_add0009_lut<1>_INV_0
    (
        .I(bird_top_1_1),
        .O(Madd_bird_color_on_add0009_lut<1>)
    );
    INV Madd_bird_color_on_add0009_lut<3>_INV_0
    (
        .I(bird_top<3>),
        .O(Madd_bird_color_on_add0009_lut<3>)
    );
    INV Madd_bird_color_on_add0012_lut<1>_INV_0
    (
        .I(bird_top_1_1),
        .O(Madd_bird_color_on_add0012_lut<1>)
    );
    INV Madd_bird_color_on_add0012_lut<2>_INV_0
    (
        .I(bird_top_2_1),
        .O(Madd_bird_color_on_add0012_lut<2>)
    );
    INV Madd_bird_color_on_add0012_lut<3>_INV_0
    (
        .I(bird_top<3>),
        .O(Madd_bird_color_on_add0012_lut<3>)
    );
    INV Madd_bird_color_on_add0011_lut<0>_INV_0
    (
        .I(bird_top_0_1),
        .O(Madd_bird_color_on_add0011_lut<0>)
    );
    INV Madd_bird_color_on_add0011_lut<2>_INV_0
    (
        .I(bird_top_2_1),
        .O(Madd_bird_color_on_add0011_lut<2>)
    );
    INV Madd_bird_color_on_add0011_lut<3>_INV_0
    (
        .I(bird_top<3>),
        .O(Madd_bird_color_on_add0011_lut<3>)
    );
    INV Madd_bird_color_on_add0013_lut<0>_INV_0
    (
        .I(bird_top_0_1),
        .O(Madd_bird_color_on_add0013_lut<0>)
    );
    INV Madd_bird_color_on_add0013_lut<1>_INV_0
    (
        .I(bird_top_1_1),
        .O(Madd_bird_color_on_add0013_lut<1>)
    );
    INV Madd_bird_color_on_add0013_lut<2>_INV_0
    (
        .I(bird_top_2_1),
        .O(Madd_bird_color_on_add0013_lut<2>)
    );
    INV Madd_bird_color_on_add0013_lut<3>_INV_0
    (
        .I(bird_top<3>),
        .O(Madd_bird_color_on_add0013_lut<3>)
    );
    INV Madd_bird_color_on_add0015_lut<0>_INV_0
    (
        .I(bird_top_0_1),
        .O(Madd_bird_color_on_add0015_lut<0>)
    );
    INV Madd_bird_color_on_add0016_lut<1>_INV_0
    (
        .I(bird_top_1_1),
        .O(Madd_bird_color_on_add0016_lut<1>)
    );
    INV Madd_bird_color_on_add0016_lut<4>_INV_0
    (
        .I(bird_top<4>),
        .O(Madd_bird_color_on_add0016_lut<4>)
    );
    INV Madd_bird_color_on_add0017_lut<0>_INV_0
    (
        .I(bird_top<0>),
        .O(Madd_bird_color_on_add0017_lut<0>)
    );
    INV Madd_bird_color_on_add0017_lut<1>_INV_0
    (
        .I(bird_top<1>),
        .O(Madd_bird_color_on_add0017_lut<1>)
    );
    INV Madd_bird_color_on_add0017_lut<4>_INV_0
    (
        .I(bird_top<4>),
        .O(Madd_bird_color_on_add0017_lut<4>)
    );
    INV Madd_bird_color_on_add0019_lut<0>_INV_0
    (
        .I(bird_top<0>),
        .O(Madd_bird_color_on_add0019_lut<0>)
    );
    INV Madd_bird_color_on_add0019_lut<2>_INV_0
    (
        .I(bird_top<2>),
        .O(Madd_bird_color_on_add0019_lut<2>)
    );
    INV Madd_bird_color_on_add0019_lut<4>_INV_0
    (
        .I(bird_top<4>),
        .O(Madd_bird_color_on_add0019_lut<4>)
    );
    INV Madd_bird_color_on_add0020_lut<1>_INV_0
    (
        .I(bird_top<1>),
        .O(Madd_bird_color_on_add0020_lut<1>)
    );
    INV Madd_bird_color_on_add0020_lut<2>_INV_0
    (
        .I(bird_top<2>),
        .O(Madd_bird_color_on_add0020_lut<2>)
    );
    INV Madd_bird_color_on_add0020_lut<4>_INV_0
    (
        .I(bird_top<4>),
        .O(Madd_bird_color_on_add0020_lut<4>)
    );
    INV Madd_bird_color_on_add0021_lut<0>_INV_0
    (
        .I(bird_top<0>),
        .O(Madd_bird_color_on_add0021_lut<0>)
    );
    INV Madd_bird_color_on_add0021_lut<1>_INV_0
    (
        .I(bird_top<1>),
        .O(Madd_bird_color_on_add0021_lut<1>)
    );
    INV Madd_bird_color_on_add0021_lut<2>_INV_0
    (
        .I(bird_top<2>),
        .O(Madd_bird_color_on_add0021_lut<2>)
    );
    INV Madd_bird_color_on_add0021_lut<4>_INV_0
    (
        .I(bird_top<4>),
        .O(Madd_bird_color_on_add0021_lut<4>)
    );
    INV Madd_bird_outline_on_addsub0000_lut<0>_INV_0
    (
        .I(bird_top_0_1),
        .O(Madd_bird_outline_on_addsub0000_lut<0>)
    );
    INV Madd_bird_outline_on_addsub0002_lut<0>_INV_0
    (
        .I(bird_top_0_1),
        .O(Madd_bird_outline_on_addsub0002_lut<0>)
    );
    INV Madd_bird_outline_on_addsub0002_lut<3>_INV_0
    (
        .I(bird_top<3>),
        .O(Madd_bird_outline_on_addsub0002_lut<3>)
    );
    INV Madd_bird_outline_on_addsub0002_lut<4>_INV_0
    (
        .I(bird_top<4>),
        .O(Madd_bird_outline_on_addsub0002_lut<4>)
    );
    INV Msub_bird_top_temp_addsub0000_lut<5>_INV_0
    (
        .I(bird_top<5>),
        .O(Msub_bird_top_temp_addsub0000_lut<5>)
    );
    INV Msub_bird_top_temp_addsub0000_lut<6>_INV_0
    (
        .I(bird_top<6>),
        .O(Msub_bird_top_temp_addsub0000_lut<6>)
    );
    INV Msub_bird_top_temp_addsub0000_lut<7>_INV_0
    (
        .I(bird_top<7>),
        .O(Msub_bird_top_temp_addsub0000_lut<7>)
    );
    INV Msub_bird_top_temp_addsub0000_lut<8>_INV_0
    (
        .I(bird_top<8>),
        .O(Msub_bird_top_temp_addsub0000_lut<8>)
    );
    INV vga_timer/Mcount_vertical_pixel_counter_lut<0>_INV_0
    (
        .I(vga_timer/vertical_pixel_counter<0>),
        .O(vga_timer/Mcount_vertical_pixel_counter_lut<0>)
    );
    INV vga_timer/Mcount_horizontal_pixel_counter_lut<0>_INV_0
    (
        .I(vga_timer/horizontal_pixel_counter<0>),
        .O(vga_timer/Mcount_horizontal_pixel_counter_lut<0>)
    );
    INV bird_top_temp_cmp_eq0000_wg_lut<0>_INV_0
    (
        .I(bird_delay<4>),
        .O(bird_top_temp_cmp_eq0000_wg_lut<0>)
    );
    INV btn<3>_inv1_INV_0
    (
        .I(btn_3_IBUF),
        .O(btn<3>_inv)
    );
    INV vga_timer/pixel_en_not00011_INV_0
    (
        .I(vga_timer/pixel_en),
        .O(vga_timer/pixel_en_not0001)
    );
    INV fall_reg_mux0001<3>1_INV_0
    (
        .I(debouncer/state_reg_FSM_FFd2),
        .O(fall_reg_mux0001<3>)
    );
    INV Madd_pipe_on_addsub0001_xor<2>11_INV_0
    (
        .I(col1_y<0>),
        .O(pipe_on_addsub0001<2>)
    );
    INV Madd_pipe_on_addsub0005_xor<2>11_INV_0
    (
        .I(col3_y<0>),
        .O(pipe_on_addsub0005<2>)
    );
    INV Madd_pipe_on_addsub0003_xor<2>11_INV_0
    (
        .I(col2_y<0>),
        .O(pipe_on_addsub0003<2>)
    );
    INV Mcompar_pipe_on_cmp_gt0000_lut<3>1_INV_0
    (
        .I(vga_timer/vertical_pixel_counter<3>),
        .O(Mcompar_pipe_on_cmp_gt0000_lut<3>)
    );
    INV Mcompar_pipe_on_cmp_gt0001_lut<3>1_INV_0
    (
        .I(vga_timer/vertical_pixel_counter<3>),
        .O(Mcompar_pipe_on_cmp_gt0001_lut<3>)
    );
    INV Mcompar_pipe_on_cmp_gt0002_lut<3>1_INV_0
    (
        .I(vga_timer/vertical_pixel_counter<3>),
        .O(Mcompar_pipe_on_cmp_gt0002_lut<3>)
    );
    INV Msub_col3_x_addsub0000_lut<4>1_INV_0
    (
        .I(col3_x<4>),
        .O(Msub_col3_x_addsub0000_lut<4>1)
    );
    INV Msub_col1_x_addsub0000_lut<4>1_INV_0
    (
        .I(col1_x<4>),
        .O(Msub_col1_x_addsub0000_lut<4>1)
    );
    INV Msub_col2_x_addsub0000_lut<4>1_INV_0
    (
        .I(col2_x<4>),
        .O(Msub_col2_x_addsub0000_lut<4>1)
    );
    INV Madd_bird_color_on_add0003_lut<2>1_INV_0
    (
        .I(bird_top<2>),
        .O(Madd_bird_color_on_add0003_lut<2>1)
    );
    INV Madd_bird_color_on_add0007_lut<3>1_INV_0
    (
        .I(bird_top<3>),
        .O(Madd_bird_color_on_add0007_lut<3>1)
    );
    INV Madd_bird_color_on_add0015_lut<4>1_INV_0
    (
        .I(bird_top<4>),
        .O(Madd_bird_color_on_add0015_lut<4>1)
    );
    LUT4 vga_timer/VS251
    (
        .I0(vga_timer/vertical_pixel_counter<6>),
        .I1(vga_timer/vertical_pixel_counter<3>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(vga_timer/vertical_pixel_counter<5>),
        .O(vga_timer/VS251)
    );
    MUXF5 vga_timer/VS25_f5
    (
        .I0(Msub_bird_top_temp_addsub0000_lut<9>),
        .I1(vga_timer/VS251),
        .S(vga_timer/vertical_pixel_counter<7>),
        .O(vga_timer/VS25)
    );
    LUT4 vga_timer/VS281
    (
        .I0(vga_timer/vertical_pixel_counter<8>),
        .I1(vga_timer/vertical_pixel_counter<4>),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(vga_timer/vertical_pixel_counter<2>),
        .O(vga_timer/VS28)
    );
    MUXF5 vga_timer/VS28_f5
    (
        .I0(vga_timer/VS28),
        .I1(Msub_bird_top_temp_addsub0000_lut<9>),
        .S(vga_timer/VS25),
        .O(VS)
    );
    LUT4 fall_reg_and0000171
    (
        .I0(jump_reg<1>),
        .I1(jump_reg<0>),
        .I2(jump_reg<3>),
        .I3(jump_reg<2>),
        .O(fall_reg_and0000171)
    );
    MUXF5 fall_reg_and000017_f5
    (
        .I0(fall_reg_and0000171),
        .I1(Madd_bird_color_on_add0002_lut<9>),
        .S(jump_reg<4>),
        .O(fall_reg_and000017)
    );
    LUT4 col2_x_not00011
    (
        .I0(col2_on_cmp_le0000),
        .I1(moveEN),
        .I2(col2_on_cmp_gt0000),
        .I3(col2_x_cmp_eq0000),
        .O(col2_x_not00011)
    );
    MUXF5 col2_x_not0001_f5
    (
        .I0(debouncer/state_reg_FSM_FFd2),
        .I1(col2_x_not00011),
        .S(state_reg<0>),
        .O(col2_x_not0001)
    );
    LUT4_D vga_timer/Mcount_horizontal_pixel_counter_eqn_0141
    (
        .I0(vga_timer/horizontal_pixel_counter<1>),
        .I1(vga_timer/horizontal_pixel_counter<2>),
        .I2(vga_timer/horizontal_pixel_counter<3>),
        .I3(vga_timer/horizontal_pixel_counter<4>),
        .LO(N193),
        .O(bird_outline_on_cmp_le00001)
    );
    LUT3_L col3_on_cmp_le00001_SW0
    (
        .I0(col3_x<6>),
        .I1(col3_x<5>),
        .I2(col3_x<4>),
        .LO(N15)
    );
    LUT4_L ground_border_on_cmp_ge000025
    (
        .I0(vga_timer/vertical_pixel_counter<3>),
        .I1(vga_timer/vertical_pixel_counter<2>),
        .I2(vga_timer/vertical_pixel_counter<1>),
        .I3(vga_timer/vertical_pixel_counter<0>),
        .LO(ground_border_on_cmp_ge000025)
    );
    LUT2_D col1_x_not000111
    (
        .I0(state_reg<0>),
        .I1(debouncer/state_reg_FSM_FFd2),
        .LO(N194),
        .O(bird_top_temp_and0000)
    );
    LUT3_L col2_on_cmp_le00001_SW0
    (
        .I0(col2_x<6>),
        .I1(col2_x<5>),
        .I2(col2_x<4>),
        .LO(N17)
    );
    LUT3_L col1_on_cmp_le00001_SW0
    (
        .I0(col1_x<6>),
        .I1(col1_x<5>),
        .I2(col1_x<4>),
        .LO(N19)
    );
    LUT4_L col2_on_cmp_gt0000210
    (
        .I0(col2_x<6>),
        .I1(col2_x<5>),
        .I2(col2_x<8>),
        .I3(col2_x<9>),
        .LO(col2_on_cmp_gt0000210)
    );
    LUT3_D col3_x_cmp_eq000011
    (
        .I0(col2_x<0>),
        .I1(col2_x<3>),
        .I2(col2_x<2>),
        .LO(N195),
        .O(N99)
    );
    LUT3_D col1_x_cmp_eq000011
    (
        .I0(col3_x<0>),
        .I1(col3_x<2>),
        .I2(col3_x<3>),
        .LO(N196),
        .O(N100)
    );
    LUT4_D bird_outline_on_cmp_le000111
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(vga_timer/horizontal_pixel_counter<8>),
        .I2(vga_timer/horizontal_pixel_counter<7>),
        .I3(N20),
        .LO(N197),
        .O(bird_outline_on_cmp_le0001)
    );
    LUT2_D bird_outline_on_or0013201
    (
        .I0(vga_timer/horizontal_pixel_counter<3>),
        .I1(vga_timer/horizontal_pixel_counter<4>),
        .LO(N198),
        .O(N101)
    );
    LUT4_D bird_top_temp<7>1
    (
        .I0(bird_top<7>),
        .I1(bird_top_temp_and0000),
        .I2(bird_top_temp_and0001),
        .I3(bird_top_temp_addsub0001<7>),
        .LO(N199),
        .O(bird_top_temp<7>)
    );
    LUT4_D bird_top_temp<8>1
    (
        .I0(bird_top_temp_and0000),
        .I1(bird_top_temp_and0001),
        .I2(bird_top<8>),
        .I3(bird_top_temp_addsub0001<8>),
        .LO(N200),
        .O(bird_top_temp<8>)
    );
    LUT4_D pipe_on_addsub0001<7>11
    (
        .I0(col1_y<5>),
        .I1(col1_y<6>),
        .I2(col1_y<0>),
        .I3(col1_y<4>),
        .LO(N201),
        .O(pipe_on_addsub0001<7>_bdd0)
    );
    LUT2_D bird_top_temp_and00011
    (
        .I0(bird_top_temp_cmp_eq0000),
        .I1(state_reg<0>),
        .LO(N202),
        .O(bird_top_temp_and0001)
    );
    LUT2_D bird_outline_on_or001351
    (
        .I0(vga_timer/horizontal_pixel_counter<5>),
        .I1(vga_timer/horizontal_pixel_counter<6>),
        .LO(N203),
        .O(bird_color_on_cmp_ge000116)
    );
    LUT2_D bird_color_on_cmp_ge0003111
    (
        .I0(vga_timer/horizontal_pixel_counter<7>),
        .I1(vga_timer/horizontal_pixel_counter<8>),
        .LO(N204),
        .O(N32)
    );
    LUT3_D bird_outline_on_or0013101
    (
        .I0(vga_timer/horizontal_pixel_counter<5>),
        .I1(vga_timer/horizontal_pixel_counter<6>),
        .I2(vga_timer/horizontal_pixel_counter<8>),
        .LO(N205),
        .O(N96)
    );
    LUT3_D bird_color_on_or001211
    (
        .I0(vga_timer/horizontal_pixel_counter<6>),
        .I1(vga_timer/horizontal_pixel_counter<5>),
        .I2(vga_timer/horizontal_pixel_counter<4>),
        .LO(N206),
        .O(N20)
    );
    LUT4_D bird_color_on_cmp_ge00031
    (
        .I0(vga_timer/horizontal_pixel_counter<6>),
        .I1(vga_timer/horizontal_pixel_counter<9>),
        .I2(N331),
        .I3(N32),
        .LO(N207),
        .O(bird_color_on_cmp_ge0003)
    );
    LUT4_D bird_top_temp<5>1
    (
        .I0(bird_top_temp_and0000),
        .I1(bird_top_temp_and0001),
        .I2(bird_top<5>),
        .I3(bird_top_temp_addsub0001<5>),
        .LO(N208),
        .O(bird_top_temp<5>)
    );
    LUT4_D pipe_on_addsub0005<7>11
    (
        .I0(col3_y<5>),
        .I1(col3_y<6>),
        .I2(col3_y<0>),
        .I3(col3_y<4>),
        .LO(N209),
        .O(pipe_on_addsub0005<7>_bdd0)
    );
    LUT4_D pipe_on_addsub0003<7>11
    (
        .I0(col2_y<5>),
        .I1(col2_y<6>),
        .I2(col2_y<0>),
        .I3(col2_y<4>),
        .LO(N210),
        .O(pipe_on_addsub0003<7>_bdd0)
    );
    LUT4_L pipe_on_or0006111
    (
        .I0(col3_x<4>),
        .I1(col3_x<5>),
        .I2(N100),
        .I3(col3_x<1>),
        .LO(pipe_on_or0006111)
    );
    LUT4_L pipe_on_or0006216
    (
        .I0(col1_x<3>),
        .I1(col1_x<2>),
        .I2(col1_x<1>),
        .I3(col1_x<0>),
        .LO(pipe_on_or0006216)
    );
    LUT4_L pipe_on_or0006275
    (
        .I0(pipe_on_or0006229),
        .I1(pipe_on_or0006255),
        .I2(col1_x<6>),
        .I3(pipe_on_cmp_ge0000),
        .LO(pipe_on_or0006275)
    );
    LUT2_D bird_color_on_or001221
    (
        .I0(vga_timer/horizontal_pixel_counter<8>),
        .I1(vga_timer/horizontal_pixel_counter<7>),
        .LO(N211),
        .O(N26)
    );
    LUT3_L bird_color_on_cmp_ge000231
    (
        .I0(vga_timer/horizontal_pixel_counter<1>),
        .I1(vga_timer/horizontal_pixel_counter<2>),
        .I2(vga_timer/horizontal_pixel_counter<3>),
        .LO(N23)
    );
    LUT4_D bird_top_temp<4>1
    (
        .I0(bird_top_temp_and0000),
        .I1(bird_top_temp_and0001),
        .I2(bird_top<4>),
        .I3(bird_top_temp_addsub0001<4>),
        .LO(N212),
        .O(bird_top_temp<4>)
    );
    LUT4_D bird_top_temp<3>1
    (
        .I0(bird_top_temp_and0000),
        .I1(bird_top_temp_and0001),
        .I2(bird_top_temp_addsub0001<3>),
        .I3(bird_top<3>),
        .LO(N213),
        .O(bird_top_temp<3>)
    );
    LUT4_D bird_top_temp<2>1
    (
        .I0(bird_top_temp_and0000),
        .I1(bird_top_temp_and0001),
        .I2(bird_top<2>),
        .I3(bird_top_temp_addsub0001<2>),
        .LO(N214),
        .O(bird_top_temp<2>)
    );
    LUT4_D bird_top_next_cmp_lt0000279
    (
        .I0(bird_top_temp<6>),
        .I1(bird_top_next_cmp_lt000027),
        .I2(bird_top_next_cmp_lt0000211),
        .I3(bird_top_next_cmp_lt0000243),
        .LO(N215),
        .O(bird_top_next_cmp_lt0000)
    );
    LUT4_L rgb<2>14
    (
        .I0(led_2_OBUF),
        .I1(bird_lips_on),
        .I2(bird_color_on),
        .I3(bird_white_on),
        .LO(rgb<2>14)
    );
    LUT4_L bird_white_on_or000426
    (
        .I0(N32),
        .I1(bird_color_on_cmp_ge000116),
        .I2(bird_outline_on_cmp_le00001),
        .I3(vga_timer/horizontal_pixel_counter<9>),
        .LO(bird_white_on_or000426)
    );
    LUT4_D bird_white_on_or000440
    (
        .I0(bird_white_on_or000427),
        .I1(bird_white_on_or000411),
        .I2(N18),
        .I3(bird_white_on_or00047),
        .LO(N216),
        .O(bird_white_on_or000440)
    );
    LUT4_L bird_white_on_or0004128
    (
        .I0(vga_timer/horizontal_pixel_counter<4>),
        .I1(vga_timer/horizontal_pixel_counter<5>),
        .I2(vga_timer/horizontal_pixel_counter<2>),
        .I3(vga_timer/horizontal_pixel_counter<3>),
        .LO(bird_white_on_or0004128)
    );
    LUT3_D bird_white_on_or0004210
    (
        .I0(bird_white_on_or000492),
        .I1(bird_white_on_or000440),
        .I2(bird_white_on_or0004187),
        .LO(N217),
        .O(bird_white_on)
    );
    LUT2_D bird_color_on_or00041
    (
        .I0(Mcompar_bird_color_on_cmp_eq0008_cy<4>),
        .I1(Mcompar_bird_color_on_cmp_eq0009_cy<4>),
        .LO(N218),
        .O(bird_color_on_or0004)
    );
    LUT2_L bird_color_on_or00001
    (
        .I0(Mcompar_bird_color_on_cmp_eq0000_cy<4>),
        .I1(Mcompar_bird_color_on_cmp_eq0001_cy<4>),
        .LO(bird_color_on_or0000)
    );
    LUT4_L rgb<0>11
    (
        .I0(led_0_OBUF),
        .I1(bird_lips_on),
        .I2(bird_color_on),
        .I3(bird_white_on),
        .LO(rgb<0>11)
    );
    LUT2_L Madd_bird_color_on_add0002_cy<3>1
    (
        .I0(bird_top<2>),
        .I1(bird_top<3>),
        .LO(Madd_bird_color_on_add0002_cy<3>)
    );
    LUT3_L bird_outline_on_or001330
    (
        .I0(bird_outline_on_cmp_le0000),
        .I1(Mcompar_bird_outline_on_cmp_eq0000_cy<4>),
        .I2(Mcompar_bird_outline_on_cmp_eq0001_cy<4>),
        .LO(bird_outline_on_or001330)
    );
    LUT4_D bird_outline_on_or0013366
    (
        .I0(bird_outline_on_or0013351),
        .I1(bird_outline_on_or0013329),
        .I2(bird_outline_on_or0013255),
        .I3(bird_outline_on_or0013145),
        .LO(N219),
        .O(bird_outline_on)
    );
    LUT4_L bird_outline_on_or001362
    (
        .I0(bird_outline_on_cmp_ge0001),
        .I1(bird_outline_on_cmp_le0003),
        .I2(N16),
        .I3(bird_outline_on_or001356),
        .LO(bird_outline_on_or001362)
    );
    LUT4_D bird_color_on_or0012131
    (
        .I0(bird_color_on_or0012123),
        .I1(N25),
        .I2(bird_color_on_or0012103),
        .I3(bird_color_on_or001298),
        .LO(N220),
        .O(bird_color_on_or0012131)
    );
    LUT4_L bird_outline_on_or0013233
    (
        .I0(vga_timer/horizontal_pixel_counter<3>),
        .I1(N49),
        .I2(bird_color_on_or0010),
        .I3(N50),
        .LO(bird_outline_on_or0013233)
    );
    LUT4_D bird_outline_on_or0013131
    (
        .I0(Mcompar_bird_color_on_cmp_eq0006_cy<4>),
        .I1(Mcompar_bird_color_on_cmp_eq0004_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0005_cy<4>),
        .I3(Mcompar_bird_color_on_cmp_eq0007_cy<4>),
        .LO(N221),
        .O(N18)
    );
    LUT4_L rgb<4>5_SW0
    (
        .I0(led_4_OBUF),
        .I1(bird_color_on_or001271),
        .I2(bird_color_on_or001220),
        .I3(bird_color_on_or0012131),
        .LO(N72)
    );
    LUT4_L rgb<4>24_SW0
    (
        .I0(ground_border_on_cmp_ge0000),
        .I1(ground_border_on_cmp_lt0000),
        .I2(pipe_on),
        .I3(blank),
        .LO(N74)
    );
    LUT4_L bird_outline_on_or0013274
    (
        .I0(vga_timer/horizontal_pixel_counter<2>),
        .I1(vga_timer/horizontal_pixel_counter<3>),
        .I2(vga_timer/horizontal_pixel_counter<4>),
        .I3(bird_color_on_or0001),
        .LO(bird_outline_on_or0013274)
    );
    LUT2_L bird_outline_on_or0013233_SW0_SW0
    (
        .I0(Mcompar_bird_color_on_cmp_eq0016_cy<4>),
        .I1(Mcompar_bird_color_on_cmp_eq0006_cy<4>),
        .LO(N94)
    );
    LUT3_L bird_outline_on_or00139_SW0
    (
        .I0(bird_outline_on_cmp_ge0000),
        .I1(Mcompar_bird_color_on_cmp_eq0004_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0005_cy<4>),
        .LO(N961)
    );
    LUT4_L rgb<0>21_SW1_SW0
    (
        .I0(blank),
        .I1(ground_border_on_cmp_ge0000),
        .I2(rgb<6>4),
        .I3(bird_white_on),
        .LO(N1041)
    );
    LUT4_L bird_outline_on_or0013233_SW1_SW0
    (
        .I0(Mcompar_bird_color_on_cmp_eq0016_cy<4>),
        .I1(Mcompar_bird_color_on_cmp_eq0012_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0000_cy<4>),
        .I3(Mcompar_bird_color_on_cmp_eq0001_cy<4>),
        .LO(N108)
    );
    LUT4_L bird_outline_on_or0013285
    (
        .I0(vga_timer/horizontal_pixel_counter<2>),
        .I1(Mcompar_bird_color_on_cmp_eq0008_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0009_cy<4>),
        .I3(N110),
        .LO(bird_outline_on_or0013285)
    );
    LUT4_L bird_color_on_or00124
    (
        .I0(Mcompar_bird_color_on_cmp_eq0023_cy<4>),
        .I1(bird_color_on_cmp_ge0000),
        .I2(Mcompar_bird_color_on_cmp_eq0022_cy<4>),
        .I3(N114),
        .LO(bird_color_on_or00124)
    );
    LUT4_L bird_outline_on_or00134
    (
        .I0(Mcompar_bird_color_on_cmp_eq0023_cy<4>),
        .I1(bird_color_on_cmp_ge0004),
        .I2(Mcompar_bird_color_on_cmp_eq0022_cy<4>),
        .I3(N116),
        .LO(bird_outline_on_or00134)
    );
    LUT3_L bird_color_on_or0012103_SW0
    (
        .I0(bird_color_on_cmp_ge0003),
        .I1(Mcompar_bird_color_on_cmp_eq0012_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0013_cy<4>),
        .LO(N118)
    );
    LUT4_L bird_color_on_or001232
    (
        .I0(Mcompar_bird_color_on_cmp_eq0007_cy<4>),
        .I1(bird_color_on_cmp_ge0002),
        .I2(Mcompar_bird_color_on_cmp_eq0006_cy<4>),
        .I3(N122),
        .LO(bird_color_on_or001232)
    );
    LUT4_L bird_outline_on_or0013176
    (
        .I0(N101),
        .I1(Mcompar_bird_color_on_cmp_eq0009_cy<4>),
        .I2(N124),
        .I3(bird_outline_on_or0013170),
        .LO(bird_outline_on_or0013176)
    );
    LUT4_L bird_outline_on_or0013109_SW0
    (
        .I0(bird_outline_on_or0013101),
        .I1(Mcompar_bird_color_on_cmp_eq0013_cy<4>),
        .I2(N126),
        .I3(N18),
        .LO(N52)
    );
    LUT4_L bird_white_on_or000473
    (
        .I0(bird_white_on_or000468),
        .I1(Mcompar_bird_color_on_cmp_eq0015_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0013_cy<4>),
        .I3(N128),
        .LO(bird_white_on_or000473)
    );
    LUT4_L rgb<0>21_SW1
    (
        .I0(blank),
        .I1(ground_border_on_cmp_ge0000),
        .I2(rgb<5>0),
        .I3(rgb<7>1),
        .LO(N132)
    );
    LUT4_L rgb<0>21_SW3
    (
        .I0(blank),
        .I1(ground_border_on_cmp_ge0000),
        .I2(rgb<5>0),
        .I3(rgb<5>1),
        .LO(N134)
    );
    LUT3_L bird_color_on_or001298_SW0_SW0
    (
        .I0(bird_color_on_cmp_ge0002),
        .I1(Mcompar_bird_color_on_cmp_eq0016_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0017_cy<4>),
        .LO(N138)
    );
    LUT4_D bird_lips_on_or000118
    (
        .I0(N140),
        .I1(N98),
        .I2(Mcompar_bird_color_on_cmp_eq0018_cy<4>),
        .I3(Mcompar_bird_color_on_cmp_eq0019_cy<4>),
        .LO(N222),
        .O(bird_lips_on_or000118)
    );
    LUT4_L bird_outline_on_or001386_SW0_SW0
    (
        .I0(vga_timer/horizontal_pixel_counter<1>),
        .I1(vga_timer/horizontal_pixel_counter<2>),
        .I2(Mcompar_bird_color_on_cmp_eq0016_cy<4>),
        .I3(Mcompar_bird_color_on_cmp_eq0017_cy<4>),
        .LO(N136)
    );
    LUT4_L rgb<1>_SW0
    (
        .I0(bird_white_on_or000492),
        .I1(bird_white_on_or000440),
        .I2(bird_white_on_or0004187),
        .I3(N142),
        .LO(N45)
    );
    LUT4_D bird_lips_on_or00014
    (
        .I0(Mcompar_bird_color_on_cmp_eq0017_cy<4>),
        .I1(bird_outline_on_cmp_le0002),
        .I2(Mcompar_bird_color_on_cmp_eq0016_cy<4>),
        .I3(N144),
        .LO(N223),
        .O(bird_lips_on_or00014)
    );
    LUT2_L bird_color_on_or00091_SW1
    (
        .I0(Mcompar_bird_color_on_cmp_eq0018_cy<4>),
        .I1(Mcompar_bird_color_on_cmp_eq0014_cy<4>),
        .LO(N148)
    );
    LUT3_L bird_outline_on_or0013166_SW0
    (
        .I0(bird_outline_on_cmp_le00001),
        .I1(Mcompar_bird_color_on_cmp_eq0000_cy<4>),
        .I2(Mcompar_bird_color_on_cmp_eq0001_cy<4>),
        .LO(N150)
    );
    LUT4_L pipe_on_or0006179
    (
        .I0(pipe_on_or0006146),
        .I1(pipe_on_or0006159),
        .I2(pipe_on_cmp_le0005),
        .I3(Mcompar_pipe_on_cmp_gt0002_cy<9>),
        .LO(pipe_on_or0006179)
    );
    LUT4_D bird_color_on_cmp_le0001121
    (
        .I0(vga_timer/horizontal_pixel_counter<5>),
        .I1(vga_timer/horizontal_pixel_counter<6>),
        .I2(vga_timer/horizontal_pixel_counter<7>),
        .I3(vga_timer/horizontal_pixel_counter<8>),
        .LO(N224),
        .O(N24)
    );
    LUT4_L state_next_0_mux0000_SW0
    (
        .I0(ground_border_on_cmp_ge0000),
        .I1(ground_border_on_cmp_lt0000244),
        .I2(vga_timer/vertical_pixel_counter<9>),
        .I3(pipe_on),
        .LO(N43)
    );
    LUT4_D bird_white_on_cmp_le00022
    (
        .I0(N96),
        .I1(N163),
        .I2(vga_timer/horizontal_pixel_counter<9>),
        .I3(N26),
        .LO(N225),
        .O(bird_white_on_cmp_le0002)
    );
    LUT4_L pipe_on_or000666_SW0
    (
        .I0(pipe_on_or000615),
        .I1(pipe_on_or000633),
        .I2(col2_x<6>),
        .I3(pipe_on_cmp_ge0001),
        .LO(N169)
    );
    LUT4_D col3_on_cmp_gt0000217
    (
        .I0(col3_on_cmp_gt0000210),
        .I1(col3_x<0>),
        .I2(col3_x<1>),
        .I3(N171),
        .LO(N226),
        .O(col3_on_cmp_gt0000)
    );
    LUT4_D col1_on_cmp_gt0000217
    (
        .I0(col1_on_cmp_gt0000210),
        .I1(col1_x<0>),
        .I2(col1_x<1>),
        .I3(N175),
        .LO(N227),
        .O(col1_on_cmp_gt0000)
    );
    LUT4_D ground_border_on_cmp_ge0000231
    (
        .I0(ground_border_on_cmp_ge0000217),
        .I1(vga_timer/vertical_pixel_counter<7>),
        .I2(vga_timer/vertical_pixel_counter<8>),
        .I3(vga_timer/vertical_pixel_counter<9>),
        .LO(N228),
        .O(ground_border_on_cmp_ge0000)
    );
    LUT4_D bird_outline_on_cmp_ge00012_SW1
    (
        .I0(vga_timer/horizontal_pixel_counter<4>),
        .I1(vga_timer/horizontal_pixel_counter<3>),
        .I2(vga_timer/horizontal_pixel_counter<1>),
        .I3(vga_timer/horizontal_pixel_counter<2>),
        .LO(N229),
        .O(N179)
    );
    LUT4_L bird_white_on_or000456
    (
        .I0(vga_timer/horizontal_pixel_counter<4>),
        .I1(vga_timer/horizontal_pixel_counter<1>),
        .I2(vga_timer/horizontal_pixel_counter<2>),
        .I3(vga_timer/horizontal_pixel_counter<3>),
        .LO(bird_white_on_or000456)
    );
    LUT4_L bird_color_on_or001249
    (
        .I0(vga_timer/horizontal_pixel_counter<4>),
        .I1(vga_timer/horizontal_pixel_counter<2>),
        .I2(vga_timer/horizontal_pixel_counter<3>),
        .I3(vga_timer/horizontal_pixel_counter<1>),
        .LO(bird_color_on_or001249)
    );
    LUT4_D bird_color_on_or001261
    (
        .I0(vga_timer/horizontal_pixel_counter<9>),
        .I1(vga_timer/horizontal_pixel_counter<8>),
        .I2(vga_timer/horizontal_pixel_counter<7>),
        .I3(N20),
        .LO(N230),
        .O(N98)
    );
    LUT4_L bird_outline_on_cmp_ge00021_SW1
    (
        .I0(vga_timer/horizontal_pixel_counter<5>),
        .I1(vga_timer/horizontal_pixel_counter<6>),
        .I2(vga_timer/horizontal_pixel_counter<3>),
        .I3(vga_timer/horizontal_pixel_counter<4>),
        .LO(N181)
    );
    LUT4_D bird_color_on_cmp_ge0001113
    (
        .I0(vga_timer/horizontal_pixel_counter<5>),
        .I1(vga_timer/horizontal_pixel_counter<8>),
        .I2(N183),
        .I3(bird_color_on_cmp_ge000110),
        .LO(N231),
        .O(bird_color_on_cmp_ge0001)
    );
    LUT4_D bird_outline_on_cmp_le00031
    (
        .I0(vga_timer/horizontal_pixel_counter<8>),
        .I1(vga_timer/horizontal_pixel_counter<9>),
        .I2(vga_timer/horizontal_pixel_counter<7>),
        .I3(N189),
        .LO(N232),
        .O(bird_outline_on_cmp_le0003)
    );
endmodule

module GND
(
    G
);

    output G;


endmodule

module VCC
(
    P
);

    output P;


endmodule

module FDCE
(
    C,
    CE,
    CLR,
    D,
    Q
);

    input C;
    input CE;
    input CLR;
    input D;
    output Q;


endmodule

module FDE
(
    C,
    CE,
    D,
    Q
);

    input C;
    input CE;
    input D;
    output Q;


endmodule

module FDC
(
    C,
    CLR,
    D,
    Q
);

    input C;
    input CLR;
    input D;
    output Q;


endmodule

module FD
(
    C,
    D,
    Q
);

    input C;
    input D;
    output Q;


endmodule

module FDP
(
    C,
    D,
    PRE,
    Q
);

    input C;
    input D;
    input PRE;
    output Q;


endmodule

module MUXCY
(
    CI,
    DI,
    S,
    O
);

    input CI;
    input DI;
    input S;
    output O;


endmodule

module XORCY
(
    CI,
    LI,
    O
);

    input CI;
    input LI;
    output O;


endmodule

module LUT4
(
    I0,
    I1,
    I2,
    I3,
    O
);

    input I0;
    input I1;
    input I2;
    input I3;
    output O;


endmodule

module LUT3
(
    I0,
    I1,
    I2,
    O
);

    input I0;
    input I1;
    input I2;
    output O;


endmodule

module LUT2
(
    I0,
    I1,
    O
);

    input I0;
    input I1;
    output O;


endmodule

module MUXF5
(
    I0,
    I1,
    S,
    O
);

    input I0;
    input I1;
    input S;
    output O;


endmodule

module IBUF
(
    I,
    O
);

    input I;
    output O;


endmodule

module OBUF
(
    I,
    O
);

    input I;
    output O;


endmodule

module LUT1
(
    I0,
    O
);

    input I0;
    output O;


endmodule

module BUFGP
(
    I,
    O
);

    input I;
    output O;


endmodule

module INV
(
    I,
    O
);

    input I;
    output O;


endmodule

module LUT4_D
(
    I0,
    I1,
    I2,
    I3,
    LO,
    O
);

    input I0;
    input I1;
    input I2;
    input I3;
    output LO;
    output O;


endmodule

module LUT3_L
(
    I0,
    I1,
    I2,
    LO
);

    input I0;
    input I1;
    input I2;
    output LO;


endmodule

module LUT4_L
(
    I0,
    I1,
    I2,
    I3,
    LO
);

    input I0;
    input I1;
    input I2;
    input I3;
    output LO;


endmodule

module LUT2_D
(
    I0,
    I1,
    LO,
    O
);

    input I0;
    input I1;
    output LO;
    output O;


endmodule

module LUT3_D
(
    I0,
    I1,
    I2,
    LO,
    O
);

    input I0;
    input I1;
    input I2;
    output LO;
    output O;


endmodule

module LUT2_L
(
    I0,
    I1,
    LO
);

    input I0;
    input I1;
    output LO;


endmodule

