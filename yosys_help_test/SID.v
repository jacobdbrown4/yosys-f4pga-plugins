//Generated from netlist by SpyDrNet
//netlist name: divider_ctrl
module divider_ctrl
(
    clkn,
    clkp,
    latch_dividend_button,
    latch_divisor_button,
    ready_button,
    rst,
    led,
    sw
);

    input clkn;
    input clkp;
    input latch_dividend_button;
    input latch_divisor_button;
    input ready_button;
    input rst;
    output [7:0]led;
    input [3:0]sw;

    wire <const0>;
    wire clkn;
    wire clkp;
    wire dividend_to_divider0;
    wire [31:0]dividend_to_divider;
    wire divisor_to_divider0;
    wire [31:0]divisor_to_divider;
    wire i_clk;
    wire i_clk_BUFG;
    wire i_rst;
    wire latch_dividend_button;
    wire latch_dividend_button_IBUF;
    wire latch_divisor_button;
    wire latch_divisor_button_IBUF;
    wire [7:0]led;
    wire [7:0]led_OBUF;
    wire [3:0]o_quotient;
    wire quotient0;
    wire ready_button;
    wire ready_button_IBUF;
    wire rst;
    wire rst_IBUF;
    wire [1:1]state_next;
    wire state_reg[1]_i_1__0_n_0;
    wire [1:0]state_reg_reg_n_0_;
    wire [3:0]sw;
    wire [3:0]sw_IBUF;

    GND GND
    (
        .G(<const0>)
    );
    IBUFDS clk_in_buf
    (
        .O(i_clk),
        .I(clkp),
        .IB(clkn)
    );
    LUT3 dividend_to_divider[31]_i_1
    (
        .O(dividend_to_divider0),
        .I0(latch_dividend_button_IBUF),
        .I1(state_reg_reg_n_0_[1]),
        .I2(state_reg_reg_n_0_[0])
    );
    FDCE dividend_to_divider_reg[0]
    (
        .Q(dividend_to_divider[0]),
        .C(i_clk_BUFG),
        .CE(dividend_to_divider0),
        .CLR(i_rst),
        .D(sw_IBUF[3])
    );
    FDCE dividend_to_divider_reg[22]
    (
        .Q(dividend_to_divider[22]),
        .C(i_clk_BUFG),
        .CE(dividend_to_divider0),
        .CLR(i_rst),
        .D(sw_IBUF[1])
    );
    FDCE dividend_to_divider_reg[31]
    (
        .Q(dividend_to_divider[31]),
        .C(i_clk_BUFG),
        .CE(dividend_to_divider0),
        .CLR(i_rst),
        .D(sw_IBUF[0])
    );
    FDCE dividend_to_divider_reg[8]
    (
        .Q(dividend_to_divider[8]),
        .C(i_clk_BUFG),
        .CE(dividend_to_divider0),
        .CLR(i_rst),
        .D(sw_IBUF[2])
    );
    divider_dshift divider
    (
        .CLK(i_clk_BUFG),
        .ready_button_IBUF(ready_button_IBUF),
        .E[0](quotient0),
        .Q[3:0]({divisor_to_divider[31], divisor_to_divider[22], divisor_to_divider[8], divisor_to_divider[0]}),
        .dividend_to_divider_reg[31][3:0]({dividend_to_divider[31], dividend_to_divider[22], dividend_to_divider[8], dividend_to_divider[0]}),
        .quotient_reg[3][3:0]({o_quotient[3], o_quotient[2], o_quotient[1], o_quotient[0]}),
        .state_reg_reg[1]_0[1:0]({state_reg_reg_n_0_[1], state_reg_reg_n_0_[0]})
    );
    LUT3 divisor_to_divider[31]_i_1
    (
        .O(divisor_to_divider0),
        .I0(latch_divisor_button_IBUF),
        .I1(state_reg_reg_n_0_[1]),
        .I2(state_reg_reg_n_0_[0])
    );
    FDCE divisor_to_divider_reg[0]
    (
        .Q(divisor_to_divider[0]),
        .C(i_clk_BUFG),
        .CE(divisor_to_divider0),
        .CLR(i_rst),
        .D(sw_IBUF[3])
    );
    FDCE divisor_to_divider_reg[22]
    (
        .Q(divisor_to_divider[22]),
        .C(i_clk_BUFG),
        .CE(divisor_to_divider0),
        .CLR(i_rst),
        .D(sw_IBUF[1])
    );
    FDCE divisor_to_divider_reg[31]
    (
        .Q(divisor_to_divider[31]),
        .C(i_clk_BUFG),
        .CE(divisor_to_divider0),
        .CLR(i_rst),
        .D(sw_IBUF[0])
    );
    FDCE divisor_to_divider_reg[8]
    (
        .Q(divisor_to_divider[8]),
        .C(i_clk_BUFG),
        .CE(divisor_to_divider0),
        .CLR(i_rst),
        .D(sw_IBUF[2])
    );
    BUFG i_clk_BUFG_inst
    (
        .O(i_clk_BUFG),
        .I(i_clk)
    );
    IBUF latch_dividend_button_IBUF_inst
    (
        .O(latch_dividend_button_IBUF),
        .I(latch_dividend_button)
    );
    IBUF latch_divisor_button_IBUF_inst
    (
        .O(latch_divisor_button_IBUF),
        .I(latch_divisor_button)
    );
    OBUF led_OBUF[0]_inst
    (
        .O(led[0]),
        .I(led_OBUF[0])
    );
    LUT2 led_OBUF[0]_inst_i_1
    (
        .O(led_OBUF[0]),
        .I0(state_reg_reg_n_0_[1]),
        .I1(state_reg_reg_n_0_[0])
    );
    OBUF led_OBUF[1]_inst
    (
        .O(led[1]),
        .I(led_OBUF[1])
    );
    LUT2 led_OBUF[1]_inst_i_1
    (
        .O(led_OBUF[1]),
        .I0(state_reg_reg_n_0_[0]),
        .I1(state_reg_reg_n_0_[1])
    );
    OBUF led_OBUF[2]_inst
    (
        .O(led[2]),
        .I(<const0>)
    );
    OBUF led_OBUF[3]_inst
    (
        .O(led[3]),
        .I(<const0>)
    );
    OBUF led_OBUF[4]_inst
    (
        .O(led[4]),
        .I(led_OBUF[4])
    );
    OBUF led_OBUF[5]_inst
    (
        .O(led[5]),
        .I(led_OBUF[5])
    );
    OBUF led_OBUF[6]_inst
    (
        .O(led[6]),
        .I(led_OBUF[6])
    );
    OBUF led_OBUF[7]_inst
    (
        .O(led[7]),
        .I(led_OBUF[7])
    );
    LUT2 quotient[3]_i_2
    (
        .O(i_rst),
        .I0(state_reg_reg_n_0_[0]),
        .I1(state_reg_reg_n_0_[1])
    );
    FDCE quotient_reg[0]
    (
        .Q(led_OBUF[4]),
        .C(i_clk_BUFG),
        .CE(quotient0),
        .CLR(i_rst),
        .D(o_quotient[0])
    );
    FDCE quotient_reg[1]
    (
        .Q(led_OBUF[5]),
        .C(i_clk_BUFG),
        .CE(quotient0),
        .CLR(i_rst),
        .D(o_quotient[1])
    );
    FDCE quotient_reg[2]
    (
        .Q(led_OBUF[6]),
        .C(i_clk_BUFG),
        .CE(quotient0),
        .CLR(i_rst),
        .D(o_quotient[2])
    );
    FDCE quotient_reg[3]
    (
        .Q(led_OBUF[7]),
        .C(i_clk_BUFG),
        .CE(quotient0),
        .CLR(i_rst),
        .D(o_quotient[3])
    );
    IBUF ready_button_IBUF_inst
    (
        .O(ready_button_IBUF),
        .I(ready_button)
    );
    IBUF rst_IBUF_inst
    (
        .O(rst_IBUF),
        .I(rst)
    );
    LUT3 state_reg[1]_i_1__0
    (
        .O(state_reg[1]_i_1__0_n_0),
        .I0(ready_button_IBUF),
        .I1(state_reg_reg_n_0_[1]),
        .I2(state_reg_reg_n_0_[0])
    );
    LUT1 state_reg[1]_i_2__0
    (
        .O(state_next),
        .I0(state_reg_reg_n_0_[1])
    );
    FDCE state_reg_reg[0]
    (
        .Q(state_reg_reg_n_0_[0]),
        .C(i_clk_BUFG),
        .CE(state_reg[1]_i_1__0_n_0),
        .CLR(rst_IBUF),
        .D(led_OBUF[0])
    );
    FDCE state_reg_reg[1]
    (
        .Q(state_reg_reg_n_0_[1]),
        .C(i_clk_BUFG),
        .CE(state_reg[1]_i_1__0_n_0),
        .CLR(rst_IBUF),
        .D(state_next)
    );
    IBUF sw_IBUF[0]_inst
    (
        .O(sw_IBUF[0]),
        .I(sw[0])
    );
    IBUF sw_IBUF[1]_inst
    (
        .O(sw_IBUF[1]),
        .I(sw[1])
    );
    IBUF sw_IBUF[2]_inst
    (
        .O(sw_IBUF[2]),
        .I(sw[2])
    );
    IBUF sw_IBUF[3]_inst
    (
        .O(sw_IBUF[3]),
        .I(sw[3])
    );
endmodule

module GND
(
    G
);

    output G;


endmodule

module IBUFDS
(
    O,
    I,
    IB
);

    output O;
    input I;
    input IB;


endmodule

module LUT3
(
    O,
    I0,
    I1,
    I2
);

    output O;
    input I0;
    input I1;
    input I2;


endmodule

module FDCE
(
    Q,
    C,
    CE,
    CLR,
    D
);

    output Q;
    input C;
    input CE;
    input CLR;
    input D;


endmodule

module divider_dshift
(
    CLK,
    ready_button_IBUF,
    .E[0]({E}),
    .Q[3:0]({Q[3], Q[2], Q[1], Q[0]}),
    .dividend_to_divider_reg[31][3:0]({dividend_to_divider_reg[31][3], dividend_to_divider_reg[31][2], dividend_to_divider_reg[31][1], dividend_to_divider_reg[31][0]}),
    .quotient_reg[3][3:0]({quotient_reg[3][3], quotient_reg[3][2], quotient_reg[3][1], quotient_reg[3][0]}),
    .state_reg_reg[1]_0[1:0]({state_reg_reg[1]_0[1], state_reg_reg[1]_0[0]})
);

    input CLK;
    input ready_button_IBUF;
    output E;
    input [3:0]Q;
    input [3:0]dividend_to_divider_reg[31];
    output [3:0]quotient_reg[3];
    input [1:0]state_reg_reg[1]_0;

    wire <const0>;
    wire <const1>;
    wire CLK;
    wire DD_sign;
    wire DD_sign_i_1_n_0;
    wire DD_sign_i_2_n_0;
    wire DR[31]_i_1_n_0;
    wire DR[31]_i_2_n_0;
    wire [31:0]DR_reg_n_0_;
    wire E;
    wire PR[0]_i_1_n_0;
    wire PR[1]_i_2_n_0;
    wire PR[1]_i_3_n_0;
    wire PR[1]_i_4_n_0;
    wire PR[20]_i_2_n_0;
    wire PR[29]_i_2_n_0;
    wire PR[29]_i_3_n_0;
    wire PR[2]_i_2_n_0;
    wire PR[2]_i_3_n_0;
    wire PR[30]_i_10_n_0;
    wire PR[30]_i_11_n_0;
    wire PR[30]_i_12_n_0;
    wire PR[30]_i_13_n_0;
    wire PR[30]_i_14_n_0;
    wire PR[30]_i_15_n_0;
    wire PR[30]_i_16_n_0;
    wire PR[30]_i_17_n_0;
    wire PR[30]_i_18_n_0;
    wire PR[30]_i_19_n_0;
    wire PR[30]_i_1_n_0;
    wire PR[30]_i_20_n_0;
    wire PR[30]_i_21_n_0;
    wire PR[30]_i_22_n_0;
    wire PR[30]_i_23_n_0;
    wire PR[30]_i_24_n_0;
    wire PR[30]_i_25_n_0;
    wire PR[30]_i_2_n_0;
    wire PR[30]_i_3_n_0;
    wire PR[30]_i_4_n_0;
    wire PR[30]_i_5_n_0;
    wire PR[30]_i_6_n_0;
    wire PR[30]_i_7_n_0;
    wire PR[30]_i_8_n_0;
    wire PR[30]_i_9_n_0;
    wire PR[31]_i_1_n_0;
    wire PR[7]_i_10_n_0;
    wire PR[7]_i_11_n_0;
    wire PR[7]_i_12_n_0;
    wire PR[7]_i_13_n_0;
    wire PR[7]_i_2_n_0;
    wire PR[7]_i_3_n_0;
    wire PR[7]_i_4_n_0;
    wire PR[7]_i_5_n_0;
    wire PR[7]_i_6_n_0;
    wire PR[7]_i_7_n_0;
    wire PR[7]_i_8_n_0;
    wire PR[7]_i_9_n_0;
    wire PR_1[0]_i_1_n_0;
    wire PR_1[0]_i_2_n_0;
    wire PR_1[0]_i_3_n_0;
    wire PR_1[0]_i_4_n_0;
    wire PR_1[0]_i_5_n_0;
    wire PR_1[0]_i_6_n_0;
    wire PR_1[0]_i_7_n_0;
    wire PR_1[0]_i_8_n_0;
    wire PR_1[10]_i_1_n_0;
    wire PR_1[10]_i_2_n_0;
    wire PR_1[10]_i_3_n_0;
    wire PR_1[10]_i_4_n_0;
    wire PR_1[11]_i_1_n_0;
    wire PR_1[11]_i_2_n_0;
    wire PR_1[11]_i_3_n_0;
    wire PR_1[11]_i_4_n_0;
    wire PR_1[11]_i_5_n_0;
    wire PR_1[12]_i_1_n_0;
    wire PR_1[12]_i_2_n_0;
    wire PR_1[12]_i_3_n_0;
    wire PR_1[12]_i_4_n_0;
    wire PR_1[12]_i_5_n_0;
    wire PR_1[13]_i_1_n_0;
    wire PR_1[13]_i_2_n_0;
    wire PR_1[13]_i_3_n_0;
    wire PR_1[13]_i_4_n_0;
    wire PR_1[13]_i_5_n_0;
    wire PR_1[14]_i_1_n_0;
    wire PR_1[14]_i_2_n_0;
    wire PR_1[14]_i_3_n_0;
    wire PR_1[14]_i_4_n_0;
    wire PR_1[14]_i_5_n_0;
    wire PR_1[15]_i_1_n_0;
    wire PR_1[15]_i_2_n_0;
    wire PR_1[15]_i_3_n_0;
    wire PR_1[15]_i_4_n_0;
    wire PR_1[15]_i_5_n_0;
    wire PR_1[16]_i_1_n_0;
    wire PR_1[16]_i_2_n_0;
    wire PR_1[16]_i_3_n_0;
    wire PR_1[16]_i_4_n_0;
    wire PR_1[16]_i_5_n_0;
    wire PR_1[17]_i_1_n_0;
    wire PR_1[17]_i_2_n_0;
    wire PR_1[17]_i_3_n_0;
    wire PR_1[17]_i_4_n_0;
    wire PR_1[17]_i_5_n_0;
    wire PR_1[18]_i_1_n_0;
    wire PR_1[18]_i_2_n_0;
    wire PR_1[18]_i_3_n_0;
    wire PR_1[18]_i_4_n_0;
    wire PR_1[18]_i_5_n_0;
    wire PR_1[19]_i_1_n_0;
    wire PR_1[19]_i_2_n_0;
    wire PR_1[19]_i_3_n_0;
    wire PR_1[19]_i_4_n_0;
    wire PR_1[1]_i_1_n_0;
    wire PR_1[1]_i_2_n_0;
    wire PR_1[1]_i_3_n_0;
    wire PR_1[1]_i_4_n_0;
    wire PR_1[1]_i_5_n_0;
    wire PR_1[20]_i_1_n_0;
    wire PR_1[20]_i_2_n_0;
    wire PR_1[20]_i_3_n_0;
    wire PR_1[20]_i_4_n_0;
    wire PR_1[21]_i_1_n_0;
    wire PR_1[21]_i_2_n_0;
    wire PR_1[21]_i_3_n_0;
    wire PR_1[21]_i_4_n_0;
    wire PR_1[22]_i_1_n_0;
    wire PR_1[22]_i_2_n_0;
    wire PR_1[22]_i_3_n_0;
    wire PR_1[22]_i_4_n_0;
    wire PR_1[23]_i_1_n_0;
    wire PR_1[23]_i_2_n_0;
    wire PR_1[23]_i_3_n_0;
    wire PR_1[23]_i_4_n_0;
    wire PR_1[24]_i_1_n_0;
    wire PR_1[24]_i_2_n_0;
    wire PR_1[24]_i_3_n_0;
    wire PR_1[24]_i_4_n_0;
    wire PR_1[25]_i_1_n_0;
    wire PR_1[25]_i_2_n_0;
    wire PR_1[25]_i_3_n_0;
    wire PR_1[25]_i_4_n_0;
    wire PR_1[26]_i_1_n_0;
    wire PR_1[26]_i_2_n_0;
    wire PR_1[26]_i_3_n_0;
    wire PR_1[26]_i_4_n_0;
    wire PR_1[26]_i_5_n_0;
    wire PR_1[26]_i_6_n_0;
    wire PR_1[27]_i_1_n_0;
    wire PR_1[27]_i_2_n_0;
    wire PR_1[27]_i_3_n_0;
    wire PR_1[28]_i_1_n_0;
    wire PR_1[28]_i_2_n_0;
    wire PR_1[28]_i_3_n_0;
    wire PR_1[29]_i_1_n_0;
    wire PR_1[29]_i_2_n_0;
    wire PR_1[29]_i_3_n_0;
    wire PR_1[2]_i_1_n_0;
    wire PR_1[2]_i_2_n_0;
    wire PR_1[2]_i_3_n_0;
    wire PR_1[30]_i_1_n_0;
    wire PR_1[30]_i_2_n_0;
    wire PR_1[30]_i_3_n_0;
    wire PR_1[31]_i_1_n_0;
    wire PR_1[31]_i_2_n_0;
    wire PR_1[31]_i_3_n_0;
    wire PR_1[31]_i_4_n_0;
    wire PR_1[3]_i_1_n_0;
    wire PR_1[3]_i_2_n_0;
    wire PR_1[3]_i_3_n_0;
    wire PR_1[3]_i_4_n_0;
    wire PR_1[3]_i_5_n_0;
    wire PR_1[4]_i_1_n_0;
    wire PR_1[4]_i_2_n_0;
    wire PR_1[4]_i_3_n_0;
    wire PR_1[4]_i_4_n_0;
    wire PR_1[4]_i_5_n_0;
    wire PR_1[5]_i_1_n_0;
    wire PR_1[5]_i_2_n_0;
    wire PR_1[5]_i_3_n_0;
    wire PR_1[5]_i_4_n_0;
    wire PR_1[5]_i_5_n_0;
    wire PR_1[6]_i_1_n_0;
    wire PR_1[6]_i_2_n_0;
    wire PR_1[6]_i_3_n_0;
    wire PR_1[6]_i_4_n_0;
    wire PR_1[6]_i_5_n_0;
    wire PR_1[6]_i_6_n_0;
    wire PR_1[7]_i_1_n_0;
    wire PR_1[7]_i_2_n_0;
    wire PR_1[7]_i_3_n_0;
    wire PR_1[7]_i_4_n_0;
    wire PR_1[7]_i_5_n_0;
    wire PR_1[8]_i_1_n_0;
    wire PR_1[8]_i_2_n_0;
    wire PR_1[8]_i_3_n_0;
    wire PR_1[8]_i_4_n_0;
    wire PR_1[9]_i_1_n_0;
    wire PR_1[9]_i_2_n_0;
    wire PR_1[9]_i_3_n_0;
    wire PR_1[9]_i_4_n_0;
    wire PR_1[9]_i_5_n_0;
    wire [31:0]PR_1_reg_n_0_;
    wire [30:0]PR_reg_n_0_;
    wire [3:0]Q;
    wire q[19]_i_1_n_0;
    wire [30:0]a;
    wire addback_DR;
    wire addback_nDR;
    wire adder_0/o_s0;
    wire adder_0/o_s01_out;
    wire adder_0/o_s04_out;
    wire adder_0/o_s07_out;
    wire [30:0]b;
    wire ct[0]_i_1_n_0;
    wire ct[1]_i_1_n_0;
    wire ct[2]_i_1_n_0;
    wire ct[2]_i_2_n_0;
    wire ct[3]_i_1_n_0;
    wire ct[3]_i_2_n_0;
    wire ct[4]_i_1_n_0;
    wire ct[5]_i_1_n_0;
    wire ct[5]_i_2_n_0;
    wire ct[5]_i_3_n_0;
    wire ct[5]_i_4_n_0;
    wire ct[5]_i_5_n_0;
    wire ct[5]_i_6_n_0;
    wire [5:0]ct_1;
    wire ct_1[0]_i_1_n_0;
    wire ct_1[1]_i_1_n_0;
    wire ct_1[2]_i_1_n_0;
    wire ct_1[3]_i_1_n_0;
    wire ct_1[4]_i_1_n_0;
    wire ct_1[5]_i_1_n_0;
    wire ct_1[5]_i_2_n_0;
    wire ct_1[5]_i_3_n_0;
    wire ct_1[5]_i_4_n_0;
    wire ct_1[5]_i_5_n_0;
    wire ct_1[5]_i_6_n_0;
    wire ct_1[5]_i_7_n_0;
    wire ct_1_en_1;
    wire ct_1_en_1_i_1_n_0;
    wire ct_1_en_i_1_n_0;
    wire ct_1_en_reg_n_0;
    wire [5:0]ct_reg_n_0_;
    wire [3:0]dividend_to_divider_reg[31];
    wire [30:0]final_nq;
    wire nq[0]_i_1_n_0;
    wire nq[10]_i_1_n_0;
    wire nq[11]_i_1_n_0;
    wire nq[12]_i_1_n_0;
    wire nq[13]_i_1_n_0;
    wire nq[14]_i_1_n_0;
    wire nq[15]_i_1_n_0;
    wire nq[15]_i_2_n_0;
    wire nq[16]_i_1_n_0;
    wire nq[17]_i_1_n_0;
    wire nq[18]_i_1_n_0;
    wire nq[19]_i_1_n_0;
    wire nq[1]_i_1_n_0;
    wire nq[20]_i_1_n_0;
    wire nq[21]_i_1_n_0;
    wire nq[22]_i_1_n_0;
    wire nq[23]_i_1_n_0;
    wire nq[23]_i_2_n_0;
    wire nq[23]_i_3_n_0;
    wire nq[24]_i_1_n_0;
    wire nq[24]_i_2_n_0;
    wire nq[25]_i_1_n_0;
    wire nq[25]_i_2_n_0;
    wire nq[26]_i_1_n_0;
    wire nq[26]_i_2_n_0;
    wire nq[27]_i_1_n_0;
    wire nq[27]_i_2_n_0;
    wire nq[28]_i_1_n_0;
    wire nq[28]_i_2_n_0;
    wire nq[29]_i_1_n_0;
    wire nq[29]_i_2_n_0;
    wire nq[2]_i_1_n_0;
    wire nq[30]_i_1_n_0;
    wire nq[30]_i_2_n_0;
    wire nq[30]_i_3_n_0;
    wire nq[30]_i_4_n_0;
    wire nq[30]_i_5_n_0;
    wire nq[30]_i_6_n_0;
    wire nq[30]_i_7_n_0;
    wire nq[3]_i_1_n_0;
    wire nq[4]_i_1_n_0;
    wire nq[5]_i_1_n_0;
    wire nq[6]_i_1_n_0;
    wire nq[7]_i_1_n_0;
    wire nq[7]_i_2_n_0;
    wire nq[8]_i_1_n_0;
    wire nq[9]_i_1_n_0;
    wire [30:0]nq_reg_n_0_;
    wire o_quotient[2]_i_2_n_0;
    wire o_quotient[3]_i_1_n_0;
    wire o_quotient[3]_i_3_n_0;
    wire o_quotient[3]_i_4_n_0;
    wire o_quotient[3]_i_5_n_0;
    wire p_1_in;
    wire q[0]_i_1_n_0;
    wire q[10]_i_1_n_0;
    wire q[11]_i_1_n_0;
    wire q[12]_i_1_n_0;
    wire q[13]_i_1_n_0;
    wire q[14]_i_1_n_0;
    wire q[15]_i_1_n_0;
    wire q[16]_i_1_n_0;
    wire q[17]_i_1_n_0;
    wire q[18]_i_1_n_0;
    wire q[1];
    wire q[1]_i_1_n_0;
    wire q[20]_i_1_n_0;
    wire q[21]_i_1_n_0;
    wire q[22]_i_1_n_0;
    wire q[23]_i_1_n_0;
    wire q[24]_i_1_n_0;
    wire q[25]_i_1_n_0;
    wire q[26]_i_1_n_0;
    wire q[27]_i_1_n_0;
    wire q[28]_i_1_n_0;
    wire q[29]_i_1_n_0;
    wire q[2]_i_1_n_0;
    wire q[30]_i_1_n_0;
    wire q[3]_i_1_n_0;
    wire q[4]_i_1_n_0;
    wire q[5]_i_1_n_0;
    wire q[6]_i_1_n_0;
    wire q[7]_i_1_n_0;
    wire q[8]_i_1_n_0;
    wire q[9]_i_1_n_0;
    wire [30:0]q_reg_n_0_;
    wire [3:0]quotient_reg[3];
    wire ready_button_IBUF;
    wire ready_i_1_n_0;
    wire ready_reg_n_0;
    wire [31:0]reg_a;
    wire reg_a[0]_i_2_n_0;
    wire reg_a[10]_i_2_n_0;
    wire reg_a[11]_i_3_n_0;
    wire reg_a[12]_i_2_n_0;
    wire reg_a[13]_i_2_n_0;
    wire reg_a[14]_i_2_n_0;
    wire reg_a[15]_i_3_n_0;
    wire reg_a[15]_i_4_n_0;
    wire reg_a[16]_i_2_n_0;
    wire reg_a[17]_i_2_n_0;
    wire reg_a[18]_i_2_n_0;
    wire reg_a[19]_i_3_n_0;
    wire reg_a[1]_i_2_n_0;
    wire reg_a[20]_i_2_n_0;
    wire reg_a[21]_i_2_n_0;
    wire reg_a[22]_i_2_n_0;
    wire reg_a[23]_i_3_n_0;
    wire reg_a[23]_i_4_n_0;
    wire reg_a[24]_i_2_n_0;
    wire reg_a[25]_i_2_n_0;
    wire reg_a[26]_i_2_n_0;
    wire reg_a[27]_i_3_n_0;
    wire reg_a[28]_i_2_n_0;
    wire reg_a[29]_i_2_n_0;
    wire reg_a[2]_i_2_n_0;
    wire reg_a[30]_i_3_n_0;
    wire reg_a[31]_i_2_n_0;
    wire reg_a[31]_i_3_n_0;
    wire reg_a[31]_i_4_n_0;
    wire reg_a[31]_i_5_n_0;
    wire reg_a[31]_i_6_n_0;
    wire reg_a[3]_i_2_n_0;
    wire reg_a[3]_i_3_n_0;
    wire reg_a[4]_i_2_n_0;
    wire reg_a[5]_i_2_n_0;
    wire reg_a[6]_i_2_n_0;
    wire reg_a[7]_i_13_n_0;
    wire reg_a[7]_i_3_n_0;
    wire reg_a[7]_i_4_n_0;
    wire reg_a[8]_i_2_n_0;
    wire reg_a[9]_i_2_n_0;
    wire reg_a_reg[11]_i_2_n_0;
    wire reg_a_reg[15]_i_2_n_0;
    wire reg_a_reg[19]_i_2_n_0;
    wire reg_a_reg[23]_i_2_n_0;
    wire reg_a_reg[27]_i_2_n_0;
    wire reg_a_reg[7]_i_2_n_0;
    wire reg_a_reg[7]_i_5_n_0;
    wire [31:0]reg_b;
    wire reg_b[0]_i_2_n_0;
    wire reg_b[1]_i_2_n_0;
    wire reg_b[2]_i_2_n_0;
    wire reg_b[31]_i_1_n_0;
    wire reg_b[31]_i_2_n_0;
    wire reg_b[3]_i_2_n_0;
    wire reg_b[4]_i_2_n_0;
    wire reg_b[5]_i_2_n_0;
    wire reg_b[7]_i_11_n_0;
    wire reg_b_reg[11]_i_2_n_0;
    wire reg_b_reg[11]_i_2_n_4;
    wire reg_b_reg[11]_i_2_n_5;
    wire reg_b_reg[11]_i_2_n_6;
    wire reg_b_reg[11]_i_2_n_7;
    wire reg_b_reg[15]_i_2_n_0;
    wire reg_b_reg[15]_i_2_n_4;
    wire reg_b_reg[15]_i_2_n_5;
    wire reg_b_reg[15]_i_2_n_6;
    wire reg_b_reg[15]_i_2_n_7;
    wire reg_b_reg[19]_i_2_n_0;
    wire reg_b_reg[19]_i_2_n_4;
    wire reg_b_reg[19]_i_2_n_5;
    wire reg_b_reg[19]_i_2_n_6;
    wire reg_b_reg[19]_i_2_n_7;
    wire reg_b_reg[23]_i_2_n_0;
    wire reg_b_reg[23]_i_2_n_4;
    wire reg_b_reg[23]_i_2_n_5;
    wire reg_b_reg[23]_i_2_n_6;
    wire reg_b_reg[23]_i_2_n_7;
    wire reg_b_reg[27]_i_2_n_0;
    wire reg_b_reg[27]_i_2_n_4;
    wire reg_b_reg[27]_i_2_n_5;
    wire reg_b_reg[27]_i_2_n_6;
    wire reg_b_reg[27]_i_2_n_7;
    wire reg_b_reg[30]_i_2_n_5;
    wire reg_b_reg[30]_i_2_n_6;
    wire reg_b_reg[30]_i_2_n_7;
    wire reg_b_reg[7]_i_2_n_0;
    wire reg_b_reg[7]_i_2_n_4;
    wire reg_b_reg[7]_i_2_n_5;
    wire reg_b_reg[7]_i_2_n_6;
    wire reg_b_reg[7]_i_2_n_7;
    wire reg_b_reg[7]_i_3_n_0;
    wire reg_b_reg[7]_i_3_n_4;
    wire reg_b_reg[7]_i_3_n_5;
    wire reg_b_reg[7]_i_3_n_6;
    wire reg_b_reg[7]_i_3_n_7;
    wire reg_carry;
    wire reg_carry_i_1_n_0;
    wire reg_carry_i_2_n_0;
    wire reg_carry_i_4_n_0;
    wire reg_carry_i_5_n_0;
    wire reg_carry_i_6_n_0;
    wire reg_carry_i_7_n_0;
    wire reg_carry_i_8_n_0;
    wire reg_carry_i_9_n_0;
    wire reg_carry_reg_n_0;
    wire sdata[0]_i_1_n_0;
    wire sdata[10]_i_1_n_0;
    wire sdata[10]_i_2_n_0;
    wire sdata[10]_i_3_n_0;
    wire sdata[10]_i_4_n_0;
    wire sdata[11]_i_1_n_0;
    wire sdata[11]_i_2_n_0;
    wire sdata[11]_i_3_n_0;
    wire sdata[12]_i_1_n_0;
    wire sdata[12]_i_2_n_0;
    wire sdata[12]_i_3_n_0;
    wire sdata[12]_i_4_n_0;
    wire sdata[12]_i_5_n_0;
    wire sdata[12]_i_6_n_0;
    wire sdata[12]_i_7_n_0;
    wire sdata[13]_i_1_n_0;
    wire sdata[13]_i_2_n_0;
    wire sdata[13]_i_3_n_0;
    wire sdata[14]_i_10_n_0;
    wire sdata[14]_i_11_n_0;
    wire sdata[14]_i_12_n_0;
    wire sdata[14]_i_1_n_0;
    wire sdata[14]_i_2_n_0;
    wire sdata[14]_i_3_n_0;
    wire sdata[14]_i_4_n_0;
    wire sdata[14]_i_5_n_0;
    wire sdata[14]_i_6_n_0;
    wire sdata[14]_i_7_n_0;
    wire sdata[14]_i_8_n_0;
    wire sdata[14]_i_9_n_0;
    wire sdata[15]_i_1_n_0;
    wire sdata[15]_i_2_n_0;
    wire sdata[15]_i_3_n_0;
    wire sdata[15]_i_4_n_0;
    wire sdata[16]_i_1_n_0;
    wire sdata[16]_i_2_n_0;
    wire sdata[16]_i_3_n_0;
    wire sdata[16]_i_4_n_0;
    wire sdata[16]_i_5_n_0;
    wire sdata[17]_i_1_n_0;
    wire sdata[17]_i_2_n_0;
    wire sdata[17]_i_3_n_0;
    wire sdata[17]_i_4_n_0;
    wire sdata[18]_i_1_n_0;
    wire sdata[18]_i_2_n_0;
    wire sdata[18]_i_3_n_0;
    wire sdata[18]_i_4_n_0;
    wire sdata[18]_i_5_n_0;
    wire sdata[18]_i_6_n_0;
    wire sdata[19]_i_1_n_0;
    wire sdata[19]_i_2_n_0;
    wire sdata[19]_i_3_n_0;
    wire sdata[19]_i_4_n_0;
    wire sdata[19]_i_5_n_0;
    wire sdata[19]_i_6_n_0;
    wire sdata[19]_i_7_n_0;
    wire sdata[1]_i_1_n_0;
    wire sdata[1]_i_2_n_0;
    wire sdata[20]_i_1_n_0;
    wire sdata[20]_i_2_n_0;
    wire sdata[20]_i_3_n_0;
    wire sdata[20]_i_4_n_0;
    wire sdata[20]_i_5_n_0;
    wire sdata[20]_i_6_n_0;
    wire sdata[20]_i_7_n_0;
    wire sdata[20]_i_8_n_0;
    wire sdata[21]_i_1_n_0;
    wire sdata[21]_i_2_n_0;
    wire sdata[21]_i_3_n_0;
    wire sdata[21]_i_4_n_0;
    wire sdata[21]_i_5_n_0;
    wire sdata[21]_i_6_n_0;
    wire sdata[21]_i_7_n_0;
    wire sdata[21]_i_8_n_0;
    wire sdata[22]_i_1_n_0;
    wire sdata[22]_i_2_n_0;
    wire sdata[22]_i_3_n_0;
    wire sdata[22]_i_4_n_0;
    wire sdata[22]_i_5_n_0;
    wire sdata[22]_i_6_n_0;
    wire sdata[23]_i_1_n_0;
    wire sdata[23]_i_2_n_0;
    wire sdata[23]_i_3_n_0;
    wire sdata[23]_i_4_n_0;
    wire sdata[23]_i_5_n_0;
    wire sdata[24]_i_1_n_0;
    wire sdata[24]_i_2_n_0;
    wire sdata[24]_i_3_n_0;
    wire sdata[24]_i_4_n_0;
    wire sdata[24]_i_5_n_0;
    wire sdata[24]_i_6_n_0;
    wire sdata[25]_i_1_n_0;
    wire sdata[25]_i_2_n_0;
    wire sdata[25]_i_3_n_0;
    wire sdata[25]_i_4_n_0;
    wire sdata[25]_i_5_n_0;
    wire sdata[25]_i_6_n_0;
    wire sdata[25]_i_7_n_0;
    wire sdata[25]_i_8_n_0;
    wire sdata[26]_i_10_n_0;
    wire sdata[26]_i_11_n_0;
    wire sdata[26]_i_12_n_0;
    wire sdata[26]_i_13_n_0;
    wire sdata[26]_i_1_n_0;
    wire sdata[26]_i_2_n_0;
    wire sdata[26]_i_3_n_0;
    wire sdata[26]_i_4_n_0;
    wire sdata[26]_i_5_n_0;
    wire sdata[26]_i_6_n_0;
    wire sdata[26]_i_7_n_0;
    wire sdata[26]_i_8_n_0;
    wire sdata[26]_i_9_n_0;
    wire sdata[27]_i_1_n_0;
    wire sdata[27]_i_2_n_0;
    wire sdata[27]_i_3_n_0;
    wire sdata[27]_i_4_n_0;
    wire sdata[27]_i_5_n_0;
    wire sdata[27]_i_6_n_0;
    wire sdata[27]_i_7_n_0;
    wire sdata[28]_i_10_n_0;
    wire sdata[28]_i_11_n_0;
    wire sdata[28]_i_12_n_0;
    wire sdata[28]_i_1_n_0;
    wire sdata[28]_i_2_n_0;
    wire sdata[28]_i_3_n_0;
    wire sdata[28]_i_4_n_0;
    wire sdata[28]_i_5_n_0;
    wire sdata[28]_i_6_n_0;
    wire sdata[28]_i_7_n_0;
    wire sdata[28]_i_8_n_0;
    wire sdata[28]_i_9_n_0;
    wire sdata[29]_i_10_n_0;
    wire sdata[29]_i_11_n_0;
    wire sdata[29]_i_12_n_0;
    wire sdata[29]_i_13_n_0;
    wire sdata[29]_i_14_n_0;
    wire sdata[29]_i_15_n_0;
    wire sdata[29]_i_16_n_0;
    wire sdata[29]_i_17_n_0;
    wire sdata[29]_i_18_n_0;
    wire sdata[29]_i_19_n_0;
    wire sdata[29]_i_1_n_0;
    wire sdata[29]_i_20_n_0;
    wire sdata[29]_i_21_n_0;
    wire sdata[29]_i_22_n_0;
    wire sdata[29]_i_23_n_0;
    wire sdata[29]_i_2_n_0;
    wire sdata[29]_i_3_n_0;
    wire sdata[29]_i_4_n_0;
    wire sdata[29]_i_5_n_0;
    wire sdata[29]_i_6_n_0;
    wire sdata[29]_i_7_n_0;
    wire sdata[29]_i_8_n_0;
    wire sdata[29]_i_9_n_0;
    wire sdata[2]_i_1_n_0;
    wire sdata[2]_i_2_n_0;
    wire sdata[2]_i_3_n_0;
    wire sdata[30]_i_10_n_0;
    wire sdata[30]_i_11_n_0;
    wire sdata[30]_i_12_n_0;
    wire sdata[30]_i_13_n_0;
    wire sdata[30]_i_14_n_0;
    wire sdata[30]_i_15_n_0;
    wire sdata[30]_i_16_n_0;
    wire sdata[30]_i_1_n_0;
    wire sdata[30]_i_2_n_0;
    wire sdata[30]_i_3_n_0;
    wire sdata[30]_i_4_n_0;
    wire sdata[30]_i_5_n_0;
    wire sdata[30]_i_6_n_0;
    wire sdata[30]_i_7_n_0;
    wire sdata[30]_i_8_n_0;
    wire sdata[30]_i_9_n_0;
    wire sdata[31]_i_10_n_0;
    wire sdata[31]_i_11_n_0;
    wire sdata[31]_i_12_n_0;
    wire sdata[31]_i_13_n_0;
    wire sdata[31]_i_14_n_0;
    wire sdata[31]_i_15_n_0;
    wire sdata[31]_i_16_n_0;
    wire sdata[31]_i_17_n_0;
    wire sdata[31]_i_18_n_0;
    wire sdata[31]_i_19_n_0;
    wire sdata[31]_i_1_n_0;
    wire sdata[31]_i_20_n_0;
    wire sdata[31]_i_21_n_0;
    wire sdata[31]_i_22_n_0;
    wire sdata[31]_i_23_n_0;
    wire sdata[31]_i_24_n_0;
    wire sdata[31]_i_25_n_0;
    wire sdata[31]_i_26_n_0;
    wire sdata[31]_i_27_n_0;
    wire sdata[31]_i_28_n_0;
    wire sdata[31]_i_29_n_0;
    wire sdata[31]_i_2_n_0;
    wire sdata[31]_i_3_n_0;
    wire sdata[31]_i_4_n_0;
    wire sdata[31]_i_5_n_0;
    wire sdata[31]_i_6_n_0;
    wire sdata[31]_i_7_n_0;
    wire sdata[31]_i_8_n_0;
    wire sdata[31]_i_9_n_0;
    wire sdata[3]_i_1_n_0;
    wire sdata[3]_i_2_n_0;
    wire sdata[3]_i_3_n_0;
    wire sdata[3]_i_4_n_0;
    wire sdata[3]_i_5_n_0;
    wire sdata[4]_i_1_n_0;
    wire sdata[4]_i_3_n_0;
    wire sdata[4]_i_4_n_0;
    wire sdata[4]_i_5_n_0;
    wire sdata[5]_i_1_n_0;
    wire sdata[5]_i_2_n_0;
    wire sdata[5]_i_3_n_0;
    wire sdata[6]_i_1_n_0;
    wire sdata[6]_i_2_n_0;
    wire sdata[7]_i_1_n_0;
    wire sdata[7]_i_2_n_0;
    wire sdata[7]_i_3_n_0;
    wire sdata[7]_i_4_n_0;
    wire sdata[7]_i_5_n_0;
    wire sdata[7]_i_6_n_0;
    wire sdata[7]_i_7_n_0;
    wire sdata[8]_i_1_n_0;
    wire sdata[8]_i_2_n_0;
    wire sdata[8]_i_3_n_0;
    wire sdata[9]_i_1_n_0;
    wire sdata[9]_i_2_n_0;
    wire sdata[9]_i_3_n_0;
    wire [31:1]sdata_o;
    wire [30:0]sdata_reg_n_0_;
    wire shifted[0]_i_1_n_0;
    wire shifted[0]_i_2_n_0;
    wire shifted[0]_i_3_n_0;
    wire shifted[1]_i_1_n_0;
    wire shifted[1]_i_2_n_0;
    wire shifted[1]_i_3_n_0;
    wire shifted[2]_i_1_n_0;
    wire shifted[3]_i_1_n_0;
    wire shifted[3]_i_2_n_0;
    wire shifted[3]_i_3_n_0;
    wire shifted[3]_i_4_n_0;
    wire shifted[3]_i_5_n_0;
    wire shifted_1[3]_i_1_n_0;
    wire shifted_1[3]_i_2_n_0;
    wire shifted_1[3]_i_3_n_0;
    wire [3:0]shifted_1_reg_n_0_;
    wire [3:0]shifted_reg_n_0_;
    wire state[5]_i_1_n_0;
    wire state[5]_i_2_n_0;
    wire state[5]_i_3_n_0;
    wire state[5]_i_4_n_0;
    wire state[5]_i_5_n_0;
    wire state[5]_i_6_n_0;
    wire state[5]_i_7_n_0;
    wire state_reg[0]_i_1_n_0;
    wire state_reg[1]_i_1_n_0;
    wire state_reg[1]_i_2_n_0;
    wire state_reg[1]_i_3_n_0;
    wire [5:0]state_reg_n_0_;
    wire [1:0]state_reg_reg[1]_0;
    wire [1:0]state_reg_reg_n_0_;

    LUT6 DD_sign_i_1
    (
        .O(DD_sign_i_1_n_0),
        .I0(dividend_to_divider_reg[31][3]),
        .I1(DD_sign_i_2_n_0),
        .I2(state_reg_n_0_[4]),
        .I3(state_reg_n_0_[3]),
        .I4(state_reg_n_0_[1]),
        .I5(DD_sign)
    );
    LUT5 DD_sign_i_2
    (
        .O(DD_sign_i_2_n_0),
        .I0(state_reg_n_0_[5]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(state_reg_n_0_[2]),
        .I3(state_reg_n_0_[0]),
        .I4(state_reg_reg_n_0_[1])
    );
    FDCE DD_sign_reg
    (
        .Q(DD_sign),
        .C(CLK),
        .CE(<const1>),
        .CLR(PR[20]_i_2_n_0),
        .D(DD_sign_i_1_n_0)
    );
    LUT6 DR[31]_i_1
    (
        .O(DR[31]_i_1_n_0),
        .I0(state_reg_n_0_[1]),
        .I1(state_reg_n_0_[0]),
        .I2(DR[31]_i_2_n_0),
        .I3(state[5]_i_5_n_0),
        .I4(state_reg_n_0_[5]),
        .I5(state_reg_n_0_[2])
    );
    LUT4 DR[31]_i_2
    (
        .O(DR[31]_i_2_n_0),
        .I0(state_reg_n_0_[3]),
        .I1(state_reg_n_0_[4]),
        .I2(state_reg_reg_n_0_[0]),
        .I3(state_reg_reg_n_0_[1])
    );
    FDCE DR_reg[0]
    (
        .Q(DR_reg_n_0_[0]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[0])
    );
    FDCE DR_reg[10]
    (
        .Q(DR_reg_n_0_[10]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[10])
    );
    FDCE DR_reg[11]
    (
        .Q(DR_reg_n_0_[11]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[11])
    );
    FDCE DR_reg[12]
    (
        .Q(DR_reg_n_0_[12]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[12])
    );
    FDCE DR_reg[13]
    (
        .Q(DR_reg_n_0_[13]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[13])
    );
    FDCE DR_reg[14]
    (
        .Q(DR_reg_n_0_[14]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[14])
    );
    FDCE DR_reg[15]
    (
        .Q(DR_reg_n_0_[15]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[15])
    );
    FDCE DR_reg[16]
    (
        .Q(DR_reg_n_0_[16]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[16])
    );
    FDCE DR_reg[17]
    (
        .Q(DR_reg_n_0_[17]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[17])
    );
    FDCE DR_reg[18]
    (
        .Q(DR_reg_n_0_[18]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[18])
    );
    FDCE DR_reg[19]
    (
        .Q(DR_reg_n_0_[19]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[19])
    );
    FDCE DR_reg[1]
    (
        .Q(DR_reg_n_0_[1]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[1])
    );
    FDCE DR_reg[20]
    (
        .Q(DR_reg_n_0_[20]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[20])
    );
    FDCE DR_reg[21]
    (
        .Q(DR_reg_n_0_[21]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[21])
    );
    FDCE DR_reg[22]
    (
        .Q(DR_reg_n_0_[22]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[22])
    );
    FDCE DR_reg[23]
    (
        .Q(DR_reg_n_0_[23]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[23])
    );
    FDCE DR_reg[24]
    (
        .Q(DR_reg_n_0_[24]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[24])
    );
    FDCE DR_reg[25]
    (
        .Q(DR_reg_n_0_[25]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[25])
    );
    FDCE DR_reg[26]
    (
        .Q(DR_reg_n_0_[26]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[26])
    );
    FDCE DR_reg[27]
    (
        .Q(DR_reg_n_0_[27]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[27])
    );
    FDCE DR_reg[28]
    (
        .Q(DR_reg_n_0_[28]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[28])
    );
    FDCE DR_reg[29]
    (
        .Q(DR_reg_n_0_[29]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[29])
    );
    FDCE DR_reg[2]
    (
        .Q(DR_reg_n_0_[2]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[2])
    );
    FDCE DR_reg[30]
    (
        .Q(DR_reg_n_0_[30]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[30])
    );
    FDCE DR_reg[31]
    (
        .Q(DR_reg_n_0_[31]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_o[31])
    );
    FDCE DR_reg[3]
    (
        .Q(DR_reg_n_0_[3]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[3])
    );
    FDCE DR_reg[4]
    (
        .Q(DR_reg_n_0_[4]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[4])
    );
    FDCE DR_reg[5]
    (
        .Q(DR_reg_n_0_[5]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[5])
    );
    FDCE DR_reg[6]
    (
        .Q(DR_reg_n_0_[6]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[6])
    );
    FDCE DR_reg[7]
    (
        .Q(DR_reg_n_0_[7]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[7])
    );
    FDCE DR_reg[8]
    (
        .Q(DR_reg_n_0_[8]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[8])
    );
    FDCE DR_reg[9]
    (
        .Q(DR_reg_n_0_[9]),
        .C(CLK),
        .CE(DR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_reg_n_0_[9])
    );
    GND GND
    (
        .G(<const0>)
    );
    LUT3 PR[0]_i_1
    (
        .O(PR[0]_i_1_n_0),
        .I0(sdata_reg_n_0_[30]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[0])
    );
    LUT3 PR[10]_i_1
    (
        .O(sdata_o[10]),
        .I0(sdata[11]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[10]_i_2_n_0)
    );
    LUT3 PR[11]_i_1
    (
        .O(sdata_o[11]),
        .I0(sdata[12]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[11]_i_2_n_0)
    );
    LUT3 PR[12]_i_1
    (
        .O(sdata_o[12]),
        .I0(sdata[13]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[12]_i_2_n_0)
    );
    LUT3 PR[13]_i_1
    (
        .O(sdata_o[13]),
        .I0(sdata[14]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[13]_i_2_n_0)
    );
    LUT3 PR[14]_i_1
    (
        .O(sdata_o[14]),
        .I0(sdata[15]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[14]_i_2_n_0)
    );
    LUT3 PR[15]_i_1
    (
        .O(sdata_o[15]),
        .I0(sdata[16]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[15]_i_2_n_0)
    );
    LUT3 PR[16]_i_1
    (
        .O(sdata_o[16]),
        .I0(sdata[17]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[16]_i_2_n_0)
    );
    LUT3 PR[17]_i_1
    (
        .O(sdata_o[17]),
        .I0(sdata[18]_i_3_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[17]_i_2_n_0)
    );
    LUT3 PR[18]_i_1
    (
        .O(sdata_o[18]),
        .I0(sdata[19]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[18]_i_3_n_0)
    );
    LUT3 PR[19]_i_1
    (
        .O(sdata_o[19]),
        .I0(sdata[20]_i_3_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[19]_i_2_n_0)
    );
    LUT5 PR[1]_i_1
    (
        .O(sdata_o[1]),
        .I0(sdata[29]_i_3_n_0),
        .I1(PR[1]_i_2_n_0),
        .I2(PR[1]_i_3_n_0),
        .I3(PR[1]_i_4_n_0),
        .I4(PR[2]_i_3_n_0)
    );
    LUT4 PR[1]_i_2
    (
        .O(PR[1]_i_2_n_0),
        .I0(sdata_reg_n_0_[28]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[29]),
        .I3(sdata_reg_n_0_[30])
    );
    LUT4 PR[1]_i_3
    (
        .O(PR[1]_i_3_n_0),
        .I0(sdata_reg_n_0_[1]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[0])
    );
    LUT6 PR[1]_i_4
    (
        .O(PR[1]_i_4_n_0),
        .I0(sdata_reg_n_0_[26]),
        .I1(sdata_reg_n_0_[30]),
        .I2(sdata_o[31]),
        .I3(sdata_reg_n_0_[28]),
        .I4(sdata_reg_n_0_[29]),
        .I5(sdata_reg_n_0_[27])
    );
    LUT3 PR[20]_i_1
    (
        .O(sdata_o[20]),
        .I0(sdata[21]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[20]_i_3_n_0)
    );
    LUT2 PR[20]_i_2
    (
        .O(PR[20]_i_2_n_0),
        .I0(state_reg_reg[1]_0[1]),
        .I1(state_reg_reg[1]_0[0])
    );
    LUT3 PR[21]_i_1
    (
        .O(sdata_o[21]),
        .I0(sdata[22]_i_3_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[21]_i_2_n_0)
    );
    LUT3 PR[22]_i_1
    (
        .O(sdata_o[22]),
        .I0(sdata[23]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[22]_i_3_n_0)
    );
    LUT3 PR[23]_i_1
    (
        .O(sdata_o[23]),
        .I0(sdata[24]_i_3_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[23]_i_2_n_0)
    );
    LUT3 PR[24]_i_1
    (
        .O(sdata_o[24]),
        .I0(sdata[25]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[24]_i_3_n_0)
    );
    LUT3 PR[25]_i_1
    (
        .O(sdata_o[25]),
        .I0(sdata[26]_i_3_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[25]_i_2_n_0)
    );
    LUT3 PR[26]_i_1
    (
        .O(sdata_o[26]),
        .I0(sdata[27]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[26]_i_3_n_0)
    );
    LUT3 PR[27]_i_1
    (
        .O(sdata_o[27]),
        .I0(sdata[28]_i_3_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[27]_i_2_n_0)
    );
    LUT3 PR[28]_i_1
    (
        .O(sdata_o[28]),
        .I0(sdata[29]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[28]_i_3_n_0)
    );
    LUT5 PR[29]_i_1
    (
        .O(sdata_o[29]),
        .I0(PR[29]_i_2_n_0),
        .I1(PR[30]_i_4_n_0),
        .I2(PR[29]_i_3_n_0),
        .I3(sdata[29]_i_3_n_0),
        .I4(sdata[29]_i_2_n_0)
    );
    LUT5 PR[29]_i_2
    (
        .O(PR[29]_i_2_n_0),
        .I0(PR[30]_i_14_n_0),
        .I1(PR[1]_i_4_n_0),
        .I2(PR[30]_i_8_n_0),
        .I3(PR[7]_i_5_n_0),
        .I4(sdata[29]_i_11_n_0)
    );
    LUT5 PR[29]_i_3
    (
        .O(PR[29]_i_3_n_0),
        .I0(PR[30]_i_12_n_0),
        .I1(PR[1]_i_4_n_0),
        .I2(PR[30]_i_13_n_0),
        .I3(PR[7]_i_5_n_0),
        .I4(sdata[29]_i_9_n_0)
    );
    LUT6 PR[2]_i_1
    (
        .O(sdata_o[2]),
        .I0(PR[2]_i_2_n_0),
        .I1(sdata_reg_n_0_[1]),
        .I2(state[5]_i_5_n_0),
        .I3(sdata_reg_n_0_[2]),
        .I4(PR[2]_i_3_n_0),
        .I5(sdata_reg_n_0_[0])
    );
    LUT3 PR[2]_i_2
    (
        .O(PR[2]_i_2_n_0),
        .I0(sdata_reg_n_0_[30]),
        .I1(sdata_reg_n_0_[29]),
        .I2(sdata_o[31])
    );
    LUT4 PR[2]_i_3
    (
        .O(PR[2]_i_3_n_0),
        .I0(sdata_reg_n_0_[30]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[28]),
        .I3(sdata_reg_n_0_[29])
    );
    LUT6 PR[30]_i_1
    (
        .O(PR[30]_i_1_n_0),
        .I0(sdata[29]_i_3_n_0),
        .I1(PR[30]_i_2_n_0),
        .I2(shifted[3]_i_4_n_0),
        .I3(PR[30]_i_3_n_0),
        .I4(PR[30]_i_4_n_0),
        .I5(PR[30]_i_5_n_0)
    );
    LUT5 PR[30]_i_10
    (
        .O(PR[30]_i_10_n_0),
        .I0(sdata_reg_n_0_[22]),
        .I1(PR[2]_i_3_n_0),
        .I2(PR[30]_i_22_n_0),
        .I3(PR[1]_i_2_n_0),
        .I4(PR[30]_i_23_n_0)
    );
    LUT6 PR[30]_i_11
    (
        .O(PR[30]_i_11_n_0),
        .I0(PR[30]_i_20_n_0),
        .I1(PR[30]_i_21_n_0),
        .I2(PR[1]_i_2_n_0),
        .I3(sdata_reg_n_0_[21]),
        .I4(PR[2]_i_3_n_0),
        .I5(PR[30]_i_23_n_0)
    );
    LUT6 PR[30]_i_12
    (
        .O(PR[30]_i_12_n_0),
        .I0(sdata_reg_n_0_[22]),
        .I1(PR[30]_i_22_n_0),
        .I2(PR[1]_i_2_n_0),
        .I3(sdata_reg_n_0_[23]),
        .I4(PR[2]_i_3_n_0),
        .I5(PR[30]_i_24_n_0)
    );
    LUT6 PR[30]_i_13
    (
        .O(PR[30]_i_13_n_0),
        .I0(PR[30]_i_25_n_0),
        .I1(PR[30]_i_23_n_0),
        .I2(sdata[29]_i_7_n_0),
        .I3(PR[30]_i_17_n_0),
        .I4(PR[1]_i_2_n_0),
        .I5(PR[30]_i_15_n_0)
    );
    LUT5 PR[30]_i_14
    (
        .O(PR[30]_i_14_n_0),
        .I0(PR[30]_i_12_n_0),
        .I1(sdata[29]_i_7_n_0),
        .I2(PR[30]_i_15_n_0),
        .I3(PR[1]_i_2_n_0),
        .I4(PR[30]_i_16_n_0)
    );
    LUT6 PR[30]_i_15
    (
        .O(PR[30]_i_15_n_0),
        .I0(sdata_reg_n_0_[24]),
        .I1(PR[2]_i_3_n_0),
        .I2(sdata_reg_n_0_[26]),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[30]),
        .I5(sdata_reg_n_0_[27])
    );
    LUT6 PR[30]_i_16
    (
        .O(PR[30]_i_16_n_0),
        .I0(sdata_reg_n_0_[25]),
        .I1(sdata_reg_n_0_[26]),
        .I2(PR[2]_i_3_n_0),
        .I3(sdata_reg_n_0_[27]),
        .I4(state[5]_i_5_n_0),
        .I5(sdata_reg_n_0_[28])
    );
    LUT6 PR[30]_i_17
    (
        .O(PR[30]_i_17_n_0),
        .I0(sdata_reg_n_0_[23]),
        .I1(PR[2]_i_3_n_0),
        .I2(sdata_reg_n_0_[25]),
        .I3(sdata_reg_n_0_[26]),
        .I4(sdata_o[31]),
        .I5(sdata_reg_n_0_[30])
    );
    LUT5 PR[30]_i_18
    (
        .O(PR[30]_i_18_n_0),
        .I0(sdata_reg_n_0_[26]),
        .I1(sdata_reg_n_0_[30]),
        .I2(sdata_o[31]),
        .I3(sdata_reg_n_0_[28]),
        .I4(sdata_reg_n_0_[29])
    );
    LUT4 PR[30]_i_19
    (
        .O(PR[30]_i_19_n_0),
        .I0(sdata_reg_n_0_[22]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[21])
    );
    LUT6 PR[30]_i_2
    (
        .O(PR[30]_i_2_n_0),
        .I0(PR[7]_i_5_n_0),
        .I1(PR[30]_i_6_n_0),
        .I2(sdata[29]_i_7_n_0),
        .I3(PR[30]_i_7_n_0),
        .I4(PR[1]_i_4_n_0),
        .I5(PR[30]_i_8_n_0)
    );
    LUT4 PR[30]_i_20
    (
        .O(PR[30]_i_20_n_0),
        .I0(sdata_reg_n_0_[21]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[20])
    );
    LUT4 PR[30]_i_21
    (
        .O(PR[30]_i_21_n_0),
        .I0(sdata_reg_n_0_[23]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[22])
    );
    LUT4 PR[30]_i_22
    (
        .O(PR[30]_i_22_n_0),
        .I0(sdata_reg_n_0_[24]),
        .I1(sdata_reg_n_0_[25]),
        .I2(sdata_o[31]),
        .I3(sdata_reg_n_0_[30])
    );
    LUT4 PR[30]_i_23
    (
        .O(PR[30]_i_23_n_0),
        .I0(sdata_reg_n_0_[24]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[23])
    );
    LUT4 PR[30]_i_24
    (
        .O(PR[30]_i_24_n_0),
        .I0(sdata_reg_n_0_[25]),
        .I1(sdata_reg_n_0_[26]),
        .I2(sdata_o[31]),
        .I3(sdata_reg_n_0_[30])
    );
    LUT6 PR[30]_i_25
    (
        .O(PR[30]_i_25_n_0),
        .I0(sdata_reg_n_0_[22]),
        .I1(PR[2]_i_3_n_0),
        .I2(sdata_reg_n_0_[24]),
        .I3(sdata_reg_n_0_[25]),
        .I4(sdata_o[31]),
        .I5(sdata_reg_n_0_[30])
    );
    LUT6 PR[30]_i_3
    (
        .O(PR[30]_i_3_n_0),
        .I0(PR[30]_i_9_n_0),
        .I1(PR[30]_i_10_n_0),
        .I2(PR[1]_i_4_n_0),
        .I3(PR[30]_i_11_n_0),
        .I4(sdata[29]_i_7_n_0),
        .I5(PR[30]_i_12_n_0)
    );
    LUT5 PR[30]_i_4
    (
        .O(PR[30]_i_4_n_0),
        .I0(shifted[3]_i_4_n_0),
        .I1(sdata_reg_n_0_[23]),
        .I2(sdata_o[31]),
        .I3(sdata_reg_n_0_[30]),
        .I4(sdata_reg_n_0_[22])
    );
    LUT5 PR[30]_i_5
    (
        .O(PR[30]_i_5_n_0),
        .I0(PR[30]_i_13_n_0),
        .I1(PR[1]_i_4_n_0),
        .I2(PR[30]_i_14_n_0),
        .I3(PR[7]_i_5_n_0),
        .I4(sdata[27]_i_4_n_0)
    );
    LUT5 PR[30]_i_6
    (
        .O(PR[30]_i_6_n_0),
        .I0(sdata_reg_n_0_[29]),
        .I1(sdata_reg_n_0_[28]),
        .I2(sdata_o[31]),
        .I3(sdata_reg_n_0_[30]),
        .I4(sdata_reg_n_0_[27])
    );
    LUT6 PR[30]_i_7
    (
        .O(PR[30]_i_7_n_0),
        .I0(PR[30]_i_15_n_0),
        .I1(sdata_reg_n_0_[30]),
        .I2(sdata_reg_n_0_[29]),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[28]),
        .I5(PR[30]_i_16_n_0)
    );
    LUT6 PR[30]_i_8
    (
        .O(PR[30]_i_8_n_0),
        .I0(PR[30]_i_17_n_0),
        .I1(PR[30]_i_15_n_0),
        .I2(sdata[29]_i_7_n_0),
        .I3(PR[30]_i_16_n_0),
        .I4(PR[1]_i_2_n_0),
        .I5(PR[30]_i_18_n_0)
    );
    LUT5 PR[30]_i_9
    (
        .O(PR[30]_i_9_n_0),
        .I0(PR[30]_i_19_n_0),
        .I1(PR[1]_i_2_n_0),
        .I2(PR[30]_i_20_n_0),
        .I3(PR[2]_i_3_n_0),
        .I4(PR[30]_i_21_n_0)
    );
    LUT2 PR[31]_i_1
    (
        .O(PR[31]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(state_reg_reg_n_0_[1])
    );
    LUT6 PR[3]_i_1
    (
        .O(sdata_o[3]),
        .I0(sdata_reg_n_0_[30]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[28]),
        .I3(sdata_reg_n_0_[29]),
        .I4(sdata_reg_n_0_[27]),
        .I5(sdata[3]_i_3_n_0)
    );
    LUT2 PR[5]_i_1
    (
        .O(sdata_o[5]),
        .I0(sdata[5]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0)
    );
    LUT5 PR[6]_i_1
    (
        .O(sdata_o[6]),
        .I0(PR[7]_i_4_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(PR[7]_i_5_n_0),
        .I4(PR[7]_i_2_n_0)
    );
    LUT6 PR[7]_i_1
    (
        .O(sdata_o[7]),
        .I0(PR[7]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(PR[7]_i_3_n_0),
        .I3(PR[7]_i_4_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(PR[30]_i_4_n_0)
    );
    LUT4 PR[7]_i_10
    (
        .O(PR[7]_i_10_n_0),
        .I0(sdata_reg_n_0_[22]),
        .I1(sdata_reg_n_0_[30]),
        .I2(sdata_o[31]),
        .I3(sdata_reg_n_0_[23])
    );
    LUT6 PR[7]_i_11
    (
        .O(PR[7]_i_11_n_0),
        .I0(sdata_reg_n_0_[2]),
        .I1(PR[2]_i_3_n_0),
        .I2(sdata_reg_n_0_[5]),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[30]),
        .I5(sdata_reg_n_0_[4])
    );
    LUT6 PR[7]_i_12
    (
        .O(PR[7]_i_12_n_0),
        .I0(sdata_reg_n_0_[3]),
        .I1(PR[2]_i_3_n_0),
        .I2(sdata_reg_n_0_[6]),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[30]),
        .I5(sdata_reg_n_0_[5])
    );
    LUT4 PR[7]_i_13
    (
        .O(PR[7]_i_13_n_0),
        .I0(sdata_reg_n_0_[7]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[6])
    );
    LUT6 PR[7]_i_2
    (
        .O(PR[7]_i_2_n_0),
        .I0(sdata[3]_i_3_n_0),
        .I1(PR[7]_i_6_n_0),
        .I2(PR[1]_i_4_n_0),
        .I3(sdata[4]_i_4_n_0),
        .I4(sdata[29]_i_7_n_0),
        .I5(PR[7]_i_7_n_0)
    );
    LUT6 PR[7]_i_3
    (
        .O(PR[7]_i_3_n_0),
        .I0(sdata[4]_i_4_n_0),
        .I1(PR[7]_i_7_n_0),
        .I2(PR[1]_i_4_n_0),
        .I3(PR[7]_i_6_n_0),
        .I4(sdata[29]_i_7_n_0),
        .I5(PR[7]_i_8_n_0)
    );
    LUT5 PR[7]_i_4
    (
        .O(PR[7]_i_4_n_0),
        .I0(sdata[4]_i_4_n_0),
        .I1(PR[1]_i_4_n_0),
        .I2(sdata[3]_i_3_n_0),
        .I3(sdata[29]_i_7_n_0),
        .I4(PR[7]_i_6_n_0)
    );
    LUT5 PR[7]_i_5
    (
        .O(PR[7]_i_5_n_0),
        .I0(PR[7]_i_9_n_0),
        .I1(sdata_reg_n_0_[29]),
        .I2(sdata_reg_n_0_[28]),
        .I3(sdata_o[31]),
        .I4(PR[7]_i_10_n_0)
    );
    LUT6 PR[7]_i_6
    (
        .O(PR[7]_i_6_n_0),
        .I0(PR[7]_i_11_n_0),
        .I1(sdata[4]_i_5_n_0),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[29]),
        .I4(sdata_o[31]),
        .I5(sdata_reg_n_0_[28])
    );
    LUT6 PR[7]_i_7
    (
        .O(PR[7]_i_7_n_0),
        .I0(PR[7]_i_12_n_0),
        .I1(PR[7]_i_11_n_0),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[29]),
        .I4(sdata_o[31]),
        .I5(sdata_reg_n_0_[28])
    );
    LUT5 PR[7]_i_8
    (
        .O(PR[7]_i_8_n_0),
        .I0(sdata_reg_n_0_[4]),
        .I1(PR[2]_i_3_n_0),
        .I2(PR[7]_i_13_n_0),
        .I3(PR[7]_i_12_n_0),
        .I4(PR[1]_i_2_n_0)
    );
    LUT5 PR[7]_i_9
    (
        .O(PR[7]_i_9_n_0),
        .I0(sdata_reg_n_0_[24]),
        .I1(sdata_reg_n_0_[25]),
        .I2(sdata_o[31]),
        .I3(sdata_reg_n_0_[26]),
        .I4(sdata_reg_n_0_[27])
    );
    LUT3 PR[8]_i_1
    (
        .O(sdata_o[8]),
        .I0(sdata[8]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[9]_i_2_n_0)
    );
    LUT3 PR[9]_i_1
    (
        .O(sdata_o[9]),
        .I0(sdata[10]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[9]_i_2_n_0)
    );
    LUT5 PR_1[0]_i_1
    (
        .O(PR_1[0]_i_1_n_0),
        .I0(sdata_reg_n_0_[0]),
        .I1(PR_1[0]_i_2_n_0),
        .I2(state_reg_reg_n_0_[0]),
        .I3(state_reg_n_0_[3]),
        .I4(dividend_to_divider_reg[31][0])
    );
    LUT6 PR_1[0]_i_2
    (
        .O(PR_1[0]_i_2_n_0),
        .I0(PR_1[0]_i_3_n_0),
        .I1(ct_1[1]),
        .I2(PR_1[0]_i_4_n_0),
        .I3(ct_1[0]),
        .I4(PR_1[1]_i_3_n_0),
        .I5(state_reg_n_0_[3])
    );
    LUT5 PR_1[0]_i_3
    (
        .O(PR_1[0]_i_3_n_0),
        .I0(PR_1[4]_i_4_n_0),
        .I1(ct_1[2]),
        .I2(ct_1[3]),
        .I3(PR_1[0]_i_5_n_0),
        .I4(PR_1[0]_i_6_n_0)
    );
    LUT5 PR_1[0]_i_4
    (
        .O(PR_1[0]_i_4_n_0),
        .I0(PR_1[6]_i_4_n_0),
        .I1(ct_1[2]),
        .I2(PR_1[0]_i_7_n_0),
        .I3(ct_1[3]),
        .I4(PR_1[0]_i_8_n_0)
    );
    LUT5 PR_1[0]_i_5
    (
        .O(PR_1[0]_i_5_n_0),
        .I0(PR_1_reg_n_0_[24]),
        .I1(PR_1_reg_n_0_[8]),
        .I2(ct_1[4]),
        .I3(ct_1[5]),
        .I4(PR_1_reg_n_0_[31])
    );
    LUT6 PR_1[0]_i_6
    (
        .O(PR_1[0]_i_6_n_0),
        .I0(PR_1_reg_n_0_[0]),
        .I1(PR_1_reg_n_0_[16]),
        .I2(ct_1[4]),
        .I3(ct_1[5]),
        .I4(ct_1[3]),
        .I5(PR_1_reg_n_0_[31])
    );
    LUT5 PR_1[0]_i_7
    (
        .O(PR_1[0]_i_7_n_0),
        .I0(PR_1_reg_n_0_[26]),
        .I1(PR_1_reg_n_0_[10]),
        .I2(ct_1[4]),
        .I3(ct_1[5]),
        .I4(PR_1_reg_n_0_[31])
    );
    LUT5 PR_1[0]_i_8
    (
        .O(PR_1[0]_i_8_n_0),
        .I0(PR_1_reg_n_0_[18]),
        .I1(ct_1[4]),
        .I2(ct_1[5]),
        .I3(PR_1_reg_n_0_[2]),
        .I4(PR_1_reg_n_0_[31])
    );
    LUT3 PR_1[10]_i_1
    (
        .O(PR_1[10]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[10]),
        .I2(PR_1[10]_i_2_n_0)
    );
    LUT6 PR_1[10]_i_2
    (
        .O(PR_1[10]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][1]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_1[11]_i_3_n_0),
        .I4(ct_1[0]),
        .I5(PR_1[10]_i_3_n_0)
    );
    LUT6 PR_1[10]_i_3
    (
        .O(PR_1[10]_i_3_n_0),
        .I0(PR_1[16]_i_5_n_0),
        .I1(ct_1[2]),
        .I2(PR_1[12]_i_4_n_0),
        .I3(PR_1[14]_i_4_n_0),
        .I4(PR_1[10]_i_4_n_0),
        .I5(ct_1[1])
    );
    LUT6 PR_1[10]_i_4
    (
        .O(PR_1[10]_i_4_n_0),
        .I0(PR_1_reg_n_0_[31]),
        .I1(ct_1[5]),
        .I2(ct_1[4]),
        .I3(PR_1_reg_n_0_[18]),
        .I4(ct_1[3]),
        .I5(PR_1[0]_i_7_n_0)
    );
    LUT3 PR_1[11]_i_1
    (
        .O(PR_1[11]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[11]),
        .I2(PR_1[11]_i_2_n_0)
    );
    LUT6 PR_1[11]_i_2
    (
        .O(PR_1[11]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][1]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_1[12]_i_3_n_0),
        .I4(ct_1[0]),
        .I5(PR_1[11]_i_3_n_0)
    );
    LUT6 PR_1[11]_i_3
    (
        .O(PR_1[11]_i_3_n_0),
        .I0(PR_1[17]_i_5_n_0),
        .I1(ct_1[2]),
        .I2(PR_1[13]_i_4_n_0),
        .I3(PR_1[15]_i_5_n_0),
        .I4(PR_1[11]_i_4_n_0),
        .I5(ct_1[1])
    );
    LUT6 PR_1[11]_i_4
    (
        .O(PR_1[11]_i_4_n_0),
        .I0(PR_1_reg_n_0_[31]),
        .I1(ct_1[5]),
        .I2(ct_1[4]),
        .I3(PR_1_reg_n_0_[19]),
        .I4(ct_1[3]),
        .I5(PR_1[11]_i_5_n_0)
    );
    LUT5 PR_1[11]_i_5
    (
        .O(PR_1[11]_i_5_n_0),
        .I0(PR_1_reg_n_0_[27]),
        .I1(PR_1_reg_n_0_[11]),
        .I2(ct_1[4]),
        .I3(ct_1[5]),
        .I4(PR_1_reg_n_0_[31])
    );
    LUT3 PR_1[12]_i_1
    (
        .O(PR_1[12]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[12]),
        .I2(PR_1[12]_i_2_n_0)
    );
    LUT6 PR_1[12]_i_2
    (
        .O(PR_1[12]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][1]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_1[13]_i_3_n_0),
        .I4(ct_1[0]),
        .I5(PR_1[12]_i_3_n_0)
    );
    LUT6 PR_1[12]_i_3
    (
        .O(PR_1[12]_i_3_n_0),
        .I0(PR_1[18]_i_5_n_0),
        .I1(ct_1[2]),
        .I2(PR_1[14]_i_4_n_0),
        .I3(PR_1[16]_i_5_n_0),
        .I4(PR_1[12]_i_4_n_0),
        .I5(ct_1[1])
    );
    LUT6 PR_1[12]_i_4
    (
        .O(PR_1[12]_i_4_n_0),
        .I0(PR_1_reg_n_0_[31]),
        .I1(ct_1[5]),
        .I2(ct_1[4]),
        .I3(PR_1_reg_n_0_[20]),
        .I4(ct_1[3]),
        .I5(PR_1[12]_i_5_n_0)
    );
    LUT5 PR_1[12]_i_5
    (
        .O(PR_1[12]_i_5_n_0),
        .I0(PR_1_reg_n_0_[28]),
        .I1(PR_1_reg_n_0_[12]),
        .I2(ct_1[4]),
        .I3(ct_1[5]),
        .I4(PR_1_reg_n_0_[31])
    );
    LUT3 PR_1[13]_i_1
    (
        .O(PR_1[13]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[13]),
        .I2(PR_1[13]_i_2_n_0)
    );
    LUT6 PR_1[13]_i_2
    (
        .O(PR_1[13]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][1]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_1[14]_i_3_n_0),
        .I4(ct_1[0]),
        .I5(PR_1[13]_i_3_n_0)
    );
    LUT6 PR_1[13]_i_3
    (
        .O(PR_1[13]_i_3_n_0),
        .I0(PR_1[15]_i_4_n_0),
        .I1(ct_1[2]),
        .I2(PR_1[15]_i_5_n_0),
        .I3(PR_1[17]_i_5_n_0),
        .I4(PR_1[13]_i_4_n_0),
        .I5(ct_1[1])
    );
    LUT6 PR_1[13]_i_4
    (
        .O(PR_1[13]_i_4_n_0),
        .I0(PR_1_reg_n_0_[31]),
        .I1(ct_1[5]),
        .I2(ct_1[4]),
        .I3(PR_1_reg_n_0_[21]),
        .I4(ct_1[3]),
        .I5(PR_1[13]_i_5_n_0)
    );
    LUT5 PR_1[13]_i_5
    (
        .O(PR_1[13]_i_5_n_0),
        .I0(PR_1_reg_n_0_[29]),
        .I1(PR_1_reg_n_0_[13]),
        .I2(ct_1[4]),
        .I3(ct_1[5]),
        .I4(PR_1_reg_n_0_[31])
    );
    LUT3 PR_1[14]_i_1
    (
        .O(PR_1[14]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[14]),
        .I2(PR_1[14]_i_2_n_0)
    );
    LUT6 PR_1[14]_i_2
    (
        .O(PR_1[14]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][1]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_1[15]_i_3_n_0),
        .I4(ct_1[0]),
        .I5(PR_1[14]_i_3_n_0)
    );
    LUT6 PR_1[14]_i_3
    (
        .O(PR_1[14]_i_3_n_0),
        .I0(PR_1[16]_i_4_n_0),
        .I1(ct_1[2]),
        .I2(PR_1[16]_i_5_n_0),
        .I3(PR_1[18]_i_5_n_0),
        .I4(PR_1[14]_i_4_n_0),
        .I5(ct_1[1])
    );
    LUT6 PR_1[14]_i_4
    (
        .O(PR_1[14]_i_4_n_0),
        .I0(PR_1_reg_n_0_[31]),
        .I1(ct_1[5]),
        .I2(ct_1[4]),
        .I3(PR_1_reg_n_0_[22]),
        .I4(ct_1[3]),
        .I5(PR_1[14]_i_5_n_0)
    );
    LUT5 PR_1[14]_i_5
    (
        .O(PR_1[14]_i_5_n_0),
        .I0(PR_1_reg_n_0_[30]),
        .I1(PR_1_reg_n_0_[14]),
        .I2(ct_1[4]),
        .I3(ct_1[5]),
        .I4(PR_1_reg_n_0_[31])
    );
    LUT3 PR_1[15]_i_1
    (
        .O(PR_1[15]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[15]),
        .I2(PR_1[15]_i_2_n_0)
    );
    LUT6 PR_1[15]_i_2
    (
        .O(PR_1[15]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][1]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(PR_1[16]_i_3_n_0),
        .I3(ct_1[0]),
        .I4(PR_1[15]_i_3_n_0),
        .I5(state_reg_n_0_[3])
    );
    LUT6 PR_1[15]_i_3
    (
        .O(PR_1[15]_i_3_n_0),
        .I0(PR_1[17]_i_4_n_0),
        .I1(PR_1[17]_i_5_n_0),
        .I2(ct_1[1]),
        .I3(PR_1[15]_i_4_n_0),
        .I4(ct_1[2]),
        .I5(PR_1[15]_i_5_n_0)
    );
    LUT6 PR_1[15]_i_4
    (
        .O(PR_1[15]_i_4_n_0),
        .I0(PR_1_reg_n_0_[27]),
        .I1(ct_1[3]),
        .I2(PR_1_reg_n_0_[31]),
        .I3(ct_1[5]),
        .I4(ct_1[4]),
        .I5(PR_1_reg_n_0_[19])
    );
    LUT6 PR_1[15]_i_5
    (
        .O(PR_1[15]_i_5_n_0),
        .I0(PR_1_reg_n_0_[23]),
        .I1(ct_1[3]),
        .I2(PR_1_reg_n_0_[31]),
        .I3(ct_1[5]),
        .I4(ct_1[4]),
        .I5(PR_1_reg_n_0_[15])
    );
    LUT3 PR_1[16]_i_1
    (
        .O(PR_1[16]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[16]),
        .I2(PR_1[16]_i_2_n_0)
    );
    LUT6 PR_1[16]_i_2
    (
        .O(PR_1[16]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][2]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(PR_1[17]_i_3_n_0),
        .I3(ct_1[0]),
        .I4(PR_1[16]_i_3_n_0),
        .I5(state_reg_n_0_[3])
    );
    LUT6 PR_1[16]_i_3
    (
        .O(PR_1[16]_i_3_n_0),
        .I0(PR_1[18]_i_4_n_0),
        .I1(PR_1[18]_i_5_n_0),
        .I2(ct_1[1]),
        .I3(PR_1[16]_i_4_n_0),
        .I4(ct_1[2]),
        .I5(PR_1[16]_i_5_n_0)
    );
    LUT6 PR_1[16]_i_4
    (
        .O(PR_1[16]_i_4_n_0),
        .I0(PR_1_reg_n_0_[28]),
        .I1(ct_1[3]),
        .I2(PR_1_reg_n_0_[31]),
        .I3(ct_1[5]),
        .I4(ct_1[4]),
        .I5(PR_1_reg_n_0_[20])
    );
    LUT6 PR_1[16]_i_5
    (
        .O(PR_1[16]_i_5_n_0),
        .I0(PR_1_reg_n_0_[24]),
        .I1(ct_1[3]),
        .I2(PR_1_reg_n_0_[31]),
        .I3(ct_1[5]),
        .I4(ct_1[4]),
        .I5(PR_1_reg_n_0_[16])
    );
    LUT3 PR_1[17]_i_1
    (
        .O(PR_1[17]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[17]),
        .I2(PR_1[17]_i_2_n_0)
    );
    LUT6 PR_1[17]_i_2
    (
        .O(PR_1[17]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][2]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(PR_1[18]_i_3_n_0),
        .I3(ct_1[0]),
        .I4(PR_1[17]_i_3_n_0),
        .I5(state_reg_n_0_[3])
    );
    LUT5 PR_1[17]_i_3
    (
        .O(PR_1[17]_i_3_n_0),
        .I0(PR_1[17]_i_4_n_0),
        .I1(ct_1[2]),
        .I2(PR_1[17]_i_5_n_0),
        .I3(PR_1[19]_i_4_n_0),
        .I4(ct_1[1])
    );
    LUT6 PR_1[17]_i_4
    (
        .O(PR_1[17]_i_4_n_0),
        .I0(PR_1_reg_n_0_[29]),
        .I1(ct_1[3]),
        .I2(PR_1_reg_n_0_[31]),
        .I3(ct_1[5]),
        .I4(ct_1[4]),
        .I5(PR_1_reg_n_0_[21])
    );
    LUT6 PR_1[17]_i_5
    (
        .O(PR_1[17]_i_5_n_0),
        .I0(PR_1_reg_n_0_[25]),
        .I1(ct_1[3]),
        .I2(PR_1_reg_n_0_[31]),
        .I3(ct_1[5]),
        .I4(ct_1[4]),
        .I5(PR_1_reg_n_0_[17])
    );
    LUT3 PR_1[18]_i_1
    (
        .O(PR_1[18]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[18]),
        .I2(PR_1[18]_i_2_n_0)
    );
    LUT6 PR_1[18]_i_2
    (
        .O(PR_1[18]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][2]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(PR_1[19]_i_3_n_0),
        .I3(ct_1[0]),
        .I4(PR_1[18]_i_3_n_0),
        .I5(state_reg_n_0_[3])
    );
    LUT5 PR_1[18]_i_3
    (
        .O(PR_1[18]_i_3_n_0),
        .I0(PR_1[18]_i_4_n_0),
        .I1(ct_1[2]),
        .I2(PR_1[18]_i_5_n_0),
        .I3(PR_1[20]_i_4_n_0),
        .I4(ct_1[1])
    );
    LUT6 PR_1[18]_i_4
    (
        .O(PR_1[18]_i_4_n_0),
        .I0(PR_1_reg_n_0_[30]),
        .I1(ct_1[3]),
        .I2(PR_1_reg_n_0_[31]),
        .I3(ct_1[5]),
        .I4(ct_1[4]),
        .I5(PR_1_reg_n_0_[22])
    );
    LUT6 PR_1[18]_i_5
    (
        .O(PR_1[18]_i_5_n_0),
        .I0(PR_1_reg_n_0_[26]),
        .I1(ct_1[3]),
        .I2(PR_1_reg_n_0_[31]),
        .I3(ct_1[5]),
        .I4(ct_1[4]),
        .I5(PR_1_reg_n_0_[18])
    );
    LUT3 PR_1[19]_i_1
    (
        .O(PR_1[19]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[19]),
        .I2(PR_1[19]_i_2_n_0)
    );
    LUT6 PR_1[19]_i_2
    (
        .O(PR_1[19]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][2]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(PR_1[20]_i_3_n_0),
        .I3(ct_1[0]),
        .I4(PR_1[19]_i_3_n_0),
        .I5(state_reg_n_0_[3])
    );
    LUT3 PR_1[19]_i_3
    (
        .O(PR_1[19]_i_3_n_0),
        .I0(PR_1[21]_i_4_n_0),
        .I1(ct_1[1]),
        .I2(PR_1[19]_i_4_n_0)
    );
    LUT6 PR_1[19]_i_4
    (
        .O(PR_1[19]_i_4_n_0),
        .I0(ct_1[3]),
        .I1(PR_1_reg_n_0_[31]),
        .I2(PR_1[26]_i_6_n_0),
        .I3(PR_1_reg_n_0_[23]),
        .I4(ct_1[2]),
        .I5(PR_1[15]_i_4_n_0)
    );
    LUT3 PR_1[1]_i_1
    (
        .O(PR_1[1]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[1]),
        .I2(PR_1[1]_i_2_n_0)
    );
    LUT6 PR_1[1]_i_2
    (
        .O(PR_1[1]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][0]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_1[2]_i_3_n_0),
        .I4(ct_1[0]),
        .I5(PR_1[1]_i_3_n_0)
    );
    LUT3 PR_1[1]_i_3
    (
        .O(PR_1[1]_i_3_n_0),
        .I0(PR_1[3]_i_4_n_0),
        .I1(ct_1[1]),
        .I2(PR_1[1]_i_4_n_0)
    );
    LUT5 PR_1[1]_i_4
    (
        .O(PR_1[1]_i_4_n_0),
        .I0(PR_1[5]_i_4_n_0),
        .I1(ct_1[2]),
        .I2(PR_1[9]_i_5_n_0),
        .I3(ct_1[3]),
        .I4(PR_1[1]_i_5_n_0)
    );
    LUT5 PR_1[1]_i_5
    (
        .O(PR_1[1]_i_5_n_0),
        .I0(PR_1_reg_n_0_[17]),
        .I1(PR_1_reg_n_0_[1]),
        .I2(ct_1[4]),
        .I3(ct_1[5]),
        .I4(PR_1_reg_n_0_[31])
    );
    LUT3 PR_1[20]_i_1
    (
        .O(PR_1[20]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[20]),
        .I2(PR_1[20]_i_2_n_0)
    );
    LUT6 PR_1[20]_i_2
    (
        .O(PR_1[20]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][2]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(PR_1[21]_i_3_n_0),
        .I3(ct_1[0]),
        .I4(PR_1[20]_i_3_n_0),
        .I5(state_reg_n_0_[3])
    );
    LUT3 PR_1[20]_i_3
    (
        .O(PR_1[20]_i_3_n_0),
        .I0(PR_1[22]_i_4_n_0),
        .I1(ct_1[1]),
        .I2(PR_1[20]_i_4_n_0)
    );
    LUT6 PR_1[20]_i_4
    (
        .O(PR_1[20]_i_4_n_0),
        .I0(ct_1[3]),
        .I1(PR_1_reg_n_0_[31]),
        .I2(PR_1[26]_i_6_n_0),
        .I3(PR_1_reg_n_0_[24]),
        .I4(ct_1[2]),
        .I5(PR_1[16]_i_4_n_0)
    );
    LUT3 PR_1[21]_i_1
    (
        .O(PR_1[21]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[21]),
        .I2(PR_1[21]_i_2_n_0)
    );
    LUT6 PR_1[21]_i_2
    (
        .O(PR_1[21]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][2]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(PR_1[22]_i_3_n_0),
        .I3(ct_1[0]),
        .I4(PR_1[21]_i_3_n_0),
        .I5(state_reg_n_0_[3])
    );
    LUT3 PR_1[21]_i_3
    (
        .O(PR_1[21]_i_3_n_0),
        .I0(PR_1[23]_i_4_n_0),
        .I1(ct_1[1]),
        .I2(PR_1[21]_i_4_n_0)
    );
    LUT6 PR_1[21]_i_4
    (
        .O(PR_1[21]_i_4_n_0),
        .I0(ct_1[3]),
        .I1(PR_1_reg_n_0_[31]),
        .I2(PR_1[26]_i_6_n_0),
        .I3(PR_1_reg_n_0_[25]),
        .I4(ct_1[2]),
        .I5(PR_1[17]_i_4_n_0)
    );
    LUT3 PR_1[22]_i_1
    (
        .O(PR_1[22]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[22]),
        .I2(PR_1[22]_i_2_n_0)
    );
    LUT6 PR_1[22]_i_2
    (
        .O(PR_1[22]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][2]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(PR_1[23]_i_3_n_0),
        .I3(ct_1[0]),
        .I4(PR_1[22]_i_3_n_0),
        .I5(state_reg_n_0_[3])
    );
    LUT3 PR_1[22]_i_3
    (
        .O(PR_1[22]_i_3_n_0),
        .I0(PR_1[24]_i_4_n_0),
        .I1(ct_1[1]),
        .I2(PR_1[22]_i_4_n_0)
    );
    LUT6 PR_1[22]_i_4
    (
        .O(PR_1[22]_i_4_n_0),
        .I0(ct_1[3]),
        .I1(PR_1_reg_n_0_[31]),
        .I2(PR_1[26]_i_6_n_0),
        .I3(PR_1_reg_n_0_[26]),
        .I4(ct_1[2]),
        .I5(PR_1[18]_i_4_n_0)
    );
    LUT3 PR_1[23]_i_1
    (
        .O(PR_1[23]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[23]),
        .I2(PR_1[23]_i_2_n_0)
    );
    LUT6 PR_1[23]_i_2
    (
        .O(PR_1[23]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][2]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(PR_1[24]_i_3_n_0),
        .I3(ct_1[0]),
        .I4(PR_1[23]_i_3_n_0),
        .I5(state_reg_n_0_[3])
    );
    LUT3 PR_1[23]_i_3
    (
        .O(PR_1[23]_i_3_n_0),
        .I0(PR_1[25]_i_4_n_0),
        .I1(ct_1[1]),
        .I2(PR_1[23]_i_4_n_0)
    );
    LUT6 PR_1[23]_i_4
    (
        .O(PR_1[23]_i_4_n_0),
        .I0(PR_1_reg_n_0_[27]),
        .I1(ct_1[2]),
        .I2(ct_1[3]),
        .I3(PR_1_reg_n_0_[31]),
        .I4(PR_1[26]_i_6_n_0),
        .I5(PR_1_reg_n_0_[23])
    );
    LUT3 PR_1[24]_i_1
    (
        .O(PR_1[24]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[24]),
        .I2(PR_1[24]_i_2_n_0)
    );
    LUT6 PR_1[24]_i_2
    (
        .O(PR_1[24]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][3]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(PR_1[25]_i_3_n_0),
        .I3(ct_1[0]),
        .I4(PR_1[24]_i_3_n_0),
        .I5(state_reg_n_0_[3])
    );
    LUT3 PR_1[24]_i_3
    (
        .O(PR_1[24]_i_3_n_0),
        .I0(PR_1[26]_i_5_n_0),
        .I1(ct_1[1]),
        .I2(PR_1[24]_i_4_n_0)
    );
    LUT6 PR_1[24]_i_4
    (
        .O(PR_1[24]_i_4_n_0),
        .I0(PR_1_reg_n_0_[28]),
        .I1(ct_1[2]),
        .I2(ct_1[3]),
        .I3(PR_1_reg_n_0_[31]),
        .I4(PR_1[26]_i_6_n_0),
        .I5(PR_1_reg_n_0_[24])
    );
    LUT3 PR_1[25]_i_1
    (
        .O(PR_1[25]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[25]),
        .I2(PR_1[25]_i_2_n_0)
    );
    LUT6 PR_1[25]_i_2
    (
        .O(PR_1[25]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][3]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(PR_1[26]_i_4_n_0),
        .I3(ct_1[0]),
        .I4(PR_1[25]_i_3_n_0),
        .I5(state_reg_n_0_[3])
    );
    LUT3 PR_1[25]_i_3
    (
        .O(PR_1[25]_i_3_n_0),
        .I0(PR_1[27]_i_3_n_0),
        .I1(ct_1[1]),
        .I2(PR_1[25]_i_4_n_0)
    );
    LUT6 PR_1[25]_i_4
    (
        .O(PR_1[25]_i_4_n_0),
        .I0(PR_1_reg_n_0_[29]),
        .I1(ct_1[2]),
        .I2(ct_1[3]),
        .I3(PR_1_reg_n_0_[31]),
        .I4(PR_1[26]_i_6_n_0),
        .I5(PR_1_reg_n_0_[25])
    );
    LUT3 PR_1[26]_i_1
    (
        .O(PR_1[26]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[26]),
        .I2(PR_1[26]_i_2_n_0)
    );
    LUT6 PR_1[26]_i_2
    (
        .O(PR_1[26]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][3]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(PR_1[26]_i_3_n_0),
        .I3(ct_1[0]),
        .I4(PR_1[26]_i_4_n_0),
        .I5(state_reg_n_0_[3])
    );
    LUT3 PR_1[26]_i_3
    (
        .O(PR_1[26]_i_3_n_0),
        .I0(PR_1[29]_i_3_n_0),
        .I1(ct_1[1]),
        .I2(PR_1[27]_i_3_n_0)
    );
    LUT3 PR_1[26]_i_4
    (
        .O(PR_1[26]_i_4_n_0),
        .I0(PR_1[28]_i_3_n_0),
        .I1(ct_1[1]),
        .I2(PR_1[26]_i_5_n_0)
    );
    LUT6 PR_1[26]_i_5
    (
        .O(PR_1[26]_i_5_n_0),
        .I0(PR_1_reg_n_0_[30]),
        .I1(ct_1[2]),
        .I2(ct_1[3]),
        .I3(PR_1_reg_n_0_[31]),
        .I4(PR_1[26]_i_6_n_0),
        .I5(PR_1_reg_n_0_[26])
    );
    LUT2 PR_1[26]_i_6
    (
        .O(PR_1[26]_i_6_n_0),
        .I0(ct_1[5]),
        .I1(ct_1[4])
    );
    LUT5 PR_1[27]_i_1
    (
        .O(PR_1[27]_i_1_n_0),
        .I0(sdata_reg_n_0_[27]),
        .I1(state_reg_n_0_[3]),
        .I2(PR_1[27]_i_2_n_0),
        .I3(state_reg_reg_n_0_[0]),
        .I4(dividend_to_divider_reg[31][3])
    );
    LUT6 PR_1[27]_i_2
    (
        .O(PR_1[27]_i_2_n_0),
        .I0(PR_1[30]_i_3_n_0),
        .I1(PR_1[28]_i_3_n_0),
        .I2(ct_1[0]),
        .I3(PR_1[29]_i_3_n_0),
        .I4(ct_1[1]),
        .I5(PR_1[27]_i_3_n_0)
    );
    LUT6 PR_1[27]_i_3
    (
        .O(PR_1[27]_i_3_n_0),
        .I0(ct_1[2]),
        .I1(ct_1[3]),
        .I2(PR_1_reg_n_0_[31]),
        .I3(ct_1[5]),
        .I4(ct_1[4]),
        .I5(PR_1_reg_n_0_[27])
    );
    LUT5 PR_1[28]_i_1
    (
        .O(PR_1[28]_i_1_n_0),
        .I0(sdata_reg_n_0_[28]),
        .I1(state_reg_n_0_[3]),
        .I2(PR_1[28]_i_2_n_0),
        .I3(state_reg_reg_n_0_[0]),
        .I4(dividend_to_divider_reg[31][3])
    );
    LUT6 PR_1[28]_i_2
    (
        .O(PR_1[28]_i_2_n_0),
        .I0(PR_1_reg_n_0_[31]),
        .I1(PR_1[29]_i_3_n_0),
        .I2(ct_1[0]),
        .I3(PR_1[30]_i_3_n_0),
        .I4(ct_1[1]),
        .I5(PR_1[28]_i_3_n_0)
    );
    LUT6 PR_1[28]_i_3
    (
        .O(PR_1[28]_i_3_n_0),
        .I0(ct_1[2]),
        .I1(ct_1[3]),
        .I2(PR_1_reg_n_0_[31]),
        .I3(ct_1[5]),
        .I4(ct_1[4]),
        .I5(PR_1_reg_n_0_[28])
    );
    LUT5 PR_1[29]_i_1
    (
        .O(PR_1[29]_i_1_n_0),
        .I0(sdata_reg_n_0_[29]),
        .I1(PR_1[29]_i_2_n_0),
        .I2(state_reg_reg_n_0_[0]),
        .I3(state_reg_n_0_[3]),
        .I4(dividend_to_divider_reg[31][3])
    );
    LUT6 PR_1[29]_i_2
    (
        .O(PR_1[29]_i_2_n_0),
        .I0(state_reg_n_0_[3]),
        .I1(PR_1[29]_i_3_n_0),
        .I2(ct_1[1]),
        .I3(PR_1_reg_n_0_[31]),
        .I4(ct_1[0]),
        .I5(PR_1[30]_i_3_n_0)
    );
    LUT6 PR_1[29]_i_3
    (
        .O(PR_1[29]_i_3_n_0),
        .I0(ct_1[2]),
        .I1(ct_1[3]),
        .I2(PR_1_reg_n_0_[29]),
        .I3(ct_1[4]),
        .I4(ct_1[5]),
        .I5(PR_1_reg_n_0_[31])
    );
    LUT3 PR_1[2]_i_1
    (
        .O(PR_1[2]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[2]),
        .I2(PR_1[2]_i_2_n_0)
    );
    LUT6 PR_1[2]_i_2
    (
        .O(PR_1[2]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][0]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_1[3]_i_3_n_0),
        .I4(ct_1[0]),
        .I5(PR_1[2]_i_3_n_0)
    );
    LUT5 PR_1[2]_i_3
    (
        .O(PR_1[2]_i_3_n_0),
        .I0(PR_1[8]_i_4_n_0),
        .I1(ct_1[2]),
        .I2(PR_1[4]_i_4_n_0),
        .I3(ct_1[1]),
        .I4(PR_1[0]_i_4_n_0)
    );
    LUT5 PR_1[30]_i_1
    (
        .O(PR_1[30]_i_1_n_0),
        .I0(PR_1[30]_i_2_n_0),
        .I1(state_reg_n_0_[3]),
        .I2(dividend_to_divider_reg[31][3]),
        .I3(sdata_reg_n_0_[30]),
        .I4(state_reg_reg_n_0_[0])
    );
    LUT5 PR_1[30]_i_2
    (
        .O(PR_1[30]_i_2_n_0),
        .I0(PR_1[30]_i_3_n_0),
        .I1(ct_1[1]),
        .I2(PR_1_reg_n_0_[31]),
        .I3(ct_1[0]),
        .I4(state_reg_n_0_[3])
    );
    LUT6 PR_1[30]_i_3
    (
        .O(PR_1[30]_i_3_n_0),
        .I0(ct_1[2]),
        .I1(ct_1[3]),
        .I2(PR_1_reg_n_0_[31]),
        .I3(ct_1[5]),
        .I4(ct_1[4]),
        .I5(PR_1_reg_n_0_[30])
    );
    LUT6 PR_1[31]_i_1
    (
        .O(PR_1[31]_i_1_n_0),
        .I0(state_reg_reg_n_0_[1]),
        .I1(state_reg_n_0_[3]),
        .I2(state_reg_n_0_[1]),
        .I3(PR_1[31]_i_3_n_0),
        .I4(PR_1[31]_i_4_n_0),
        .I5(state_reg_reg_n_0_[0])
    );
    LUT5 PR_1[31]_i_2
    (
        .O(PR_1[31]_i_2_n_0),
        .I0(sdata_o[31]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(PR_1_reg_n_0_[31]),
        .I3(state_reg_n_0_[3]),
        .I4(dividend_to_divider_reg[31][3])
    );
    LUT2 PR_1[31]_i_3
    (
        .O(PR_1[31]_i_3_n_0),
        .I0(state_reg_n_0_[5]),
        .I1(state_reg_n_0_[4])
    );
    LUT2 PR_1[31]_i_4
    (
        .O(PR_1[31]_i_4_n_0),
        .I0(state_reg_n_0_[2]),
        .I1(state_reg_n_0_[0])
    );
    LUT3 PR_1[3]_i_1
    (
        .O(PR_1[3]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[3]),
        .I2(PR_1[3]_i_2_n_0)
    );
    LUT6 PR_1[3]_i_2
    (
        .O(PR_1[3]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][0]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_1[4]_i_3_n_0),
        .I4(ct_1[0]),
        .I5(PR_1[3]_i_3_n_0)
    );
    LUT5 PR_1[3]_i_3
    (
        .O(PR_1[3]_i_3_n_0),
        .I0(PR_1[9]_i_4_n_0),
        .I1(ct_1[2]),
        .I2(PR_1[5]_i_4_n_0),
        .I3(ct_1[1]),
        .I4(PR_1[3]_i_4_n_0)
    );
    LUT5 PR_1[3]_i_4
    (
        .O(PR_1[3]_i_4_n_0),
        .I0(PR_1[7]_i_4_n_0),
        .I1(ct_1[2]),
        .I2(PR_1[11]_i_5_n_0),
        .I3(ct_1[3]),
        .I4(PR_1[3]_i_5_n_0)
    );
    LUT5 PR_1[3]_i_5
    (
        .O(PR_1[3]_i_5_n_0),
        .I0(PR_1_reg_n_0_[19]),
        .I1(ct_1[4]),
        .I2(ct_1[5]),
        .I3(PR_1_reg_n_0_[3]),
        .I4(PR_1_reg_n_0_[31])
    );
    LUT3 PR_1[4]_i_1
    (
        .O(PR_1[4]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[4]),
        .I2(PR_1[4]_i_2_n_0)
    );
    LUT6 PR_1[4]_i_2
    (
        .O(PR_1[4]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][0]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_1[5]_i_3_n_0),
        .I4(ct_1[0]),
        .I5(PR_1[4]_i_3_n_0)
    );
    LUT6 PR_1[4]_i_3
    (
        .O(PR_1[4]_i_3_n_0),
        .I0(PR_1[10]_i_4_n_0),
        .I1(ct_1[2]),
        .I2(PR_1[6]_i_4_n_0),
        .I3(PR_1[8]_i_4_n_0),
        .I4(PR_1[4]_i_4_n_0),
        .I5(ct_1[1])
    );
    LUT3 PR_1[4]_i_4
    (
        .O(PR_1[4]_i_4_n_0),
        .I0(PR_1[12]_i_5_n_0),
        .I1(ct_1[3]),
        .I2(PR_1[4]_i_5_n_0)
    );
    LUT5 PR_1[4]_i_5
    (
        .O(PR_1[4]_i_5_n_0),
        .I0(PR_1_reg_n_0_[20]),
        .I1(PR_1_reg_n_0_[4]),
        .I2(ct_1[4]),
        .I3(ct_1[5]),
        .I4(PR_1_reg_n_0_[31])
    );
    LUT3 PR_1[5]_i_1
    (
        .O(PR_1[5]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[5]),
        .I2(PR_1[5]_i_2_n_0)
    );
    LUT6 PR_1[5]_i_2
    (
        .O(PR_1[5]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][0]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_1[6]_i_3_n_0),
        .I4(ct_1[0]),
        .I5(PR_1[5]_i_3_n_0)
    );
    LUT6 PR_1[5]_i_3
    (
        .O(PR_1[5]_i_3_n_0),
        .I0(PR_1[11]_i_4_n_0),
        .I1(ct_1[2]),
        .I2(PR_1[7]_i_4_n_0),
        .I3(PR_1[9]_i_4_n_0),
        .I4(PR_1[5]_i_4_n_0),
        .I5(ct_1[1])
    );
    LUT6 PR_1[5]_i_4
    (
        .O(PR_1[5]_i_4_n_0),
        .I0(PR_1[5]_i_5_n_0),
        .I1(PR_1[6]_i_6_n_0),
        .I2(ct_1[5]),
        .I3(ct_1[4]),
        .I4(PR_1_reg_n_0_[5]),
        .I5(PR_1_reg_n_0_[21])
    );
    LUT6 PR_1[5]_i_5
    (
        .O(PR_1[5]_i_5_n_0),
        .I0(PR_1_reg_n_0_[31]),
        .I1(ct_1[5]),
        .I2(ct_1[4]),
        .I3(PR_1_reg_n_0_[13]),
        .I4(PR_1_reg_n_0_[29]),
        .I5(ct_1[3])
    );
    LUT3 PR_1[6]_i_1
    (
        .O(PR_1[6]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[6]),
        .I2(PR_1[6]_i_2_n_0)
    );
    LUT6 PR_1[6]_i_2
    (
        .O(PR_1[6]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][0]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_1[7]_i_3_n_0),
        .I4(ct_1[0]),
        .I5(PR_1[6]_i_3_n_0)
    );
    LUT6 PR_1[6]_i_3
    (
        .O(PR_1[6]_i_3_n_0),
        .I0(PR_1[12]_i_4_n_0),
        .I1(ct_1[2]),
        .I2(PR_1[8]_i_4_n_0),
        .I3(PR_1[10]_i_4_n_0),
        .I4(PR_1[6]_i_4_n_0),
        .I5(ct_1[1])
    );
    LUT6 PR_1[6]_i_4
    (
        .O(PR_1[6]_i_4_n_0),
        .I0(PR_1[6]_i_5_n_0),
        .I1(PR_1[6]_i_6_n_0),
        .I2(ct_1[5]),
        .I3(ct_1[4]),
        .I4(PR_1_reg_n_0_[6]),
        .I5(PR_1_reg_n_0_[22])
    );
    LUT6 PR_1[6]_i_5
    (
        .O(PR_1[6]_i_5_n_0),
        .I0(PR_1_reg_n_0_[31]),
        .I1(ct_1[5]),
        .I2(ct_1[4]),
        .I3(PR_1_reg_n_0_[14]),
        .I4(PR_1_reg_n_0_[30]),
        .I5(ct_1[3])
    );
    LUT3 PR_1[6]_i_6
    (
        .O(PR_1[6]_i_6_n_0),
        .I0(ct_1[3]),
        .I1(PR_1_reg_n_0_[31]),
        .I2(ct_1[5])
    );
    LUT3 PR_1[7]_i_1
    (
        .O(PR_1[7]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[7]),
        .I2(PR_1[7]_i_2_n_0)
    );
    LUT6 PR_1[7]_i_2
    (
        .O(PR_1[7]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][0]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_1[8]_i_3_n_0),
        .I4(ct_1[0]),
        .I5(PR_1[7]_i_3_n_0)
    );
    LUT6 PR_1[7]_i_3
    (
        .O(PR_1[7]_i_3_n_0),
        .I0(PR_1[13]_i_4_n_0),
        .I1(ct_1[2]),
        .I2(PR_1[9]_i_4_n_0),
        .I3(PR_1[11]_i_4_n_0),
        .I4(PR_1[7]_i_4_n_0),
        .I5(ct_1[1])
    );
    LUT6 PR_1[7]_i_4
    (
        .O(PR_1[7]_i_4_n_0),
        .I0(ct_1[3]),
        .I1(PR_1_reg_n_0_[31]),
        .I2(ct_1[5]),
        .I3(ct_1[4]),
        .I4(PR_1_reg_n_0_[15]),
        .I5(PR_1[7]_i_5_n_0)
    );
    LUT6 PR_1[7]_i_5
    (
        .O(PR_1[7]_i_5_n_0),
        .I0(PR_1_reg_n_0_[23]),
        .I1(PR_1_reg_n_0_[7]),
        .I2(ct_1[4]),
        .I3(ct_1[5]),
        .I4(ct_1[3]),
        .I5(PR_1_reg_n_0_[31])
    );
    LUT3 PR_1[8]_i_1
    (
        .O(PR_1[8]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[8]),
        .I2(PR_1[8]_i_2_n_0)
    );
    LUT6 PR_1[8]_i_2
    (
        .O(PR_1[8]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][1]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_1[9]_i_3_n_0),
        .I4(ct_1[0]),
        .I5(PR_1[8]_i_3_n_0)
    );
    LUT6 PR_1[8]_i_3
    (
        .O(PR_1[8]_i_3_n_0),
        .I0(PR_1[14]_i_4_n_0),
        .I1(ct_1[2]),
        .I2(PR_1[10]_i_4_n_0),
        .I3(PR_1[12]_i_4_n_0),
        .I4(PR_1[8]_i_4_n_0),
        .I5(ct_1[1])
    );
    LUT6 PR_1[8]_i_4
    (
        .O(PR_1[8]_i_4_n_0),
        .I0(PR_1_reg_n_0_[31]),
        .I1(ct_1[5]),
        .I2(ct_1[4]),
        .I3(PR_1_reg_n_0_[16]),
        .I4(ct_1[3]),
        .I5(PR_1[0]_i_5_n_0)
    );
    LUT3 PR_1[9]_i_1
    (
        .O(PR_1[9]_i_1_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(sdata_reg_n_0_[9]),
        .I2(PR_1[9]_i_2_n_0)
    );
    LUT6 PR_1[9]_i_2
    (
        .O(PR_1[9]_i_2_n_0),
        .I0(dividend_to_divider_reg[31][1]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_1[10]_i_3_n_0),
        .I4(ct_1[0]),
        .I5(PR_1[9]_i_3_n_0)
    );
    LUT6 PR_1[9]_i_3
    (
        .O(PR_1[9]_i_3_n_0),
        .I0(PR_1[15]_i_5_n_0),
        .I1(ct_1[2]),
        .I2(PR_1[11]_i_4_n_0),
        .I3(PR_1[13]_i_4_n_0),
        .I4(PR_1[9]_i_4_n_0),
        .I5(ct_1[1])
    );
    LUT6 PR_1[9]_i_4
    (
        .O(PR_1[9]_i_4_n_0),
        .I0(PR_1_reg_n_0_[31]),
        .I1(ct_1[5]),
        .I2(ct_1[4]),
        .I3(PR_1_reg_n_0_[17]),
        .I4(ct_1[3]),
        .I5(PR_1[9]_i_5_n_0)
    );
    LUT5 PR_1[9]_i_5
    (
        .O(PR_1[9]_i_5_n_0),
        .I0(PR_1_reg_n_0_[25]),
        .I1(PR_1_reg_n_0_[9]),
        .I2(ct_1[4]),
        .I3(ct_1[5]),
        .I4(PR_1_reg_n_0_[31])
    );
    FDCE PR_1_reg[0]
    (
        .Q(PR_1_reg_n_0_[0]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[0]_i_1_n_0)
    );
    FDCE PR_1_reg[10]
    (
        .Q(PR_1_reg_n_0_[10]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[10]_i_1_n_0)
    );
    FDCE PR_1_reg[11]
    (
        .Q(PR_1_reg_n_0_[11]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[11]_i_1_n_0)
    );
    FDCE PR_1_reg[12]
    (
        .Q(PR_1_reg_n_0_[12]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[12]_i_1_n_0)
    );
    FDCE PR_1_reg[13]
    (
        .Q(PR_1_reg_n_0_[13]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[13]_i_1_n_0)
    );
    FDCE PR_1_reg[14]
    (
        .Q(PR_1_reg_n_0_[14]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[14]_i_1_n_0)
    );
    FDCE PR_1_reg[15]
    (
        .Q(PR_1_reg_n_0_[15]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[15]_i_1_n_0)
    );
    FDCE PR_1_reg[16]
    (
        .Q(PR_1_reg_n_0_[16]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[16]_i_1_n_0)
    );
    FDCE PR_1_reg[17]
    (
        .Q(PR_1_reg_n_0_[17]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[17]_i_1_n_0)
    );
    FDCE PR_1_reg[18]
    (
        .Q(PR_1_reg_n_0_[18]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[18]_i_1_n_0)
    );
    FDCE PR_1_reg[19]
    (
        .Q(PR_1_reg_n_0_[19]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[19]_i_1_n_0)
    );
    FDCE PR_1_reg[1]
    (
        .Q(PR_1_reg_n_0_[1]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[1]_i_1_n_0)
    );
    FDCE PR_1_reg[20]
    (
        .Q(PR_1_reg_n_0_[20]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[20]_i_1_n_0)
    );
    FDCE PR_1_reg[21]
    (
        .Q(PR_1_reg_n_0_[21]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[21]_i_1_n_0)
    );
    FDCE PR_1_reg[22]
    (
        .Q(PR_1_reg_n_0_[22]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[22]_i_1_n_0)
    );
    FDCE PR_1_reg[23]
    (
        .Q(PR_1_reg_n_0_[23]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[23]_i_1_n_0)
    );
    FDCE PR_1_reg[24]
    (
        .Q(PR_1_reg_n_0_[24]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[24]_i_1_n_0)
    );
    FDCE PR_1_reg[25]
    (
        .Q(PR_1_reg_n_0_[25]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[25]_i_1_n_0)
    );
    FDCE PR_1_reg[26]
    (
        .Q(PR_1_reg_n_0_[26]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[26]_i_1_n_0)
    );
    FDCE PR_1_reg[27]
    (
        .Q(PR_1_reg_n_0_[27]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[27]_i_1_n_0)
    );
    FDCE PR_1_reg[28]
    (
        .Q(PR_1_reg_n_0_[28]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[28]_i_1_n_0)
    );
    FDCE PR_1_reg[29]
    (
        .Q(PR_1_reg_n_0_[29]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[29]_i_1_n_0)
    );
    FDCE PR_1_reg[2]
    (
        .Q(PR_1_reg_n_0_[2]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[2]_i_1_n_0)
    );
    FDCE PR_1_reg[30]
    (
        .Q(PR_1_reg_n_0_[30]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[30]_i_1_n_0)
    );
    FDCE PR_1_reg[31]
    (
        .Q(PR_1_reg_n_0_[31]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[31]_i_2_n_0)
    );
    FDCE PR_1_reg[3]
    (
        .Q(PR_1_reg_n_0_[3]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[3]_i_1_n_0)
    );
    FDCE PR_1_reg[4]
    (
        .Q(PR_1_reg_n_0_[4]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[4]_i_1_n_0)
    );
    FDCE PR_1_reg[5]
    (
        .Q(PR_1_reg_n_0_[5]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[5]_i_1_n_0)
    );
    FDCE PR_1_reg[6]
    (
        .Q(PR_1_reg_n_0_[6]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[6]_i_1_n_0)
    );
    FDCE PR_1_reg[7]
    (
        .Q(PR_1_reg_n_0_[7]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[7]_i_1_n_0)
    );
    FDCE PR_1_reg[8]
    (
        .Q(PR_1_reg_n_0_[8]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[8]_i_1_n_0)
    );
    FDCE PR_1_reg[9]
    (
        .Q(PR_1_reg_n_0_[9]),
        .C(CLK),
        .CE(PR_1[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR_1[9]_i_1_n_0)
    );
    FDCE PR_reg[0]
    (
        .Q(PR_reg_n_0_[0]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(PR[0]_i_1_n_0)
    );
    FDCE PR_reg[10]
    (
        .Q(PR_reg_n_0_[10]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[10])
    );
    FDCE PR_reg[11]
    (
        .Q(PR_reg_n_0_[11]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[11])
    );
    FDCE PR_reg[12]
    (
        .Q(PR_reg_n_0_[12]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[12])
    );
    FDCE PR_reg[13]
    (
        .Q(PR_reg_n_0_[13]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[13])
    );
    FDCE PR_reg[14]
    (
        .Q(PR_reg_n_0_[14]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[14])
    );
    FDCE PR_reg[15]
    (
        .Q(PR_reg_n_0_[15]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[15])
    );
    FDCE PR_reg[16]
    (
        .Q(PR_reg_n_0_[16]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[16])
    );
    FDCE PR_reg[17]
    (
        .Q(PR_reg_n_0_[17]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[17])
    );
    FDCE PR_reg[18]
    (
        .Q(PR_reg_n_0_[18]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[18])
    );
    FDCE PR_reg[19]
    (
        .Q(PR_reg_n_0_[19]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[19])
    );
    FDCE PR_reg[1]
    (
        .Q(PR_reg_n_0_[1]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[1])
    );
    FDCE PR_reg[20]
    (
        .Q(PR_reg_n_0_[20]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[20])
    );
    FDCE PR_reg[21]
    (
        .Q(PR_reg_n_0_[21]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_o[21])
    );
    FDCE PR_reg[22]
    (
        .Q(PR_reg_n_0_[22]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_o[22])
    );
    FDCE PR_reg[23]
    (
        .Q(PR_reg_n_0_[23]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_o[23])
    );
    FDCE PR_reg[24]
    (
        .Q(PR_reg_n_0_[24]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_o[24])
    );
    FDCE PR_reg[25]
    (
        .Q(PR_reg_n_0_[25]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_o[25])
    );
    FDCE PR_reg[26]
    (
        .Q(PR_reg_n_0_[26]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_o[26])
    );
    FDCE PR_reg[27]
    (
        .Q(PR_reg_n_0_[27]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_o[27])
    );
    FDCE PR_reg[28]
    (
        .Q(PR_reg_n_0_[28]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_o[28])
    );
    FDCE PR_reg[29]
    (
        .Q(PR_reg_n_0_[29]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_o[29])
    );
    FDCE PR_reg[2]
    (
        .Q(PR_reg_n_0_[2]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[2])
    );
    FDCE PR_reg[30]
    (
        .Q(PR_reg_n_0_[30]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(PR[30]_i_1_n_0)
    );
    FDCE PR_reg[31]
    (
        .Q(p_1_in),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata_o[31])
    );
    FDCE PR_reg[3]
    (
        .Q(PR_reg_n_0_[3]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[3])
    );
    FDCE PR_reg[4]
    (
        .Q(PR_reg_n_0_[4]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[4])
    );
    FDCE PR_reg[5]
    (
        .Q(PR_reg_n_0_[5]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[5])
    );
    FDCE PR_reg[6]
    (
        .Q(PR_reg_n_0_[6]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[6])
    );
    FDCE PR_reg[7]
    (
        .Q(PR_reg_n_0_[7]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[7])
    );
    FDCE PR_reg[8]
    (
        .Q(PR_reg_n_0_[8]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[8])
    );
    FDCE PR_reg[9]
    (
        .Q(PR_reg_n_0_[9]),
        .C(CLK),
        .CE(PR[31]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(sdata_o[9])
    );
    VCC VCC
    (
        .P(<const1>)
    );
    LUT4 ct[0]_i_1
    (
        .O(ct[0]_i_1_n_0),
        .I0(ct_reg_n_0_[0]),
        .I1(shifted_reg_n_0_[0]),
        .I2(state_reg_n_0_[5]),
        .I3(state_reg_reg_n_0_[1])
    );
    LUT6 ct[1]_i_1
    (
        .O(ct[1]_i_1_n_0),
        .I0(state_reg_reg_n_0_[1]),
        .I1(ct_reg_n_0_[1]),
        .I2(shifted_reg_n_0_[1]),
        .I3(state_reg_n_0_[5]),
        .I4(ct_reg_n_0_[0]),
        .I5(shifted_reg_n_0_[0])
    );
    LUT5 ct[2]_i_1
    (
        .O(ct[2]_i_1_n_0),
        .I0(ct[2]_i_2_n_0),
        .I1(state_reg_n_0_[5]),
        .I2(shifted_reg_n_0_[2]),
        .I3(ct_reg_n_0_[2]),
        .I4(state_reg_reg_n_0_[1])
    );
    LUT5 ct[2]_i_2
    (
        .O(ct[2]_i_2_n_0),
        .I0(ct_reg_n_0_[1]),
        .I1(shifted_reg_n_0_[1]),
        .I2(state_reg_n_0_[5]),
        .I3(ct_reg_n_0_[0]),
        .I4(shifted_reg_n_0_[0])
    );
    LUT5 ct[3]_i_1
    (
        .O(ct[3]_i_1_n_0),
        .I0(state_reg_reg_n_0_[1]),
        .I1(ct[3]_i_2_n_0),
        .I2(ct_reg_n_0_[3]),
        .I3(shifted_reg_n_0_[3]),
        .I4(state_reg_n_0_[5])
    );
    LUT4 ct[3]_i_2
    (
        .O(ct[3]_i_2_n_0),
        .I0(ct[2]_i_2_n_0),
        .I1(ct_reg_n_0_[2]),
        .I2(shifted_reg_n_0_[2]),
        .I3(state_reg_n_0_[5])
    );
    LUT4 ct[4]_i_1
    (
        .O(ct[4]_i_1_n_0),
        .I0(state_reg_reg_n_0_[1]),
        .I1(ct[5]_i_5_n_0),
        .I2(state_reg_n_0_[5]),
        .I3(ct_reg_n_0_[4])
    );
    LUT5 ct[5]_i_1
    (
        .O(ct[5]_i_1_n_0),
        .I0(ct_reg_n_0_[5]),
        .I1(state_reg_n_0_[2]),
        .I2(state_reg_n_0_[5]),
        .I3(ct[5]_i_3_n_0),
        .I4(ct[5]_i_4_n_0)
    );
    LUT5 ct[5]_i_2
    (
        .O(ct[5]_i_2_n_0),
        .I0(ct_reg_n_0_[4]),
        .I1(ct[5]_i_5_n_0),
        .I2(state_reg_n_0_[5]),
        .I3(ct_reg_n_0_[5]),
        .I4(state_reg_reg_n_0_[1])
    );
    LUT6 ct[5]_i_3
    (
        .O(ct[5]_i_3_n_0),
        .I0(state_reg_reg_n_0_[1]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(state_reg_n_0_[4]),
        .I3(state_reg_n_0_[3]),
        .I4(state_reg_n_0_[0]),
        .I5(state_reg_n_0_[1])
    );
    LUT6 ct[5]_i_4
    (
        .O(ct[5]_i_4_n_0),
        .I0(state_reg_n_0_[0]),
        .I1(state_reg_n_0_[2]),
        .I2(ct[5]_i_6_n_0),
        .I3(PR_1[31]_i_3_n_0),
        .I4(state_reg_reg_n_0_[0]),
        .I5(state_reg_reg_n_0_[1])
    );
    LUT6 ct[5]_i_5
    (
        .O(ct[5]_i_5_n_0),
        .I0(ct[2]_i_2_n_0),
        .I1(ct_reg_n_0_[2]),
        .I2(shifted_reg_n_0_[2]),
        .I3(state_reg_n_0_[5]),
        .I4(ct_reg_n_0_[3]),
        .I5(shifted_reg_n_0_[3])
    );
    LUT2 ct[5]_i_6
    (
        .O(ct[5]_i_6_n_0),
        .I0(state_reg_n_0_[1]),
        .I1(state_reg_n_0_[3])
    );
    LUT4 ct_1[0]_i_1
    (
        .O(ct_1[0]_i_1_n_0),
        .I0(reg_b[0]),
        .I1(reg_a[0]),
        .I2(reg_carry_reg_n_0),
        .I3(state_reg_reg_n_0_[1])
    );
    LUT6 ct_1[1]_i_1
    (
        .O(ct_1[1]_i_1_n_0),
        .I0(reg_b[1]),
        .I1(reg_a[1]),
        .I2(reg_carry_reg_n_0),
        .I3(reg_a[0]),
        .I4(reg_b[0]),
        .I5(state_reg_reg_n_0_[1])
    );
    LUT6 ct_1[2]_i_1
    (
        .O(ct_1[2]_i_1_n_0),
        .I0(state_reg_reg_n_0_[1]),
        .I1(o_quotient[2]_i_2_n_0),
        .I2(reg_b[1]),
        .I3(reg_a[1]),
        .I4(reg_b[2]),
        .I5(reg_a[2])
    );
    LUT4 ct_1[3]_i_1
    (
        .O(ct_1[3]_i_1_n_0),
        .I0(state_reg_reg_n_0_[1]),
        .I1(o_quotient[3]_i_5_n_0),
        .I2(reg_b[3]),
        .I3(reg_a[3])
    );
    LUT6 ct_1[4]_i_1
    (
        .O(ct_1[4]_i_1_n_0),
        .I0(state_reg_reg_n_0_[1]),
        .I1(o_quotient[3]_i_5_n_0),
        .I2(reg_b[3]),
        .I3(reg_a[3]),
        .I4(reg_b[4]),
        .I5(reg_a[4])
    );
    LUT6 ct_1[5]_i_1
    (
        .O(ct_1[5]_i_1_n_0),
        .I0(state_reg_n_0_[4]),
        .I1(state_reg_n_0_[3]),
        .I2(o_quotient[3]_i_4_n_0),
        .I3(state_reg_reg_n_0_[0]),
        .I4(state_reg_reg_n_0_[1]),
        .I5(ct_1_en_1)
    );
    LUT4 ct_1[5]_i_2
    (
        .O(ct_1[5]_i_2_n_0),
        .I0(state_reg_reg_n_0_[1]),
        .I1(reg_b[5]),
        .I2(reg_a[5]),
        .I3(ct_1[5]_i_3_n_0)
    );
    LUT5 ct_1[5]_i_3
    (
        .O(ct_1[5]_i_3_n_0),
        .I0(o_quotient[2]_i_2_n_0),
        .I1(ct_1[5]_i_4_n_0),
        .I2(ct_1[5]_i_5_n_0),
        .I3(ct_1[5]_i_6_n_0),
        .I4(ct_1[5]_i_7_n_0)
    );
    LUT4 ct_1[5]_i_4
    (
        .O(ct_1[5]_i_4_n_0),
        .I0(reg_a[2]),
        .I1(reg_b[2]),
        .I2(reg_a[1]),
        .I3(reg_b[1])
    );
    LUT4 ct_1[5]_i_5
    (
        .O(ct_1[5]_i_5_n_0),
        .I0(reg_a[4]),
        .I1(reg_b[4]),
        .I2(reg_a[3]),
        .I3(reg_b[3])
    );
    LUT4 ct_1[5]_i_6
    (
        .O(ct_1[5]_i_6_n_0),
        .I0(reg_b[1]),
        .I1(reg_a[1]),
        .I2(reg_b[2]),
        .I3(reg_a[2])
    );
    LUT4 ct_1[5]_i_7
    (
        .O(ct_1[5]_i_7_n_0),
        .I0(reg_b[3]),
        .I1(reg_a[3]),
        .I2(reg_b[4]),
        .I3(reg_a[4])
    );
    LUT2 ct_1_en_1_i_1
    (
        .O(ct_1_en_1_i_1_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(state_reg_reg_n_0_[1])
    );
    FDCE ct_1_en_1_reg
    (
        .Q(ct_1_en_1),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(ct_1_en_1_i_1_n_0)
    );
    LUT4 ct_1_en_i_1
    (
        .O(ct_1_en_i_1_n_0),
        .I0(state_reg_reg_n_0_[1]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(shifted_1[3]_i_2_n_0),
        .I3(ct_1_en_reg_n_0)
    );
    FDCE ct_1_en_reg
    (
        .Q(ct_1_en_reg_n_0),
        .C(CLK),
        .CE(<const1>),
        .CLR(PR[20]_i_2_n_0),
        .D(ct_1_en_i_1_n_0)
    );
    FDCE ct_1_reg[0]
    (
        .Q(ct_1[0]),
        .C(CLK),
        .CE(ct_1[5]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(ct_1[0]_i_1_n_0)
    );
    FDCE ct_1_reg[1]
    (
        .Q(ct_1[1]),
        .C(CLK),
        .CE(ct_1[5]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(ct_1[1]_i_1_n_0)
    );
    FDCE ct_1_reg[2]
    (
        .Q(ct_1[2]),
        .C(CLK),
        .CE(ct_1[5]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(ct_1[2]_i_1_n_0)
    );
    FDCE ct_1_reg[3]
    (
        .Q(ct_1[3]),
        .C(CLK),
        .CE(ct_1[5]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(ct_1[3]_i_1_n_0)
    );
    FDCE ct_1_reg[4]
    (
        .Q(ct_1[4]),
        .C(CLK),
        .CE(ct_1[5]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(ct_1[4]_i_1_n_0)
    );
    FDCE ct_1_reg[5]
    (
        .Q(ct_1[5]),
        .C(CLK),
        .CE(ct_1[5]_i_1_n_0),
        .CLR(PR[20]_i_2_n_0),
        .D(ct_1[5]_i_2_n_0)
    );
    FDCE ct_reg[0]
    (
        .Q(ct_reg_n_0_[0]),
        .C(CLK),
        .CE(ct[5]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(ct[0]_i_1_n_0)
    );
    FDCE ct_reg[1]
    (
        .Q(ct_reg_n_0_[1]),
        .C(CLK),
        .CE(ct[5]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(ct[1]_i_1_n_0)
    );
    FDCE ct_reg[2]
    (
        .Q(ct_reg_n_0_[2]),
        .C(CLK),
        .CE(ct[5]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(ct[2]_i_1_n_0)
    );
    FDCE ct_reg[3]
    (
        .Q(ct_reg_n_0_[3]),
        .C(CLK),
        .CE(ct[5]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(ct[3]_i_1_n_0)
    );
    FDCE ct_reg[4]
    (
        .Q(ct_reg_n_0_[4]),
        .C(CLK),
        .CE(ct[5]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(ct[4]_i_1_n_0)
    );
    FDCE ct_reg[5]
    (
        .Q(ct_reg_n_0_[5]),
        .C(CLK),
        .CE(ct[5]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(ct[5]_i_2_n_0)
    );
    LUT6 nq[0]_i_1
    (
        .O(nq[0]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[24]_i_2_n_0),
        .I3(nq[7]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[0])
    );
    LUT6 nq[10]_i_1
    (
        .O(nq[10]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[26]_i_2_n_0),
        .I3(nq[15]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[10])
    );
    LUT6 nq[11]_i_1
    (
        .O(nq[11]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[27]_i_2_n_0),
        .I3(nq[15]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[11])
    );
    LUT6 nq[12]_i_1
    (
        .O(nq[12]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[28]_i_2_n_0),
        .I3(nq[15]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[12])
    );
    LUT6 nq[13]_i_1
    (
        .O(nq[13]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[29]_i_2_n_0),
        .I3(nq[15]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[13])
    );
    LUT6 nq[14]_i_1
    (
        .O(nq[14]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_5_n_0),
        .I3(nq[15]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[14])
    );
    LUT6 nq[15]_i_1
    (
        .O(nq[15]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[23]_i_2_n_0),
        .I3(nq[15]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[15])
    );
    LUT6 nq[15]_i_2
    (
        .O(nq[15]_i_2_n_0),
        .I0(ct_reg_n_0_[3]),
        .I1(state_reg_n_0_[0]),
        .I2(state_reg_n_0_[1]),
        .I3(state_reg_n_0_[2]),
        .I4(ct_reg_n_0_[4]),
        .I5(ct_reg_n_0_[5])
    );
    LUT6 nq[16]_i_1
    (
        .O(nq[16]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[24]_i_2_n_0),
        .I3(nq[23]_i_3_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[16])
    );
    LUT6 nq[17]_i_1
    (
        .O(nq[17]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[25]_i_2_n_0),
        .I3(nq[23]_i_3_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[17])
    );
    LUT6 nq[18]_i_1
    (
        .O(nq[18]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[26]_i_2_n_0),
        .I3(nq[23]_i_3_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[18])
    );
    LUT6 nq[19]_i_1
    (
        .O(nq[19]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[27]_i_2_n_0),
        .I3(nq[23]_i_3_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[19])
    );
    LUT6 nq[1]_i_1
    (
        .O(nq[1]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[25]_i_2_n_0),
        .I3(nq[7]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[1])
    );
    LUT6 nq[20]_i_1
    (
        .O(nq[20]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[28]_i_2_n_0),
        .I3(nq[23]_i_3_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[20])
    );
    LUT6 nq[21]_i_1
    (
        .O(nq[21]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[29]_i_2_n_0),
        .I3(nq[23]_i_3_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[21])
    );
    LUT6 nq[22]_i_1
    (
        .O(nq[22]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_5_n_0),
        .I3(nq[23]_i_3_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[22])
    );
    LUT6 nq[23]_i_1
    (
        .O(nq[23]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[23]_i_2_n_0),
        .I3(nq[23]_i_3_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[23])
    );
    LUT3 nq[23]_i_2
    (
        .O(nq[23]_i_2_n_0),
        .I0(ct_reg_n_0_[2]),
        .I1(ct_reg_n_0_[1]),
        .I2(ct_reg_n_0_[0])
    );
    LUT6 nq[23]_i_3
    (
        .O(nq[23]_i_3_n_0),
        .I0(ct_reg_n_0_[4]),
        .I1(ct_reg_n_0_[5]),
        .I2(state_reg_n_0_[0]),
        .I3(state_reg_n_0_[1]),
        .I4(state_reg_n_0_[2]),
        .I5(ct_reg_n_0_[3])
    );
    LUT6 nq[24]_i_1
    (
        .O(nq[24]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_6_n_0),
        .I3(nq[24]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[24])
    );
    LUT3 nq[24]_i_2
    (
        .O(nq[24]_i_2_n_0),
        .I0(ct_reg_n_0_[2]),
        .I1(ct_reg_n_0_[1]),
        .I2(ct_reg_n_0_[0])
    );
    LUT6 nq[25]_i_1
    (
        .O(nq[25]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_6_n_0),
        .I3(nq[25]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[25])
    );
    LUT3 nq[25]_i_2
    (
        .O(nq[25]_i_2_n_0),
        .I0(ct_reg_n_0_[2]),
        .I1(ct_reg_n_0_[0]),
        .I2(ct_reg_n_0_[1])
    );
    LUT6 nq[26]_i_1
    (
        .O(nq[26]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_6_n_0),
        .I3(nq[26]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[26])
    );
    LUT3 nq[26]_i_2
    (
        .O(nq[26]_i_2_n_0),
        .I0(ct_reg_n_0_[2]),
        .I1(ct_reg_n_0_[1]),
        .I2(ct_reg_n_0_[0])
    );
    LUT6 nq[27]_i_1
    (
        .O(nq[27]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_6_n_0),
        .I3(nq[27]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[27])
    );
    LUT3 nq[27]_i_2
    (
        .O(nq[27]_i_2_n_0),
        .I0(ct_reg_n_0_[2]),
        .I1(ct_reg_n_0_[1]),
        .I2(ct_reg_n_0_[0])
    );
    LUT6 nq[28]_i_1
    (
        .O(nq[28]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_6_n_0),
        .I3(nq[28]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[28])
    );
    LUT3 nq[28]_i_2
    (
        .O(nq[28]_i_2_n_0),
        .I0(ct_reg_n_0_[2]),
        .I1(ct_reg_n_0_[1]),
        .I2(ct_reg_n_0_[0])
    );
    LUT6 nq[29]_i_1
    (
        .O(nq[29]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_6_n_0),
        .I3(nq[29]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[29])
    );
    LUT3 nq[29]_i_2
    (
        .O(nq[29]_i_2_n_0),
        .I0(ct_reg_n_0_[2]),
        .I1(ct_reg_n_0_[0]),
        .I2(ct_reg_n_0_[1])
    );
    LUT6 nq[2]_i_1
    (
        .O(nq[2]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[26]_i_2_n_0),
        .I3(nq[7]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[2])
    );
    LUT6 nq[30]_i_1
    (
        .O(nq[30]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_5_n_0),
        .I3(nq[30]_i_6_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[30])
    );
    LUT2 nq[30]_i_2
    (
        .O(nq[30]_i_2_n_0),
        .I0(state_reg_reg[1]_0[1]),
        .I1(state_reg_reg[1]_0[0])
    );
    LUT3 nq[30]_i_3
    (
        .O(nq[30]_i_3_n_0),
        .I0(p_1_in),
        .I1(DR_reg_n_0_[31]),
        .I2(state_reg_n_0_[2])
    );
    LUT5 nq[30]_i_4
    (
        .O(nq[30]_i_4_n_0),
        .I0(state_reg_reg_n_0_[1]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(state_reg_n_0_[4]),
        .I3(state_reg_n_0_[3]),
        .I4(state_reg_n_0_[5])
    );
    LUT3 nq[30]_i_5
    (
        .O(nq[30]_i_5_n_0),
        .I0(ct_reg_n_0_[2]),
        .I1(ct_reg_n_0_[1]),
        .I2(ct_reg_n_0_[0])
    );
    LUT6 nq[30]_i_6
    (
        .O(nq[30]_i_6_n_0),
        .I0(ct_reg_n_0_[4]),
        .I1(ct_reg_n_0_[5]),
        .I2(ct_reg_n_0_[3]),
        .I3(state_reg_n_0_[0]),
        .I4(state_reg_n_0_[1]),
        .I5(state_reg_n_0_[2])
    );
    LUT5 nq[30]_i_7
    (
        .O(nq[30]_i_7_n_0),
        .I0(ready_reg_n_0),
        .I1(ready_button_IBUF),
        .I2(state_reg_n_0_[0]),
        .I3(state_reg_n_0_[2]),
        .I4(state_reg_n_0_[1])
    );
    LUT6 nq[3]_i_1
    (
        .O(nq[3]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[27]_i_2_n_0),
        .I3(nq[7]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[3])
    );
    LUT6 nq[4]_i_1
    (
        .O(nq[4]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[28]_i_2_n_0),
        .I3(nq[7]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[4])
    );
    LUT6 nq[5]_i_1
    (
        .O(nq[5]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[29]_i_2_n_0),
        .I3(nq[7]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[5])
    );
    LUT6 nq[6]_i_1
    (
        .O(nq[6]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_5_n_0),
        .I3(nq[7]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[6])
    );
    LUT6 nq[7]_i_1
    (
        .O(nq[7]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[23]_i_2_n_0),
        .I3(nq[7]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[7])
    );
    LUT6 nq[7]_i_2
    (
        .O(nq[7]_i_2_n_0),
        .I0(state_reg_n_0_[0]),
        .I1(state_reg_n_0_[1]),
        .I2(state_reg_n_0_[2]),
        .I3(ct_reg_n_0_[3]),
        .I4(ct_reg_n_0_[4]),
        .I5(ct_reg_n_0_[5])
    );
    LUT6 nq[8]_i_1
    (
        .O(nq[8]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[24]_i_2_n_0),
        .I3(nq[15]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[8])
    );
    LUT6 nq[9]_i_1
    (
        .O(nq[9]_i_1_n_0),
        .I0(nq[30]_i_3_n_0),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[25]_i_2_n_0),
        .I3(nq[15]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(nq_reg_n_0_[9])
    );
    FDCE nq_reg[0]
    (
        .Q(nq_reg_n_0_[0]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[0]_i_1_n_0)
    );
    FDCE nq_reg[10]
    (
        .Q(nq_reg_n_0_[10]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[10]_i_1_n_0)
    );
    FDCE nq_reg[11]
    (
        .Q(nq_reg_n_0_[11]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[11]_i_1_n_0)
    );
    FDCE nq_reg[12]
    (
        .Q(nq_reg_n_0_[12]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[12]_i_1_n_0)
    );
    FDCE nq_reg[13]
    (
        .Q(nq_reg_n_0_[13]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[13]_i_1_n_0)
    );
    FDCE nq_reg[14]
    (
        .Q(nq_reg_n_0_[14]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[14]_i_1_n_0)
    );
    FDCE nq_reg[15]
    (
        .Q(nq_reg_n_0_[15]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[15]_i_1_n_0)
    );
    FDCE nq_reg[16]
    (
        .Q(nq_reg_n_0_[16]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[16]_i_1_n_0)
    );
    FDCE nq_reg[17]
    (
        .Q(nq_reg_n_0_[17]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[17]_i_1_n_0)
    );
    FDCE nq_reg[18]
    (
        .Q(nq_reg_n_0_[18]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[18]_i_1_n_0)
    );
    FDCE nq_reg[19]
    (
        .Q(nq_reg_n_0_[19]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[19]_i_1_n_0)
    );
    FDCE nq_reg[1]
    (
        .Q(nq_reg_n_0_[1]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[1]_i_1_n_0)
    );
    FDCE nq_reg[20]
    (
        .Q(nq_reg_n_0_[20]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[20]_i_1_n_0)
    );
    FDCE nq_reg[21]
    (
        .Q(nq_reg_n_0_[21]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[21]_i_1_n_0)
    );
    FDCE nq_reg[22]
    (
        .Q(nq_reg_n_0_[22]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[22]_i_1_n_0)
    );
    FDCE nq_reg[23]
    (
        .Q(nq_reg_n_0_[23]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[23]_i_1_n_0)
    );
    FDCE nq_reg[24]
    (
        .Q(nq_reg_n_0_[24]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[24]_i_1_n_0)
    );
    FDCE nq_reg[25]
    (
        .Q(nq_reg_n_0_[25]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[25]_i_1_n_0)
    );
    FDCE nq_reg[26]
    (
        .Q(nq_reg_n_0_[26]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[26]_i_1_n_0)
    );
    FDCE nq_reg[27]
    (
        .Q(nq_reg_n_0_[27]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[27]_i_1_n_0)
    );
    FDCE nq_reg[28]
    (
        .Q(nq_reg_n_0_[28]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[28]_i_1_n_0)
    );
    FDCE nq_reg[29]
    (
        .Q(nq_reg_n_0_[29]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[29]_i_1_n_0)
    );
    FDCE nq_reg[2]
    (
        .Q(nq_reg_n_0_[2]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[2]_i_1_n_0)
    );
    FDCE nq_reg[30]
    (
        .Q(nq_reg_n_0_[30]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[30]_i_1_n_0)
    );
    FDCE nq_reg[3]
    (
        .Q(nq_reg_n_0_[3]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[3]_i_1_n_0)
    );
    FDCE nq_reg[4]
    (
        .Q(nq_reg_n_0_[4]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[4]_i_1_n_0)
    );
    FDCE nq_reg[5]
    (
        .Q(nq_reg_n_0_[5]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[5]_i_1_n_0)
    );
    FDCE nq_reg[6]
    (
        .Q(nq_reg_n_0_[6]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[6]_i_1_n_0)
    );
    FDCE nq_reg[7]
    (
        .Q(nq_reg_n_0_[7]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[7]_i_1_n_0)
    );
    FDCE nq_reg[8]
    (
        .Q(nq_reg_n_0_[8]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[8]_i_1_n_0)
    );
    FDCE nq_reg[9]
    (
        .Q(nq_reg_n_0_[9]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(nq[9]_i_1_n_0)
    );
    LUT3 o_quotient[0]_i_1
    (
        .O(adder_0/o_s0),
        .I0(reg_carry_reg_n_0),
        .I1(reg_a[0]),
        .I2(reg_b[0])
    );
    LUT5 o_quotient[1]_i_1
    (
        .O(adder_0/o_s01_out),
        .I0(reg_b[0]),
        .I1(reg_a[0]),
        .I2(reg_carry_reg_n_0),
        .I3(reg_a[1]),
        .I4(reg_b[1])
    );
    LUT5 o_quotient[2]_i_1
    (
        .O(adder_0/o_s04_out),
        .I0(o_quotient[2]_i_2_n_0),
        .I1(reg_b[1]),
        .I2(reg_a[1]),
        .I3(reg_b[2]),
        .I4(reg_a[2])
    );
    LUT3 o_quotient[2]_i_2
    (
        .O(o_quotient[2]_i_2_n_0),
        .I0(reg_carry_reg_n_0),
        .I1(reg_a[0]),
        .I2(reg_b[0])
    );
    LUT3 o_quotient[3]_i_1
    (
        .O(o_quotient[3]_i_1_n_0),
        .I0(o_quotient[3]_i_4_n_0),
        .I1(state_reg_n_0_[3]),
        .I2(state_reg_n_0_[4])
    );
    LUT3 o_quotient[3]_i_2
    (
        .O(adder_0/o_s07_out),
        .I0(o_quotient[3]_i_5_n_0),
        .I1(reg_b[3]),
        .I2(reg_a[3])
    );
    LUT2 o_quotient[3]_i_3
    (
        .O(o_quotient[3]_i_3_n_0),
        .I0(state_reg_reg[1]_0[1]),
        .I1(state_reg_reg[1]_0[0])
    );
    LUT6 o_quotient[3]_i_4
    (
        .O(o_quotient[3]_i_4_n_0),
        .I0(state_reg_reg_n_0_[1]),
        .I1(state_reg_n_0_[0]),
        .I2(state_reg_n_0_[2]),
        .I3(state_reg_reg_n_0_[0]),
        .I4(state_reg_n_0_[5]),
        .I5(state_reg_n_0_[1])
    );
    LUT5 o_quotient[3]_i_5
    (
        .O(o_quotient[3]_i_5_n_0),
        .I0(reg_a[2]),
        .I1(reg_b[2]),
        .I2(reg_a[1]),
        .I3(reg_b[1]),
        .I4(o_quotient[2]_i_2_n_0)
    );
    FDCE o_quotient_reg[0]
    (
        .Q(quotient_reg[3][0]),
        .C(CLK),
        .CE(o_quotient[3]_i_1_n_0),
        .CLR(o_quotient[3]_i_3_n_0),
        .D(adder_0/o_s0)
    );
    FDCE o_quotient_reg[1]
    (
        .Q(quotient_reg[3][1]),
        .C(CLK),
        .CE(o_quotient[3]_i_1_n_0),
        .CLR(o_quotient[3]_i_3_n_0),
        .D(adder_0/o_s01_out)
    );
    FDCE o_quotient_reg[2]
    (
        .Q(quotient_reg[3][2]),
        .C(CLK),
        .CE(o_quotient[3]_i_1_n_0),
        .CLR(o_quotient[3]_i_3_n_0),
        .D(adder_0/o_s04_out)
    );
    FDCE o_quotient_reg[3]
    (
        .Q(quotient_reg[3][3]),
        .C(CLK),
        .CE(o_quotient[3]_i_1_n_0),
        .CLR(o_quotient[3]_i_3_n_0),
        .D(adder_0/o_s07_out)
    );
    LUT6 q[0]_i_1
    (
        .O(q[0]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[24]_i_2_n_0),
        .I3(nq[7]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[0])
    );
    LUT6 q[10]_i_1
    (
        .O(q[10]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[26]_i_2_n_0),
        .I3(nq[15]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[10])
    );
    LUT6 q[11]_i_1
    (
        .O(q[11]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[27]_i_2_n_0),
        .I3(nq[15]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[11])
    );
    LUT6 q[12]_i_1
    (
        .O(q[12]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[28]_i_2_n_0),
        .I3(nq[15]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[12])
    );
    LUT6 q[13]_i_1
    (
        .O(q[13]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[29]_i_2_n_0),
        .I3(nq[15]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[13])
    );
    LUT6 q[14]_i_1
    (
        .O(q[14]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_5_n_0),
        .I3(nq[15]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[14])
    );
    LUT6 q[15]_i_1
    (
        .O(q[15]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[23]_i_2_n_0),
        .I3(nq[15]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[15])
    );
    LUT6 q[16]_i_1
    (
        .O(q[16]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[24]_i_2_n_0),
        .I3(nq[23]_i_3_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[16])
    );
    LUT6 q[17]_i_1
    (
        .O(q[17]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[25]_i_2_n_0),
        .I3(nq[23]_i_3_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[17])
    );
    LUT6 q[18]_i_1
    (
        .O(q[18]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[26]_i_2_n_0),
        .I3(nq[23]_i_3_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[18])
    );
    LUT6 q[19]_i_1
    (
        .O(q[19]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[27]_i_2_n_0),
        .I3(nq[23]_i_3_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[19])
    );
    LUT6 q[1]_i_1
    (
        .O(q[1]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[25]_i_2_n_0),
        .I3(nq[7]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[1])
    );
    LUT6 q[20]_i_1
    (
        .O(q[20]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[28]_i_2_n_0),
        .I3(nq[23]_i_3_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[20])
    );
    LUT6 q[21]_i_1
    (
        .O(q[21]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[29]_i_2_n_0),
        .I3(nq[23]_i_3_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[21])
    );
    LUT6 q[22]_i_1
    (
        .O(q[22]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_5_n_0),
        .I3(nq[23]_i_3_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[22])
    );
    LUT6 q[23]_i_1
    (
        .O(q[23]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[23]_i_2_n_0),
        .I3(nq[23]_i_3_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[23])
    );
    LUT6 q[24]_i_1
    (
        .O(q[24]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_6_n_0),
        .I3(nq[24]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[24])
    );
    LUT6 q[25]_i_1
    (
        .O(q[25]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_6_n_0),
        .I3(nq[25]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[25])
    );
    LUT6 q[26]_i_1
    (
        .O(q[26]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_6_n_0),
        .I3(nq[26]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[26])
    );
    LUT6 q[27]_i_1
    (
        .O(q[27]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_6_n_0),
        .I3(nq[27]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[27])
    );
    LUT6 q[28]_i_1
    (
        .O(q[28]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_6_n_0),
        .I3(nq[28]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[28])
    );
    LUT6 q[29]_i_1
    (
        .O(q[29]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_6_n_0),
        .I3(nq[29]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[29])
    );
    LUT6 q[2]_i_1
    (
        .O(q[2]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[26]_i_2_n_0),
        .I3(nq[7]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[2])
    );
    LUT6 q[30]_i_1
    (
        .O(q[30]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_5_n_0),
        .I3(nq[30]_i_6_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[30])
    );
    LUT3 q[30]_i_2
    (
        .O(q[1]),
        .I0(state_reg_n_0_[2]),
        .I1(p_1_in),
        .I2(DR_reg_n_0_[31])
    );
    LUT6 q[3]_i_1
    (
        .O(q[3]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[27]_i_2_n_0),
        .I3(nq[7]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[3])
    );
    LUT6 q[4]_i_1
    (
        .O(q[4]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[28]_i_2_n_0),
        .I3(nq[7]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[4])
    );
    LUT6 q[5]_i_1
    (
        .O(q[5]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[29]_i_2_n_0),
        .I3(nq[7]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[5])
    );
    LUT6 q[6]_i_1
    (
        .O(q[6]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[30]_i_5_n_0),
        .I3(nq[7]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[6])
    );
    LUT6 q[7]_i_1
    (
        .O(q[7]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[23]_i_2_n_0),
        .I3(nq[7]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[7])
    );
    LUT6 q[8]_i_1
    (
        .O(q[8]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[24]_i_2_n_0),
        .I3(nq[15]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[8])
    );
    LUT6 q[9]_i_1
    (
        .O(q[9]_i_1_n_0),
        .I0(q[1]),
        .I1(nq[30]_i_4_n_0),
        .I2(nq[25]_i_2_n_0),
        .I3(nq[15]_i_2_n_0),
        .I4(nq[30]_i_7_n_0),
        .I5(q_reg_n_0_[9])
    );
    FDCE q_reg[0]
    (
        .Q(q_reg_n_0_[0]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[0]_i_1_n_0)
    );
    FDCE q_reg[10]
    (
        .Q(q_reg_n_0_[10]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[10]_i_1_n_0)
    );
    FDCE q_reg[11]
    (
        .Q(q_reg_n_0_[11]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[11]_i_1_n_0)
    );
    FDCE q_reg[12]
    (
        .Q(q_reg_n_0_[12]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[12]_i_1_n_0)
    );
    FDCE q_reg[13]
    (
        .Q(q_reg_n_0_[13]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[13]_i_1_n_0)
    );
    FDCE q_reg[14]
    (
        .Q(q_reg_n_0_[14]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[14]_i_1_n_0)
    );
    FDCE q_reg[15]
    (
        .Q(q_reg_n_0_[15]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[15]_i_1_n_0)
    );
    FDCE q_reg[16]
    (
        .Q(q_reg_n_0_[16]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[16]_i_1_n_0)
    );
    FDCE q_reg[17]
    (
        .Q(q_reg_n_0_[17]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[17]_i_1_n_0)
    );
    FDCE q_reg[18]
    (
        .Q(q_reg_n_0_[18]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[18]_i_1_n_0)
    );
    FDCE q_reg[19]
    (
        .Q(q_reg_n_0_[19]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[19]_i_1_n_0)
    );
    FDCE q_reg[1]
    (
        .Q(q_reg_n_0_[1]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[1]_i_1_n_0)
    );
    FDCE q_reg[20]
    (
        .Q(q_reg_n_0_[20]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[20]_i_1_n_0)
    );
    FDCE q_reg[21]
    (
        .Q(q_reg_n_0_[21]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[21]_i_1_n_0)
    );
    FDCE q_reg[22]
    (
        .Q(q_reg_n_0_[22]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[22]_i_1_n_0)
    );
    FDCE q_reg[23]
    (
        .Q(q_reg_n_0_[23]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[23]_i_1_n_0)
    );
    FDCE q_reg[24]
    (
        .Q(q_reg_n_0_[24]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[24]_i_1_n_0)
    );
    FDCE q_reg[25]
    (
        .Q(q_reg_n_0_[25]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[25]_i_1_n_0)
    );
    FDCE q_reg[26]
    (
        .Q(q_reg_n_0_[26]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[26]_i_1_n_0)
    );
    FDCE q_reg[27]
    (
        .Q(q_reg_n_0_[27]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[27]_i_1_n_0)
    );
    FDCE q_reg[28]
    (
        .Q(q_reg_n_0_[28]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[28]_i_1_n_0)
    );
    FDCE q_reg[29]
    (
        .Q(q_reg_n_0_[29]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[29]_i_1_n_0)
    );
    FDCE q_reg[2]
    (
        .Q(q_reg_n_0_[2]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[2]_i_1_n_0)
    );
    FDCE q_reg[30]
    (
        .Q(q_reg_n_0_[30]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[30]_i_1_n_0)
    );
    FDCE q_reg[3]
    (
        .Q(q_reg_n_0_[3]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[3]_i_1_n_0)
    );
    FDCE q_reg[4]
    (
        .Q(q_reg_n_0_[4]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[4]_i_1_n_0)
    );
    FDCE q_reg[5]
    (
        .Q(q_reg_n_0_[5]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[5]_i_1_n_0)
    );
    FDCE q_reg[6]
    (
        .Q(q_reg_n_0_[6]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[6]_i_1_n_0)
    );
    FDCE q_reg[7]
    (
        .Q(q_reg_n_0_[7]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[7]_i_1_n_0)
    );
    FDCE q_reg[8]
    (
        .Q(q_reg_n_0_[8]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[8]_i_1_n_0)
    );
    FDCE q_reg[9]
    (
        .Q(q_reg_n_0_[9]),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(q[9]_i_1_n_0)
    );
    LUT4 quotient[3]_i_1
    (
        .O(E),
        .I0(state_reg_reg[1]_0[0]),
        .I1(state_reg_reg[1]_0[1]),
        .I2(ready_reg_n_0),
        .I3(ready_button_IBUF)
    );
    LUT5 ready_i_1
    (
        .O(ready_i_1_n_0),
        .I0(ready_button_IBUF),
        .I1(ready_reg_n_0),
        .I2(state_reg_n_0_[4]),
        .I3(state_reg_n_0_[3]),
        .I4(o_quotient[3]_i_4_n_0)
    );
    FDCE ready_reg
    (
        .Q(ready_reg_n_0),
        .C(CLK),
        .CE(<const1>),
        .CLR(nq[30]_i_2_n_0),
        .D(ready_i_1_n_0)
    );
    LUT3 reg_a[0]_i_1
    (
        .O(a[0]),
        .I0(shifted_1_reg_n_0_[0]),
        .I1(ct_1_en_reg_n_0),
        .I2(reg_a[0]_i_2_n_0)
    );
    LUT6 reg_a[0]_i_2
    (
        .O(reg_a[0]_i_2_n_0),
        .I0(final_nq[0]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[7]_i_3_n_0),
        .I4(DR_reg_n_0_[0]),
        .I5(reg_a[3]_i_3_n_0)
    );
    LUT5 reg_a[10]_i_1
    (
        .O(a[10]),
        .I0(final_nq[10]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[15]_i_3_n_0),
        .I4(reg_a[10]_i_2_n_0)
    );
    LUT5 reg_a[10]_i_2
    (
        .O(reg_a[10]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[10]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[11]_i_1
    (
        .O(a[11]),
        .I0(final_nq[11]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[15]_i_3_n_0),
        .I4(reg_a[11]_i_3_n_0)
    );
    LUT5 reg_a[11]_i_3
    (
        .O(reg_a[11]_i_3_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[11]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[12]_i_1
    (
        .O(a[12]),
        .I0(final_nq[12]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[15]_i_3_n_0),
        .I4(reg_a[12]_i_2_n_0)
    );
    LUT5 reg_a[12]_i_2
    (
        .O(reg_a[12]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[12]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[13]_i_1
    (
        .O(a[13]),
        .I0(final_nq[13]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[15]_i_3_n_0),
        .I4(reg_a[13]_i_2_n_0)
    );
    LUT5 reg_a[13]_i_2
    (
        .O(reg_a[13]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[13]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[14]_i_1
    (
        .O(a[14]),
        .I0(final_nq[14]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[15]_i_3_n_0),
        .I4(reg_a[14]_i_2_n_0)
    );
    LUT5 reg_a[14]_i_2
    (
        .O(reg_a[14]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[14]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[15]_i_1
    (
        .O(a[15]),
        .I0(final_nq[15]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[15]_i_3_n_0),
        .I4(reg_a[15]_i_4_n_0)
    );
    LUT4 reg_a[15]_i_3
    (
        .O(reg_a[15]_i_3_n_0),
        .I0(addback_nDR),
        .I1(Q[1]),
        .I2(addback_DR),
        .I3(state_reg_n_0_[3])
    );
    LUT5 reg_a[15]_i_4
    (
        .O(reg_a[15]_i_4_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[15]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[16]_i_1
    (
        .O(a[16]),
        .I0(reg_a[23]_i_3_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(final_nq[16]),
        .I4(reg_a[16]_i_2_n_0)
    );
    LUT5 reg_a[16]_i_2
    (
        .O(reg_a[16]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[16]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[17]_i_1
    (
        .O(a[17]),
        .I0(reg_a[23]_i_3_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(final_nq[17]),
        .I4(reg_a[17]_i_2_n_0)
    );
    LUT5 reg_a[17]_i_2
    (
        .O(reg_a[17]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[17]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[18]_i_1
    (
        .O(a[18]),
        .I0(reg_a[23]_i_3_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(final_nq[18]),
        .I4(reg_a[18]_i_2_n_0)
    );
    LUT5 reg_a[18]_i_2
    (
        .O(reg_a[18]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[18]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[19]_i_1
    (
        .O(a[19]),
        .I0(reg_a[23]_i_3_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(final_nq[19]),
        .I4(reg_a[19]_i_3_n_0)
    );
    LUT5 reg_a[19]_i_3
    (
        .O(reg_a[19]_i_3_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[19]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT3 reg_a[1]_i_1
    (
        .O(a[1]),
        .I0(shifted_1_reg_n_0_[1]),
        .I1(ct_1_en_reg_n_0),
        .I2(reg_a[1]_i_2_n_0)
    );
    LUT6 reg_a[1]_i_2
    (
        .O(reg_a[1]_i_2_n_0),
        .I0(final_nq[1]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[7]_i_3_n_0),
        .I4(DR_reg_n_0_[1]),
        .I5(reg_a[3]_i_3_n_0)
    );
    LUT5 reg_a[20]_i_1
    (
        .O(a[20]),
        .I0(final_nq[20]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[23]_i_3_n_0),
        .I4(reg_a[20]_i_2_n_0)
    );
    LUT5 reg_a[20]_i_2
    (
        .O(reg_a[20]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[20]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[21]_i_1
    (
        .O(a[21]),
        .I0(final_nq[21]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[23]_i_3_n_0),
        .I4(reg_a[21]_i_2_n_0)
    );
    LUT5 reg_a[21]_i_2
    (
        .O(reg_a[21]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[21]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[22]_i_1
    (
        .O(a[22]),
        .I0(final_nq[22]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[23]_i_3_n_0),
        .I4(reg_a[22]_i_2_n_0)
    );
    LUT5 reg_a[22]_i_2
    (
        .O(reg_a[22]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[22]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[23]_i_1
    (
        .O(a[23]),
        .I0(final_nq[23]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[23]_i_3_n_0),
        .I4(reg_a[23]_i_4_n_0)
    );
    LUT4 reg_a[23]_i_3
    (
        .O(reg_a[23]_i_3_n_0),
        .I0(addback_nDR),
        .I1(Q[2]),
        .I2(addback_DR),
        .I3(state_reg_n_0_[3])
    );
    LUT5 reg_a[23]_i_4
    (
        .O(reg_a[23]_i_4_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[23]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[24]_i_1
    (
        .O(a[24]),
        .I0(state_reg_n_0_[3]),
        .I1(reg_a[31]_i_4_n_0),
        .I2(final_nq[24]),
        .I3(reg_a[31]_i_5_n_0),
        .I4(reg_a[24]_i_2_n_0)
    );
    LUT5 reg_a[24]_i_2
    (
        .O(reg_a[24]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[24]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[25]_i_1
    (
        .O(a[25]),
        .I0(state_reg_n_0_[3]),
        .I1(reg_a[31]_i_4_n_0),
        .I2(final_nq[25]),
        .I3(reg_a[31]_i_5_n_0),
        .I4(reg_a[25]_i_2_n_0)
    );
    LUT5 reg_a[25]_i_2
    (
        .O(reg_a[25]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[25]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[26]_i_1
    (
        .O(a[26]),
        .I0(state_reg_n_0_[3]),
        .I1(reg_a[31]_i_4_n_0),
        .I2(final_nq[26]),
        .I3(reg_a[31]_i_5_n_0),
        .I4(reg_a[26]_i_2_n_0)
    );
    LUT5 reg_a[26]_i_2
    (
        .O(reg_a[26]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[26]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[27]_i_1
    (
        .O(a[27]),
        .I0(state_reg_n_0_[3]),
        .I1(reg_a[31]_i_4_n_0),
        .I2(final_nq[27]),
        .I3(reg_a[31]_i_5_n_0),
        .I4(reg_a[27]_i_3_n_0)
    );
    LUT5 reg_a[27]_i_3
    (
        .O(reg_a[27]_i_3_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[27]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[28]_i_1
    (
        .O(a[28]),
        .I0(state_reg_n_0_[3]),
        .I1(reg_a[31]_i_4_n_0),
        .I2(final_nq[28]),
        .I3(reg_a[31]_i_5_n_0),
        .I4(reg_a[28]_i_2_n_0)
    );
    LUT5 reg_a[28]_i_2
    (
        .O(reg_a[28]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[28]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[29]_i_1
    (
        .O(a[29]),
        .I0(state_reg_n_0_[3]),
        .I1(reg_a[31]_i_4_n_0),
        .I2(final_nq[29]),
        .I3(reg_a[31]_i_5_n_0),
        .I4(reg_a[29]_i_2_n_0)
    );
    LUT5 reg_a[29]_i_2
    (
        .O(reg_a[29]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[29]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT3 reg_a[2]_i_1
    (
        .O(a[2]),
        .I0(shifted_1_reg_n_0_[2]),
        .I1(ct_1_en_reg_n_0),
        .I2(reg_a[2]_i_2_n_0)
    );
    LUT6 reg_a[2]_i_2
    (
        .O(reg_a[2]_i_2_n_0),
        .I0(final_nq[2]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[7]_i_3_n_0),
        .I4(DR_reg_n_0_[2]),
        .I5(reg_a[3]_i_3_n_0)
    );
    LUT5 reg_a[30]_i_1
    (
        .O(a[30]),
        .I0(state_reg_n_0_[3]),
        .I1(reg_a[31]_i_4_n_0),
        .I2(final_nq[30]),
        .I3(reg_a[31]_i_5_n_0),
        .I4(reg_a[30]_i_3_n_0)
    );
    LUT5 reg_a[30]_i_3
    (
        .O(reg_a[30]_i_3_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[30]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT2 reg_a[31]_i_1
    (
        .O(reg_carry),
        .I0(state_reg_reg_n_0_[1]),
        .I1(state_reg_reg_n_0_[0])
    );
    LUT6 reg_a[31]_i_2
    (
        .O(reg_a[31]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_3_n_0),
        .I2(reg_a[31]_i_4_n_0),
        .I3(state_reg_n_0_[4]),
        .I4(state_reg_n_0_[3]),
        .I5(reg_a[31]_i_5_n_0)
    );
    LUT5 reg_a[31]_i_3
    (
        .O(reg_a[31]_i_3_n_0),
        .I0(state_reg_n_0_[3]),
        .I1(state_reg_n_0_[4]),
        .I2(p_1_in),
        .I3(state_reg_n_0_[0]),
        .I4(reg_a[31]_i_6_n_0)
    );
    LUT3 reg_a[31]_i_4
    (
        .O(reg_a[31]_i_4_n_0),
        .I0(addback_DR),
        .I1(Q[3]),
        .I2(addback_nDR)
    );
    LUT6 reg_a[31]_i_5
    (
        .O(reg_a[31]_i_5_n_0),
        .I0(state_reg_n_0_[3]),
        .I1(state_reg_n_0_[4]),
        .I2(state_reg_n_0_[2]),
        .I3(state_reg_n_0_[0]),
        .I4(state_reg_n_0_[5]),
        .I5(state_reg_n_0_[1])
    );
    LUT3 reg_a[31]_i_6
    (
        .O(reg_a[31]_i_6_n_0),
        .I0(state_reg_n_0_[1]),
        .I1(state_reg_n_0_[5]),
        .I2(state_reg_n_0_[2])
    );
    LUT4 reg_a[31]_i_7
    (
        .O(addback_DR),
        .I0(reg_carry_i_4_n_0),
        .I1(DR_reg_n_0_[31]),
        .I2(p_1_in),
        .I3(DD_sign)
    );
    LUT3 reg_a[3]_i_1
    (
        .O(a[3]),
        .I0(shifted_1_reg_n_0_[3]),
        .I1(ct_1_en_reg_n_0),
        .I2(reg_a[3]_i_2_n_0)
    );
    LUT6 reg_a[3]_i_2
    (
        .O(reg_a[3]_i_2_n_0),
        .I0(final_nq[3]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[7]_i_3_n_0),
        .I4(DR_reg_n_0_[3]),
        .I5(reg_a[3]_i_3_n_0)
    );
    LUT2 reg_a[3]_i_3
    (
        .O(reg_a[3]_i_3_n_0),
        .I0(DR_reg_n_0_[31]),
        .I1(p_1_in)
    );
    LUT5 reg_a[4]_i_1
    (
        .O(a[4]),
        .I0(final_nq[4]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[7]_i_3_n_0),
        .I4(reg_a[4]_i_2_n_0)
    );
    LUT5 reg_a[4]_i_2
    (
        .O(reg_a[4]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[4]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[5]_i_1
    (
        .O(a[5]),
        .I0(final_nq[5]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[7]_i_3_n_0),
        .I4(reg_a[5]_i_2_n_0)
    );
    LUT5 reg_a[5]_i_2
    (
        .O(reg_a[5]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[5]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[6]_i_1
    (
        .O(a[6]),
        .I0(final_nq[6]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[7]_i_3_n_0),
        .I4(reg_a[6]_i_2_n_0)
    );
    LUT5 reg_a[6]_i_2
    (
        .O(reg_a[6]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[6]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[7]_i_1
    (
        .O(a[7]),
        .I0(final_nq[7]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[7]_i_3_n_0),
        .I4(reg_a[7]_i_4_n_0)
    );
    LUT2 reg_a[7]_i_13
    (
        .O(reg_a[7]_i_13_n_0),
        .I0(nq_reg_n_0_[0]),
        .I1(addback_DR)
    );
    LUT4 reg_a[7]_i_3
    (
        .O(reg_a[7]_i_3_n_0),
        .I0(addback_nDR),
        .I1(Q[0]),
        .I2(addback_DR),
        .I3(state_reg_n_0_[3])
    );
    LUT5 reg_a[7]_i_4
    (
        .O(reg_a[7]_i_4_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[7]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[8]_i_1
    (
        .O(a[8]),
        .I0(final_nq[8]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[15]_i_3_n_0),
        .I4(reg_a[8]_i_2_n_0)
    );
    LUT5 reg_a[8]_i_2
    (
        .O(reg_a[8]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[8]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    LUT5 reg_a[9]_i_1
    (
        .O(a[9]),
        .I0(final_nq[9]),
        .I1(reg_a[31]_i_5_n_0),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[15]_i_3_n_0),
        .I4(reg_a[9]_i_2_n_0)
    );
    LUT5 reg_a[9]_i_2
    (
        .O(reg_a[9]_i_2_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_a[31]_i_5_n_0),
        .I2(DR_reg_n_0_[9]),
        .I3(p_1_in),
        .I4(DR_reg_n_0_[31])
    );
    FDCE reg_a_reg[0]
    (
        .Q(reg_a[0]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[0])
    );
    FDCE reg_a_reg[10]
    (
        .Q(reg_a[10]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[10])
    );
    FDCE reg_a_reg[11]
    (
        .Q(reg_a[11]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[11])
    );
    CARRY4 reg_a_reg[11]_i_2
    (
        .CI(reg_a_reg[7]_i_2_n_0),
        .CYINIT(<const0>),
        .CO[3:0](reg_a_reg[11]_i_2_n_0),
        .O[3:0]({final_nq[11], final_nq[10], final_nq[9], final_nq[8]}),
        .DI[3:0]({<const0>, <const0>, <const0>, <const0>}),
        .S[3:0]({nq_reg_n_0_[11], nq_reg_n_0_[10], nq_reg_n_0_[9], nq_reg_n_0_[8]})
    );
    FDCE reg_a_reg[12]
    (
        .Q(reg_a[12]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[12])
    );
    FDCE reg_a_reg[13]
    (
        .Q(reg_a[13]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[13])
    );
    FDCE reg_a_reg[14]
    (
        .Q(reg_a[14]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[14])
    );
    FDCE reg_a_reg[15]
    (
        .Q(reg_a[15]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[15])
    );
    CARRY4 reg_a_reg[15]_i_2
    (
        .CI(reg_a_reg[11]_i_2_n_0),
        .CYINIT(<const0>),
        .CO[3:0](reg_a_reg[15]_i_2_n_0),
        .O[3:0]({final_nq[15], final_nq[14], final_nq[13], final_nq[12]}),
        .DI[3:0]({<const0>, <const0>, <const0>, <const0>}),
        .S[3:0]({nq_reg_n_0_[15], nq_reg_n_0_[14], nq_reg_n_0_[13], nq_reg_n_0_[12]})
    );
    FDCE reg_a_reg[16]
    (
        .Q(reg_a[16]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[16])
    );
    FDCE reg_a_reg[17]
    (
        .Q(reg_a[17]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[17])
    );
    FDCE reg_a_reg[18]
    (
        .Q(reg_a[18]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[18])
    );
    FDCE reg_a_reg[19]
    (
        .Q(reg_a[19]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[19])
    );
    CARRY4 reg_a_reg[19]_i_2
    (
        .CI(reg_a_reg[15]_i_2_n_0),
        .CYINIT(<const0>),
        .CO[3:0](reg_a_reg[19]_i_2_n_0),
        .O[3:0]({final_nq[19], final_nq[18], final_nq[17], final_nq[16]}),
        .DI[3:0]({<const0>, <const0>, <const0>, <const0>}),
        .S[3:0]({nq_reg_n_0_[19], nq_reg_n_0_[18], nq_reg_n_0_[17], nq_reg_n_0_[16]})
    );
    FDCE reg_a_reg[1]
    (
        .Q(reg_a[1]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[1])
    );
    FDCE reg_a_reg[20]
    (
        .Q(reg_a[20]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[20])
    );
    FDCE reg_a_reg[21]
    (
        .Q(reg_a[21]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[21])
    );
    FDCE reg_a_reg[22]
    (
        .Q(reg_a[22]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[22])
    );
    FDCE reg_a_reg[23]
    (
        .Q(reg_a[23]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[23])
    );
    CARRY4 reg_a_reg[23]_i_2
    (
        .CI(reg_a_reg[19]_i_2_n_0),
        .CYINIT(<const0>),
        .CO[3:0](reg_a_reg[23]_i_2_n_0),
        .O[3:0]({final_nq[23], final_nq[22], final_nq[21], final_nq[20]}),
        .DI[3:0]({<const0>, <const0>, <const0>, <const0>}),
        .S[3:0]({nq_reg_n_0_[23], nq_reg_n_0_[22], nq_reg_n_0_[21], nq_reg_n_0_[20]})
    );
    FDCE reg_a_reg[24]
    (
        .Q(reg_a[24]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[24])
    );
    FDCE reg_a_reg[25]
    (
        .Q(reg_a[25]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[25])
    );
    FDCE reg_a_reg[26]
    (
        .Q(reg_a[26]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[26])
    );
    FDCE reg_a_reg[27]
    (
        .Q(reg_a[27]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[27])
    );
    CARRY4 reg_a_reg[27]_i_2
    (
        .CI(reg_a_reg[23]_i_2_n_0),
        .CYINIT(<const0>),
        .CO[3:0](reg_a_reg[27]_i_2_n_0),
        .O[3:0]({final_nq[27], final_nq[26], final_nq[25], final_nq[24]}),
        .DI[3:0]({<const0>, <const0>, <const0>, <const0>}),
        .S[3:0]({nq_reg_n_0_[27], nq_reg_n_0_[26], nq_reg_n_0_[25], nq_reg_n_0_[24]})
    );
    FDCE reg_a_reg[28]
    (
        .Q(reg_a[28]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[28])
    );
    FDCE reg_a_reg[29]
    (
        .Q(reg_a[29]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[29])
    );
    FDCE reg_a_reg[2]
    (
        .Q(reg_a[2]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[2])
    );
    FDCE reg_a_reg[30]
    (
        .Q(reg_a[30]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[30])
    );
    CARRY4 reg_a_reg[30]_i_2
    (
        .CI(reg_a_reg[27]_i_2_n_0),
        .CYINIT(<const0>),
        .CO[3:0](),
        .O[3:0]({}),
        .DI[3:0]({<const0>, <const0>, <const0>, <const0>}),
        .S[3:0]({<const0>, nq_reg_n_0_[30], nq_reg_n_0_[29], nq_reg_n_0_[28]})
    );
    FDCE reg_a_reg[31]
    (
        .Q(reg_a[31]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(reg_a[31]_i_2_n_0)
    );
    FDCE reg_a_reg[3]
    (
        .Q(reg_a[3]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[3])
    );
    FDCE reg_a_reg[4]
    (
        .Q(reg_a[4]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[4])
    );
    FDCE reg_a_reg[5]
    (
        .Q(reg_a[5]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[5])
    );
    FDCE reg_a_reg[6]
    (
        .Q(reg_a[6]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[6])
    );
    FDCE reg_a_reg[7]
    (
        .Q(reg_a[7]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[7])
    );
    CARRY4 reg_a_reg[7]_i_2
    (
        .CI(reg_a_reg[7]_i_5_n_0),
        .CYINIT(<const0>),
        .CO[3:0](reg_a_reg[7]_i_2_n_0),
        .O[3:0]({final_nq[7], final_nq[6], final_nq[5], final_nq[4]}),
        .DI[3:0]({<const0>, <const0>, <const0>, <const0>}),
        .S[3:0]({nq_reg_n_0_[7], nq_reg_n_0_[6], nq_reg_n_0_[5], nq_reg_n_0_[4]})
    );
    CARRY4 reg_a_reg[7]_i_5
    (
        .CI(<const0>),
        .CYINIT(<const0>),
        .CO[3:0](reg_a_reg[7]_i_5_n_0),
        .O[3:0]({final_nq[3], final_nq[2], final_nq[1], final_nq[0]}),
        .DI[3:0]({<const0>, <const0>, <const0>, nq_reg_n_0_[0]}),
        .S[3:0]({nq_reg_n_0_[3], nq_reg_n_0_[2], nq_reg_n_0_[1], reg_a[7]_i_13_n_0})
    );
    FDCE reg_a_reg[8]
    (
        .Q(reg_a[8]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[8])
    );
    FDCE reg_a_reg[9]
    (
        .Q(reg_a[9]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(a[9])
    );
    LUT3 reg_b[0]_i_1
    (
        .O(b[0]),
        .I0(ct_1[0]),
        .I1(ct_1_en_reg_n_0),
        .I2(reg_b[0]_i_2_n_0)
    );
    LUT5 reg_b[0]_i_2
    (
        .O(reg_b[0]_i_2_n_0),
        .I0(reg_b_reg[7]_i_3_n_7),
        .I1(PR_1_reg_n_0_[0]),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[31]_i_5_n_0),
        .I4(PR_reg_n_0_[0])
    );
    LUT6 reg_b[10]_i_1
    (
        .O(b[10]),
        .I0(reg_b_reg[11]_i_2_n_5),
        .I1(PR_1_reg_n_0_[10]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[10]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[11]_i_1
    (
        .O(b[11]),
        .I0(reg_b_reg[11]_i_2_n_4),
        .I1(PR_1_reg_n_0_[11]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[11]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[12]_i_1
    (
        .O(b[12]),
        .I0(reg_b_reg[15]_i_2_n_7),
        .I1(PR_1_reg_n_0_[12]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[12]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[13]_i_1
    (
        .O(b[13]),
        .I0(reg_b_reg[15]_i_2_n_6),
        .I1(PR_1_reg_n_0_[13]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[13]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[14]_i_1
    (
        .O(b[14]),
        .I0(reg_b_reg[15]_i_2_n_5),
        .I1(PR_1_reg_n_0_[14]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[14]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[15]_i_1
    (
        .O(b[15]),
        .I0(reg_b_reg[15]_i_2_n_4),
        .I1(PR_1_reg_n_0_[15]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[15]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[16]_i_1
    (
        .O(b[16]),
        .I0(reg_b_reg[19]_i_2_n_7),
        .I1(PR_1_reg_n_0_[16]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[16]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[17]_i_1
    (
        .O(b[17]),
        .I0(reg_b_reg[19]_i_2_n_6),
        .I1(PR_1_reg_n_0_[17]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[17]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[18]_i_1
    (
        .O(b[18]),
        .I0(reg_b_reg[19]_i_2_n_5),
        .I1(PR_1_reg_n_0_[18]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[18]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[19]_i_1
    (
        .O(b[19]),
        .I0(reg_b_reg[19]_i_2_n_4),
        .I1(PR_1_reg_n_0_[19]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[19]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT3 reg_b[1]_i_1
    (
        .O(b[1]),
        .I0(reg_b[1]_i_2_n_0),
        .I1(ct_1[1]),
        .I2(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[1]_i_2
    (
        .O(reg_b[1]_i_2_n_0),
        .I0(reg_b_reg[7]_i_3_n_6),
        .I1(PR_1_reg_n_0_[1]),
        .I2(state_reg_n_0_[3]),
        .I3(ct_1_en_reg_n_0),
        .I4(reg_a[31]_i_5_n_0),
        .I5(PR_reg_n_0_[1])
    );
    LUT6 reg_b[20]_i_1
    (
        .O(b[20]),
        .I0(reg_b_reg[23]_i_2_n_7),
        .I1(PR_1_reg_n_0_[20]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[20]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[21]_i_1
    (
        .O(b[21]),
        .I0(reg_b_reg[23]_i_2_n_6),
        .I1(PR_1_reg_n_0_[21]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[21]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[22]_i_1
    (
        .O(b[22]),
        .I0(reg_b_reg[23]_i_2_n_5),
        .I1(PR_1_reg_n_0_[22]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[22]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[23]_i_1
    (
        .O(b[23]),
        .I0(reg_b_reg[23]_i_2_n_4),
        .I1(PR_1_reg_n_0_[23]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[23]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[24]_i_1
    (
        .O(b[24]),
        .I0(reg_b_reg[27]_i_2_n_7),
        .I1(PR_1_reg_n_0_[24]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[24]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[25]_i_1
    (
        .O(b[25]),
        .I0(reg_b_reg[27]_i_2_n_6),
        .I1(PR_1_reg_n_0_[25]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[25]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[26]_i_1
    (
        .O(b[26]),
        .I0(reg_b_reg[27]_i_2_n_5),
        .I1(PR_1_reg_n_0_[26]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[26]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[27]_i_1
    (
        .O(b[27]),
        .I0(reg_b_reg[27]_i_2_n_4),
        .I1(PR_1_reg_n_0_[27]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[27]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[28]_i_1
    (
        .O(b[28]),
        .I0(reg_b_reg[30]_i_2_n_7),
        .I1(PR_1_reg_n_0_[28]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[28]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[29]_i_1
    (
        .O(b[29]),
        .I0(reg_b_reg[30]_i_2_n_6),
        .I1(PR_1_reg_n_0_[29]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[29]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT3 reg_b[2]_i_1
    (
        .O(b[2]),
        .I0(ct_1_en_reg_n_0),
        .I1(ct_1[2]),
        .I2(reg_b[2]_i_2_n_0)
    );
    LUT6 reg_b[2]_i_2
    (
        .O(reg_b[2]_i_2_n_0),
        .I0(reg_b_reg[7]_i_3_n_5),
        .I1(PR_1_reg_n_0_[2]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[2]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[30]_i_1
    (
        .O(b[30]),
        .I0(reg_b_reg[30]_i_2_n_5),
        .I1(PR_1_reg_n_0_[30]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[30]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[31]_i_1
    (
        .O(reg_b[31]_i_1_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_b[31]_i_2_n_0),
        .I2(state_reg_n_0_[4]),
        .I3(state_reg_n_0_[3]),
        .I4(PR_1_reg_n_0_[31]),
        .I5(p_1_in)
    );
    LUT4 reg_b[31]_i_2
    (
        .O(reg_b[31]_i_2_n_0),
        .I0(state_reg_n_0_[1]),
        .I1(state_reg_n_0_[5]),
        .I2(state_reg_n_0_[0]),
        .I3(state_reg_n_0_[2])
    );
    LUT3 reg_b[3]_i_1
    (
        .O(b[3]),
        .I0(ct_1[3]),
        .I1(ct_1_en_reg_n_0),
        .I2(reg_b[3]_i_2_n_0)
    );
    LUT5 reg_b[3]_i_2
    (
        .O(reg_b[3]_i_2_n_0),
        .I0(reg_b_reg[7]_i_3_n_4),
        .I1(PR_1_reg_n_0_[3]),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[31]_i_5_n_0),
        .I4(PR_reg_n_0_[3])
    );
    LUT3 reg_b[4]_i_1
    (
        .O(b[4]),
        .I0(ct_1[4]),
        .I1(ct_1_en_reg_n_0),
        .I2(reg_b[4]_i_2_n_0)
    );
    LUT5 reg_b[4]_i_2
    (
        .O(reg_b[4]_i_2_n_0),
        .I0(reg_b_reg[7]_i_2_n_7),
        .I1(PR_1_reg_n_0_[4]),
        .I2(state_reg_n_0_[3]),
        .I3(reg_a[31]_i_5_n_0),
        .I4(PR_reg_n_0_[4])
    );
    LUT3 reg_b[5]_i_1
    (
        .O(b[5]),
        .I0(reg_b[5]_i_2_n_0),
        .I1(ct_1[5]),
        .I2(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[5]_i_2
    (
        .O(reg_b[5]_i_2_n_0),
        .I0(reg_b_reg[7]_i_2_n_6),
        .I1(PR_1_reg_n_0_[5]),
        .I2(state_reg_n_0_[3]),
        .I3(ct_1_en_reg_n_0),
        .I4(reg_a[31]_i_5_n_0),
        .I5(PR_reg_n_0_[5])
    );
    LUT6 reg_b[6]_i_1
    (
        .O(b[6]),
        .I0(reg_b_reg[7]_i_2_n_5),
        .I1(state_reg_n_0_[3]),
        .I2(PR_1_reg_n_0_[6]),
        .I3(PR_reg_n_0_[6]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[7]_i_1
    (
        .O(b[7]),
        .I0(reg_b_reg[7]_i_2_n_4),
        .I1(state_reg_n_0_[3]),
        .I2(PR_1_reg_n_0_[7]),
        .I3(PR_reg_n_0_[7]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT2 reg_b[7]_i_11
    (
        .O(reg_b[7]_i_11_n_0),
        .I0(q_reg_n_0_[0]),
        .I1(addback_nDR)
    );
    LUT6 reg_b[8]_i_1
    (
        .O(b[8]),
        .I0(reg_b_reg[11]_i_2_n_7),
        .I1(PR_1_reg_n_0_[8]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[8]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    LUT6 reg_b[9]_i_1
    (
        .O(b[9]),
        .I0(reg_b_reg[11]_i_2_n_6),
        .I1(PR_1_reg_n_0_[9]),
        .I2(state_reg_n_0_[3]),
        .I3(PR_reg_n_0_[9]),
        .I4(reg_a[31]_i_5_n_0),
        .I5(ct_1_en_reg_n_0)
    );
    FDCE reg_b_reg[0]
    (
        .Q(reg_b[0]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[0])
    );
    FDCE reg_b_reg[10]
    (
        .Q(reg_b[10]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[10])
    );
    FDCE reg_b_reg[11]
    (
        .Q(reg_b[11]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[11])
    );
    CARRY4 reg_b_reg[11]_i_2
    (
        .CI(reg_b_reg[7]_i_2_n_0),
        .CYINIT(<const0>),
        .CO[3:0](reg_b_reg[11]_i_2_n_0),
        .O[3:0]({reg_b_reg[11]_i_2_n_4, reg_b_reg[11]_i_2_n_5, reg_b_reg[11]_i_2_n_6, reg_b_reg[11]_i_2_n_7}),
        .DI[3:0]({<const0>, <const0>, <const0>, <const0>}),
        .S[3:0]({q_reg_n_0_[11], q_reg_n_0_[10], q_reg_n_0_[9], q_reg_n_0_[8]})
    );
    FDCE reg_b_reg[12]
    (
        .Q(reg_b[12]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[12])
    );
    FDCE reg_b_reg[13]
    (
        .Q(reg_b[13]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[13])
    );
    FDCE reg_b_reg[14]
    (
        .Q(reg_b[14]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[14])
    );
    FDCE reg_b_reg[15]
    (
        .Q(reg_b[15]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[15])
    );
    CARRY4 reg_b_reg[15]_i_2
    (
        .CI(reg_b_reg[11]_i_2_n_0),
        .CYINIT(<const0>),
        .CO[3:0](reg_b_reg[15]_i_2_n_0),
        .O[3:0]({reg_b_reg[15]_i_2_n_4, reg_b_reg[15]_i_2_n_5, reg_b_reg[15]_i_2_n_6, reg_b_reg[15]_i_2_n_7}),
        .DI[3:0]({<const0>, <const0>, <const0>, <const0>}),
        .S[3:0]({q_reg_n_0_[15], q_reg_n_0_[14], q_reg_n_0_[13], q_reg_n_0_[12]})
    );
    FDCE reg_b_reg[16]
    (
        .Q(reg_b[16]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[16])
    );
    FDCE reg_b_reg[17]
    (
        .Q(reg_b[17]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[17])
    );
    FDCE reg_b_reg[18]
    (
        .Q(reg_b[18]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[18])
    );
    FDCE reg_b_reg[19]
    (
        .Q(reg_b[19]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[19])
    );
    CARRY4 reg_b_reg[19]_i_2
    (
        .CI(reg_b_reg[15]_i_2_n_0),
        .CYINIT(<const0>),
        .CO[3:0](reg_b_reg[19]_i_2_n_0),
        .O[3:0]({reg_b_reg[19]_i_2_n_4, reg_b_reg[19]_i_2_n_5, reg_b_reg[19]_i_2_n_6, reg_b_reg[19]_i_2_n_7}),
        .DI[3:0]({<const0>, <const0>, <const0>, <const0>}),
        .S[3:0]({q_reg_n_0_[19], q_reg_n_0_[18], q_reg_n_0_[17], q_reg_n_0_[16]})
    );
    FDCE reg_b_reg[1]
    (
        .Q(reg_b[1]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[1])
    );
    FDCE reg_b_reg[20]
    (
        .Q(reg_b[20]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[20])
    );
    FDCE reg_b_reg[21]
    (
        .Q(reg_b[21]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[21])
    );
    FDCE reg_b_reg[22]
    (
        .Q(reg_b[22]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[22])
    );
    FDCE reg_b_reg[23]
    (
        .Q(reg_b[23]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[23])
    );
    CARRY4 reg_b_reg[23]_i_2
    (
        .CI(reg_b_reg[19]_i_2_n_0),
        .CYINIT(<const0>),
        .CO[3:0](reg_b_reg[23]_i_2_n_0),
        .O[3:0]({reg_b_reg[23]_i_2_n_4, reg_b_reg[23]_i_2_n_5, reg_b_reg[23]_i_2_n_6, reg_b_reg[23]_i_2_n_7}),
        .DI[3:0]({<const0>, <const0>, <const0>, <const0>}),
        .S[3:0]({q_reg_n_0_[23], q_reg_n_0_[22], q_reg_n_0_[21], q_reg_n_0_[20]})
    );
    FDCE reg_b_reg[24]
    (
        .Q(reg_b[24]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[24])
    );
    FDCE reg_b_reg[25]
    (
        .Q(reg_b[25]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[25])
    );
    FDCE reg_b_reg[26]
    (
        .Q(reg_b[26]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[26])
    );
    FDCE reg_b_reg[27]
    (
        .Q(reg_b[27]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[27])
    );
    CARRY4 reg_b_reg[27]_i_2
    (
        .CI(reg_b_reg[23]_i_2_n_0),
        .CYINIT(<const0>),
        .CO[3:0](reg_b_reg[27]_i_2_n_0),
        .O[3:0]({reg_b_reg[27]_i_2_n_4, reg_b_reg[27]_i_2_n_5, reg_b_reg[27]_i_2_n_6, reg_b_reg[27]_i_2_n_7}),
        .DI[3:0]({<const0>, <const0>, <const0>, <const0>}),
        .S[3:0]({q_reg_n_0_[27], q_reg_n_0_[26], q_reg_n_0_[25], q_reg_n_0_[24]})
    );
    FDCE reg_b_reg[28]
    (
        .Q(reg_b[28]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[28])
    );
    FDCE reg_b_reg[29]
    (
        .Q(reg_b[29]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[29])
    );
    FDCE reg_b_reg[2]
    (
        .Q(reg_b[2]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[2])
    );
    FDCE reg_b_reg[30]
    (
        .Q(reg_b[30]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[30])
    );
    CARRY4 reg_b_reg[30]_i_2
    (
        .CI(reg_b_reg[27]_i_2_n_0),
        .CYINIT(<const0>),
        .CO[3:0](),
        .O[3:0]({}),
        .DI[3:0]({<const0>, <const0>, <const0>, <const0>}),
        .S[3:0]({<const0>, q_reg_n_0_[30], q_reg_n_0_[29], q_reg_n_0_[28]})
    );
    FDCE reg_b_reg[31]
    (
        .Q(reg_b[31]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(PR[20]_i_2_n_0),
        .D(reg_b[31]_i_1_n_0)
    );
    FDCE reg_b_reg[3]
    (
        .Q(reg_b[3]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[3])
    );
    FDCE reg_b_reg[4]
    (
        .Q(reg_b[4]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[4])
    );
    FDCE reg_b_reg[5]
    (
        .Q(reg_b[5]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[5])
    );
    FDCE reg_b_reg[6]
    (
        .Q(reg_b[6]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[6])
    );
    FDCE reg_b_reg[7]
    (
        .Q(reg_b[7]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[7])
    );
    CARRY4 reg_b_reg[7]_i_2
    (
        .CI(reg_b_reg[7]_i_3_n_0),
        .CYINIT(<const0>),
        .CO[3:0](reg_b_reg[7]_i_2_n_0),
        .O[3:0]({reg_b_reg[7]_i_2_n_4, reg_b_reg[7]_i_2_n_5, reg_b_reg[7]_i_2_n_6, reg_b_reg[7]_i_2_n_7}),
        .DI[3:0]({<const0>, <const0>, <const0>, <const0>}),
        .S[3:0]({q_reg_n_0_[7], q_reg_n_0_[6], q_reg_n_0_[5], q_reg_n_0_[4]})
    );
    CARRY4 reg_b_reg[7]_i_3
    (
        .CI(<const0>),
        .CYINIT(<const0>),
        .CO[3:0](reg_b_reg[7]_i_3_n_0),
        .O[3:0]({reg_b_reg[7]_i_3_n_4, reg_b_reg[7]_i_3_n_5, reg_b_reg[7]_i_3_n_6, reg_b_reg[7]_i_3_n_7}),
        .DI[3:0]({<const0>, <const0>, <const0>, q_reg_n_0_[0]}),
        .S[3:0]({q_reg_n_0_[3], q_reg_n_0_[2], q_reg_n_0_[1], reg_b[7]_i_11_n_0})
    );
    FDCE reg_b_reg[8]
    (
        .Q(reg_b[8]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[8])
    );
    FDCE reg_b_reg[9]
    (
        .Q(reg_b[9]),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(b[9])
    );
    LUT6 reg_carry_i_1
    (
        .O(reg_carry_i_1_n_0),
        .I0(ct_1_en_reg_n_0),
        .I1(reg_carry_i_2_n_0),
        .I2(addback_nDR),
        .I3(state_reg_n_0_[4]),
        .I4(state_reg_n_0_[3]),
        .I5(reg_a[31]_i_5_n_0)
    );
    LUT6 reg_carry_i_2
    (
        .O(reg_carry_i_2_n_0),
        .I0(state_reg_n_0_[3]),
        .I1(state_reg_n_0_[4]),
        .I2(p_1_in),
        .I3(DR_reg_n_0_[31]),
        .I4(state_reg_n_0_[0]),
        .I5(reg_a[31]_i_6_n_0)
    );
    LUT4 reg_carry_i_3
    (
        .O(addback_nDR),
        .I0(reg_carry_i_4_n_0),
        .I1(DD_sign),
        .I2(p_1_in),
        .I3(DR_reg_n_0_[31])
    );
    LUT6 reg_carry_i_4
    (
        .O(reg_carry_i_4_n_0),
        .I0(reg_carry_i_5_n_0),
        .I1(reg_carry_i_6_n_0),
        .I2(reg_carry_i_7_n_0),
        .I3(PR_reg_n_0_[16]),
        .I4(reg_carry_i_8_n_0),
        .I5(reg_carry_i_9_n_0)
    );
    LUT6 reg_carry_i_5
    (
        .O(reg_carry_i_5_n_0),
        .I0(PR_reg_n_0_[13]),
        .I1(PR_reg_n_0_[17]),
        .I2(PR_reg_n_0_[29]),
        .I3(PR_reg_n_0_[5]),
        .I4(PR_reg_n_0_[14]),
        .I5(PR_reg_n_0_[30])
    );
    LUT6 reg_carry_i_6
    (
        .O(reg_carry_i_6_n_0),
        .I0(PR_reg_n_0_[28]),
        .I1(PR_reg_n_0_[20]),
        .I2(PR_reg_n_0_[22]),
        .I3(PR_reg_n_0_[27]),
        .I4(PR_reg_n_0_[18]),
        .I5(PR_reg_n_0_[21])
    );
    LUT6 reg_carry_i_7
    (
        .O(reg_carry_i_7_n_0),
        .I0(PR_reg_n_0_[26]),
        .I1(PR_reg_n_0_[25]),
        .I2(PR_reg_n_0_[2]),
        .I3(PR_reg_n_0_[3]),
        .I4(PR_reg_n_0_[8]),
        .I5(PR_reg_n_0_[24])
    );
    LUT6 reg_carry_i_8
    (
        .O(reg_carry_i_8_n_0),
        .I0(PR_reg_n_0_[6]),
        .I1(PR_reg_n_0_[0]),
        .I2(PR_reg_n_0_[9]),
        .I3(PR_reg_n_0_[10]),
        .I4(PR_reg_n_0_[7]),
        .I5(PR_reg_n_0_[11])
    );
    LUT6 reg_carry_i_9
    (
        .O(reg_carry_i_9_n_0),
        .I0(PR_reg_n_0_[15]),
        .I1(PR_reg_n_0_[23]),
        .I2(PR_reg_n_0_[1]),
        .I3(PR_reg_n_0_[12]),
        .I4(PR_reg_n_0_[4]),
        .I5(PR_reg_n_0_[19])
    );
    FDCE reg_carry_reg
    (
        .Q(reg_carry_reg_n_0),
        .C(CLK),
        .CE(reg_carry),
        .CLR(nq[30]_i_2_n_0),
        .D(reg_carry_i_1_n_0)
    );
    LUT6 sdata[0]_i_1
    (
        .O(sdata[0]_i_1_n_0),
        .I0(state_reg_n_0_[5]),
        .I1(state[5]_i_5_n_0),
        .I2(sdata_reg_n_0_[0]),
        .I3(adder_0/o_s0),
        .I4(state_reg_n_0_[2]),
        .I5(sdata[7]_i_2_n_0)
    );
    LUT6 sdata[10]_i_1
    (
        .O(sdata[10]_i_1_n_0),
        .I0(sdata[10]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[11]_i_2_n_0),
        .I3(state_reg_n_0_[5]),
        .I4(sdata[10]_i_3_n_0),
        .I5(sdata[14]_i_4_n_0)
    );
    LUT5 sdata[10]_i_2
    (
        .O(sdata[10]_i_2_n_0),
        .I0(PR[7]_i_3_n_0),
        .I1(PR[30]_i_4_n_0),
        .I2(sdata[16]_i_4_n_0),
        .I3(PR[7]_i_5_n_0),
        .I4(PR[7]_i_4_n_0)
    );
    LUT6 sdata[10]_i_3
    (
        .O(sdata[10]_i_3_n_0),
        .I0(state_reg_n_0_[2]),
        .I1(sdata[10]_i_4_n_0),
        .I2(reg_b[9]),
        .I3(reg_a[9]),
        .I4(reg_b[10]),
        .I5(reg_a[10])
    );
    LUT3 sdata[10]_i_4
    (
        .O(sdata[10]_i_4_n_0),
        .I0(sdata[14]_i_6_n_0),
        .I1(ct_1[5]_i_3_n_0),
        .I2(sdata[14]_i_9_n_0)
    );
    LUT5 sdata[11]_i_1
    (
        .O(sdata[11]_i_1_n_0),
        .I0(sdata[11]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[12]_i_2_n_0),
        .I3(state_reg_n_0_[5]),
        .I4(sdata[11]_i_3_n_0)
    );
    LUT5 sdata[11]_i_2
    (
        .O(sdata[11]_i_2_n_0),
        .I0(sdata[15]_i_4_n_0),
        .I1(PR[30]_i_4_n_0),
        .I2(sdata[17]_i_4_n_0),
        .I3(PR[7]_i_5_n_0),
        .I4(PR[7]_i_2_n_0)
    );
    LUT5 sdata[11]_i_3
    (
        .O(sdata[11]_i_3_n_0),
        .I0(sdata[14]_i_4_n_0),
        .I1(state_reg_n_0_[2]),
        .I2(reg_a[11]),
        .I3(reg_b[11]),
        .I4(sdata[12]_i_4_n_0)
    );
    LUT6 sdata[12]_i_1
    (
        .O(sdata[12]_i_1_n_0),
        .I0(sdata[12]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[13]_i_2_n_0),
        .I3(state_reg_n_0_[5]),
        .I4(sdata[12]_i_3_n_0),
        .I5(sdata[14]_i_4_n_0)
    );
    LUT6 sdata[12]_i_2
    (
        .O(sdata[12]_i_2_n_0),
        .I0(sdata[16]_i_4_n_0),
        .I1(PR[7]_i_4_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(sdata[18]_i_5_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(PR[7]_i_3_n_0)
    );
    LUT6 sdata[12]_i_3
    (
        .O(sdata[12]_i_3_n_0),
        .I0(state_reg_n_0_[2]),
        .I1(sdata[12]_i_4_n_0),
        .I2(reg_b[11]),
        .I3(reg_a[11]),
        .I4(reg_b[12]),
        .I5(reg_a[12])
    );
    LUT5 sdata[12]_i_4
    (
        .O(sdata[12]_i_4_n_0),
        .I0(sdata[7]_i_5_n_0),
        .I1(o_quotient[3]_i_5_n_0),
        .I2(sdata[7]_i_6_n_0),
        .I3(sdata[12]_i_5_n_0),
        .I4(sdata[12]_i_6_n_0)
    );
    LUT5 sdata[12]_i_5
    (
        .O(sdata[12]_i_5_n_0),
        .I0(reg_b[8]),
        .I1(reg_a[8]),
        .I2(reg_b[7]),
        .I3(reg_a[7]),
        .I4(sdata[31]_i_25_n_0)
    );
    LUT5 sdata[12]_i_6
    (
        .O(sdata[12]_i_6_n_0),
        .I0(sdata[12]_i_7_n_0),
        .I1(reg_a[9]),
        .I2(reg_b[9]),
        .I3(reg_a[10]),
        .I4(reg_b[10])
    );
    LUT4 sdata[12]_i_7
    (
        .O(sdata[12]_i_7_n_0),
        .I0(reg_b[7]),
        .I1(reg_a[7]),
        .I2(reg_b[8]),
        .I3(reg_a[8])
    );
    LUT5 sdata[13]_i_1
    (
        .O(sdata[13]_i_1_n_0),
        .I0(sdata[13]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[14]_i_2_n_0),
        .I3(state_reg_n_0_[5]),
        .I4(sdata[13]_i_3_n_0)
    );
    LUT6 sdata[13]_i_2
    (
        .O(sdata[13]_i_2_n_0),
        .I0(sdata[17]_i_4_n_0),
        .I1(PR[7]_i_2_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(sdata[19]_i_4_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(sdata[15]_i_4_n_0)
    );
    LUT5 sdata[13]_i_3
    (
        .O(sdata[13]_i_3_n_0),
        .I0(sdata[14]_i_4_n_0),
        .I1(reg_a[13]),
        .I2(reg_b[13]),
        .I3(sdata[14]_i_5_n_0),
        .I4(state_reg_n_0_[2])
    );
    LUT6 sdata[14]_i_1
    (
        .O(sdata[14]_i_1_n_0),
        .I0(sdata[14]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[15]_i_2_n_0),
        .I3(state_reg_n_0_[5]),
        .I4(sdata[14]_i_3_n_0),
        .I5(sdata[14]_i_4_n_0)
    );
    LUT4 sdata[14]_i_10
    (
        .O(sdata[14]_i_10_n_0),
        .I0(reg_a[7]),
        .I1(reg_b[7]),
        .I2(reg_a[8]),
        .I3(reg_b[8])
    );
    LUT4 sdata[14]_i_11
    (
        .O(sdata[14]_i_11_n_0),
        .I0(reg_b[9]),
        .I1(reg_a[9]),
        .I2(reg_b[10]),
        .I3(reg_a[10])
    );
    LUT4 sdata[14]_i_12
    (
        .O(sdata[14]_i_12_n_0),
        .I0(reg_b[5]),
        .I1(reg_a[5]),
        .I2(reg_b[6]),
        .I3(reg_a[6])
    );
    LUT6 sdata[14]_i_2
    (
        .O(sdata[14]_i_2_n_0),
        .I0(sdata[18]_i_5_n_0),
        .I1(PR[7]_i_3_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(sdata[20]_i_5_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(sdata[16]_i_4_n_0)
    );
    LUT6 sdata[14]_i_3
    (
        .O(sdata[14]_i_3_n_0),
        .I0(state_reg_n_0_[2]),
        .I1(sdata[14]_i_5_n_0),
        .I2(reg_b[13]),
        .I3(reg_a[13]),
        .I4(reg_b[14]),
        .I5(reg_a[14])
    );
    LUT4 sdata[14]_i_4
    (
        .O(sdata[14]_i_4_n_0),
        .I0(Q[1]),
        .I1(state_reg_n_0_[0]),
        .I2(dividend_to_divider_reg[31][1]),
        .I3(state_reg_n_0_[1])
    );
    LUT5 sdata[14]_i_5
    (
        .O(sdata[14]_i_5_n_0),
        .I0(sdata[14]_i_6_n_0),
        .I1(ct_1[5]_i_3_n_0),
        .I2(sdata[14]_i_7_n_0),
        .I3(sdata[14]_i_8_n_0),
        .I4(sdata[14]_i_9_n_0)
    );
    LUT5 sdata[14]_i_6
    (
        .O(sdata[14]_i_6_n_0),
        .I0(reg_b[6]),
        .I1(reg_a[6]),
        .I2(reg_b[5]),
        .I3(reg_a[5]),
        .I4(sdata[14]_i_10_n_0)
    );
    LUT5 sdata[14]_i_7
    (
        .O(sdata[14]_i_7_n_0),
        .I0(reg_a[11]),
        .I1(reg_b[11]),
        .I2(reg_a[12]),
        .I3(reg_b[12]),
        .I4(sdata[14]_i_11_n_0)
    );
    LUT5 sdata[14]_i_8
    (
        .O(sdata[14]_i_8_n_0),
        .I0(reg_b[10]),
        .I1(reg_a[10]),
        .I2(reg_b[9]),
        .I3(reg_a[9]),
        .I4(sdata[26]_i_13_n_0)
    );
    LUT5 sdata[14]_i_9
    (
        .O(sdata[14]_i_9_n_0),
        .I0(reg_a[7]),
        .I1(reg_b[7]),
        .I2(reg_a[8]),
        .I3(reg_b[8]),
        .I4(sdata[14]_i_12_n_0)
    );
    LUT5 sdata[15]_i_1
    (
        .O(sdata[15]_i_1_n_0),
        .I0(sdata[15]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[16]_i_2_n_0),
        .I3(state_reg_n_0_[5]),
        .I4(sdata[15]_i_3_n_0)
    );
    LUT6 sdata[15]_i_2
    (
        .O(sdata[15]_i_2_n_0),
        .I0(sdata[19]_i_4_n_0),
        .I1(sdata[15]_i_4_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(sdata[21]_i_4_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(sdata[17]_i_4_n_0)
    );
    LUT5 sdata[15]_i_3
    (
        .O(sdata[15]_i_3_n_0),
        .I0(sdata[16]_i_5_n_0),
        .I1(reg_a[15]),
        .I2(reg_b[15]),
        .I3(state_reg_n_0_[2]),
        .I4(sdata[14]_i_4_n_0)
    );
    LUT6 sdata[15]_i_4
    (
        .O(sdata[15]_i_4_n_0),
        .I0(PR[7]_i_6_n_0),
        .I1(PR[7]_i_8_n_0),
        .I2(PR[1]_i_4_n_0),
        .I3(PR[7]_i_7_n_0),
        .I4(sdata[29]_i_7_n_0),
        .I5(sdata[18]_i_6_n_0)
    );
    LUT6 sdata[16]_i_1
    (
        .O(sdata[16]_i_1_n_0),
        .I0(sdata[16]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[17]_i_2_n_0),
        .I3(state_reg_n_0_[5]),
        .I4(sdata[16]_i_3_n_0),
        .I5(sdata[22]_i_4_n_0)
    );
    LUT6 sdata[16]_i_2
    (
        .O(sdata[16]_i_2_n_0),
        .I0(sdata[20]_i_5_n_0),
        .I1(sdata[16]_i_4_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(sdata[22]_i_6_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(sdata[18]_i_5_n_0)
    );
    LUT6 sdata[16]_i_3
    (
        .O(sdata[16]_i_3_n_0),
        .I0(state_reg_n_0_[2]),
        .I1(sdata[16]_i_5_n_0),
        .I2(reg_b[15]),
        .I3(reg_a[15]),
        .I4(reg_b[16]),
        .I5(reg_a[16])
    );
    LUT6 sdata[16]_i_4
    (
        .O(sdata[16]_i_4_n_0),
        .I0(PR[7]_i_7_n_0),
        .I1(sdata[18]_i_6_n_0),
        .I2(PR[1]_i_4_n_0),
        .I3(PR[7]_i_8_n_0),
        .I4(sdata[29]_i_7_n_0),
        .I5(sdata[19]_i_5_n_0)
    );
    LUT3 sdata[16]_i_5
    (
        .O(sdata[16]_i_5_n_0),
        .I0(sdata[31]_i_17_n_0),
        .I1(sdata[7]_i_4_n_0),
        .I2(sdata[31]_i_14_n_0)
    );
    LUT5 sdata[17]_i_1
    (
        .O(sdata[17]_i_1_n_0),
        .I0(sdata[17]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[18]_i_3_n_0),
        .I3(state_reg_n_0_[5]),
        .I4(sdata[17]_i_3_n_0)
    );
    LUT6 sdata[17]_i_2
    (
        .O(sdata[17]_i_2_n_0),
        .I0(sdata[21]_i_4_n_0),
        .I1(sdata[17]_i_4_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(sdata[23]_i_4_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(sdata[19]_i_4_n_0)
    );
    LUT5 sdata[17]_i_3
    (
        .O(sdata[17]_i_3_n_0),
        .I0(sdata[22]_i_4_n_0),
        .I1(reg_a[17]),
        .I2(reg_b[17]),
        .I3(sdata[18]_i_4_n_0),
        .I4(state_reg_n_0_[2])
    );
    LUT6 sdata[17]_i_4
    (
        .O(sdata[17]_i_4_n_0),
        .I0(PR[7]_i_8_n_0),
        .I1(sdata[19]_i_5_n_0),
        .I2(PR[1]_i_4_n_0),
        .I3(sdata[18]_i_6_n_0),
        .I4(sdata[29]_i_7_n_0),
        .I5(sdata[20]_i_6_n_0)
    );
    LUT6 sdata[18]_i_1
    (
        .O(sdata[18]_i_1_n_0),
        .I0(sdata[18]_i_2_n_0),
        .I1(state_reg_n_0_[5]),
        .I2(sdata[19]_i_2_n_0),
        .I3(sdata[29]_i_3_n_0),
        .I4(sdata[18]_i_3_n_0),
        .I5(sdata[22]_i_4_n_0)
    );
    LUT6 sdata[18]_i_2
    (
        .O(sdata[18]_i_2_n_0),
        .I0(state_reg_n_0_[2]),
        .I1(sdata[18]_i_4_n_0),
        .I2(reg_b[17]),
        .I3(reg_a[17]),
        .I4(reg_b[18]),
        .I5(reg_a[18])
    );
    LUT6 sdata[18]_i_3
    (
        .O(sdata[18]_i_3_n_0),
        .I0(sdata[22]_i_6_n_0),
        .I1(sdata[18]_i_5_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(sdata[24]_i_4_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(sdata[20]_i_5_n_0)
    );
    LUT3 sdata[18]_i_4
    (
        .O(sdata[18]_i_4_n_0),
        .I0(sdata[26]_i_8_n_0),
        .I1(sdata[26]_i_10_n_0),
        .I2(sdata[10]_i_4_n_0)
    );
    LUT6 sdata[18]_i_5
    (
        .O(sdata[18]_i_5_n_0),
        .I0(sdata[18]_i_6_n_0),
        .I1(sdata[20]_i_6_n_0),
        .I2(PR[1]_i_4_n_0),
        .I3(sdata[19]_i_5_n_0),
        .I4(sdata[29]_i_7_n_0),
        .I5(sdata[21]_i_5_n_0)
    );
    LUT6 sdata[18]_i_6
    (
        .O(sdata[18]_i_6_n_0),
        .I0(sdata_reg_n_0_[6]),
        .I1(sdata_reg_n_0_[30]),
        .I2(sdata_o[31]),
        .I3(sdata_reg_n_0_[7]),
        .I4(PR[1]_i_2_n_0),
        .I5(sdata[19]_i_7_n_0)
    );
    LUT5 sdata[19]_i_1
    (
        .O(sdata[19]_i_1_n_0),
        .I0(sdata[19]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[20]_i_3_n_0),
        .I3(state_reg_n_0_[5]),
        .I4(sdata[19]_i_3_n_0)
    );
    LUT6 sdata[19]_i_2
    (
        .O(sdata[19]_i_2_n_0),
        .I0(sdata[23]_i_4_n_0),
        .I1(sdata[19]_i_4_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(sdata[25]_i_4_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(sdata[21]_i_4_n_0)
    );
    LUT5 sdata[19]_i_3
    (
        .O(sdata[19]_i_3_n_0),
        .I0(sdata[22]_i_4_n_0),
        .I1(reg_a[19]),
        .I2(reg_b[19]),
        .I3(sdata[20]_i_4_n_0),
        .I4(state_reg_n_0_[2])
    );
    LUT6 sdata[19]_i_4
    (
        .O(sdata[19]_i_4_n_0),
        .I0(sdata[19]_i_5_n_0),
        .I1(sdata[21]_i_5_n_0),
        .I2(PR[1]_i_4_n_0),
        .I3(sdata[20]_i_6_n_0),
        .I4(sdata[29]_i_7_n_0),
        .I5(sdata[21]_i_6_n_0)
    );
    LUT6 sdata[19]_i_5
    (
        .O(sdata[19]_i_5_n_0),
        .I0(sdata[19]_i_6_n_0),
        .I1(sdata_reg_n_0_[28]),
        .I2(sdata_o[31]),
        .I3(sdata_reg_n_0_[29]),
        .I4(sdata_reg_n_0_[30]),
        .I5(sdata[19]_i_7_n_0)
    );
    LUT6 sdata[19]_i_6
    (
        .O(sdata[19]_i_6_n_0),
        .I0(sdata_reg_n_0_[6]),
        .I1(sdata_reg_n_0_[7]),
        .I2(PR[2]_i_3_n_0),
        .I3(sdata_reg_n_0_[9]),
        .I4(state[5]_i_5_n_0),
        .I5(sdata_reg_n_0_[8])
    );
    LUT6 sdata[19]_i_7
    (
        .O(sdata[19]_i_7_n_0),
        .I0(sdata_reg_n_0_[8]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[7]),
        .I4(sdata_reg_n_0_[5]),
        .I5(PR[2]_i_3_n_0)
    );
    LUT5 sdata[1]_i_1
    (
        .O(sdata[1]_i_1_n_0),
        .I0(sdata[1]_i_2_n_0),
        .I1(state_reg_n_0_[5]),
        .I2(adder_0/o_s01_out),
        .I3(state_reg_n_0_[2]),
        .I4(sdata[7]_i_2_n_0)
    );
    LUT5 sdata[1]_i_2
    (
        .O(sdata[1]_i_2_n_0),
        .I0(PR[2]_i_3_n_0),
        .I1(PR[1]_i_4_n_0),
        .I2(PR[1]_i_3_n_0),
        .I3(PR[1]_i_2_n_0),
        .I4(sdata[29]_i_3_n_0)
    );
    LUT6 sdata[20]_i_1
    (
        .O(sdata[20]_i_1_n_0),
        .I0(sdata[20]_i_2_n_0),
        .I1(state_reg_n_0_[5]),
        .I2(sdata[21]_i_2_n_0),
        .I3(sdata[29]_i_3_n_0),
        .I4(sdata[20]_i_3_n_0),
        .I5(sdata[22]_i_4_n_0)
    );
    LUT6 sdata[20]_i_2
    (
        .O(sdata[20]_i_2_n_0),
        .I0(state_reg_n_0_[2]),
        .I1(sdata[20]_i_4_n_0),
        .I2(reg_b[19]),
        .I3(reg_a[19]),
        .I4(reg_b[20]),
        .I5(reg_a[20])
    );
    LUT6 sdata[20]_i_3
    (
        .O(sdata[20]_i_3_n_0),
        .I0(sdata[24]_i_4_n_0),
        .I1(sdata[20]_i_5_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(sdata[26]_i_5_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(sdata[22]_i_6_n_0)
    );
    LUT3 sdata[20]_i_4
    (
        .O(sdata[20]_i_4_n_0),
        .I0(sdata[28]_i_6_n_0),
        .I1(sdata[28]_i_9_n_0),
        .I2(sdata[12]_i_4_n_0)
    );
    LUT6 sdata[20]_i_5
    (
        .O(sdata[20]_i_5_n_0),
        .I0(sdata[20]_i_6_n_0),
        .I1(sdata[21]_i_6_n_0),
        .I2(PR[1]_i_4_n_0),
        .I3(sdata[21]_i_5_n_0),
        .I4(sdata[29]_i_7_n_0),
        .I5(sdata[23]_i_5_n_0)
    );
    LUT5 sdata[20]_i_6
    (
        .O(sdata[20]_i_6_n_0),
        .I0(sdata_reg_n_0_[7]),
        .I1(PR[2]_i_3_n_0),
        .I2(sdata[20]_i_7_n_0),
        .I3(sdata[20]_i_8_n_0),
        .I4(PR[1]_i_2_n_0)
    );
    LUT4 sdata[20]_i_7
    (
        .O(sdata[20]_i_7_n_0),
        .I0(sdata_reg_n_0_[10]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[9])
    );
    LUT4 sdata[20]_i_8
    (
        .O(sdata[20]_i_8_n_0),
        .I0(sdata_reg_n_0_[9]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[8])
    );
    LUT5 sdata[21]_i_1
    (
        .O(sdata[21]_i_1_n_0),
        .I0(sdata[21]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[22]_i_3_n_0),
        .I3(state_reg_n_0_[5]),
        .I4(sdata[21]_i_3_n_0)
    );
    LUT6 sdata[21]_i_2
    (
        .O(sdata[21]_i_2_n_0),
        .I0(sdata[25]_i_4_n_0),
        .I1(sdata[21]_i_4_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(sdata[27]_i_5_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(sdata[23]_i_4_n_0)
    );
    LUT5 sdata[21]_i_3
    (
        .O(sdata[21]_i_3_n_0),
        .I0(sdata[22]_i_4_n_0),
        .I1(reg_a[21]),
        .I2(reg_b[21]),
        .I3(sdata[22]_i_5_n_0),
        .I4(state_reg_n_0_[2])
    );
    LUT6 sdata[21]_i_4
    (
        .O(sdata[21]_i_4_n_0),
        .I0(sdata[21]_i_5_n_0),
        .I1(sdata[23]_i_5_n_0),
        .I2(PR[1]_i_4_n_0),
        .I3(sdata[21]_i_6_n_0),
        .I4(sdata[29]_i_7_n_0),
        .I5(sdata[24]_i_5_n_0)
    );
    LUT6 sdata[21]_i_5
    (
        .O(sdata[21]_i_5_n_0),
        .I0(sdata_reg_n_0_[9]),
        .I1(sdata_reg_n_0_[30]),
        .I2(sdata_o[31]),
        .I3(sdata_reg_n_0_[10]),
        .I4(PR[1]_i_2_n_0),
        .I5(sdata[21]_i_7_n_0)
    );
    LUT5 sdata[21]_i_6
    (
        .O(sdata[21]_i_6_n_0),
        .I0(sdata[21]_i_8_n_0),
        .I1(sdata_reg_n_0_[9]),
        .I2(PR[2]_i_3_n_0),
        .I3(PR[1]_i_2_n_0),
        .I4(sdata[21]_i_7_n_0)
    );
    LUT6 sdata[21]_i_7
    (
        .O(sdata[21]_i_7_n_0),
        .I0(sdata_reg_n_0_[11]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[10]),
        .I4(sdata_reg_n_0_[8]),
        .I5(PR[2]_i_3_n_0)
    );
    LUT4 sdata[21]_i_8
    (
        .O(sdata[21]_i_8_n_0),
        .I0(sdata_reg_n_0_[12]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[11])
    );
    LUT6 sdata[22]_i_1
    (
        .O(sdata[22]_i_1_n_0),
        .I0(sdata[22]_i_2_n_0),
        .I1(state_reg_n_0_[5]),
        .I2(sdata[23]_i_2_n_0),
        .I3(sdata[29]_i_3_n_0),
        .I4(sdata[22]_i_3_n_0),
        .I5(sdata[22]_i_4_n_0)
    );
    LUT6 sdata[22]_i_2
    (
        .O(sdata[22]_i_2_n_0),
        .I0(state_reg_n_0_[2]),
        .I1(sdata[22]_i_5_n_0),
        .I2(reg_b[21]),
        .I3(reg_a[21]),
        .I4(reg_b[22]),
        .I5(reg_a[22])
    );
    LUT6 sdata[22]_i_3
    (
        .O(sdata[22]_i_3_n_0),
        .I0(sdata[26]_i_5_n_0),
        .I1(sdata[22]_i_6_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(sdata[28]_i_5_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(sdata[24]_i_4_n_0)
    );
    LUT4 sdata[22]_i_4
    (
        .O(sdata[22]_i_4_n_0),
        .I0(Q[2]),
        .I1(state_reg_n_0_[0]),
        .I2(dividend_to_divider_reg[31][2]),
        .I3(state_reg_n_0_[1])
    );
    LUT3 sdata[22]_i_5
    (
        .O(sdata[22]_i_5_n_0),
        .I0(sdata[30]_i_5_n_0),
        .I1(sdata[14]_i_5_n_0),
        .I2(sdata[30]_i_7_n_0)
    );
    LUT5 sdata[22]_i_6
    (
        .O(sdata[22]_i_6_n_0),
        .I0(sdata[24]_i_5_n_0),
        .I1(PR[1]_i_4_n_0),
        .I2(sdata[23]_i_5_n_0),
        .I3(sdata[29]_i_7_n_0),
        .I4(sdata[25]_i_5_n_0)
    );
    LUT5 sdata[23]_i_1
    (
        .O(sdata[23]_i_1_n_0),
        .I0(sdata[23]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[24]_i_3_n_0),
        .I3(state_reg_n_0_[5]),
        .I4(sdata[23]_i_3_n_0)
    );
    LUT6 sdata[23]_i_2
    (
        .O(sdata[23]_i_2_n_0),
        .I0(sdata[27]_i_5_n_0),
        .I1(sdata[23]_i_4_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(sdata[29]_i_6_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(sdata[25]_i_4_n_0)
    );
    LUT5 sdata[23]_i_3
    (
        .O(sdata[23]_i_3_n_0),
        .I0(reg_a[23]),
        .I1(reg_b[23]),
        .I2(sdata[31]_i_8_n_0),
        .I3(state_reg_n_0_[2]),
        .I4(sdata[22]_i_4_n_0)
    );
    LUT6 sdata[23]_i_4
    (
        .O(sdata[23]_i_4_n_0),
        .I0(sdata[23]_i_5_n_0),
        .I1(sdata[25]_i_5_n_0),
        .I2(PR[1]_i_4_n_0),
        .I3(sdata[24]_i_5_n_0),
        .I4(sdata[29]_i_7_n_0),
        .I5(sdata[25]_i_6_n_0)
    );
    LUT6 sdata[23]_i_5
    (
        .O(sdata[23]_i_5_n_0),
        .I0(sdata[24]_i_6_n_0),
        .I1(PR[1]_i_2_n_0),
        .I2(sdata_reg_n_0_[12]),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[30]),
        .I5(sdata_reg_n_0_[11])
    );
    LUT6 sdata[24]_i_1
    (
        .O(sdata[24]_i_1_n_0),
        .I0(sdata[24]_i_2_n_0),
        .I1(state_reg_n_0_[5]),
        .I2(sdata[25]_i_2_n_0),
        .I3(sdata[29]_i_3_n_0),
        .I4(sdata[24]_i_3_n_0),
        .I5(sdata[30]_i_3_n_0)
    );
    LUT6 sdata[24]_i_2
    (
        .O(sdata[24]_i_2_n_0),
        .I0(state_reg_n_0_[2]),
        .I1(reg_b[23]),
        .I2(reg_a[23]),
        .I3(sdata[31]_i_8_n_0),
        .I4(reg_b[24]),
        .I5(reg_a[24])
    );
    LUT6 sdata[24]_i_3
    (
        .O(sdata[24]_i_3_n_0),
        .I0(sdata[28]_i_5_n_0),
        .I1(sdata[24]_i_4_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(sdata[29]_i_9_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(sdata[26]_i_5_n_0)
    );
    LUT6 sdata[24]_i_4
    (
        .O(sdata[24]_i_4_n_0),
        .I0(sdata[24]_i_5_n_0),
        .I1(sdata[25]_i_6_n_0),
        .I2(PR[1]_i_4_n_0),
        .I3(sdata[25]_i_5_n_0),
        .I4(sdata[29]_i_7_n_0),
        .I5(sdata[27]_i_6_n_0)
    );
    LUT6 sdata[24]_i_5
    (
        .O(sdata[24]_i_5_n_0),
        .I0(sdata[25]_i_8_n_0),
        .I1(sdata[24]_i_6_n_0),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[29]),
        .I4(sdata_o[31]),
        .I5(sdata_reg_n_0_[28])
    );
    LUT6 sdata[24]_i_6
    (
        .O(sdata[24]_i_6_n_0),
        .I0(sdata_reg_n_0_[10]),
        .I1(PR[2]_i_3_n_0),
        .I2(sdata_reg_n_0_[13]),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[30]),
        .I5(sdata_reg_n_0_[12])
    );
    LUT5 sdata[25]_i_1
    (
        .O(sdata[25]_i_1_n_0),
        .I0(sdata[25]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[26]_i_3_n_0),
        .I3(state_reg_n_0_[5]),
        .I4(sdata[25]_i_3_n_0)
    );
    LUT6 sdata[25]_i_2
    (
        .O(sdata[25]_i_2_n_0),
        .I0(sdata[29]_i_6_n_0),
        .I1(sdata[25]_i_4_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(sdata[27]_i_4_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(sdata[27]_i_5_n_0)
    );
    LUT5 sdata[25]_i_3
    (
        .O(sdata[25]_i_3_n_0),
        .I0(sdata[30]_i_3_n_0),
        .I1(reg_a[25]),
        .I2(reg_b[25]),
        .I3(sdata[26]_i_4_n_0),
        .I4(state_reg_n_0_[2])
    );
    LUT6 sdata[25]_i_4
    (
        .O(sdata[25]_i_4_n_0),
        .I0(sdata[25]_i_5_n_0),
        .I1(sdata[27]_i_6_n_0),
        .I2(PR[1]_i_4_n_0),
        .I3(sdata[25]_i_6_n_0),
        .I4(sdata[29]_i_7_n_0),
        .I5(sdata[28]_i_10_n_0)
    );
    LUT5 sdata[25]_i_5
    (
        .O(sdata[25]_i_5_n_0),
        .I0(sdata[25]_i_7_n_0),
        .I1(sdata_reg_n_0_[12]),
        .I2(PR[2]_i_3_n_0),
        .I3(PR[1]_i_2_n_0),
        .I4(sdata[25]_i_8_n_0)
    );
    LUT6 sdata[25]_i_6
    (
        .O(sdata[25]_i_6_n_0),
        .I0(sdata[27]_i_7_n_0),
        .I1(PR[1]_i_2_n_0),
        .I2(sdata_reg_n_0_[15]),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[30]),
        .I5(sdata_reg_n_0_[14])
    );
    LUT4 sdata[25]_i_7
    (
        .O(sdata[25]_i_7_n_0),
        .I0(sdata_reg_n_0_[15]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[14])
    );
    LUT6 sdata[25]_i_8
    (
        .O(sdata[25]_i_8_n_0),
        .I0(sdata_reg_n_0_[11]),
        .I1(PR[2]_i_3_n_0),
        .I2(sdata_reg_n_0_[14]),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[30]),
        .I5(sdata_reg_n_0_[13])
    );
    LUT6 sdata[26]_i_1
    (
        .O(sdata[26]_i_1_n_0),
        .I0(sdata[26]_i_2_n_0),
        .I1(state_reg_n_0_[5]),
        .I2(sdata[27]_i_2_n_0),
        .I3(sdata[29]_i_3_n_0),
        .I4(sdata[26]_i_3_n_0),
        .I5(sdata[30]_i_3_n_0)
    );
    LUT6 sdata[26]_i_10
    (
        .O(sdata[26]_i_10_n_0),
        .I0(sdata[26]_i_13_n_0),
        .I1(reg_a[9]),
        .I2(reg_b[9]),
        .I3(reg_a[10]),
        .I4(reg_b[10]),
        .I5(sdata[30]_i_9_n_0)
    );
    LUT4 sdata[26]_i_11
    (
        .O(sdata[26]_i_11_n_0),
        .I0(reg_b[21]),
        .I1(reg_a[21]),
        .I2(reg_b[22]),
        .I3(reg_a[22])
    );
    LUT4 sdata[26]_i_12
    (
        .O(sdata[26]_i_12_n_0),
        .I0(reg_b[17]),
        .I1(reg_a[17]),
        .I2(reg_b[18]),
        .I3(reg_a[18])
    );
    LUT4 sdata[26]_i_13
    (
        .O(sdata[26]_i_13_n_0),
        .I0(reg_a[11]),
        .I1(reg_b[11]),
        .I2(reg_a[12]),
        .I3(reg_b[12])
    );
    LUT6 sdata[26]_i_2
    (
        .O(sdata[26]_i_2_n_0),
        .I0(state_reg_n_0_[2]),
        .I1(sdata[26]_i_4_n_0),
        .I2(reg_b[25]),
        .I3(reg_a[25]),
        .I4(reg_b[26]),
        .I5(reg_a[26])
    );
    LUT6 sdata[26]_i_3
    (
        .O(sdata[26]_i_3_n_0),
        .I0(sdata[29]_i_9_n_0),
        .I1(sdata[26]_i_5_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(sdata[29]_i_11_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(sdata[28]_i_5_n_0)
    );
    LUT6 sdata[26]_i_4
    (
        .O(sdata[26]_i_4_n_0),
        .I0(sdata[26]_i_6_n_0),
        .I1(sdata[26]_i_7_n_0),
        .I2(sdata[26]_i_8_n_0),
        .I3(sdata[26]_i_9_n_0),
        .I4(sdata[26]_i_10_n_0),
        .I5(sdata[10]_i_4_n_0)
    );
    LUT5 sdata[26]_i_5
    (
        .O(sdata[26]_i_5_n_0),
        .I0(sdata[28]_i_10_n_0),
        .I1(PR[1]_i_4_n_0),
        .I2(sdata[27]_i_6_n_0),
        .I3(sdata[29]_i_7_n_0),
        .I4(sdata[29]_i_12_n_0)
    );
    LUT5 sdata[26]_i_6
    (
        .O(sdata[26]_i_6_n_0),
        .I0(sdata[26]_i_11_n_0),
        .I1(reg_a[24]),
        .I2(reg_b[24]),
        .I3(reg_a[23]),
        .I4(reg_b[23])
    );
    LUT6 sdata[26]_i_7
    (
        .O(sdata[26]_i_7_n_0),
        .I0(reg_b[19]),
        .I1(reg_a[19]),
        .I2(reg_b[20]),
        .I3(reg_a[20]),
        .I4(sdata[26]_i_12_n_0),
        .I5(sdata[30]_i_10_n_0)
    );
    LUT3 sdata[26]_i_8
    (
        .O(sdata[26]_i_8_n_0),
        .I0(sdata[30]_i_12_n_0),
        .I1(sdata[30]_i_9_n_0),
        .I2(sdata[14]_i_7_n_0)
    );
    LUT6 sdata[26]_i_9
    (
        .O(sdata[26]_i_9_n_0),
        .I0(sdata[30]_i_10_n_0),
        .I1(reg_a[17]),
        .I2(reg_b[17]),
        .I3(reg_a[18]),
        .I4(reg_b[18]),
        .I5(sdata[31]_i_23_n_0)
    );
    LUT5 sdata[27]_i_1
    (
        .O(sdata[27]_i_1_n_0),
        .I0(sdata[27]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[28]_i_3_n_0),
        .I3(state_reg_n_0_[5]),
        .I4(sdata[27]_i_3_n_0)
    );
    LUT6 sdata[27]_i_2
    (
        .O(sdata[27]_i_2_n_0),
        .I0(sdata[27]_i_4_n_0),
        .I1(sdata[27]_i_5_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(PR[30]_i_3_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(sdata[29]_i_6_n_0)
    );
    LUT5 sdata[27]_i_3
    (
        .O(sdata[27]_i_3_n_0),
        .I0(sdata[30]_i_3_n_0),
        .I1(reg_a[27]),
        .I2(reg_b[27]),
        .I3(sdata[28]_i_4_n_0),
        .I4(state_reg_n_0_[2])
    );
    LUT6 sdata[27]_i_4
    (
        .O(sdata[27]_i_4_n_0),
        .I0(sdata[29]_i_13_n_0),
        .I1(PR[30]_i_9_n_0),
        .I2(PR[1]_i_4_n_0),
        .I3(sdata[29]_i_15_n_0),
        .I4(sdata[29]_i_7_n_0),
        .I5(PR[30]_i_11_n_0)
    );
    LUT6 sdata[27]_i_5
    (
        .O(sdata[27]_i_5_n_0),
        .I0(sdata[27]_i_6_n_0),
        .I1(sdata[29]_i_12_n_0),
        .I2(PR[1]_i_4_n_0),
        .I3(sdata[28]_i_10_n_0),
        .I4(sdata[29]_i_7_n_0),
        .I5(sdata[29]_i_14_n_0)
    );
    LUT6 sdata[27]_i_6
    (
        .O(sdata[27]_i_6_n_0),
        .I0(sdata[28]_i_12_n_0),
        .I1(sdata[27]_i_7_n_0),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[29]),
        .I4(sdata_o[31]),
        .I5(sdata_reg_n_0_[28])
    );
    LUT6 sdata[27]_i_7
    (
        .O(sdata[27]_i_7_n_0),
        .I0(sdata_reg_n_0_[13]),
        .I1(PR[2]_i_3_n_0),
        .I2(sdata_reg_n_0_[16]),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[30]),
        .I5(sdata_reg_n_0_[15])
    );
    LUT6 sdata[28]_i_1
    (
        .O(sdata[28]_i_1_n_0),
        .I0(sdata[28]_i_2_n_0),
        .I1(state_reg_n_0_[5]),
        .I2(sdata[29]_i_2_n_0),
        .I3(sdata[29]_i_3_n_0),
        .I4(sdata[28]_i_3_n_0),
        .I5(sdata[30]_i_3_n_0)
    );
    LUT6 sdata[28]_i_10
    (
        .O(sdata[28]_i_10_n_0),
        .I0(sdata[29]_i_19_n_0),
        .I1(sdata[28]_i_12_n_0),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[29]),
        .I4(sdata_o[31]),
        .I5(sdata_reg_n_0_[28])
    );
    LUT4 sdata[28]_i_11
    (
        .O(sdata[28]_i_11_n_0),
        .I0(reg_a[13]),
        .I1(reg_b[13]),
        .I2(reg_a[14]),
        .I3(reg_b[14])
    );
    LUT6 sdata[28]_i_12
    (
        .O(sdata[28]_i_12_n_0),
        .I0(sdata_reg_n_0_[14]),
        .I1(PR[2]_i_3_n_0),
        .I2(sdata_reg_n_0_[17]),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[30]),
        .I5(sdata_reg_n_0_[16])
    );
    LUT6 sdata[28]_i_2
    (
        .O(sdata[28]_i_2_n_0),
        .I0(state_reg_n_0_[2]),
        .I1(sdata[28]_i_4_n_0),
        .I2(reg_b[27]),
        .I3(reg_a[27]),
        .I4(reg_b[28]),
        .I5(reg_a[28])
    );
    LUT6 sdata[28]_i_3
    (
        .O(sdata[28]_i_3_n_0),
        .I0(sdata[29]_i_11_n_0),
        .I1(sdata[28]_i_5_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(sdata[29]_i_8_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(sdata[29]_i_9_n_0)
    );
    LUT6 sdata[28]_i_4
    (
        .O(sdata[28]_i_4_n_0),
        .I0(sdata[28]_i_6_n_0),
        .I1(sdata[31]_i_7_n_0),
        .I2(sdata[28]_i_7_n_0),
        .I3(sdata[28]_i_8_n_0),
        .I4(sdata[28]_i_9_n_0),
        .I5(sdata[12]_i_4_n_0)
    );
    LUT6 sdata[28]_i_5
    (
        .O(sdata[28]_i_5_n_0),
        .I0(sdata[28]_i_10_n_0),
        .I1(sdata[29]_i_14_n_0),
        .I2(PR[1]_i_4_n_0),
        .I3(sdata[29]_i_12_n_0),
        .I4(sdata[29]_i_7_n_0),
        .I5(sdata[29]_i_13_n_0)
    );
    LUT3 sdata[28]_i_6
    (
        .O(sdata[28]_i_6_n_0),
        .I0(sdata[31]_i_24_n_0),
        .I1(sdata[31]_i_26_n_0),
        .I2(sdata[31]_i_21_n_0)
    );
    LUT6 sdata[28]_i_7
    (
        .O(sdata[28]_i_7_n_0),
        .I0(sdata[31]_i_15_n_0),
        .I1(reg_a[24]),
        .I2(reg_b[24]),
        .I3(reg_a[23]),
        .I4(reg_b[23]),
        .I5(sdata[31]_i_11_n_0)
    );
    LUT6 sdata[28]_i_8
    (
        .O(sdata[28]_i_8_n_0),
        .I0(reg_b[20]),
        .I1(reg_a[20]),
        .I2(reg_b[19]),
        .I3(reg_a[19]),
        .I4(sdata[30]_i_10_n_0),
        .I5(sdata[31]_i_11_n_0)
    );
    LUT6 sdata[28]_i_9
    (
        .O(sdata[28]_i_9_n_0),
        .I0(sdata[28]_i_11_n_0),
        .I1(reg_a[11]),
        .I2(reg_b[11]),
        .I3(reg_a[12]),
        .I4(reg_b[12]),
        .I5(sdata[31]_i_26_n_0)
    );
    LUT5 sdata[29]_i_1
    (
        .O(sdata[29]_i_1_n_0),
        .I0(sdata[29]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[29]_i_4_n_0),
        .I3(state_reg_n_0_[5]),
        .I4(sdata[29]_i_5_n_0)
    );
    LUT6 sdata[29]_i_10
    (
        .O(sdata[29]_i_10_n_0),
        .I0(PR[30]_i_14_n_0),
        .I1(sdata_reg_n_0_[26]),
        .I2(PR[2]_i_3_n_0),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[27]),
        .I5(PR[30]_i_8_n_0)
    );
    LUT6 sdata[29]_i_11
    (
        .O(sdata[29]_i_11_n_0),
        .I0(PR[30]_i_11_n_0),
        .I1(sdata_reg_n_0_[26]),
        .I2(PR[2]_i_3_n_0),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[27]),
        .I5(sdata[29]_i_17_n_0)
    );
    LUT6 sdata[29]_i_12
    (
        .O(sdata[29]_i_12_n_0),
        .I0(sdata[29]_i_18_n_0),
        .I1(sdata_reg_n_0_[28]),
        .I2(sdata_o[31]),
        .I3(sdata_reg_n_0_[29]),
        .I4(sdata_reg_n_0_[30]),
        .I5(sdata[29]_i_19_n_0)
    );
    LUT6 sdata[29]_i_13
    (
        .O(sdata[29]_i_13_n_0),
        .I0(PR[30]_i_20_n_0),
        .I1(sdata[29]_i_20_n_0),
        .I2(PR[1]_i_2_n_0),
        .I3(sdata[29]_i_21_n_0),
        .I4(sdata_reg_n_0_[17]),
        .I5(PR[2]_i_3_n_0)
    );
    LUT6 sdata[29]_i_14
    (
        .O(sdata[29]_i_14_n_0),
        .I0(sdata[29]_i_22_n_0),
        .I1(sdata_reg_n_0_[28]),
        .I2(sdata_o[31]),
        .I3(sdata_reg_n_0_[29]),
        .I4(sdata_reg_n_0_[30]),
        .I5(sdata[29]_i_18_n_0)
    );
    LUT5 sdata[29]_i_15
    (
        .O(sdata[29]_i_15_n_0),
        .I0(sdata_reg_n_0_[19]),
        .I1(PR[2]_i_3_n_0),
        .I2(PR[30]_i_19_n_0),
        .I3(PR[1]_i_2_n_0),
        .I4(PR[30]_i_20_n_0)
    );
    LUT5 sdata[29]_i_16
    (
        .O(sdata[29]_i_16_n_0),
        .I0(sdata[29]_i_13_n_0),
        .I1(sdata[29]_i_7_n_0),
        .I2(PR[30]_i_19_n_0),
        .I3(PR[1]_i_2_n_0),
        .I4(sdata[29]_i_23_n_0)
    );
    LUT6 sdata[29]_i_17
    (
        .O(sdata[29]_i_17_n_0),
        .I0(PR[30]_i_19_n_0),
        .I1(sdata[29]_i_23_n_0),
        .I2(sdata[29]_i_7_n_0),
        .I3(PR[30]_i_25_n_0),
        .I4(PR[1]_i_2_n_0),
        .I5(PR[30]_i_23_n_0)
    );
    LUT6 sdata[29]_i_18
    (
        .O(sdata[29]_i_18_n_0),
        .I0(sdata_reg_n_0_[19]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[18]),
        .I4(PR[2]_i_3_n_0),
        .I5(sdata_reg_n_0_[16])
    );
    LUT6 sdata[29]_i_19
    (
        .O(sdata[29]_i_19_n_0),
        .I0(sdata_reg_n_0_[15]),
        .I1(PR[2]_i_3_n_0),
        .I2(sdata_reg_n_0_[18]),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[30]),
        .I5(sdata_reg_n_0_[17])
    );
    LUT5 sdata[29]_i_2
    (
        .O(sdata[29]_i_2_n_0),
        .I0(PR[30]_i_3_n_0),
        .I1(PR[7]_i_5_n_0),
        .I2(sdata[29]_i_6_n_0),
        .I3(PR[30]_i_4_n_0),
        .I4(PR[30]_i_5_n_0)
    );
    LUT4 sdata[29]_i_20
    (
        .O(sdata[29]_i_20_n_0),
        .I0(sdata_reg_n_0_[19]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[18])
    );
    LUT6 sdata[29]_i_21
    (
        .O(sdata[29]_i_21_n_0),
        .I0(sdata_reg_n_0_[29]),
        .I1(sdata_reg_n_0_[28]),
        .I2(sdata_reg_n_0_[19]),
        .I3(sdata_reg_n_0_[30]),
        .I4(sdata_o[31]),
        .I5(sdata_reg_n_0_[20])
    );
    LUT6 sdata[29]_i_22
    (
        .O(sdata[29]_i_22_n_0),
        .I0(sdata_reg_n_0_[20]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[19]),
        .I4(sdata_reg_n_0_[17]),
        .I5(PR[2]_i_3_n_0)
    );
    LUT6 sdata[29]_i_23
    (
        .O(sdata[29]_i_23_n_0),
        .I0(sdata_reg_n_0_[21]),
        .I1(sdata_reg_n_0_[20]),
        .I2(PR[2]_i_3_n_0),
        .I3(sdata_reg_n_0_[23]),
        .I4(state[5]_i_5_n_0),
        .I5(sdata_reg_n_0_[22])
    );
    LUT6 sdata[29]_i_3
    (
        .O(sdata[29]_i_3_n_0),
        .I0(PR[7]_i_5_n_0),
        .I1(PR[30]_i_4_n_0),
        .I2(sdata_reg_n_0_[23]),
        .I3(sdata[29]_i_7_n_0),
        .I4(sdata_o[31]),
        .I5(sdata_reg_n_0_[25])
    );
    LUT6 sdata[29]_i_4
    (
        .O(sdata[29]_i_4_n_0),
        .I0(sdata[29]_i_8_n_0),
        .I1(sdata[29]_i_9_n_0),
        .I2(PR[30]_i_4_n_0),
        .I3(sdata[29]_i_10_n_0),
        .I4(PR[7]_i_5_n_0),
        .I5(sdata[29]_i_11_n_0)
    );
    LUT5 sdata[29]_i_5
    (
        .O(sdata[29]_i_5_n_0),
        .I0(sdata[30]_i_3_n_0),
        .I1(reg_a[29]),
        .I2(reg_b[29]),
        .I3(sdata[30]_i_4_n_0),
        .I4(state_reg_n_0_[2])
    );
    LUT6 sdata[29]_i_6
    (
        .O(sdata[29]_i_6_n_0),
        .I0(sdata[29]_i_12_n_0),
        .I1(sdata[29]_i_13_n_0),
        .I2(PR[1]_i_4_n_0),
        .I3(sdata[29]_i_14_n_0),
        .I4(sdata[29]_i_7_n_0),
        .I5(sdata[29]_i_15_n_0)
    );
    LUT6 sdata[29]_i_7
    (
        .O(sdata[29]_i_7_n_0),
        .I0(sdata_reg_n_0_[29]),
        .I1(sdata_reg_n_0_[28]),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[26]),
        .I5(sdata_reg_n_0_[27])
    );
    LUT6 sdata[29]_i_8
    (
        .O(sdata[29]_i_8_n_0),
        .I0(PR[30]_i_12_n_0),
        .I1(sdata_reg_n_0_[26]),
        .I2(PR[2]_i_3_n_0),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[27]),
        .I5(PR[30]_i_13_n_0)
    );
    LUT6 sdata[29]_i_9
    (
        .O(sdata[29]_i_9_n_0),
        .I0(sdata[29]_i_15_n_0),
        .I1(sdata_reg_n_0_[26]),
        .I2(PR[2]_i_3_n_0),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[27]),
        .I5(sdata[29]_i_16_n_0)
    );
    LUT5 sdata[2]_i_1
    (
        .O(sdata[2]_i_1_n_0),
        .I0(sdata[2]_i_2_n_0),
        .I1(state_reg_n_0_[2]),
        .I2(state_reg_n_0_[5]),
        .I3(sdata[2]_i_3_n_0),
        .I4(sdata[7]_i_2_n_0)
    );
    LUT5 sdata[2]_i_2
    (
        .O(sdata[2]_i_2_n_0),
        .I0(reg_a[2]),
        .I1(reg_b[2]),
        .I2(reg_a[1]),
        .I3(reg_b[1]),
        .I4(o_quotient[2]_i_2_n_0)
    );
    LUT6 sdata[2]_i_3
    (
        .O(sdata[2]_i_3_n_0),
        .I0(sdata_reg_n_0_[0]),
        .I1(PR[2]_i_3_n_0),
        .I2(sdata_reg_n_0_[2]),
        .I3(state[5]_i_5_n_0),
        .I4(sdata_reg_n_0_[1]),
        .I5(PR[2]_i_2_n_0)
    );
    LUT4 sdata[30]_i_1
    (
        .O(sdata[30]_i_1_n_0),
        .I0(sdata[30]_i_2_n_0),
        .I1(PR[30]_i_1_n_0),
        .I2(state_reg_n_0_[5]),
        .I3(sdata[30]_i_3_n_0)
    );
    LUT5 sdata[30]_i_10
    (
        .O(sdata[30]_i_10_n_0),
        .I0(reg_b[23]),
        .I1(reg_a[23]),
        .I2(reg_b[24]),
        .I3(reg_a[24]),
        .I4(sdata[30]_i_15_n_0)
    );
    LUT5 sdata[30]_i_11
    (
        .O(sdata[30]_i_11_n_0),
        .I0(sdata[26]_i_12_n_0),
        .I1(reg_a[20]),
        .I2(reg_b[20]),
        .I3(reg_a[19]),
        .I4(reg_b[19])
    );
    LUT5 sdata[30]_i_12
    (
        .O(sdata[30]_i_12_n_0),
        .I0(reg_a[16]),
        .I1(reg_b[16]),
        .I2(reg_a[15]),
        .I3(reg_b[15]),
        .I4(sdata[30]_i_16_n_0)
    );
    LUT5 sdata[30]_i_13
    (
        .O(sdata[30]_i_13_n_0),
        .I0(sdata[31]_i_23_n_0),
        .I1(reg_b[18]),
        .I2(reg_a[18]),
        .I3(reg_b[17]),
        .I4(reg_a[17])
    );
    LUT4 sdata[30]_i_14
    (
        .O(sdata[30]_i_14_n_0),
        .I0(reg_b[25]),
        .I1(reg_a[25]),
        .I2(reg_b[26]),
        .I3(reg_a[26])
    );
    LUT4 sdata[30]_i_15
    (
        .O(sdata[30]_i_15_n_0),
        .I0(reg_a[21]),
        .I1(reg_b[21]),
        .I2(reg_a[22]),
        .I3(reg_b[22])
    );
    LUT4 sdata[30]_i_16
    (
        .O(sdata[30]_i_16_n_0),
        .I0(reg_b[13]),
        .I1(reg_a[13]),
        .I2(reg_b[14]),
        .I3(reg_a[14])
    );
    LUT6 sdata[30]_i_2
    (
        .O(sdata[30]_i_2_n_0),
        .I0(state_reg_n_0_[2]),
        .I1(reg_b[29]),
        .I2(reg_a[29]),
        .I3(sdata[30]_i_4_n_0),
        .I4(reg_b[30]),
        .I5(reg_a[30])
    );
    LUT4 sdata[30]_i_3
    (
        .O(sdata[30]_i_3_n_0),
        .I0(Q[3]),
        .I1(state_reg_n_0_[0]),
        .I2(dividend_to_divider_reg[31][3]),
        .I3(state_reg_n_0_[1])
    );
    LUT5 sdata[30]_i_4
    (
        .O(sdata[30]_i_4_n_0),
        .I0(sdata[30]_i_5_n_0),
        .I1(sdata[14]_i_5_n_0),
        .I2(sdata[30]_i_6_n_0),
        .I3(sdata[30]_i_7_n_0),
        .I4(sdata[30]_i_8_n_0)
    );
    LUT6 sdata[30]_i_5
    (
        .O(sdata[30]_i_5_n_0),
        .I0(sdata[30]_i_9_n_0),
        .I1(reg_a[17]),
        .I2(reg_b[17]),
        .I3(reg_a[18]),
        .I4(reg_b[18]),
        .I5(sdata[31]_i_23_n_0)
    );
    LUT6 sdata[30]_i_6
    (
        .O(sdata[30]_i_6_n_0),
        .I0(sdata[31]_i_11_n_0),
        .I1(reg_a[27]),
        .I2(reg_b[27]),
        .I3(reg_a[28]),
        .I4(reg_b[28]),
        .I5(sdata[30]_i_10_n_0)
    );
    LUT3 sdata[30]_i_7
    (
        .O(sdata[30]_i_7_n_0),
        .I0(sdata[30]_i_11_n_0),
        .I1(sdata[30]_i_12_n_0),
        .I2(sdata[30]_i_13_n_0)
    );
    LUT5 sdata[30]_i_8
    (
        .O(sdata[30]_i_8_n_0),
        .I0(sdata[26]_i_6_n_0),
        .I1(sdata[31]_i_11_n_0),
        .I2(sdata[31]_i_19_n_0),
        .I3(sdata[30]_i_14_n_0),
        .I4(sdata[31]_i_12_n_0)
    );
    LUT5 sdata[30]_i_9
    (
        .O(sdata[30]_i_9_n_0),
        .I0(reg_b[14]),
        .I1(reg_a[14]),
        .I2(reg_b[13]),
        .I3(reg_a[13]),
        .I4(sdata[31]_i_29_n_0)
    );
    LUT5 sdata[31]_i_1
    (
        .O(sdata[31]_i_1_n_0),
        .I0(state_reg_reg_n_0_[1]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(state_reg_n_0_[4]),
        .I3(state_reg_n_0_[3]),
        .I4(sdata[31]_i_3_n_0)
    );
    LUT4 sdata[31]_i_10
    (
        .O(sdata[31]_i_10_n_0),
        .I0(reg_a[24]),
        .I1(reg_b[24]),
        .I2(reg_a[23]),
        .I3(reg_b[23])
    );
    LUT4 sdata[31]_i_11
    (
        .O(sdata[31]_i_11_n_0),
        .I0(reg_a[25]),
        .I1(reg_b[25]),
        .I2(reg_a[26]),
        .I3(reg_b[26])
    );
    LUT4 sdata[31]_i_12
    (
        .O(sdata[31]_i_12_n_0),
        .I0(reg_b[27]),
        .I1(reg_a[27]),
        .I2(reg_b[28]),
        .I3(reg_a[28])
    );
    LUT4 sdata[31]_i_13
    (
        .O(sdata[31]_i_13_n_0),
        .I0(reg_b[23]),
        .I1(reg_a[23]),
        .I2(reg_b[24]),
        .I3(reg_a[24])
    );
    LUT3 sdata[31]_i_14
    (
        .O(sdata[31]_i_14_n_0),
        .I0(sdata[31]_i_20_n_0),
        .I1(sdata[12]_i_6_n_0),
        .I2(sdata[31]_i_21_n_0)
    );
    LUT5 sdata[31]_i_15
    (
        .O(sdata[31]_i_15_n_0),
        .I0(sdata[31]_i_22_n_0),
        .I1(reg_a[22]),
        .I2(reg_b[22]),
        .I3(reg_a[21]),
        .I4(reg_b[21])
    );
    LUT6 sdata[31]_i_16
    (
        .O(sdata[31]_i_16_n_0),
        .I0(reg_a[21]),
        .I1(reg_b[21]),
        .I2(reg_a[22]),
        .I3(reg_b[22]),
        .I4(sdata[31]_i_23_n_0),
        .I5(sdata[31]_i_24_n_0)
    );
    LUT6 sdata[31]_i_17
    (
        .O(sdata[31]_i_17_n_0),
        .I0(sdata[31]_i_25_n_0),
        .I1(reg_a[7]),
        .I2(reg_b[7]),
        .I3(reg_a[8]),
        .I4(reg_b[8]),
        .I5(sdata[31]_i_20_n_0)
    );
    LUT6 sdata[31]_i_18
    (
        .O(sdata[31]_i_18_n_0),
        .I0(reg_a[21]),
        .I1(reg_b[21]),
        .I2(reg_a[22]),
        .I3(reg_b[22]),
        .I4(sdata[31]_i_23_n_0),
        .I5(sdata[31]_i_26_n_0)
    );
    LUT4 sdata[31]_i_19
    (
        .O(sdata[31]_i_19_n_0),
        .I0(reg_a[27]),
        .I1(reg_b[27]),
        .I2(reg_a[28]),
        .I3(reg_b[28])
    );
    LUT5 sdata[31]_i_2
    (
        .O(sdata[31]_i_2_n_0),
        .I0(sdata[31]_i_4_n_0),
        .I1(reg_a[31]),
        .I2(reg_b[31]),
        .I3(state_reg_n_0_[2]),
        .I4(sdata[31]_i_5_n_0)
    );
    LUT5 sdata[31]_i_20
    (
        .O(sdata[31]_i_20_n_0),
        .I0(reg_b[12]),
        .I1(reg_a[12]),
        .I2(reg_b[11]),
        .I3(reg_a[11]),
        .I4(sdata[28]_i_11_n_0)
    );
    LUT5 sdata[31]_i_21
    (
        .O(sdata[31]_i_21_n_0),
        .I0(sdata[31]_i_27_n_0),
        .I1(reg_a[14]),
        .I2(reg_b[14]),
        .I3(reg_a[13]),
        .I4(reg_b[13])
    );
    LUT4 sdata[31]_i_22
    (
        .O(sdata[31]_i_22_n_0),
        .I0(reg_b[19]),
        .I1(reg_a[19]),
        .I2(reg_b[20]),
        .I3(reg_a[20])
    );
    LUT4 sdata[31]_i_23
    (
        .O(sdata[31]_i_23_n_0),
        .I0(reg_a[19]),
        .I1(reg_b[19]),
        .I2(reg_a[20]),
        .I3(reg_b[20])
    );
    LUT5 sdata[31]_i_24
    (
        .O(sdata[31]_i_24_n_0),
        .I0(sdata[31]_i_28_n_0),
        .I1(reg_a[18]),
        .I2(reg_b[18]),
        .I3(reg_a[17]),
        .I4(reg_b[17])
    );
    LUT4 sdata[31]_i_25
    (
        .O(sdata[31]_i_25_n_0),
        .I0(reg_a[9]),
        .I1(reg_b[9]),
        .I2(reg_a[10]),
        .I3(reg_b[10])
    );
    LUT5 sdata[31]_i_26
    (
        .O(sdata[31]_i_26_n_0),
        .I0(reg_b[18]),
        .I1(reg_a[18]),
        .I2(reg_b[17]),
        .I3(reg_a[17]),
        .I4(sdata[31]_i_29_n_0)
    );
    LUT4 sdata[31]_i_27
    (
        .O(sdata[31]_i_27_n_0),
        .I0(reg_b[11]),
        .I1(reg_a[11]),
        .I2(reg_b[12]),
        .I3(reg_a[12])
    );
    LUT4 sdata[31]_i_28
    (
        .O(sdata[31]_i_28_n_0),
        .I0(reg_b[15]),
        .I1(reg_a[15]),
        .I2(reg_b[16]),
        .I3(reg_a[16])
    );
    LUT4 sdata[31]_i_29
    (
        .O(sdata[31]_i_29_n_0),
        .I0(reg_a[16]),
        .I1(reg_b[16]),
        .I2(reg_a[15]),
        .I3(reg_b[15])
    );
    LUT6 sdata[31]_i_3
    (
        .O(sdata[31]_i_3_n_0),
        .I0(nq[30]_i_7_n_0),
        .I1(state_reg_n_0_[0]),
        .I2(state_reg_n_0_[5]),
        .I3(state_reg_n_0_[1]),
        .I4(state_reg_n_0_[2]),
        .I5(ct_reg_n_0_[5])
    );
    LUT6 sdata[31]_i_4
    (
        .O(sdata[31]_i_4_n_0),
        .I0(sdata[31]_i_6_n_0),
        .I1(sdata[31]_i_7_n_0),
        .I2(sdata[31]_i_8_n_0),
        .I3(sdata[31]_i_9_n_0),
        .I4(sdata[31]_i_10_n_0),
        .I5(sdata[31]_i_11_n_0)
    );
    LUT6 sdata[31]_i_5
    (
        .O(sdata[31]_i_5_n_0),
        .I0(state_reg_n_0_[1]),
        .I1(dividend_to_divider_reg[31][3]),
        .I2(state_reg_n_0_[0]),
        .I3(Q[3]),
        .I4(state_reg_n_0_[5]),
        .I5(sdata_o[31])
    );
    LUT5 sdata[31]_i_6
    (
        .O(sdata[31]_i_6_n_0),
        .I0(sdata[31]_i_12_n_0),
        .I1(reg_a[29]),
        .I2(reg_b[29]),
        .I3(reg_a[30]),
        .I4(reg_b[30])
    );
    LUT5 sdata[31]_i_7
    (
        .O(sdata[31]_i_7_n_0),
        .I0(sdata[31]_i_13_n_0),
        .I1(reg_a[25]),
        .I2(reg_b[25]),
        .I3(reg_a[26]),
        .I4(reg_b[26])
    );
    LUT6 sdata[31]_i_8
    (
        .O(sdata[31]_i_8_n_0),
        .I0(sdata[31]_i_14_n_0),
        .I1(sdata[31]_i_15_n_0),
        .I2(sdata[31]_i_16_n_0),
        .I3(sdata[31]_i_17_n_0),
        .I4(sdata[31]_i_18_n_0),
        .I5(sdata[7]_i_4_n_0)
    );
    LUT5 sdata[31]_i_9
    (
        .O(sdata[31]_i_9_n_0),
        .I0(sdata[31]_i_19_n_0),
        .I1(reg_b[30]),
        .I2(reg_a[30]),
        .I3(reg_b[29]),
        .I4(reg_a[29])
    );
    LUT6 sdata[3]_i_1
    (
        .O(sdata[3]_i_1_n_0),
        .I0(state_reg_n_0_[5]),
        .I1(sdata[3]_i_2_n_0),
        .I2(sdata[3]_i_3_n_0),
        .I3(state_reg_n_0_[2]),
        .I4(sdata[3]_i_4_n_0),
        .I5(sdata[7]_i_2_n_0)
    );
    LUT5 sdata[3]_i_2
    (
        .O(sdata[3]_i_2_n_0),
        .I0(sdata_reg_n_0_[27]),
        .I1(sdata_reg_n_0_[29]),
        .I2(sdata_reg_n_0_[28]),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[30])
    );
    LUT6 sdata[3]_i_3
    (
        .O(sdata[3]_i_3_n_0),
        .I0(sdata_reg_n_0_[2]),
        .I1(sdata_o[31]),
        .I2(sdata_reg_n_0_[30]),
        .I3(sdata_reg_n_0_[1]),
        .I4(sdata[3]_i_5_n_0),
        .I5(PR[1]_i_2_n_0)
    );
    LUT3 sdata[3]_i_4
    (
        .O(sdata[3]_i_4_n_0),
        .I0(reg_a[3]),
        .I1(reg_b[3]),
        .I2(o_quotient[3]_i_5_n_0)
    );
    LUT6 sdata[3]_i_5
    (
        .O(sdata[3]_i_5_n_0),
        .I0(sdata_reg_n_0_[0]),
        .I1(PR[2]_i_3_n_0),
        .I2(sdata_reg_n_0_[3]),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[30]),
        .I5(sdata_reg_n_0_[2])
    );
    LUT5 sdata[4]_i_1
    (
        .O(sdata[4]_i_1_n_0),
        .I0(sdata_o[4]),
        .I1(state_reg_n_0_[5]),
        .I2(state_reg_n_0_[2]),
        .I3(sdata[4]_i_3_n_0),
        .I4(sdata[7]_i_2_n_0)
    );
    LUT6 sdata[4]_i_2
    (
        .O(sdata_o[4]),
        .I0(sdata[4]_i_4_n_0),
        .I1(sdata[3]_i_3_n_0),
        .I2(sdata_reg_n_0_[26]),
        .I3(PR[2]_i_3_n_0),
        .I4(sdata_o[31]),
        .I5(sdata_reg_n_0_[27])
    );
    LUT5 sdata[4]_i_3
    (
        .O(sdata[4]_i_3_n_0),
        .I0(reg_a[4]),
        .I1(reg_b[4]),
        .I2(reg_a[3]),
        .I3(reg_b[3]),
        .I4(o_quotient[3]_i_5_n_0)
    );
    LUT6 sdata[4]_i_4
    (
        .O(sdata[4]_i_4_n_0),
        .I0(sdata[3]_i_5_n_0),
        .I1(sdata[4]_i_5_n_0),
        .I2(sdata_reg_n_0_[28]),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[29]),
        .I5(sdata_reg_n_0_[30])
    );
    LUT6 sdata[4]_i_5
    (
        .O(sdata[4]_i_5_n_0),
        .I0(sdata_reg_n_0_[1]),
        .I1(PR[2]_i_3_n_0),
        .I2(sdata_reg_n_0_[4]),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[30]),
        .I5(sdata_reg_n_0_[3])
    );
    LUT6 sdata[5]_i_1
    (
        .O(sdata[5]_i_1_n_0),
        .I0(state_reg_n_0_[5]),
        .I1(sdata[5]_i_2_n_0),
        .I2(sdata[29]_i_3_n_0),
        .I3(state_reg_n_0_[2]),
        .I4(sdata[5]_i_3_n_0),
        .I5(sdata[7]_i_2_n_0)
    );
    LUT3 sdata[5]_i_2
    (
        .O(sdata[5]_i_2_n_0),
        .I0(PR[30]_i_4_n_0),
        .I1(PR[7]_i_5_n_0),
        .I2(PR[7]_i_4_n_0)
    );
    LUT3 sdata[5]_i_3
    (
        .O(sdata[5]_i_3_n_0),
        .I0(ct_1[5]_i_3_n_0),
        .I1(reg_a[5]),
        .I2(reg_b[5])
    );
    LUT4 sdata[6]_i_1
    (
        .O(sdata[6]_i_1_n_0),
        .I0(state_reg_n_0_[5]),
        .I1(sdata_o[6]),
        .I2(sdata[6]_i_2_n_0),
        .I3(sdata[7]_i_2_n_0)
    );
    LUT6 sdata[6]_i_2
    (
        .O(sdata[6]_i_2_n_0),
        .I0(state_reg_n_0_[2]),
        .I1(ct_1[5]_i_3_n_0),
        .I2(reg_b[5]),
        .I3(reg_a[5]),
        .I4(reg_b[6]),
        .I5(reg_a[6])
    );
    LUT6 sdata[7]_i_1
    (
        .O(sdata[7]_i_1_n_0),
        .I0(state_reg_n_0_[5]),
        .I1(sdata_o[7]),
        .I2(sdata[7]_i_2_n_0),
        .I3(state_reg_n_0_[2]),
        .I4(sdata[7]_i_3_n_0),
        .I5(sdata[7]_i_4_n_0)
    );
    LUT4 sdata[7]_i_2
    (
        .O(sdata[7]_i_2_n_0),
        .I0(Q[0]),
        .I1(state_reg_n_0_[0]),
        .I2(dividend_to_divider_reg[31][0]),
        .I3(state_reg_n_0_[1])
    );
    LUT2 sdata[7]_i_3
    (
        .O(sdata[7]_i_3_n_0),
        .I0(reg_b[7]),
        .I1(reg_a[7])
    );
    LUT3 sdata[7]_i_4
    (
        .O(sdata[7]_i_4_n_0),
        .I0(sdata[7]_i_5_n_0),
        .I1(o_quotient[3]_i_5_n_0),
        .I2(sdata[7]_i_6_n_0)
    );
    LUT5 sdata[7]_i_5
    (
        .O(sdata[7]_i_5_n_0),
        .I0(reg_b[3]),
        .I1(reg_a[3]),
        .I2(reg_b[4]),
        .I3(reg_a[4]),
        .I4(sdata[7]_i_7_n_0)
    );
    LUT5 sdata[7]_i_6
    (
        .O(sdata[7]_i_6_n_0),
        .I0(reg_a[5]),
        .I1(reg_b[5]),
        .I2(reg_a[6]),
        .I3(reg_b[6]),
        .I4(ct_1[5]_i_7_n_0)
    );
    LUT4 sdata[7]_i_7
    (
        .O(sdata[7]_i_7_n_0),
        .I0(reg_a[5]),
        .I1(reg_b[5]),
        .I2(reg_a[6]),
        .I3(reg_b[6])
    );
    LUT6 sdata[8]_i_1
    (
        .O(sdata[8]_i_1_n_0),
        .I0(state_reg_n_0_[5]),
        .I1(sdata[8]_i_2_n_0),
        .I2(sdata[29]_i_3_n_0),
        .I3(sdata[9]_i_2_n_0),
        .I4(sdata[8]_i_3_n_0),
        .I5(sdata[14]_i_4_n_0)
    );
    LUT4 sdata[8]_i_2
    (
        .O(sdata[8]_i_2_n_0),
        .I0(PR[7]_i_3_n_0),
        .I1(PR[7]_i_4_n_0),
        .I2(PR[7]_i_5_n_0),
        .I3(PR[30]_i_4_n_0)
    );
    LUT6 sdata[8]_i_3
    (
        .O(sdata[8]_i_3_n_0),
        .I0(state_reg_n_0_[2]),
        .I1(sdata[7]_i_4_n_0),
        .I2(reg_b[7]),
        .I3(reg_a[7]),
        .I4(reg_b[8]),
        .I5(reg_a[8])
    );
    LUT5 sdata[9]_i_1
    (
        .O(sdata[9]_i_1_n_0),
        .I0(sdata[9]_i_2_n_0),
        .I1(sdata[29]_i_3_n_0),
        .I2(sdata[10]_i_2_n_0),
        .I3(state_reg_n_0_[5]),
        .I4(sdata[9]_i_3_n_0)
    );
    LUT4 sdata[9]_i_2
    (
        .O(sdata[9]_i_2_n_0),
        .I0(sdata[15]_i_4_n_0),
        .I1(PR[7]_i_2_n_0),
        .I2(PR[7]_i_5_n_0),
        .I3(PR[30]_i_4_n_0)
    );
    LUT5 sdata[9]_i_3
    (
        .O(sdata[9]_i_3_n_0),
        .I0(sdata[14]_i_4_n_0),
        .I1(state_reg_n_0_[2]),
        .I2(reg_a[9]),
        .I3(reg_b[9]),
        .I4(sdata[10]_i_4_n_0)
    );
    FDCE sdata_reg[0]
    (
        .Q(sdata_reg_n_0_[0]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[0]_i_1_n_0)
    );
    FDCE sdata_reg[10]
    (
        .Q(sdata_reg_n_0_[10]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[10]_i_1_n_0)
    );
    FDCE sdata_reg[11]
    (
        .Q(sdata_reg_n_0_[11]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[11]_i_1_n_0)
    );
    FDCE sdata_reg[12]
    (
        .Q(sdata_reg_n_0_[12]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[12]_i_1_n_0)
    );
    FDCE sdata_reg[13]
    (
        .Q(sdata_reg_n_0_[13]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[13]_i_1_n_0)
    );
    FDCE sdata_reg[14]
    (
        .Q(sdata_reg_n_0_[14]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[14]_i_1_n_0)
    );
    FDCE sdata_reg[15]
    (
        .Q(sdata_reg_n_0_[15]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[15]_i_1_n_0)
    );
    FDCE sdata_reg[16]
    (
        .Q(sdata_reg_n_0_[16]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[16]_i_1_n_0)
    );
    FDCE sdata_reg[17]
    (
        .Q(sdata_reg_n_0_[17]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[17]_i_1_n_0)
    );
    FDCE sdata_reg[18]
    (
        .Q(sdata_reg_n_0_[18]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[18]_i_1_n_0)
    );
    FDCE sdata_reg[19]
    (
        .Q(sdata_reg_n_0_[19]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[19]_i_1_n_0)
    );
    FDCE sdata_reg[1]
    (
        .Q(sdata_reg_n_0_[1]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[1]_i_1_n_0)
    );
    FDCE sdata_reg[20]
    (
        .Q(sdata_reg_n_0_[20]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[20]_i_1_n_0)
    );
    FDCE sdata_reg[21]
    (
        .Q(sdata_reg_n_0_[21]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[21]_i_1_n_0)
    );
    FDCE sdata_reg[22]
    (
        .Q(sdata_reg_n_0_[22]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[22]_i_1_n_0)
    );
    FDCE sdata_reg[23]
    (
        .Q(sdata_reg_n_0_[23]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[23]_i_1_n_0)
    );
    FDCE sdata_reg[24]
    (
        .Q(sdata_reg_n_0_[24]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[24]_i_1_n_0)
    );
    FDCE sdata_reg[25]
    (
        .Q(sdata_reg_n_0_[25]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[25]_i_1_n_0)
    );
    FDCE sdata_reg[26]
    (
        .Q(sdata_reg_n_0_[26]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[26]_i_1_n_0)
    );
    FDCE sdata_reg[27]
    (
        .Q(sdata_reg_n_0_[27]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[27]_i_1_n_0)
    );
    FDCE sdata_reg[28]
    (
        .Q(sdata_reg_n_0_[28]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[28]_i_1_n_0)
    );
    FDCE sdata_reg[29]
    (
        .Q(sdata_reg_n_0_[29]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[29]_i_1_n_0)
    );
    FDCE sdata_reg[2]
    (
        .Q(sdata_reg_n_0_[2]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[2]_i_1_n_0)
    );
    FDCE sdata_reg[30]
    (
        .Q(sdata_reg_n_0_[30]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[30]_i_1_n_0)
    );
    FDCE sdata_reg[31]
    (
        .Q(sdata_o[31]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[31]_i_2_n_0)
    );
    FDCE sdata_reg[3]
    (
        .Q(sdata_reg_n_0_[3]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[3]_i_1_n_0)
    );
    FDCE sdata_reg[4]
    (
        .Q(sdata_reg_n_0_[4]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[4]_i_1_n_0)
    );
    FDCE sdata_reg[5]
    (
        .Q(sdata_reg_n_0_[5]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[5]_i_1_n_0)
    );
    FDCE sdata_reg[6]
    (
        .Q(sdata_reg_n_0_[6]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[6]_i_1_n_0)
    );
    FDCE sdata_reg[7]
    (
        .Q(sdata_reg_n_0_[7]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[7]_i_1_n_0)
    );
    FDCE sdata_reg[8]
    (
        .Q(sdata_reg_n_0_[8]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[8]_i_1_n_0)
    );
    FDCE sdata_reg[9]
    (
        .Q(sdata_reg_n_0_[9]),
        .C(CLK),
        .CE(sdata[31]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(sdata[9]_i_1_n_0)
    );
    LUT5 shifted[0]_i_1
    (
        .O(shifted[0]_i_1_n_0),
        .I0(state_reg_n_0_[5]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(shifted[0]_i_2_n_0),
        .I3(shifted[1]_i_3_n_0),
        .I4(shifted[0]_i_3_n_0)
    );
    LUT5 shifted[0]_i_2
    (
        .O(shifted[0]_i_2_n_0),
        .I0(sdata_reg_n_0_[25]),
        .I1(sdata_o[31]),
        .I2(sdata[29]_i_7_n_0),
        .I3(sdata_reg_n_0_[23]),
        .I4(PR[30]_i_4_n_0)
    );
    LUT6 shifted[0]_i_3
    (
        .O(shifted[0]_i_3_n_0),
        .I0(sdata_reg_n_0_[27]),
        .I1(sdata_reg_n_0_[29]),
        .I2(sdata_reg_n_0_[28]),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[30]),
        .I5(sdata_reg_n_0_[26])
    );
    LUT6 shifted[1]_i_1
    (
        .O(shifted[1]_i_1_n_0),
        .I0(shifted[1]_i_2_n_0),
        .I1(shifted[1]_i_3_n_0),
        .I2(sdata_o[31]),
        .I3(sdata_reg_n_0_[29]),
        .I4(sdata_reg_n_0_[30]),
        .I5(sdata[3]_i_2_n_0)
    );
    LUT5 shifted[1]_i_2
    (
        .O(shifted[1]_i_2_n_0),
        .I0(state_reg_n_0_[5]),
        .I1(state_reg_reg_n_0_[0]),
        .I2(sdata_o[31]),
        .I3(sdata_reg_n_0_[23]),
        .I4(shifted[3]_i_4_n_0)
    );
    LUT6 shifted[1]_i_3
    (
        .O(shifted[1]_i_3_n_0),
        .I0(PR[7]_i_5_n_0),
        .I1(PR[2]_i_3_n_0),
        .I2(sdata_o[31]),
        .I3(sdata_reg_n_0_[26]),
        .I4(sdata_reg_n_0_[27]),
        .I5(sdata_reg_n_0_[25])
    );
    LUT6 shifted[2]_i_1
    (
        .O(shifted[2]_i_1_n_0),
        .I0(shifted[3]_i_4_n_0),
        .I1(sdata_reg_n_0_[23]),
        .I2(sdata_o[31]),
        .I3(state_reg_reg_n_0_[0]),
        .I4(state_reg_n_0_[5]),
        .I5(sdata[3]_i_2_n_0)
    );
    LUT6 shifted[3]_i_1
    (
        .O(shifted[3]_i_1_n_0),
        .I0(PR[31]_i_1_n_0),
        .I1(shifted[3]_i_3_n_0),
        .I2(state_reg_n_0_[5]),
        .I3(state_reg_n_0_[1]),
        .I4(state_reg_n_0_[0]),
        .I5(state_reg_n_0_[2])
    );
    LUT5 shifted[3]_i_2
    (
        .O(shifted[3]_i_2_n_0),
        .I0(sdata_o[31]),
        .I1(sdata_reg_n_0_[23]),
        .I2(shifted[3]_i_4_n_0),
        .I3(state_reg_n_0_[5]),
        .I4(state_reg_reg_n_0_[0])
    );
    LUT6 shifted[3]_i_3
    (
        .O(shifted[3]_i_3_n_0),
        .I0(state_reg_n_0_[0]),
        .I1(ready_button_IBUF),
        .I2(ready_reg_n_0),
        .I3(state_reg_n_0_[5]),
        .I4(shifted[3]_i_5_n_0),
        .I5(state_reg_reg_n_0_[1])
    );
    LUT6 shifted[3]_i_4
    (
        .O(shifted[3]_i_4_n_0),
        .I0(PR[2]_i_3_n_0),
        .I1(sdata_reg_n_0_[27]),
        .I2(sdata_reg_n_0_[26]),
        .I3(sdata_o[31]),
        .I4(sdata_reg_n_0_[25]),
        .I5(sdata_reg_n_0_[24])
    );
    LUT2 shifted[3]_i_5
    (
        .O(shifted[3]_i_5_n_0),
        .I0(state_reg_n_0_[4]),
        .I1(state_reg_n_0_[3])
    );
    LUT2 shifted_1[3]_i_1
    (
        .O(shifted_1[3]_i_1_n_0),
        .I0(shifted_1[3]_i_2_n_0),
        .I1(state_reg_reg_n_0_[0])
    );
    LUT6 shifted_1[3]_i_2
    (
        .O(shifted_1[3]_i_2_n_0),
        .I0(shifted_1[3]_i_3_n_0),
        .I1(ct_reg_n_0_[5]),
        .I2(state_reg_n_0_[5]),
        .I3(state_reg_n_0_[2]),
        .I4(state_reg_reg_n_0_[1]),
        .I5(shifted[3]_i_5_n_0)
    );
    LUT2 shifted_1[3]_i_3
    (
        .O(shifted_1[3]_i_3_n_0),
        .I0(state_reg_n_0_[1]),
        .I1(state_reg_n_0_[0])
    );
    FDCE shifted_1_reg[0]
    (
        .Q(shifted_1_reg_n_0_[0]),
        .C(CLK),
        .CE(shifted_1[3]_i_1_n_0),
        .CLR(o_quotient[3]_i_3_n_0),
        .D(shifted_reg_n_0_[0])
    );
    FDCE shifted_1_reg[1]
    (
        .Q(shifted_1_reg_n_0_[1]),
        .C(CLK),
        .CE(shifted_1[3]_i_1_n_0),
        .CLR(o_quotient[3]_i_3_n_0),
        .D(shifted_reg_n_0_[1])
    );
    FDCE shifted_1_reg[2]
    (
        .Q(shifted_1_reg_n_0_[2]),
        .C(CLK),
        .CE(shifted_1[3]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(shifted_reg_n_0_[2])
    );
    FDCE shifted_1_reg[3]
    (
        .Q(shifted_1_reg_n_0_[3]),
        .C(CLK),
        .CE(shifted_1[3]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(shifted_reg_n_0_[3])
    );
    FDCE shifted_reg[0]
    (
        .Q(shifted_reg_n_0_[0]),
        .C(CLK),
        .CE(shifted[3]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(shifted[0]_i_1_n_0)
    );
    FDCE shifted_reg[1]
    (
        .Q(shifted_reg_n_0_[1]),
        .C(CLK),
        .CE(shifted[3]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(shifted[1]_i_1_n_0)
    );
    FDCE shifted_reg[2]
    (
        .Q(shifted_reg_n_0_[2]),
        .C(CLK),
        .CE(shifted[3]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(shifted[2]_i_1_n_0)
    );
    FDCE shifted_reg[3]
    (
        .Q(shifted_reg_n_0_[3]),
        .C(CLK),
        .CE(shifted[3]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(shifted[3]_i_2_n_0)
    );
    LUT6 state[5]_i_1
    (
        .O(state[5]_i_1_n_0),
        .I0(state[5]_i_4_n_0),
        .I1(state[5]_i_5_n_0),
        .I2(state_reg_n_0_[5]),
        .I3(state_reg_reg_n_0_[1]),
        .I4(state_reg_reg_n_0_[0]),
        .I5(state[5]_i_6_n_0)
    );
    LUT5 state[5]_i_2
    (
        .O(state[5]_i_2_n_0),
        .I0(state_reg_n_0_[4]),
        .I1(state_reg_n_0_[5]),
        .I2(state_reg_n_0_[1]),
        .I3(state_reg_n_0_[3]),
        .I4(state_reg_n_0_[2])
    );
    LUT2 state[5]_i_3
    (
        .O(state[5]_i_3_n_0),
        .I0(state_reg_reg[1]_0[1]),
        .I1(state_reg_reg[1]_0[0])
    );
    LUT6 state[5]_i_4
    (
        .O(state[5]_i_4_n_0),
        .I0(state[5]_i_7_n_0),
        .I1(state_reg_n_0_[1]),
        .I2(state_reg_n_0_[2]),
        .I3(ct_reg_n_0_[5]),
        .I4(state_reg_n_0_[4]),
        .I5(state_reg_n_0_[3])
    );
    LUT2 state[5]_i_5
    (
        .O(state[5]_i_5_n_0),
        .I0(sdata_o[31]),
        .I1(sdata_reg_n_0_[30])
    );
    LUT6 state[5]_i_6
    (
        .O(state[5]_i_6_n_0),
        .I0(state_reg_n_0_[0]),
        .I1(state_reg_n_0_[1]),
        .I2(state_reg_n_0_[2]),
        .I3(state_reg_n_0_[3]),
        .I4(state_reg_n_0_[4]),
        .I5(state_reg_n_0_[5])
    );
    LUT3 state[5]_i_7
    (
        .O(state[5]_i_7_n_0),
        .I0(state_reg_n_0_[0]),
        .I1(ready_button_IBUF),
        .I2(ready_reg_n_0)
    );
    FDPE state_reg[0]
    (
        .Q(state_reg_n_0_[0]),
        .C(CLK),
        .CE(state[5]_i_1_n_0),
        .D(state_reg_n_0_[4]),
        .PRE(state[5]_i_3_n_0)
    );
    LUT6 state_reg[0]_i_1
    (
        .O(state_reg[0]_i_1_n_0),
        .I0(state_reg_reg_n_0_[1]),
        .I1(ct_reg_n_0_[5]),
        .I2(state_reg_n_0_[2]),
        .I3(state_reg_n_0_[3]),
        .I4(state_reg[1]_i_2_n_0),
        .I5(state_reg_reg_n_0_[0])
    );
    FDCE state_reg[1]
    (
        .Q(state_reg_n_0_[1]),
        .C(CLK),
        .CE(state[5]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(state_reg_n_0_[5])
    );
    LUT6 state_reg[1]_i_1
    (
        .O(state_reg[1]_i_1_n_0),
        .I0(state_reg_n_0_[3]),
        .I1(state_reg_n_0_[2]),
        .I2(ct_reg_n_0_[5]),
        .I3(state_reg_reg_n_0_[0]),
        .I4(state_reg[1]_i_2_n_0),
        .I5(state_reg_reg_n_0_[1])
    );
    LUT6 state_reg[1]_i_2
    (
        .O(state_reg[1]_i_2_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(state_reg_reg_n_0_[1]),
        .I2(state_reg_n_0_[2]),
        .I3(state_reg_n_0_[3]),
        .I4(state_reg_n_0_[1]),
        .I5(state_reg[1]_i_3_n_0)
    );
    LUT6 state_reg[1]_i_3
    (
        .O(state_reg[1]_i_3_n_0),
        .I0(state_reg_reg_n_0_[0]),
        .I1(state_reg_n_0_[0]),
        .I2(state_reg_n_0_[5]),
        .I3(state_reg_n_0_[4]),
        .I4(state_reg_n_0_[3]),
        .I5(state_reg_n_0_[1])
    );
    FDCE state_reg[2]
    (
        .Q(state_reg_n_0_[2]),
        .C(CLK),
        .CE(state[5]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(state_reg_n_0_[1])
    );
    FDCE state_reg[3]
    (
        .Q(state_reg_n_0_[3]),
        .C(CLK),
        .CE(state[5]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(state_reg_n_0_[2])
    );
    FDCE state_reg[4]
    (
        .Q(state_reg_n_0_[4]),
        .C(CLK),
        .CE(state[5]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(state_reg_n_0_[3])
    );
    FDCE state_reg[5]
    (
        .Q(state_reg_n_0_[5]),
        .C(CLK),
        .CE(state[5]_i_1_n_0),
        .CLR(state[5]_i_3_n_0),
        .D(state[5]_i_2_n_0)
    );
    FDCE state_reg_reg[0]
    (
        .Q(state_reg_reg_n_0_[0]),
        .C(CLK),
        .CE(<const1>),
        .CLR(state[5]_i_3_n_0),
        .D(state_reg[0]_i_1_n_0)
    );
    FDCE state_reg_reg[1]
    (
        .Q(state_reg_reg_n_0_[1]),
        .C(CLK),
        .CE(<const1>),
        .CLR(state[5]_i_3_n_0),
        .D(state_reg[1]_i_1_n_0)
    );
endmodule

module BUFG
(
    O,
    I
);

    output O;
    input I;


endmodule

module IBUF
(
    O,
    I
);

    output O;
    input I;


endmodule

module OBUF
(
    O,
    I
);

    output O;
    input I;


endmodule

module LUT2
(
    O,
    I0,
    I1
);

    output O;
    input I0;
    input I1;


endmodule

module LUT1
(
    O,
    I0
);

    output O;
    input I0;


endmodule

module LUT6
(
    O,
    I0,
    I1,
    I2,
    I3,
    I4,
    I5
);

    output O;
    input I0;
    input I1;
    input I2;
    input I3;
    input I4;
    input I5;


endmodule

module LUT5
(
    O,
    I0,
    I1,
    I2,
    I3,
    I4
);

    output O;
    input I0;
    input I1;
    input I2;
    input I3;
    input I4;


endmodule

module LUT4
(
    O,
    I0,
    I1,
    I2,
    I3
);

    output O;
    input I0;
    input I1;
    input I2;
    input I3;


endmodule

module VCC
(
    P
);

    output P;


endmodule

module CARRY4
(
    CI,
    CYINIT,
    CO[3:0],
    O[3:0],
    DI[3:0],
    S[3:0]
);

    input CI;
    input CYINIT;
    output [3:0]CO[3:0];
    output [3:0]O[3:0];
    input [3:0]DI[3:0];
    input [3:0]S[3:0];


endmodule

module FDPE
(
    Q,
    C,
    CE,
    D,
    PRE
);

    output Q;
    input C;
    input CE;
    input D;
    input PRE;


endmodule

module INV
(
    I,
    O
);

    input I;
    output O;


endmodule

