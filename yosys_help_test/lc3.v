//Generated from netlist by SpyDrNet
//netlist name: LC3
module LC3
(
    clk,
    reset
);

    input clk;
    input reset;

    wire ground;
    wire [2:0]DR;
    wire [15:6]IR;
    wire N;
    wire P;
    wire [2:0]SR1;
    wire [2:0]SR2;
    wire VCC_1;
    wire Z;
    wire [1:0]aluControl;
    wire clk;
    wire clk_IBUF;
    wire clk_IBUF_BUFG;
    wire enaALU;
    wire enaMARM;
    wire enaMDR;
    wire enaPC;
    wire flagWE;
    wire ldIR;
    wire ldMAR;
    wire ldMDR;
    wire ldPC;
    wire memWE;
    wire regWE;
    wire reset;
    wire reset_IBUF;
    wire selEAB1;
    wire [1:0]selEAB2;
    wire selMAR;
    wire selMDR;
    wire [1:0]selPC;

    GND GND
    (
        .G(ground)
    );
    VCC VCC
    (
        .P(VCC_1)
    );
    Control c
    (
        .N(N),
        .P(P),
        .Z(Z),
        .clk(clk_IBUF_BUFG),
        .enaALU(enaALU),
        .enaMARM(enaMARM),
        .enaMDR(enaMDR),
        .enaPC(enaPC),
        .flagWE(flagWE),
        .ldIR(ldIR),
        .ldMAR(ldMAR),
        .ldMDR(ldMDR),
        .ldPC(ldPC),
        .memWE(memWE),
        .regWE(regWE),
        .reset(reset_IBUF),
        .selEAB1(selEAB1),
        .selMAR(selMAR),
        .selMDR(selMDR),
        .DR[2:0]({DR[2], DR[1], DR[0]}),
        .IR[15:0]({IR[15], IR[14], IR[13], IR[12], IR[11], IR[10], IR[9], IR[8], IR[7], IR[6], ground, ground, ground, ground, ground, ground}),
        .SR1[2:0]({SR1[2], SR1[1], SR1[0]}),
        .SR2[2:0](),
        .aluControl[1:0]({aluControl[1], aluControl[0]}),
        .selEAB2[1:0]({selEAB2[1], selEAB2[0]}),
        .selPC[1:0]({selPC[1], selPC[0]})
    );
    BUFGCE clk_IBUF_BUFG_inst
    (
        .O(clk_IBUF_BUFG),
        .CE(VCC_1),
        .I(clk_IBUF)
    );
    IBUF clk_IBUF_inst
    (
        .O(clk_IBUF),
        .I(clk)
    );
    Datapath d
    (
        .N(N),
        .P(P),
        .Z(Z),
        .clk(clk_IBUF_BUFG),
        .enaALU(enaALU),
        .enaMARM(enaMARM),
        .enaMDR(enaMDR),
        .enaPC(enaPC),
        .flagWE(flagWE),
        .ldIR(ldIR),
        .ldMAR(ldMAR),
        .ldMDR(ldMDR),
        .ldPC(ldPC),
        .memWE(memWE),
        .regWE(regWE),
        .reset(reset_IBUF),
        .selEAB1(selEAB1),
        .selMAR(selMAR),
        .selMDR(selMDR),
        .DR[2:0]({DR[2], DR[1], DR[0]}),
        .IR[15:0]({IR[15], IR[14], IR[13], IR[12], IR[11], IR[10], IR[9], IR[8], IR[7], IR[6]}),
        .SR1[2:0]({SR1[2], SR1[1], SR1[0]}),
        .SR2[2:0]({SR2[2], SR2[1], SR2[0]}),
        .aluControl[1:0]({aluControl[1], aluControl[0]}),
        .selEAB2[1:0]({selEAB2[1], selEAB2[0]}),
        .selPC[1:0]({selPC[1], selPC[0]})
    );
    IBUF reset_IBUF_inst
    (
        .O(reset_IBUF),
        .I(reset)
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

module Control
(
    N,
    P,
    Z,
    clk,
    enaALU,
    enaMARM,
    enaMDR,
    enaPC,
    flagWE,
    ldIR,
    ldMAR,
    ldMDR,
    ldPC,
    memWE,
    regWE,
    reset,
    selEAB1,
    .selMAR({ground}),
    selMDR,
    .DR[2:0]({DR[2], DR[1], DR[0]}),
    .IR[15:0]({IR[15], IR[14], IR[13], IR[12], IR[11], IR[10], IR[9], IR[8], IR[7], IR[6]}),
    .SR1[2:0]({SR1[2], SR1[1], SR1[0]}),
    .SR2[2:0]({ground, ground, ground}),
    .aluControl[1:0]({aluControl[1], aluControl[0]}),
    .selEAB2[1:0]({selMDR, selEAB2}),
    .selPC[1:0]({selPC[1], selPC[0]})
);

    input N;
    input P;
    input Z;
    input clk;
    output enaALU;
    output enaMARM;
    output enaMDR;
    output enaPC;
    output flagWE;
    output ldIR;
    output ldMAR;
    output ldMDR;
    output ldPC;
    output memWE;
    output regWE;
    input reset;
    output selEAB1;
    output ground;
    output selMDR;
    output [2:0]DR;
    input [15:6]IR;
    output [2:0]SR1;
    output ground;
    output [1:0]aluControl;
    output selMDR;
    output selEAB2;
    output [1:0]selPC;

    wire ground;
    wire <const1>;
    wire [2:0]DR;
    wire FSM_sequential_state[0]_i_1_n_0;
    wire FSM_sequential_state[0]_i_2_n_0;
    wire FSM_sequential_state[1]_i_1_n_0;
    wire FSM_sequential_state[1]_i_2_n_0;
    wire FSM_sequential_state[2]_i_1_n_0;
    wire FSM_sequential_state[2]_i_2_n_0;
    wire FSM_sequential_state[3]_i_1_n_0;
    wire FSM_sequential_state[3]_i_2_n_0;
    wire FSM_sequential_state[4]_i_1_n_0;
    wire FSM_sequential_state[4]_i_2_n_0;
    wire [15:6]IR;
    wire N;
    wire P;
    wire [2:0]SR1;
    wire SR1[0]_INST_0_i_1_n_0;
    wire SR1[1]_INST_0_i_1_n_0;
    wire SR1[2]_INST_0_i_1_n_0;
    wire Z;
    wire [1:0]aluControl;
    wire clk;
    wire enaALU;
    wire enaMARM;
    wire enaMDR;
    wire enaPC;
    wire flagWE;
    wire ldIR;
    wire ldMAR;
    wire ldMDR;
    wire ldPC;
    wire ldPC_INST_0_i_1_n_0;
    wire memWE;
    wire regWE;
    wire reset;
    wire selEAB1;
    wire selEAB2;
    wire selMDR;
    wire [1:0]selPC;
    wire [4:0]state;

    LUT6 DR[0]_INST_0
    (
        .O(DR[0]),
        .I0(state[0]),
        .I1(state[4]),
        .I2(state[1]),
        .I3(state[2]),
        .I4(state[3]),
        .I5(IR[9])
    );
    LUT6 DR[1]_INST_0
    (
        .O(DR[1]),
        .I0(state[0]),
        .I1(state[4]),
        .I2(state[1]),
        .I3(state[2]),
        .I4(state[3]),
        .I5(IR[10])
    );
    LUT6 DR[2]_INST_0
    (
        .O(DR[2]),
        .I0(state[0]),
        .I1(state[4]),
        .I2(state[1]),
        .I3(state[2]),
        .I4(state[3]),
        .I5(IR[11])
    );
    LUT6 FSM_sequential_state[0]_i_1
    (
        .O(FSM_sequential_state[0]_i_1_n_0),
        .I0(state[1]),
        .I1(state[2]),
        .I2(state[3]),
        .I3(state[4]),
        .I4(FSM_sequential_state[0]_i_2_n_0),
        .I5(state[0])
    );
    LUT6 FSM_sequential_state[0]_i_2
    (
        .O(FSM_sequential_state[0]_i_2_n_0),
        .I0(IR[14]),
        .I1(IR[13]),
        .I2(IR[12]),
        .I3(IR[15]),
        .I4(state[2]),
        .I5(state[1])
    );
    LUT6 FSM_sequential_state[1]_i_1
    (
        .O(FSM_sequential_state[1]_i_1_n_0),
        .I0(state[3]),
        .I1(state[1]),
        .I2(state[2]),
        .I3(state[0]),
        .I4(FSM_sequential_state[1]_i_2_n_0),
        .I5(state[4])
    );
    LUT6 FSM_sequential_state[1]_i_2
    (
        .O(FSM_sequential_state[1]_i_2_n_0),
        .I0(state[1]),
        .I1(IR[14]),
        .I2(IR[12]),
        .I3(IR[13]),
        .I4(IR[15]),
        .I5(state[2])
    );
    LUT6 FSM_sequential_state[2]_i_1
    (
        .O(FSM_sequential_state[2]_i_1_n_0),
        .I0(state[4]),
        .I1(FSM_sequential_state[2]_i_2_n_0),
        .I2(state[0]),
        .I3(state[2]),
        .I4(state[1]),
        .I5(state[3])
    );
    LUT6 FSM_sequential_state[2]_i_2
    (
        .O(FSM_sequential_state[2]_i_2_n_0),
        .I0(state[1]),
        .I1(IR[12]),
        .I2(IR[13]),
        .I3(IR[14]),
        .I4(IR[15]),
        .I5(state[2])
    );
    LUT6 FSM_sequential_state[3]_i_1
    (
        .O(FSM_sequential_state[3]_i_1_n_0),
        .I0(state[2]),
        .I1(state[1]),
        .I2(state[3]),
        .I3(state[4]),
        .I4(FSM_sequential_state[3]_i_2_n_0),
        .I5(state[0])
    );
    LUT6 FSM_sequential_state[3]_i_2
    (
        .O(FSM_sequential_state[3]_i_2_n_0),
        .I0(state[1]),
        .I1(IR[14]),
        .I2(IR[12]),
        .I3(IR[13]),
        .I4(IR[15]),
        .I5(state[2])
    );
    LUT4 FSM_sequential_state[4]_i_1
    (
        .O(FSM_sequential_state[4]_i_1_n_0),
        .I0(state[0]),
        .I1(FSM_sequential_state[4]_i_2_n_0),
        .I2(state[4]),
        .I3(state[3])
    );
    LUT6 FSM_sequential_state[4]_i_2
    (
        .O(FSM_sequential_state[4]_i_2_n_0),
        .I0(state[1]),
        .I1(IR[15]),
        .I2(IR[14]),
        .I3(IR[13]),
        .I4(IR[12]),
        .I5(state[2])
    );
    FDSE FSM_sequential_state_reg[0]
    (
        .Q(state[0]),
        .C(clk),
        .CE(<const1>),
        .D(FSM_sequential_state[0]_i_1_n_0),
        .S(reset)
    );
    FDRE FSM_sequential_state_reg[1]
    (
        .Q(state[1]),
        .C(clk),
        .CE(<const1>),
        .D(FSM_sequential_state[1]_i_1_n_0),
        .R(reset)
    );
    FDRE FSM_sequential_state_reg[2]
    (
        .Q(state[2]),
        .C(clk),
        .CE(<const1>),
        .D(FSM_sequential_state[2]_i_1_n_0),
        .R(reset)
    );
    FDRE FSM_sequential_state_reg[3]
    (
        .Q(state[3]),
        .C(clk),
        .CE(<const1>),
        .D(FSM_sequential_state[3]_i_1_n_0),
        .R(reset)
    );
    FDRE FSM_sequential_state_reg[4]
    (
        .Q(state[4]),
        .C(clk),
        .CE(<const1>),
        .D(FSM_sequential_state[4]_i_1_n_0),
        .R(reset)
    );
    GND GND
    (
        .G(ground)
    );
    LUT3 SR1[0]_INST_0
    (
        .O(SR1[0]),
        .I0(SR1[0]_INST_0_i_1_n_0),
        .I1(state[3]),
        .I2(IR[6])
    );
    LUT6 SR1[0]_INST_0_i_1
    (
        .O(SR1[0]_INST_0_i_1_n_0),
        .I0(state[4]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(IR[9]),
        .I4(state[0]),
        .I5(IR[6])
    );
    LUT3 SR1[1]_INST_0
    (
        .O(SR1[1]),
        .I0(SR1[1]_INST_0_i_1_n_0),
        .I1(state[3]),
        .I2(IR[7])
    );
    LUT6 SR1[1]_INST_0_i_1
    (
        .O(SR1[1]_INST_0_i_1_n_0),
        .I0(state[4]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(IR[10]),
        .I4(state[0]),
        .I5(IR[7])
    );
    LUT3 SR1[2]_INST_0
    (
        .O(SR1[2]),
        .I0(SR1[2]_INST_0_i_1_n_0),
        .I1(state[3]),
        .I2(IR[8])
    );
    LUT6 SR1[2]_INST_0_i_1
    (
        .O(SR1[2]_INST_0_i_1_n_0),
        .I0(state[4]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(IR[11]),
        .I4(state[0]),
        .I5(IR[8])
    );
    VCC VCC
    (
        .P(<const1>)
    );
    LUT5 aluControl[0]_INST_0
    (
        .O(aluControl[0]),
        .I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .I3(state[4]),
        .I4(state[3])
    );
    LUT4 aluControl[1]_INST_0
    (
        .O(aluControl[1]),
        .I0(state[4]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[3])
    );
    LUT5 enaALU_INST_0
    (
        .O(enaALU),
        .I0(state[3]),
        .I1(state[4]),
        .I2(state[2]),
        .I3(state[1]),
        .I4(state[0])
    );
    LUT5 enaMARM_INST_0
    (
        .O(enaMARM),
        .I0(state[3]),
        .I1(state[4]),
        .I2(state[1]),
        .I3(state[2]),
        .I4(state[0])
    );
    LUT4 enaMDR_INST_0
    (
        .O(enaMDR),
        .I0(state[3]),
        .I1(state[4]),
        .I2(state[1]),
        .I3(state[0])
    );
    LUT5 enaPC_INST_0
    (
        .O(enaPC),
        .I0(state[3]),
        .I1(state[4]),
        .I2(state[1]),
        .I3(state[2]),
        .I4(state[0])
    );
    LUT5 flagWE_INST_0
    (
        .O(flagWE),
        .I0(state[3]),
        .I1(state[4]),
        .I2(state[1]),
        .I3(state[2]),
        .I4(state[0])
    );
    LUT5 ldIR_INST_0
    (
        .O(ldIR),
        .I0(state[0]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[4]),
        .I4(state[3])
    );
    LUT5 ldMAR_INST_0
    (
        .O(ldMAR),
        .I0(state[3]),
        .I1(state[4]),
        .I2(state[1]),
        .I3(state[2]),
        .I4(state[0])
    );
    LUT5 ldMDR_INST_0
    (
        .O(ldMDR),
        .I0(state[0]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[4]),
        .I4(state[3])
    );
    LUT6 ldPC_INST_0
    (
        .O(ldPC),
        .I0(ldPC_INST_0_i_1_n_0),
        .I1(state[0]),
        .I2(state[2]),
        .I3(state[1]),
        .I4(state[4]),
        .I5(state[3])
    );
    LUT6 ldPC_INST_0_i_1
    (
        .O(ldPC_INST_0_i_1_n_0),
        .I0(IR[11]),
        .I1(N),
        .I2(Z),
        .I3(IR[10]),
        .I4(P),
        .I5(IR[9])
    );
    LUT5 memWE_INST_0
    (
        .O(memWE),
        .I0(state[0]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[4]),
        .I4(state[3])
    );
    LUT5 regWE_INST_0
    (
        .O(regWE),
        .I0(state[0]),
        .I1(state[1]),
        .I2(state[2]),
        .I3(state[4]),
        .I4(state[3])
    );
    LUT5 selEAB1_INST_0
    (
        .O(selEAB1),
        .I0(state[0]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[4]),
        .I4(state[3])
    );
    LUT5 selEAB2[0]_INST_0
    (
        .O(selEAB2),
        .I0(state[3]),
        .I1(state[4]),
        .I2(state[1]),
        .I3(state[2]),
        .I4(state[0])
    );
    LUT5 selMDR_INST_0
    (
        .O(selMDR),
        .I0(state[0]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[4]),
        .I4(state[3])
    );
    LUT5 selPC[0]_INST_0
    (
        .O(selPC[0]),
        .I0(state[3]),
        .I1(state[0]),
        .I2(state[2]),
        .I3(state[1]),
        .I4(state[4])
    );
    LUT5 selPC[1]_INST_0
    (
        .O(selPC[1]),
        .I0(state[0]),
        .I1(state[2]),
        .I2(state[1]),
        .I3(state[4]),
        .I4(state[3])
    );
endmodule

module BUFGCE
(
    O,
    CE,
    I
);

    output O;
    input CE;
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

module Datapath
(
    N,
    P,
    Z,
    clk,
    enaALU,
    enaMARM,
    enaMDR,
    enaPC,
    flagWE,
    ldIR,
    ldMAR,
    ldMDR,
    ldPC,
    memWE,
    regWE,
    reset,
    selEAB1,
    selMAR,
    selMDR,
    .DR[2:0]({DR[2], DR[1], DR[0]}),
    .IR[15:0]({IR[15], IR[14], IR[13], IR[12], IR[11], IR[10], IR[9], IR[8], IR[7], IR[6], ground, ground, ground, IR[2], IR[1], IR[0]}),
    .SR1[2:0]({SR1[2], SR1[1], SR1[0]}),
    .SR2[2:0]({SR2[2], SR2[1], SR2[0]}),
    .aluControl[1:0]({aluControl[1], aluControl[0]}),
    .selEAB2[1:0]({selEAB2[1], selEAB2[0]}),
    .selPC[1:0]({selPC[1], selPC[0]})
);

    output N;
    output P;
    output Z;
    input clk;
    input enaALU;
    input enaMARM;
    input enaMDR;
    input enaPC;
    input flagWE;
    input ldIR;
    input ldMAR;
    input ldMDR;
    input ldPC;
    input memWE;
    input regWE;
    input reset;
    input selEAB1;
    input selMAR;
    input selMDR;
    input [2:0]DR;
    output [15:0]IR;
    output ground;
    input [2:0]SR1;
    input [2:0]SR2;
    input [1:0]aluControl;
    input [1:0]selEAB2;
    input [1:0]selPC;

    wire ground;
    wire ALUdriver_n_0;
    wire ALUdriver_n_1;
    wire ALUdriver_n_10;
    wire ALUdriver_n_11;
    wire ALUdriver_n_12;
    wire ALUdriver_n_13;
    wire ALUdriver_n_14;
    wire ALUdriver_n_15;
    wire ALUdriver_n_16;
    wire ALUdriver_n_17;
    wire ALUdriver_n_18;
    wire ALUdriver_n_19;
    wire ALUdriver_n_2;
    wire ALUdriver_n_20;
    wire ALUdriver_n_21;
    wire ALUdriver_n_22;
    wire ALUdriver_n_23;
    wire ALUdriver_n_24;
    wire ALUdriver_n_25;
    wire ALUdriver_n_26;
    wire ALUdriver_n_27;
    wire ALUdriver_n_28;
    wire ALUdriver_n_29;
    wire ALUdriver_n_3;
    wire ALUdriver_n_30;
    wire ALUdriver_n_31;
    wire ALUdriver_n_4;
    wire ALUdriver_n_5;
    wire ALUdriver_n_6;
    wire ALUdriver_n_7;
    wire ALUdriver_n_8;
    wire ALUdriver_n_9;
    wire [15:0]Buss;
    wire [2:0]DR;
    wire [15:0]IR;
    wire [15:0]MARMuxOut;
    wire MARMuxdriver_n_0;
    wire MARMuxdriver_n_1;
    wire MARMuxdriver_n_10;
    wire MARMuxdriver_n_11;
    wire MARMuxdriver_n_12;
    wire MARMuxdriver_n_13;
    wire MARMuxdriver_n_14;
    wire MARMuxdriver_n_15;
    wire MARMuxdriver_n_16;
    wire MARMuxdriver_n_17;
    wire MARMuxdriver_n_18;
    wire MARMuxdriver_n_19;
    wire MARMuxdriver_n_2;
    wire MARMuxdriver_n_20;
    wire MARMuxdriver_n_21;
    wire MARMuxdriver_n_22;
    wire MARMuxdriver_n_23;
    wire MARMuxdriver_n_24;
    wire MARMuxdriver_n_25;
    wire MARMuxdriver_n_26;
    wire MARMuxdriver_n_27;
    wire MARMuxdriver_n_28;
    wire MARMuxdriver_n_29;
    wire MARMuxdriver_n_3;
    wire MARMuxdriver_n_30;
    wire MARMuxdriver_n_31;
    wire MARMuxdriver_n_4;
    wire MARMuxdriver_n_5;
    wire MARMuxdriver_n_6;
    wire MARMuxdriver_n_7;
    wire MARMuxdriver_n_8;
    wire MARMuxdriver_n_9;
    wire MDRdriver_n_0;
    wire MDRdriver_n_1;
    wire MDRdriver_n_10;
    wire MDRdriver_n_11;
    wire MDRdriver_n_12;
    wire MDRdriver_n_13;
    wire MDRdriver_n_14;
    wire MDRdriver_n_15;
    wire MDRdriver_n_16;
    wire MDRdriver_n_17;
    wire MDRdriver_n_18;
    wire MDRdriver_n_19;
    wire MDRdriver_n_2;
    wire MDRdriver_n_20;
    wire MDRdriver_n_21;
    wire MDRdriver_n_22;
    wire MDRdriver_n_23;
    wire MDRdriver_n_24;
    wire MDRdriver_n_25;
    wire MDRdriver_n_26;
    wire MDRdriver_n_27;
    wire MDRdriver_n_28;
    wire MDRdriver_n_29;
    wire MDRdriver_n_3;
    wire MDRdriver_n_30;
    wire MDRdriver_n_31;
    wire MDRdriver_n_4;
    wire MDRdriver_n_5;
    wire MDRdriver_n_6;
    wire MDRdriver_n_7;
    wire MDRdriver_n_8;
    wire MDRdriver_n_9;
    wire N;
    wire P;
    wire [15:0]PC;
    wire PCdriver_n_0;
    wire PCdriver_n_1;
    wire PCdriver_n_10;
    wire PCdriver_n_11;
    wire PCdriver_n_12;
    wire PCdriver_n_13;
    wire PCdriver_n_14;
    wire PCdriver_n_15;
    wire PCdriver_n_16;
    wire PCdriver_n_17;
    wire PCdriver_n_18;
    wire PCdriver_n_19;
    wire PCdriver_n_2;
    wire PCdriver_n_20;
    wire PCdriver_n_21;
    wire PCdriver_n_22;
    wire PCdriver_n_23;
    wire PCdriver_n_24;
    wire PCdriver_n_25;
    wire PCdriver_n_26;
    wire PCdriver_n_27;
    wire PCdriver_n_28;
    wire PCdriver_n_29;
    wire PCdriver_n_3;
    wire PCdriver_n_30;
    wire PCdriver_n_31;
    wire PCdriver_n_4;
    wire PCdriver_n_5;
    wire PCdriver_n_6;
    wire PCdriver_n_7;
    wire PCdriver_n_8;
    wire PCdriver_n_9;
    wire [15:0]Ra;
    wire [15:0]Rb;
    wire [2:0]SR1;
    wire [2:0]SR2;
    wire Z;
    wire [1:0]aluControl;
    wire [15:0]aluOut;
    wire clk;
    wire [15:0]eabOut;
    wire enaALU;
    wire enaMARM;
    wire enaMDR;
    wire enaPC;
    wire flagWE;
    wire ir1_i_17_n_0;
    wire ir1_i_18_n_0;
    wire ir1_i_19_n_0;
    wire ir1_i_20_n_0;
    wire ir1_i_21_n_0;
    wire ir1_i_22_n_0;
    wire ir1_i_23_n_0;
    wire ir1_i_24_n_0;
    wire ir1_i_25_n_0;
    wire ir1_i_26_n_0;
    wire ir1_i_27_n_0;
    wire ir1_i_28_n_0;
    wire ir1_i_29_n_0;
    wire ir1_i_30_n_0;
    wire ir1_i_31_n_0;
    wire ir1_i_32_n_0;
    wire ir1_i_33_n_0;
    wire ir1_i_34_n_0;
    wire ir1_i_35_n_0;
    wire ir1_i_36_n_0;
    wire ir1_i_37_n_0;
    wire ir1_i_38_n_0;
    wire ir1_i_39_n_0;
    wire ir1_i_40_n_0;
    wire ir1_i_41_n_0;
    wire ir1_i_42_n_0;
    wire ir1_i_43_n_0;
    wire ir1_i_44_n_0;
    wire ir1_i_45_n_0;
    wire ir1_i_46_n_0;
    wire ir1_i_47_n_0;
    wire ir1_i_48_n_0;
    wire ir1_i_49_n_0;
    wire ir1_i_50_n_0;
    wire ir1_i_51_n_0;
    wire ir1_i_52_n_0;
    wire ir1_i_53_n_0;
    wire ir1_i_54_n_0;
    wire ir1_i_55_n_0;
    wire ir1_i_56_n_0;
    wire ir1_i_57_n_0;
    wire ir1_i_58_n_0;
    wire ir1_i_59_n_0;
    wire ir1_i_60_n_0;
    wire ir1_i_61_n_0;
    wire ir1_i_62_n_0;
    wire ir1_i_63_n_0;
    wire ir1_i_64_n_0;
    wire ir1_i_65_n_0;
    wire ir1_i_66_n_0;
    wire ir1_i_67_n_0;
    wire ir1_i_68_n_0;
    wire ir1_i_69_n_0;
    wire ir1_i_70_n_0;
    wire ir1_i_71_n_0;
    wire ir1_i_72_n_0;
    wire ir1_i_73_n_0;
    wire ir1_i_74_n_0;
    wire ir1_i_75_n_0;
    wire ir1_i_76_n_0;
    wire ir1_i_77_n_0;
    wire ir1_i_78_n_0;
    wire ir1_i_79_n_0;
    wire ir1_i_80_n_0;
    wire ir1_n_10;
    wire ir1_n_11;
    wire ir1_n_12;
    wire ldIR;
    wire ldMAR;
    wire ldMDR;
    wire ldPC;
    wire [15:0]mdrOut;
    wire memWE;
    wire regWE;
    wire reset;
    wire selEAB1;
    wire [1:0]selEAB2;
    wire selMAR;
    wire selMDR;
    wire [1:0]selPC;

    ts_driver ALUdriver
    (
        .ctrl(enaALU),
        .enz_0(ALUdriver_n_0),
        .enz_1(ALUdriver_n_1),
        .enz_10(ALUdriver_n_10),
        .enz_11(ALUdriver_n_11),
        .enz_12(ALUdriver_n_12),
        .enz_13(ALUdriver_n_13),
        .enz_14(ALUdriver_n_14),
        .enz_15(ALUdriver_n_15),
        .enz_2(ALUdriver_n_2),
        .enz_3(ALUdriver_n_3),
        .enz_4(ALUdriver_n_4),
        .enz_5(ALUdriver_n_5),
        .enz_6(ALUdriver_n_6),
        .enz_7(ALUdriver_n_7),
        .enz_8(ALUdriver_n_8),
        .enz_9(ALUdriver_n_9),
        .din[15:0]({aluOut[15], aluOut[14], aluOut[13], aluOut[12], aluOut[11], aluOut[10], aluOut[9], aluOut[8], aluOut[7], aluOut[6], aluOut[5], aluOut[4], aluOut[3], aluOut[2], aluOut[1], aluOut[0]}),
        .dout[15:0]({ALUdriver_n_16, ALUdriver_n_17, ALUdriver_n_18, ALUdriver_n_19, ALUdriver_n_20, ALUdriver_n_21, ALUdriver_n_22, ALUdriver_n_23, ALUdriver_n_24, ALUdriver_n_25, ALUdriver_n_26, ALUdriver_n_27, ALUdriver_n_28, ALUdriver_n_29, ALUdriver_n_30, ALUdriver_n_31})
    );
    GND GND
    (
        .G(ground)
    );
    ts_driver__1 MARMuxdriver
    (
        .ctrl(enaMARM),
        .enz_0(MARMuxdriver_n_0),
        .enz_1(MARMuxdriver_n_1),
        .enz_10(MARMuxdriver_n_10),
        .enz_11(MARMuxdriver_n_11),
        .enz_12(MARMuxdriver_n_12),
        .enz_13(MARMuxdriver_n_13),
        .enz_14(MARMuxdriver_n_14),
        .enz_15(MARMuxdriver_n_15),
        .enz_2(MARMuxdriver_n_2),
        .enz_3(MARMuxdriver_n_3),
        .enz_4(MARMuxdriver_n_4),
        .enz_5(MARMuxdriver_n_5),
        .enz_6(MARMuxdriver_n_6),
        .enz_7(MARMuxdriver_n_7),
        .enz_8(MARMuxdriver_n_8),
        .enz_9(MARMuxdriver_n_9),
        .din[15:0]({MARMuxOut[15], MARMuxOut[14], MARMuxOut[13], MARMuxOut[12], MARMuxOut[11], MARMuxOut[10], MARMuxOut[9], MARMuxOut[8], MARMuxOut[7], MARMuxOut[6], MARMuxOut[5], MARMuxOut[4], MARMuxOut[3], MARMuxOut[2], MARMuxOut[1], MARMuxOut[0]}),
        .dout[15:0]({MARMuxdriver_n_16, MARMuxdriver_n_17, MARMuxdriver_n_18, MARMuxdriver_n_19, MARMuxdriver_n_20, MARMuxdriver_n_21, MARMuxdriver_n_22, MARMuxdriver_n_23, MARMuxdriver_n_24, MARMuxdriver_n_25, MARMuxdriver_n_26, MARMuxdriver_n_27, MARMuxdriver_n_28, MARMuxdriver_n_29, MARMuxdriver_n_30, MARMuxdriver_n_31})
    );
    ts_driver__3 MDRdriver
    (
        .ctrl(enaMDR),
        .enz_0(MDRdriver_n_0),
        .enz_1(MDRdriver_n_1),
        .enz_10(MDRdriver_n_10),
        .enz_11(MDRdriver_n_11),
        .enz_12(MDRdriver_n_12),
        .enz_13(MDRdriver_n_13),
        .enz_14(MDRdriver_n_14),
        .enz_15(MDRdriver_n_15),
        .enz_2(MDRdriver_n_2),
        .enz_3(MDRdriver_n_3),
        .enz_4(MDRdriver_n_4),
        .enz_5(MDRdriver_n_5),
        .enz_6(MDRdriver_n_6),
        .enz_7(MDRdriver_n_7),
        .enz_8(MDRdriver_n_8),
        .enz_9(MDRdriver_n_9),
        .din[15:0]({mdrOut[15], mdrOut[14], mdrOut[13], mdrOut[12], mdrOut[11], mdrOut[10], mdrOut[9], mdrOut[8], mdrOut[7], mdrOut[6], mdrOut[5], mdrOut[4], mdrOut[3], mdrOut[2], mdrOut[1], mdrOut[0]}),
        .dout[15:0]({MDRdriver_n_16, MDRdriver_n_17, MDRdriver_n_18, MDRdriver_n_19, MDRdriver_n_20, MDRdriver_n_21, MDRdriver_n_22, MDRdriver_n_23, MDRdriver_n_24, MDRdriver_n_25, MDRdriver_n_26, MDRdriver_n_27, MDRdriver_n_28, MDRdriver_n_29, MDRdriver_n_30, MDRdriver_n_31})
    );
    ts_driver__2 PCdriver
    (
        .ctrl(enaPC),
        .enz_0(PCdriver_n_0),
        .enz_1(PCdriver_n_1),
        .enz_10(PCdriver_n_10),
        .enz_11(PCdriver_n_11),
        .enz_12(PCdriver_n_12),
        .enz_13(PCdriver_n_13),
        .enz_14(PCdriver_n_14),
        .enz_15(PCdriver_n_15),
        .enz_2(PCdriver_n_2),
        .enz_3(PCdriver_n_3),
        .enz_4(PCdriver_n_4),
        .enz_5(PCdriver_n_5),
        .enz_6(PCdriver_n_6),
        .enz_7(PCdriver_n_7),
        .enz_8(PCdriver_n_8),
        .enz_9(PCdriver_n_9),
        .din[15:0]({PC[15], PC[14], PC[13], PC[12], PC[11], PC[10], PC[9], PC[8], PC[7], PC[6], PC[5], PC[4], PC[3], PC[2], PC[1], PC[0]}),
        .dout[15:0]({PCdriver_n_16, PCdriver_n_17, PCdriver_n_18, PCdriver_n_19, PCdriver_n_20, PCdriver_n_21, PCdriver_n_22, PCdriver_n_23, PCdriver_n_24, PCdriver_n_25, PCdriver_n_26, PCdriver_n_27, PCdriver_n_28, PCdriver_n_29, PCdriver_n_30, PCdriver_n_31})
    );
    ALU alu1
    (
        .IR[5:0]({ir1_n_10, ir1_n_11, ir1_n_12, IR[2], IR[1], IR[0]}),
        .Ra[15:0]({Ra[15], Ra[14], Ra[13], Ra[12], Ra[11], Ra[10], Ra[9], Ra[8], Ra[7], Ra[6], Ra[5], Ra[4], Ra[3], Ra[2], Ra[1], Ra[0]}),
        .Rb[15:0]({Rb[15], Rb[14], Rb[13], Rb[12], Rb[11], Rb[10], Rb[9], Rb[8], Rb[7], Rb[6], Rb[5], Rb[4], Rb[3], Rb[2], Rb[1], Rb[0]}),
        .aluControl[1:0]({aluControl[1], aluControl[0]}),
        .aluOut[15:0]({aluOut[15], aluOut[14], aluOut[13], aluOut[12], aluOut[11], aluOut[10], aluOut[9], aluOut[8], aluOut[7], aluOut[6], aluOut[5], aluOut[4], aluOut[3], aluOut[2], aluOut[1], aluOut[0]})
    );
    EAB eab1
    (
        .selEAB1(selEAB1),
        .IR[10:0]({IR[10], IR[9], IR[8], IR[7], IR[6], ir1_n_10, ir1_n_11, ir1_n_12, IR[2], IR[1], IR[0]}),
        .PC[15:0]({PC[15], PC[14], PC[13], PC[12], PC[11], PC[10], PC[9], PC[8], PC[7], PC[6], PC[5], PC[4], PC[3], PC[2], PC[1], PC[0]}),
        .Ra[15:0]({Ra[15], Ra[14], Ra[13], Ra[12], Ra[11], Ra[10], Ra[9], Ra[8], Ra[7], Ra[6], Ra[5], Ra[4], Ra[3], Ra[2], Ra[1], Ra[0]}),
        .eabOut[15:0]({eabOut[15], eabOut[14], eabOut[13], eabOut[12], eabOut[11], eabOut[10], eabOut[9], eabOut[8], eabOut[7], eabOut[6], eabOut[5], eabOut[4], eabOut[3], eabOut[2], eabOut[1], eabOut[0]}),
        .selEAB2[1:0]({selEAB2[1], selEAB2[0]})
    );
    IR ir1
    (
        .clk(clk),
        .ldIR(ldIR),
        .reset(reset),
        .Buss[15:0]({Buss[15], Buss[14], Buss[13], Buss[12], Buss[11], Buss[10], Buss[9], Buss[8], Buss[7], Buss[6], Buss[5], Buss[4], Buss[3], Buss[2], Buss[1], Buss[0]}),
        .IR[15:0]({IR[15], IR[14], IR[13], IR[12], IR[11], IR[10], IR[9], IR[8], IR[7], IR[6], ir1_n_10, ir1_n_11, ir1_n_12, IR[2], IR[1], IR[0]})
    );
    LUT2 ir1_i_1
    (
        .O(Buss[15]),
        .I0(ir1_i_17_n_0),
        .I1(ir1_i_18_n_0)
    );
    LUT2 ir1_i_10
    (
        .O(Buss[6]),
        .I0(ir1_i_35_n_0),
        .I1(ir1_i_36_n_0)
    );
    LUT2 ir1_i_11
    (
        .O(Buss[5]),
        .I0(ir1_i_37_n_0),
        .I1(ir1_i_38_n_0)
    );
    LUT2 ir1_i_12
    (
        .O(Buss[4]),
        .I0(ir1_i_39_n_0),
        .I1(ir1_i_40_n_0)
    );
    LUT2 ir1_i_13
    (
        .O(Buss[3]),
        .I0(ir1_i_41_n_0),
        .I1(ir1_i_42_n_0)
    );
    LUT2 ir1_i_14
    (
        .O(Buss[2]),
        .I0(ir1_i_43_n_0),
        .I1(ir1_i_44_n_0)
    );
    LUT2 ir1_i_15
    (
        .O(Buss[1]),
        .I0(ir1_i_45_n_0),
        .I1(ir1_i_46_n_0)
    );
    LUT2 ir1_i_16
    (
        .O(Buss[0]),
        .I0(ir1_i_47_n_0),
        .I1(ir1_i_48_n_0)
    );
    LUT2 ir1_i_17
    (
        .O(ir1_i_17_n_0),
        .I0(ir1_i_49_n_0),
        .I1(ir1_i_50_n_0)
    );
    LUT4 ir1_i_18
    (
        .O(ir1_i_18_n_0),
        .I0(ALUdriver_n_0),
        .I1(MDRdriver_n_0),
        .I2(PCdriver_n_0),
        .I3(MARMuxdriver_n_0)
    );
    LUT2 ir1_i_19
    (
        .O(ir1_i_19_n_0),
        .I0(ir1_i_51_n_0),
        .I1(ir1_i_52_n_0)
    );
    LUT2 ir1_i_2
    (
        .O(Buss[14]),
        .I0(ir1_i_19_n_0),
        .I1(ir1_i_20_n_0)
    );
    LUT4 ir1_i_20
    (
        .O(ir1_i_20_n_0),
        .I0(ALUdriver_n_1),
        .I1(MDRdriver_n_1),
        .I2(PCdriver_n_1),
        .I3(MARMuxdriver_n_1)
    );
    LUT2 ir1_i_21
    (
        .O(ir1_i_21_n_0),
        .I0(ir1_i_53_n_0),
        .I1(ir1_i_54_n_0)
    );
    LUT4 ir1_i_22
    (
        .O(ir1_i_22_n_0),
        .I0(ALUdriver_n_2),
        .I1(MDRdriver_n_2),
        .I2(PCdriver_n_2),
        .I3(MARMuxdriver_n_2)
    );
    LUT2 ir1_i_23
    (
        .O(ir1_i_23_n_0),
        .I0(ir1_i_55_n_0),
        .I1(ir1_i_56_n_0)
    );
    LUT4 ir1_i_24
    (
        .O(ir1_i_24_n_0),
        .I0(ALUdriver_n_3),
        .I1(MDRdriver_n_3),
        .I2(PCdriver_n_3),
        .I3(MARMuxdriver_n_3)
    );
    LUT2 ir1_i_25
    (
        .O(ir1_i_25_n_0),
        .I0(ir1_i_57_n_0),
        .I1(ir1_i_58_n_0)
    );
    LUT4 ir1_i_26
    (
        .O(ir1_i_26_n_0),
        .I0(ALUdriver_n_4),
        .I1(MDRdriver_n_4),
        .I2(PCdriver_n_4),
        .I3(MARMuxdriver_n_4)
    );
    LUT2 ir1_i_27
    (
        .O(ir1_i_27_n_0),
        .I0(ir1_i_59_n_0),
        .I1(ir1_i_60_n_0)
    );
    LUT4 ir1_i_28
    (
        .O(ir1_i_28_n_0),
        .I0(ALUdriver_n_5),
        .I1(MDRdriver_n_5),
        .I2(PCdriver_n_5),
        .I3(MARMuxdriver_n_5)
    );
    LUT2 ir1_i_29
    (
        .O(ir1_i_29_n_0),
        .I0(ir1_i_61_n_0),
        .I1(ir1_i_62_n_0)
    );
    LUT2 ir1_i_3
    (
        .O(Buss[13]),
        .I0(ir1_i_21_n_0),
        .I1(ir1_i_22_n_0)
    );
    LUT4 ir1_i_30
    (
        .O(ir1_i_30_n_0),
        .I0(ALUdriver_n_6),
        .I1(MDRdriver_n_6),
        .I2(PCdriver_n_6),
        .I3(MARMuxdriver_n_6)
    );
    LUT2 ir1_i_31
    (
        .O(ir1_i_31_n_0),
        .I0(ir1_i_63_n_0),
        .I1(ir1_i_64_n_0)
    );
    LUT4 ir1_i_32
    (
        .O(ir1_i_32_n_0),
        .I0(ALUdriver_n_7),
        .I1(MDRdriver_n_7),
        .I2(PCdriver_n_7),
        .I3(MARMuxdriver_n_7)
    );
    LUT2 ir1_i_33
    (
        .O(ir1_i_33_n_0),
        .I0(ir1_i_65_n_0),
        .I1(ir1_i_66_n_0)
    );
    LUT4 ir1_i_34
    (
        .O(ir1_i_34_n_0),
        .I0(ALUdriver_n_8),
        .I1(MDRdriver_n_8),
        .I2(PCdriver_n_8),
        .I3(MARMuxdriver_n_8)
    );
    LUT2 ir1_i_35
    (
        .O(ir1_i_35_n_0),
        .I0(ir1_i_67_n_0),
        .I1(ir1_i_68_n_0)
    );
    LUT4 ir1_i_36
    (
        .O(ir1_i_36_n_0),
        .I0(ALUdriver_n_9),
        .I1(MDRdriver_n_9),
        .I2(PCdriver_n_9),
        .I3(MARMuxdriver_n_9)
    );
    LUT2 ir1_i_37
    (
        .O(ir1_i_37_n_0),
        .I0(ir1_i_69_n_0),
        .I1(ir1_i_70_n_0)
    );
    LUT4 ir1_i_38
    (
        .O(ir1_i_38_n_0),
        .I0(ALUdriver_n_10),
        .I1(MDRdriver_n_10),
        .I2(PCdriver_n_10),
        .I3(MARMuxdriver_n_10)
    );
    LUT2 ir1_i_39
    (
        .O(ir1_i_39_n_0),
        .I0(ir1_i_71_n_0),
        .I1(ir1_i_72_n_0)
    );
    LUT2 ir1_i_4
    (
        .O(Buss[12]),
        .I0(ir1_i_23_n_0),
        .I1(ir1_i_24_n_0)
    );
    LUT4 ir1_i_40
    (
        .O(ir1_i_40_n_0),
        .I0(ALUdriver_n_11),
        .I1(MDRdriver_n_11),
        .I2(PCdriver_n_11),
        .I3(MARMuxdriver_n_11)
    );
    LUT2 ir1_i_41
    (
        .O(ir1_i_41_n_0),
        .I0(ir1_i_73_n_0),
        .I1(ir1_i_74_n_0)
    );
    LUT4 ir1_i_42
    (
        .O(ir1_i_42_n_0),
        .I0(ALUdriver_n_12),
        .I1(MDRdriver_n_12),
        .I2(PCdriver_n_12),
        .I3(MARMuxdriver_n_12)
    );
    LUT2 ir1_i_43
    (
        .O(ir1_i_43_n_0),
        .I0(ir1_i_75_n_0),
        .I1(ir1_i_76_n_0)
    );
    LUT4 ir1_i_44
    (
        .O(ir1_i_44_n_0),
        .I0(ALUdriver_n_13),
        .I1(MDRdriver_n_13),
        .I2(PCdriver_n_13),
        .I3(MARMuxdriver_n_13)
    );
    LUT2 ir1_i_45
    (
        .O(ir1_i_45_n_0),
        .I0(ir1_i_77_n_0),
        .I1(ir1_i_78_n_0)
    );
    LUT4 ir1_i_46
    (
        .O(ir1_i_46_n_0),
        .I0(ALUdriver_n_14),
        .I1(MDRdriver_n_14),
        .I2(PCdriver_n_14),
        .I3(MARMuxdriver_n_14)
    );
    LUT2 ir1_i_47
    (
        .O(ir1_i_47_n_0),
        .I0(ir1_i_79_n_0),
        .I1(ir1_i_80_n_0)
    );
    LUT4 ir1_i_48
    (
        .O(ir1_i_48_n_0),
        .I0(ALUdriver_n_15),
        .I1(MDRdriver_n_15),
        .I2(PCdriver_n_15),
        .I3(MARMuxdriver_n_15)
    );
    LUT6 ir1_i_49
    (
        .O(ir1_i_49_n_0),
        .I0(ALUdriver_n_16),
        .I1(ALUdriver_n_0),
        .I2(MDRdriver_n_16),
        .I3(MDRdriver_n_0),
        .I4(PCdriver_n_16),
        .I5(PCdriver_n_0)
    );
    LUT2 ir1_i_5
    (
        .O(Buss[11]),
        .I0(ir1_i_25_n_0),
        .I1(ir1_i_26_n_0)
    );
    LUT2 ir1_i_50
    (
        .O(ir1_i_50_n_0),
        .I0(MARMuxdriver_n_16),
        .I1(MARMuxdriver_n_0)
    );
    LUT6 ir1_i_51
    (
        .O(ir1_i_51_n_0),
        .I0(ALUdriver_n_17),
        .I1(ALUdriver_n_1),
        .I2(MDRdriver_n_17),
        .I3(MDRdriver_n_1),
        .I4(PCdriver_n_17),
        .I5(PCdriver_n_1)
    );
    LUT2 ir1_i_52
    (
        .O(ir1_i_52_n_0),
        .I0(MARMuxdriver_n_17),
        .I1(MARMuxdriver_n_1)
    );
    LUT6 ir1_i_53
    (
        .O(ir1_i_53_n_0),
        .I0(ALUdriver_n_18),
        .I1(ALUdriver_n_2),
        .I2(MDRdriver_n_18),
        .I3(MDRdriver_n_2),
        .I4(PCdriver_n_18),
        .I5(PCdriver_n_2)
    );
    LUT2 ir1_i_54
    (
        .O(ir1_i_54_n_0),
        .I0(MARMuxdriver_n_18),
        .I1(MARMuxdriver_n_2)
    );
    LUT6 ir1_i_55
    (
        .O(ir1_i_55_n_0),
        .I0(ALUdriver_n_19),
        .I1(ALUdriver_n_3),
        .I2(MDRdriver_n_19),
        .I3(MDRdriver_n_3),
        .I4(PCdriver_n_19),
        .I5(PCdriver_n_3)
    );
    LUT2 ir1_i_56
    (
        .O(ir1_i_56_n_0),
        .I0(MARMuxdriver_n_19),
        .I1(MARMuxdriver_n_3)
    );
    LUT6 ir1_i_57
    (
        .O(ir1_i_57_n_0),
        .I0(ALUdriver_n_20),
        .I1(ALUdriver_n_4),
        .I2(MDRdriver_n_20),
        .I3(MDRdriver_n_4),
        .I4(PCdriver_n_20),
        .I5(PCdriver_n_4)
    );
    LUT2 ir1_i_58
    (
        .O(ir1_i_58_n_0),
        .I0(MARMuxdriver_n_20),
        .I1(MARMuxdriver_n_4)
    );
    LUT6 ir1_i_59
    (
        .O(ir1_i_59_n_0),
        .I0(ALUdriver_n_21),
        .I1(ALUdriver_n_5),
        .I2(MDRdriver_n_21),
        .I3(MDRdriver_n_5),
        .I4(PCdriver_n_21),
        .I5(PCdriver_n_5)
    );
    LUT2 ir1_i_6
    (
        .O(Buss[10]),
        .I0(ir1_i_27_n_0),
        .I1(ir1_i_28_n_0)
    );
    LUT2 ir1_i_60
    (
        .O(ir1_i_60_n_0),
        .I0(MARMuxdriver_n_21),
        .I1(MARMuxdriver_n_5)
    );
    LUT6 ir1_i_61
    (
        .O(ir1_i_61_n_0),
        .I0(ALUdriver_n_22),
        .I1(ALUdriver_n_6),
        .I2(MDRdriver_n_22),
        .I3(MDRdriver_n_6),
        .I4(PCdriver_n_22),
        .I5(PCdriver_n_6)
    );
    LUT2 ir1_i_62
    (
        .O(ir1_i_62_n_0),
        .I0(MARMuxdriver_n_22),
        .I1(MARMuxdriver_n_6)
    );
    LUT6 ir1_i_63
    (
        .O(ir1_i_63_n_0),
        .I0(ALUdriver_n_23),
        .I1(ALUdriver_n_7),
        .I2(MDRdriver_n_23),
        .I3(MDRdriver_n_7),
        .I4(PCdriver_n_23),
        .I5(PCdriver_n_7)
    );
    LUT2 ir1_i_64
    (
        .O(ir1_i_64_n_0),
        .I0(MARMuxdriver_n_23),
        .I1(MARMuxdriver_n_7)
    );
    LUT6 ir1_i_65
    (
        .O(ir1_i_65_n_0),
        .I0(ALUdriver_n_24),
        .I1(ALUdriver_n_8),
        .I2(MDRdriver_n_24),
        .I3(MDRdriver_n_8),
        .I4(PCdriver_n_24),
        .I5(PCdriver_n_8)
    );
    LUT2 ir1_i_66
    (
        .O(ir1_i_66_n_0),
        .I0(MARMuxdriver_n_24),
        .I1(MARMuxdriver_n_8)
    );
    LUT6 ir1_i_67
    (
        .O(ir1_i_67_n_0),
        .I0(ALUdriver_n_25),
        .I1(ALUdriver_n_9),
        .I2(MDRdriver_n_25),
        .I3(MDRdriver_n_9),
        .I4(PCdriver_n_25),
        .I5(PCdriver_n_9)
    );
    LUT2 ir1_i_68
    (
        .O(ir1_i_68_n_0),
        .I0(MARMuxdriver_n_25),
        .I1(MARMuxdriver_n_9)
    );
    LUT6 ir1_i_69
    (
        .O(ir1_i_69_n_0),
        .I0(ALUdriver_n_26),
        .I1(ALUdriver_n_10),
        .I2(MDRdriver_n_26),
        .I3(MDRdriver_n_10),
        .I4(PCdriver_n_26),
        .I5(PCdriver_n_10)
    );
    LUT2 ir1_i_7
    (
        .O(Buss[9]),
        .I0(ir1_i_29_n_0),
        .I1(ir1_i_30_n_0)
    );
    LUT2 ir1_i_70
    (
        .O(ir1_i_70_n_0),
        .I0(MARMuxdriver_n_26),
        .I1(MARMuxdriver_n_10)
    );
    LUT6 ir1_i_71
    (
        .O(ir1_i_71_n_0),
        .I0(ALUdriver_n_27),
        .I1(ALUdriver_n_11),
        .I2(MDRdriver_n_27),
        .I3(MDRdriver_n_11),
        .I4(PCdriver_n_27),
        .I5(PCdriver_n_11)
    );
    LUT2 ir1_i_72
    (
        .O(ir1_i_72_n_0),
        .I0(MARMuxdriver_n_27),
        .I1(MARMuxdriver_n_11)
    );
    LUT6 ir1_i_73
    (
        .O(ir1_i_73_n_0),
        .I0(ALUdriver_n_28),
        .I1(ALUdriver_n_12),
        .I2(MDRdriver_n_28),
        .I3(MDRdriver_n_12),
        .I4(PCdriver_n_28),
        .I5(PCdriver_n_12)
    );
    LUT2 ir1_i_74
    (
        .O(ir1_i_74_n_0),
        .I0(MARMuxdriver_n_28),
        .I1(MARMuxdriver_n_12)
    );
    LUT6 ir1_i_75
    (
        .O(ir1_i_75_n_0),
        .I0(ALUdriver_n_29),
        .I1(ALUdriver_n_13),
        .I2(MDRdriver_n_29),
        .I3(MDRdriver_n_13),
        .I4(PCdriver_n_29),
        .I5(PCdriver_n_13)
    );
    LUT2 ir1_i_76
    (
        .O(ir1_i_76_n_0),
        .I0(MARMuxdriver_n_29),
        .I1(MARMuxdriver_n_13)
    );
    LUT6 ir1_i_77
    (
        .O(ir1_i_77_n_0),
        .I0(ALUdriver_n_30),
        .I1(ALUdriver_n_14),
        .I2(MDRdriver_n_30),
        .I3(MDRdriver_n_14),
        .I4(PCdriver_n_30),
        .I5(PCdriver_n_14)
    );
    LUT2 ir1_i_78
    (
        .O(ir1_i_78_n_0),
        .I0(MARMuxdriver_n_30),
        .I1(MARMuxdriver_n_14)
    );
    LUT6 ir1_i_79
    (
        .O(ir1_i_79_n_0),
        .I0(ALUdriver_n_31),
        .I1(ALUdriver_n_15),
        .I2(MDRdriver_n_31),
        .I3(MDRdriver_n_15),
        .I4(PCdriver_n_31),
        .I5(PCdriver_n_15)
    );
    LUT2 ir1_i_8
    (
        .O(Buss[8]),
        .I0(ir1_i_31_n_0),
        .I1(ir1_i_32_n_0)
    );
    LUT2 ir1_i_80
    (
        .O(ir1_i_80_n_0),
        .I0(MARMuxdriver_n_31),
        .I1(MARMuxdriver_n_15)
    );
    LUT2 ir1_i_9
    (
        .O(Buss[7]),
        .I0(ir1_i_33_n_0),
        .I1(ir1_i_34_n_0)
    );
    MARMux marmux1
    (
        .selMAR(selMAR),
        .IR[7:0]({IR[7], IR[6], ir1_n_10, ir1_n_11, ir1_n_12, IR[2], IR[1], IR[0]}),
        .MARMuxOut[15:0]({MARMuxOut[15], MARMuxOut[14], MARMuxOut[13], MARMuxOut[12], MARMuxOut[11], MARMuxOut[10], MARMuxOut[9], MARMuxOut[8], MARMuxOut[7], MARMuxOut[6], MARMuxOut[5], MARMuxOut[4], MARMuxOut[3], MARMuxOut[2], MARMuxOut[1], MARMuxOut[0]}),
        .eabOut[15:0]({eabOut[15], eabOut[14], eabOut[13], eabOut[12], eabOut[11], eabOut[10], eabOut[9], eabOut[8], eabOut[7], eabOut[6], eabOut[5], eabOut[4], eabOut[3], eabOut[2], eabOut[1], eabOut[0]})
    );
    Memory memory1
    (
        .clk(clk),
        .ldMAR(ldMAR),
        .ldMDR(ldMDR),
        .memWE(memWE),
        .reset(reset),
        .selMDR(selMDR),
        .Buss[15:0]({Buss[15], Buss[14], Buss[13], Buss[12], Buss[11], Buss[10], Buss[9], Buss[8], Buss[7], Buss[6], Buss[5], Buss[4], Buss[3], Buss[2], Buss[1], Buss[0]}),
        .mdrOut[15:0]({mdrOut[15], mdrOut[14], mdrOut[13], mdrOut[12], mdrOut[11], mdrOut[10], mdrOut[9], mdrOut[8], mdrOut[7], mdrOut[6], mdrOut[5], mdrOut[4], mdrOut[3], mdrOut[2], mdrOut[1], mdrOut[0]})
    );
    NZP nzp1
    (
        .N(N),
        .P(P),
        .Z(Z),
        .clk(clk),
        .flagWE(flagWE),
        .reset(reset),
        .Buss[15:0]({Buss[15], Buss[14], Buss[13], Buss[12], Buss[11], Buss[10], Buss[9], Buss[8], Buss[7], Buss[6], Buss[5], Buss[4], Buss[3], Buss[2], Buss[1], Buss[0]})
    );
    PC pc1
    (
        .clk(clk),
        .ldPC(ldPC),
        .reset(reset),
        .Buss[15:0]({Buss[15], Buss[14], Buss[13], Buss[12], Buss[11], Buss[10], Buss[9], Buss[8], Buss[7], Buss[6], Buss[5], Buss[4], Buss[3], Buss[2], Buss[1], Buss[0]}),
        .PC[15:0]({PC[15], PC[14], PC[13], PC[12], PC[11], PC[10], PC[9], PC[8], PC[7], PC[6], PC[5], PC[4], PC[3], PC[2], PC[1], PC[0]}),
        .eabOut[15:0]({eabOut[15], eabOut[14], eabOut[13], eabOut[12], eabOut[11], eabOut[10], eabOut[9], eabOut[8], eabOut[7], eabOut[6], eabOut[5], eabOut[4], eabOut[3], eabOut[2], eabOut[1], eabOut[0]}),
        .selPC[1:0]({selPC[1], selPC[0]})
    );
    RegFile regfile1
    (
        .clk(clk),
        .regWE(regWE),
        .reset(reset),
        .Buss[15:0]({Buss[15], Buss[14], Buss[13], Buss[12], Buss[11], Buss[10], Buss[9], Buss[8], Buss[7], Buss[6], Buss[5], Buss[4], Buss[3], Buss[2], Buss[1], Buss[0]}),
        .DR[2:0]({DR[2], DR[1], DR[0]}),
        .Ra[15:0]({Ra[15], Ra[14], Ra[13], Ra[12], Ra[11], Ra[10], Ra[9], Ra[8], Ra[7], Ra[6], Ra[5], Ra[4], Ra[3], Ra[2], Ra[1], Ra[0]}),
        .Rb[15:0]({Rb[15], Rb[14], Rb[13], Rb[12], Rb[11], Rb[10], Rb[9], Rb[8], Rb[7], Rb[6], Rb[5], Rb[4], Rb[3], Rb[2], Rb[1], Rb[0]}),
        .SR1[2:0]({SR1[2], SR1[1], SR1[0]}),
        .SR2[2:0]({SR2[2], SR2[1], SR2[0]})
    );
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

module FDSE
(
    Q,
    C,
    CE,
    D,
    S
);

    output Q;
    input C;
    input CE;
    input D;
    input S;


endmodule

module FDRE
(
    Q,
    C,
    CE,
    D,
    R
);

    output Q;
    input C;
    input CE;
    input D;
    input R;


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

module ts_driver
(
    ctrl,
    .enz_0({ctrl}),
    .enz_1({ctrl}),
    .enz_10({ctrl}),
    .enz_11({ctrl}),
    .enz_12({ctrl}),
    .enz_13({ctrl}),
    .enz_14({ctrl}),
    .enz_15({ctrl}),
    .enz_2({ctrl}),
    .enz_3({ctrl}),
    .enz_4({ctrl}),
    .enz_5({ctrl}),
    .enz_6({ctrl}),
    .enz_7({ctrl}),
    .enz_8({ctrl}),
    .enz_9({ctrl}),
    .din[15:0]({din[15], din[14], din[13], din[12], din[11], din[10], din[9], din[8], din[7], din[6], din[5], din[4], din[3], din[2], din[1], din[0]}),
    .dout[15:0]({dout[15], dout[14], dout[13], dout[12], dout[11], dout[10], dout[9], dout[8], dout[7], dout[6], dout[5], dout[4], dout[3], dout[2], dout[1], dout[0]})
);

    input ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    input [15:0]din;
    inout [15:0]dout;

    wire ctrl;
    wire [15:0]din;
    wire [15:0]dout;

    LUT1 dout[0]_INST_0
    (
        .O(dout[0]),
        .I0(din[0])
    );
    LUT1 dout[10]_INST_0
    (
        .O(dout[10]),
        .I0(din[10])
    );
    LUT1 dout[11]_INST_0
    (
        .O(dout[11]),
        .I0(din[11])
    );
    LUT1 dout[12]_INST_0
    (
        .O(dout[12]),
        .I0(din[12])
    );
    LUT1 dout[13]_INST_0
    (
        .O(dout[13]),
        .I0(din[13])
    );
    LUT1 dout[14]_INST_0
    (
        .O(dout[14]),
        .I0(din[14])
    );
    LUT1 dout[15]_INST_0
    (
        .O(dout[15]),
        .I0(din[15])
    );
    LUT1 dout[1]_INST_0
    (
        .O(dout[1]),
        .I0(din[1])
    );
    LUT1 dout[2]_INST_0
    (
        .O(dout[2]),
        .I0(din[2])
    );
    LUT1 dout[3]_INST_0
    (
        .O(dout[3]),
        .I0(din[3])
    );
    LUT1 dout[4]_INST_0
    (
        .O(dout[4]),
        .I0(din[4])
    );
    LUT1 dout[5]_INST_0
    (
        .O(dout[5]),
        .I0(din[5])
    );
    LUT1 dout[6]_INST_0
    (
        .O(dout[6]),
        .I0(din[6])
    );
    LUT1 dout[7]_INST_0
    (
        .O(dout[7]),
        .I0(din[7])
    );
    LUT1 dout[8]_INST_0
    (
        .O(dout[8]),
        .I0(din[8])
    );
    LUT1 dout[9]_INST_0
    (
        .O(dout[9]),
        .I0(din[9])
    );
endmodule

module ts_driver__1
(
    ctrl,
    .enz_0({ctrl}),
    .enz_1({ctrl}),
    .enz_10({ctrl}),
    .enz_11({ctrl}),
    .enz_12({ctrl}),
    .enz_13({ctrl}),
    .enz_14({ctrl}),
    .enz_15({ctrl}),
    .enz_2({ctrl}),
    .enz_3({ctrl}),
    .enz_4({ctrl}),
    .enz_5({ctrl}),
    .enz_6({ctrl}),
    .enz_7({ctrl}),
    .enz_8({ctrl}),
    .enz_9({ctrl}),
    .din[15:0]({din[15], din[14], din[13], din[12], din[11], din[10], din[9], din[8], din[7], din[6], din[5], din[4], din[3], din[2], din[1], din[0]}),
    .dout[15:0]({dout[15], dout[14], dout[13], dout[12], dout[11], dout[10], dout[9], dout[8], dout[7], dout[6], dout[5], dout[4], dout[3], dout[2], dout[1], dout[0]})
);

    input ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    input [15:0]din;
    inout [15:0]dout;

    wire ctrl;
    wire [15:0]din;
    wire [15:0]dout;

    LUT1 dout[0]_INST_0
    (
        .O(dout[0]),
        .I0(din[0])
    );
    LUT1 dout[10]_INST_0
    (
        .O(dout[10]),
        .I0(din[10])
    );
    LUT1 dout[11]_INST_0
    (
        .O(dout[11]),
        .I0(din[11])
    );
    LUT1 dout[12]_INST_0
    (
        .O(dout[12]),
        .I0(din[12])
    );
    LUT1 dout[13]_INST_0
    (
        .O(dout[13]),
        .I0(din[13])
    );
    LUT1 dout[14]_INST_0
    (
        .O(dout[14]),
        .I0(din[14])
    );
    LUT1 dout[15]_INST_0
    (
        .O(dout[15]),
        .I0(din[15])
    );
    LUT1 dout[1]_INST_0
    (
        .O(dout[1]),
        .I0(din[1])
    );
    LUT1 dout[2]_INST_0
    (
        .O(dout[2]),
        .I0(din[2])
    );
    LUT1 dout[3]_INST_0
    (
        .O(dout[3]),
        .I0(din[3])
    );
    LUT1 dout[4]_INST_0
    (
        .O(dout[4]),
        .I0(din[4])
    );
    LUT1 dout[5]_INST_0
    (
        .O(dout[5]),
        .I0(din[5])
    );
    LUT1 dout[6]_INST_0
    (
        .O(dout[6]),
        .I0(din[6])
    );
    LUT1 dout[7]_INST_0
    (
        .O(dout[7]),
        .I0(din[7])
    );
    LUT1 dout[8]_INST_0
    (
        .O(dout[8]),
        .I0(din[8])
    );
    LUT1 dout[9]_INST_0
    (
        .O(dout[9]),
        .I0(din[9])
    );
endmodule

module ts_driver__3
(
    ctrl,
    .enz_0({ctrl}),
    .enz_1({ctrl}),
    .enz_10({ctrl}),
    .enz_11({ctrl}),
    .enz_12({ctrl}),
    .enz_13({ctrl}),
    .enz_14({ctrl}),
    .enz_15({ctrl}),
    .enz_2({ctrl}),
    .enz_3({ctrl}),
    .enz_4({ctrl}),
    .enz_5({ctrl}),
    .enz_6({ctrl}),
    .enz_7({ctrl}),
    .enz_8({ctrl}),
    .enz_9({ctrl}),
    .din[15:0]({din[15], din[14], din[13], din[12], din[11], din[10], din[9], din[8], din[7], din[6], din[5], din[4], din[3], din[2], din[1], din[0]}),
    .dout[15:0]({dout[15], dout[14], dout[13], dout[12], dout[11], dout[10], dout[9], dout[8], dout[7], dout[6], dout[5], dout[4], dout[3], dout[2], dout[1], dout[0]})
);

    input ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    input [15:0]din;
    inout [15:0]dout;

    wire ctrl;
    wire [15:0]din;
    wire [15:0]dout;

    LUT1 dout[0]_INST_0
    (
        .O(dout[0]),
        .I0(din[0])
    );
    LUT1 dout[10]_INST_0
    (
        .O(dout[10]),
        .I0(din[10])
    );
    LUT1 dout[11]_INST_0
    (
        .O(dout[11]),
        .I0(din[11])
    );
    LUT1 dout[12]_INST_0
    (
        .O(dout[12]),
        .I0(din[12])
    );
    LUT1 dout[13]_INST_0
    (
        .O(dout[13]),
        .I0(din[13])
    );
    LUT1 dout[14]_INST_0
    (
        .O(dout[14]),
        .I0(din[14])
    );
    LUT1 dout[15]_INST_0
    (
        .O(dout[15]),
        .I0(din[15])
    );
    LUT1 dout[1]_INST_0
    (
        .O(dout[1]),
        .I0(din[1])
    );
    LUT1 dout[2]_INST_0
    (
        .O(dout[2]),
        .I0(din[2])
    );
    LUT1 dout[3]_INST_0
    (
        .O(dout[3]),
        .I0(din[3])
    );
    LUT1 dout[4]_INST_0
    (
        .O(dout[4]),
        .I0(din[4])
    );
    LUT1 dout[5]_INST_0
    (
        .O(dout[5]),
        .I0(din[5])
    );
    LUT1 dout[6]_INST_0
    (
        .O(dout[6]),
        .I0(din[6])
    );
    LUT1 dout[7]_INST_0
    (
        .O(dout[7]),
        .I0(din[7])
    );
    LUT1 dout[8]_INST_0
    (
        .O(dout[8]),
        .I0(din[8])
    );
    LUT1 dout[9]_INST_0
    (
        .O(dout[9]),
        .I0(din[9])
    );
endmodule

module ts_driver__2
(
    ctrl,
    .enz_0({ctrl}),
    .enz_1({ctrl}),
    .enz_10({ctrl}),
    .enz_11({ctrl}),
    .enz_12({ctrl}),
    .enz_13({ctrl}),
    .enz_14({ctrl}),
    .enz_15({ctrl}),
    .enz_2({ctrl}),
    .enz_3({ctrl}),
    .enz_4({ctrl}),
    .enz_5({ctrl}),
    .enz_6({ctrl}),
    .enz_7({ctrl}),
    .enz_8({ctrl}),
    .enz_9({ctrl}),
    .din[15:0]({din[15], din[14], din[13], din[12], din[11], din[10], din[9], din[8], din[7], din[6], din[5], din[4], din[3], din[2], din[1], din[0]}),
    .dout[15:0]({dout[15], dout[14], dout[13], dout[12], dout[11], dout[10], dout[9], dout[8], dout[7], dout[6], dout[5], dout[4], dout[3], dout[2], dout[1], dout[0]})
);

    input ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    output ctrl;
    input [15:0]din;
    inout [15:0]dout;

    wire ctrl;
    wire [15:0]din;
    wire [15:0]dout;

    LUT1 dout[0]_INST_0
    (
        .O(dout[0]),
        .I0(din[0])
    );
    LUT1 dout[10]_INST_0
    (
        .O(dout[10]),
        .I0(din[10])
    );
    LUT1 dout[11]_INST_0
    (
        .O(dout[11]),
        .I0(din[11])
    );
    LUT1 dout[12]_INST_0
    (
        .O(dout[12]),
        .I0(din[12])
    );
    LUT1 dout[13]_INST_0
    (
        .O(dout[13]),
        .I0(din[13])
    );
    LUT1 dout[14]_INST_0
    (
        .O(dout[14]),
        .I0(din[14])
    );
    LUT1 dout[15]_INST_0
    (
        .O(dout[15]),
        .I0(din[15])
    );
    LUT1 dout[1]_INST_0
    (
        .O(dout[1]),
        .I0(din[1])
    );
    LUT1 dout[2]_INST_0
    (
        .O(dout[2]),
        .I0(din[2])
    );
    LUT1 dout[3]_INST_0
    (
        .O(dout[3]),
        .I0(din[3])
    );
    LUT1 dout[4]_INST_0
    (
        .O(dout[4]),
        .I0(din[4])
    );
    LUT1 dout[5]_INST_0
    (
        .O(dout[5]),
        .I0(din[5])
    );
    LUT1 dout[6]_INST_0
    (
        .O(dout[6]),
        .I0(din[6])
    );
    LUT1 dout[7]_INST_0
    (
        .O(dout[7]),
        .I0(din[7])
    );
    LUT1 dout[8]_INST_0
    (
        .O(dout[8]),
        .I0(din[8])
    );
    LUT1 dout[9]_INST_0
    (
        .O(dout[9]),
        .I0(din[9])
    );
endmodule

module ALU
(
    .IR[5:0]({IR[5], IR[4], IR[3], IR[2], IR[1], IR[0]}),
    .Ra[15:0]({Ra[15], Ra[14], Ra[13], Ra[12], Ra[11], Ra[10], Ra[9], Ra[8], Ra[7], Ra[6], Ra[5], Ra[4], Ra[3], Ra[2], Ra[1], Ra[0]}),
    .Rb[15:0]({Rb[15], Rb[14], Rb[13], Rb[12], Rb[11], Rb[10], Rb[9], Rb[8], Rb[7], Rb[6], Rb[5], Rb[4], Rb[3], Rb[2], Rb[1], Rb[0]}),
    .aluControl[1:0]({aluControl[1], aluControl[0]}),
    .aluOut[15:0]({aluOut[15], aluOut[14], aluOut[13], aluOut[12], aluOut[11], aluOut[10], aluOut[9], aluOut[8], aluOut[7], aluOut[6], aluOut[5], aluOut[4], aluOut[3], aluOut[2], aluOut[1], aluOut[0]})
);

    input [5:0]IR;
    input [15:0]Ra;
    input [15:0]Rb;
    input [1:0]aluControl;
    output [15:0]aluOut;

    wire ground;
    wire GND_2;
    wire [5:0]IR;
    wire [15:0]Ra;
    wire [15:0]Rb;
    wire [1:0]aluControl;
    wire [15:0]aluOut1;
    wire [15:0]aluOut;
    wire aluOut[15]_INST_0_i_10_n_0;
    wire aluOut[15]_INST_0_i_1_n_1;
    wire aluOut[15]_INST_0_i_1_n_2;
    wire aluOut[15]_INST_0_i_1_n_3;
    wire aluOut[15]_INST_0_i_1_n_5;
    wire aluOut[15]_INST_0_i_1_n_6;
    wire aluOut[15]_INST_0_i_1_n_7;
    wire aluOut[15]_INST_0_i_3_n_0;
    wire aluOut[15]_INST_0_i_4_n_0;
    wire aluOut[15]_INST_0_i_5_n_0;
    wire aluOut[15]_INST_0_i_6_n_0;
    wire aluOut[15]_INST_0_i_7_n_0;
    wire aluOut[15]_INST_0_i_8_n_0;
    wire aluOut[15]_INST_0_i_9_n_0;
    wire aluOut[7]_INST_0_i_10_n_0;
    wire aluOut[7]_INST_0_i_1_n_0;
    wire aluOut[7]_INST_0_i_1_n_1;
    wire aluOut[7]_INST_0_i_1_n_2;
    wire aluOut[7]_INST_0_i_1_n_3;
    wire aluOut[7]_INST_0_i_1_n_5;
    wire aluOut[7]_INST_0_i_1_n_6;
    wire aluOut[7]_INST_0_i_1_n_7;
    wire aluOut[7]_INST_0_i_3_n_0;
    wire aluOut[7]_INST_0_i_4_n_0;
    wire aluOut[7]_INST_0_i_5_n_0;
    wire aluOut[7]_INST_0_i_6_n_0;
    wire aluOut[7]_INST_0_i_7_n_0;
    wire aluOut[7]_INST_0_i_8_n_0;
    wire aluOut[7]_INST_0_i_9_n_0;
    wire [14:0]sr2muxout;
    wire [15:15]sr2muxout__0;

    GND GND
    (
        .G(ground)
    );
    GND GND_1
    (
        .G(GND_2)
    );
    LUT5 aluOut[0]_INST_0
    (
        .O(aluOut[0]),
        .I0(aluOut1[0]),
        .I1(sr2muxout[0]),
        .I2(aluControl[1]),
        .I3(Ra[0]),
        .I4(aluControl[0])
    );
    LUT3 aluOut[0]_INST_0_i_1
    (
        .O(sr2muxout[0]),
        .I0(IR[0]),
        .I1(Rb[0]),
        .I2(IR[5])
    );
    LUT5 aluOut[10]_INST_0
    (
        .O(aluOut[10]),
        .I0(aluOut1[10]),
        .I1(sr2muxout[10]),
        .I2(aluControl[1]),
        .I3(Ra[10]),
        .I4(aluControl[0])
    );
    LUT3 aluOut[10]_INST_0_i_1
    (
        .O(sr2muxout[10]),
        .I0(IR[4]),
        .I1(Rb[10]),
        .I2(IR[5])
    );
    LUT5 aluOut[11]_INST_0
    (
        .O(aluOut[11]),
        .I0(aluOut1[11]),
        .I1(sr2muxout[11]),
        .I2(aluControl[1]),
        .I3(Ra[11]),
        .I4(aluControl[0])
    );
    LUT3 aluOut[11]_INST_0_i_1
    (
        .O(sr2muxout[11]),
        .I0(IR[4]),
        .I1(Rb[11]),
        .I2(IR[5])
    );
    LUT5 aluOut[12]_INST_0
    (
        .O(aluOut[12]),
        .I0(aluOut1[12]),
        .I1(sr2muxout[12]),
        .I2(aluControl[1]),
        .I3(Ra[12]),
        .I4(aluControl[0])
    );
    LUT3 aluOut[12]_INST_0_i_1
    (
        .O(sr2muxout[12]),
        .I0(IR[4]),
        .I1(Rb[12]),
        .I2(IR[5])
    );
    LUT5 aluOut[13]_INST_0
    (
        .O(aluOut[13]),
        .I0(aluOut1[13]),
        .I1(sr2muxout[13]),
        .I2(aluControl[1]),
        .I3(Ra[13]),
        .I4(aluControl[0])
    );
    LUT3 aluOut[13]_INST_0_i_1
    (
        .O(sr2muxout[13]),
        .I0(IR[4]),
        .I1(Rb[13]),
        .I2(IR[5])
    );
    LUT5 aluOut[14]_INST_0
    (
        .O(aluOut[14]),
        .I0(aluOut1[14]),
        .I1(sr2muxout[14]),
        .I2(aluControl[1]),
        .I3(Ra[14]),
        .I4(aluControl[0])
    );
    LUT3 aluOut[14]_INST_0_i_1
    (
        .O(sr2muxout[14]),
        .I0(IR[4]),
        .I1(Rb[14]),
        .I2(IR[5])
    );
    LUT5 aluOut[15]_INST_0
    (
        .O(aluOut[15]),
        .I0(aluOut1[15]),
        .I1(sr2muxout__0),
        .I2(aluControl[1]),
        .I3(Ra[15]),
        .I4(aluControl[0])
    );
    CARRY8 aluOut[15]_INST_0_i_1
    (
        .CI(aluOut[7]_INST_0_i_1_n_0),
        .CI_TOP(GND_2),
        .CO[7:0]({}),
        .O[7:0]({aluOut1[15], aluOut1[14], aluOut1[13], aluOut1[12], aluOut1[11], aluOut1[10], aluOut1[9], aluOut1[8]}),
        .DI[7:0]({ground, Ra[14], Ra[13], Ra[12], Ra[11], Ra[10], Ra[9], Ra[8]}),
        .S[7:0]({aluOut[15]_INST_0_i_3_n_0, aluOut[15]_INST_0_i_4_n_0, aluOut[15]_INST_0_i_5_n_0, aluOut[15]_INST_0_i_6_n_0, aluOut[15]_INST_0_i_7_n_0, aluOut[15]_INST_0_i_8_n_0, aluOut[15]_INST_0_i_9_n_0, aluOut[15]_INST_0_i_10_n_0})
    );
    LUT4 aluOut[15]_INST_0_i_10
    (
        .O(aluOut[15]_INST_0_i_10_n_0),
        .I0(Ra[8]),
        .I1(IR[5]),
        .I2(Rb[8]),
        .I3(IR[4])
    );
    LUT3 aluOut[15]_INST_0_i_2
    (
        .O(sr2muxout__0),
        .I0(IR[4]),
        .I1(Rb[15]),
        .I2(IR[5])
    );
    LUT4 aluOut[15]_INST_0_i_3
    (
        .O(aluOut[15]_INST_0_i_3_n_0),
        .I0(Ra[15]),
        .I1(IR[5]),
        .I2(Rb[15]),
        .I3(IR[4])
    );
    LUT4 aluOut[15]_INST_0_i_4
    (
        .O(aluOut[15]_INST_0_i_4_n_0),
        .I0(Ra[14]),
        .I1(IR[5]),
        .I2(Rb[14]),
        .I3(IR[4])
    );
    LUT4 aluOut[15]_INST_0_i_5
    (
        .O(aluOut[15]_INST_0_i_5_n_0),
        .I0(Ra[13]),
        .I1(IR[5]),
        .I2(Rb[13]),
        .I3(IR[4])
    );
    LUT4 aluOut[15]_INST_0_i_6
    (
        .O(aluOut[15]_INST_0_i_6_n_0),
        .I0(Ra[12]),
        .I1(IR[5]),
        .I2(Rb[12]),
        .I3(IR[4])
    );
    LUT4 aluOut[15]_INST_0_i_7
    (
        .O(aluOut[15]_INST_0_i_7_n_0),
        .I0(Ra[11]),
        .I1(IR[5]),
        .I2(Rb[11]),
        .I3(IR[4])
    );
    LUT4 aluOut[15]_INST_0_i_8
    (
        .O(aluOut[15]_INST_0_i_8_n_0),
        .I0(Ra[10]),
        .I1(IR[5]),
        .I2(Rb[10]),
        .I3(IR[4])
    );
    LUT4 aluOut[15]_INST_0_i_9
    (
        .O(aluOut[15]_INST_0_i_9_n_0),
        .I0(Ra[9]),
        .I1(IR[5]),
        .I2(Rb[9]),
        .I3(IR[4])
    );
    LUT5 aluOut[1]_INST_0
    (
        .O(aluOut[1]),
        .I0(aluOut1[1]),
        .I1(sr2muxout[1]),
        .I2(aluControl[1]),
        .I3(Ra[1]),
        .I4(aluControl[0])
    );
    LUT3 aluOut[1]_INST_0_i_1
    (
        .O(sr2muxout[1]),
        .I0(IR[1]),
        .I1(Rb[1]),
        .I2(IR[5])
    );
    LUT5 aluOut[2]_INST_0
    (
        .O(aluOut[2]),
        .I0(aluOut1[2]),
        .I1(sr2muxout[2]),
        .I2(aluControl[1]),
        .I3(Ra[2]),
        .I4(aluControl[0])
    );
    LUT3 aluOut[2]_INST_0_i_1
    (
        .O(sr2muxout[2]),
        .I0(IR[2]),
        .I1(Rb[2]),
        .I2(IR[5])
    );
    LUT5 aluOut[3]_INST_0
    (
        .O(aluOut[3]),
        .I0(aluOut1[3]),
        .I1(sr2muxout[3]),
        .I2(aluControl[1]),
        .I3(Ra[3]),
        .I4(aluControl[0])
    );
    LUT3 aluOut[3]_INST_0_i_1
    (
        .O(sr2muxout[3]),
        .I0(IR[3]),
        .I1(Rb[3]),
        .I2(IR[5])
    );
    LUT5 aluOut[4]_INST_0
    (
        .O(aluOut[4]),
        .I0(aluOut1[4]),
        .I1(sr2muxout[4]),
        .I2(aluControl[1]),
        .I3(Ra[4]),
        .I4(aluControl[0])
    );
    LUT3 aluOut[4]_INST_0_i_1
    (
        .O(sr2muxout[4]),
        .I0(IR[4]),
        .I1(Rb[4]),
        .I2(IR[5])
    );
    LUT5 aluOut[5]_INST_0
    (
        .O(aluOut[5]),
        .I0(aluOut1[5]),
        .I1(sr2muxout[5]),
        .I2(aluControl[1]),
        .I3(Ra[5]),
        .I4(aluControl[0])
    );
    LUT3 aluOut[5]_INST_0_i_1
    (
        .O(sr2muxout[5]),
        .I0(IR[4]),
        .I1(Rb[5]),
        .I2(IR[5])
    );
    LUT5 aluOut[6]_INST_0
    (
        .O(aluOut[6]),
        .I0(aluOut1[6]),
        .I1(sr2muxout[6]),
        .I2(aluControl[1]),
        .I3(Ra[6]),
        .I4(aluControl[0])
    );
    LUT3 aluOut[6]_INST_0_i_1
    (
        .O(sr2muxout[6]),
        .I0(IR[4]),
        .I1(Rb[6]),
        .I2(IR[5])
    );
    LUT5 aluOut[7]_INST_0
    (
        .O(aluOut[7]),
        .I0(aluOut1[7]),
        .I1(sr2muxout[7]),
        .I2(aluControl[1]),
        .I3(Ra[7]),
        .I4(aluControl[0])
    );
    CARRY8 aluOut[7]_INST_0_i_1
    (
        .CI(ground),
        .CI_TOP(GND_2),
        .CO[7:0]({aluOut[7]_INST_0_i_1_n_0, aluOut[7]_INST_0_i_1_n_1, aluOut[7]_INST_0_i_1_n_2, aluOut[7]_INST_0_i_1_n_3}),
        .O[7:0]({aluOut1[7], aluOut1[6], aluOut1[5], aluOut1[4], aluOut1[3], aluOut1[2], aluOut1[1], aluOut1[0]}),
        .DI[7:0]({Ra[7], Ra[6], Ra[5], Ra[4], Ra[3], Ra[2], Ra[1], Ra[0]}),
        .S[7:0]({aluOut[7]_INST_0_i_3_n_0, aluOut[7]_INST_0_i_4_n_0, aluOut[7]_INST_0_i_5_n_0, aluOut[7]_INST_0_i_6_n_0, aluOut[7]_INST_0_i_7_n_0, aluOut[7]_INST_0_i_8_n_0, aluOut[7]_INST_0_i_9_n_0, aluOut[7]_INST_0_i_10_n_0})
    );
    LUT4 aluOut[7]_INST_0_i_10
    (
        .O(aluOut[7]_INST_0_i_10_n_0),
        .I0(Ra[0]),
        .I1(IR[5]),
        .I2(Rb[0]),
        .I3(IR[0])
    );
    LUT3 aluOut[7]_INST_0_i_2
    (
        .O(sr2muxout[7]),
        .I0(IR[4]),
        .I1(Rb[7]),
        .I2(IR[5])
    );
    LUT4 aluOut[7]_INST_0_i_3
    (
        .O(aluOut[7]_INST_0_i_3_n_0),
        .I0(Ra[7]),
        .I1(IR[5]),
        .I2(Rb[7]),
        .I3(IR[4])
    );
    LUT4 aluOut[7]_INST_0_i_4
    (
        .O(aluOut[7]_INST_0_i_4_n_0),
        .I0(Ra[6]),
        .I1(IR[5]),
        .I2(Rb[6]),
        .I3(IR[4])
    );
    LUT4 aluOut[7]_INST_0_i_5
    (
        .O(aluOut[7]_INST_0_i_5_n_0),
        .I0(Ra[5]),
        .I1(IR[5]),
        .I2(Rb[5]),
        .I3(IR[4])
    );
    LUT4 aluOut[7]_INST_0_i_6
    (
        .O(aluOut[7]_INST_0_i_6_n_0),
        .I0(Ra[4]),
        .I1(IR[5]),
        .I2(Rb[4]),
        .I3(IR[4])
    );
    LUT4 aluOut[7]_INST_0_i_7
    (
        .O(aluOut[7]_INST_0_i_7_n_0),
        .I0(Ra[3]),
        .I1(IR[5]),
        .I2(Rb[3]),
        .I3(IR[3])
    );
    LUT4 aluOut[7]_INST_0_i_8
    (
        .O(aluOut[7]_INST_0_i_8_n_0),
        .I0(Ra[2]),
        .I1(IR[5]),
        .I2(Rb[2]),
        .I3(IR[2])
    );
    LUT4 aluOut[7]_INST_0_i_9
    (
        .O(aluOut[7]_INST_0_i_9_n_0),
        .I0(Ra[1]),
        .I1(IR[5]),
        .I2(Rb[1]),
        .I3(IR[1])
    );
    LUT5 aluOut[8]_INST_0
    (
        .O(aluOut[8]),
        .I0(aluOut1[8]),
        .I1(sr2muxout[8]),
        .I2(aluControl[1]),
        .I3(Ra[8]),
        .I4(aluControl[0])
    );
    LUT3 aluOut[8]_INST_0_i_1
    (
        .O(sr2muxout[8]),
        .I0(IR[4]),
        .I1(Rb[8]),
        .I2(IR[5])
    );
    LUT5 aluOut[9]_INST_0
    (
        .O(aluOut[9]),
        .I0(aluOut1[9]),
        .I1(sr2muxout[9]),
        .I2(aluControl[1]),
        .I3(Ra[9]),
        .I4(aluControl[0])
    );
    LUT3 aluOut[9]_INST_0_i_1
    (
        .O(sr2muxout[9]),
        .I0(IR[4]),
        .I1(Rb[9]),
        .I2(IR[5])
    );
endmodule

module EAB
(
    selEAB1,
    .IR[10:0]({IR[10], IR[9], IR[8], IR[7], IR[6], IR[5], IR[4], IR[3], IR[2], IR[1], IR[0]}),
    .PC[15:0]({PC[15], PC[14], PC[13], PC[12], PC[11], PC[10], PC[9], PC[8], PC[7], PC[6], PC[5], PC[4], PC[3], PC[2], PC[1], PC[0]}),
    .Ra[15:0]({Ra[15], Ra[14], Ra[13], Ra[12], Ra[11], Ra[10], Ra[9], Ra[8], Ra[7], Ra[6], Ra[5], Ra[4], Ra[3], Ra[2], Ra[1], Ra[0]}),
    .eabOut[15:0]({eabOut[15], eabOut[14], eabOut[13], eabOut[12], eabOut[11], eabOut[10], eabOut[9], eabOut[8], eabOut[7], eabOut[6], eabOut[5], eabOut[4], eabOut[3], eabOut[2], eabOut[1], eabOut[0]}),
    .selEAB2[1:0]({selEAB2[1], selEAB2[0]})
);

    input selEAB1;
    input [10:0]IR;
    input [15:0]PC;
    input [15:0]Ra;
    output [15:0]eabOut;
    input [1:0]selEAB2;

    wire ground;
    wire GND_2;
    wire [10:0]IR;
    wire [15:0]PC;
    wire [15:0]Ra;
    wire [14:0]addr1;
    wire [15:0]eabOut;
    wire eabOut[0]_INST_0_i_10_n_0;
    wire eabOut[0]_INST_0_i_11_n_0;
    wire eabOut[0]_INST_0_i_12_n_0;
    wire eabOut[0]_INST_0_i_13_n_0;
    wire eabOut[0]_INST_0_i_14_n_0;
    wire eabOut[0]_INST_0_i_15_n_0;
    wire eabOut[0]_INST_0_i_16_n_0;
    wire eabOut[0]_INST_0_i_9_n_0;
    wire eabOut[0]_INST_0_n_0;
    wire eabOut[0]_INST_0_n_1;
    wire eabOut[0]_INST_0_n_2;
    wire eabOut[0]_INST_0_n_3;
    wire eabOut[0]_INST_0_n_5;
    wire eabOut[0]_INST_0_n_6;
    wire eabOut[0]_INST_0_n_7;
    wire eabOut[8]_INST_0_i_10_n_0;
    wire eabOut[8]_INST_0_i_11_n_0;
    wire eabOut[8]_INST_0_i_12_n_0;
    wire eabOut[8]_INST_0_i_13_n_0;
    wire eabOut[8]_INST_0_i_14_n_0;
    wire eabOut[8]_INST_0_i_15_n_0;
    wire eabOut[8]_INST_0_i_17_n_0;
    wire eabOut[8]_INST_0_i_8_n_0;
    wire eabOut[8]_INST_0_i_9_n_0;
    wire eabOut[8]_INST_0_n_1;
    wire eabOut[8]_INST_0_n_2;
    wire eabOut[8]_INST_0_n_3;
    wire eabOut[8]_INST_0_n_5;
    wire eabOut[8]_INST_0_n_6;
    wire eabOut[8]_INST_0_n_7;
    wire [10:10]p_0_in;
    wire selEAB1;
    wire [1:0]selEAB2;

    GND GND
    (
        .G(ground)
    );
    GND GND_1
    (
        .G(GND_2)
    );
    CARRY8 eabOut[0]_INST_0
    (
        .CI(ground),
        .CI_TOP(GND_2),
        .CO[7:0]({eabOut[0]_INST_0_n_0, eabOut[0]_INST_0_n_1, eabOut[0]_INST_0_n_2, eabOut[0]_INST_0_n_3}),
        .O[7:0]({eabOut[7], eabOut[6], eabOut[5], eabOut[4], eabOut[3], eabOut[2], eabOut[1], eabOut[0]}),
        .DI[7:0]({addr1[7], addr1[6], addr1[5], addr1[4], addr1[3], addr1[2], addr1[1], addr1[0]}),
        .S[7:0]({eabOut[0]_INST_0_i_9_n_0, eabOut[0]_INST_0_i_10_n_0, eabOut[0]_INST_0_i_11_n_0, eabOut[0]_INST_0_i_12_n_0, eabOut[0]_INST_0_i_13_n_0, eabOut[0]_INST_0_i_14_n_0, eabOut[0]_INST_0_i_15_n_0, eabOut[0]_INST_0_i_16_n_0})
    );
    LUT3 eabOut[0]_INST_0_i_1
    (
        .O(addr1[7]),
        .I0(Ra[7]),
        .I1(PC[7]),
        .I2(selEAB1)
    );
    LUT6 eabOut[0]_INST_0_i_10
    (
        .O(eabOut[0]_INST_0_i_10_n_0),
        .I0(selEAB1),
        .I1(PC[6]),
        .I2(Ra[6]),
        .I3(eabOut[8]_INST_0_i_17_n_0),
        .I4(selEAB2[1]),
        .I5(IR[6])
    );
    LUT6 eabOut[0]_INST_0_i_11
    (
        .O(eabOut[0]_INST_0_i_11_n_0),
        .I0(selEAB1),
        .I1(PC[5]),
        .I2(Ra[5]),
        .I3(selEAB2[1]),
        .I4(selEAB2[0]),
        .I5(IR[5])
    );
    LUT6 eabOut[0]_INST_0_i_12
    (
        .O(eabOut[0]_INST_0_i_12_n_0),
        .I0(selEAB1),
        .I1(PC[4]),
        .I2(Ra[4]),
        .I3(selEAB2[1]),
        .I4(selEAB2[0]),
        .I5(IR[4])
    );
    LUT6 eabOut[0]_INST_0_i_13
    (
        .O(eabOut[0]_INST_0_i_13_n_0),
        .I0(selEAB1),
        .I1(PC[3]),
        .I2(Ra[3]),
        .I3(selEAB2[1]),
        .I4(selEAB2[0]),
        .I5(IR[3])
    );
    LUT6 eabOut[0]_INST_0_i_14
    (
        .O(eabOut[0]_INST_0_i_14_n_0),
        .I0(selEAB1),
        .I1(PC[2]),
        .I2(Ra[2]),
        .I3(selEAB2[1]),
        .I4(selEAB2[0]),
        .I5(IR[2])
    );
    LUT6 eabOut[0]_INST_0_i_15
    (
        .O(eabOut[0]_INST_0_i_15_n_0),
        .I0(selEAB1),
        .I1(PC[1]),
        .I2(Ra[1]),
        .I3(selEAB2[1]),
        .I4(selEAB2[0]),
        .I5(IR[1])
    );
    LUT6 eabOut[0]_INST_0_i_16
    (
        .O(eabOut[0]_INST_0_i_16_n_0),
        .I0(selEAB1),
        .I1(PC[0]),
        .I2(Ra[0]),
        .I3(selEAB2[1]),
        .I4(selEAB2[0]),
        .I5(IR[0])
    );
    LUT3 eabOut[0]_INST_0_i_2
    (
        .O(addr1[6]),
        .I0(Ra[6]),
        .I1(PC[6]),
        .I2(selEAB1)
    );
    LUT3 eabOut[0]_INST_0_i_3
    (
        .O(addr1[5]),
        .I0(Ra[5]),
        .I1(PC[5]),
        .I2(selEAB1)
    );
    LUT3 eabOut[0]_INST_0_i_4
    (
        .O(addr1[4]),
        .I0(Ra[4]),
        .I1(PC[4]),
        .I2(selEAB1)
    );
    LUT3 eabOut[0]_INST_0_i_5
    (
        .O(addr1[3]),
        .I0(Ra[3]),
        .I1(PC[3]),
        .I2(selEAB1)
    );
    LUT3 eabOut[0]_INST_0_i_6
    (
        .O(addr1[2]),
        .I0(Ra[2]),
        .I1(PC[2]),
        .I2(selEAB1)
    );
    LUT3 eabOut[0]_INST_0_i_7
    (
        .O(addr1[1]),
        .I0(Ra[1]),
        .I1(PC[1]),
        .I2(selEAB1)
    );
    LUT3 eabOut[0]_INST_0_i_8
    (
        .O(addr1[0]),
        .I0(Ra[0]),
        .I1(PC[0]),
        .I2(selEAB1)
    );
    LUT6 eabOut[0]_INST_0_i_9
    (
        .O(eabOut[0]_INST_0_i_9_n_0),
        .I0(selEAB1),
        .I1(PC[7]),
        .I2(Ra[7]),
        .I3(eabOut[8]_INST_0_i_17_n_0),
        .I4(selEAB2[1]),
        .I5(IR[7])
    );
    CARRY8 eabOut[8]_INST_0
    (
        .CI(eabOut[0]_INST_0_n_0),
        .CI_TOP(GND_2),
        .CO[7:0]({}),
        .O[7:0]({eabOut[15], eabOut[14], eabOut[13], eabOut[12], eabOut[11], eabOut[10], eabOut[9], eabOut[8]}),
        .DI[7:0]({ground, addr1[14], addr1[13], addr1[12], addr1[11], addr1[10], addr1[9], addr1[8]}),
        .S[7:0]({eabOut[8]_INST_0_i_8_n_0, eabOut[8]_INST_0_i_9_n_0, eabOut[8]_INST_0_i_10_n_0, eabOut[8]_INST_0_i_11_n_0, eabOut[8]_INST_0_i_12_n_0, eabOut[8]_INST_0_i_13_n_0, eabOut[8]_INST_0_i_14_n_0, eabOut[8]_INST_0_i_15_n_0})
    );
    LUT3 eabOut[8]_INST_0_i_1
    (
        .O(addr1[14]),
        .I0(Ra[14]),
        .I1(PC[14]),
        .I2(selEAB1)
    );
    LUT4 eabOut[8]_INST_0_i_10
    (
        .O(eabOut[8]_INST_0_i_10_n_0),
        .I0(selEAB1),
        .I1(PC[13]),
        .I2(Ra[13]),
        .I3(p_0_in)
    );
    LUT4 eabOut[8]_INST_0_i_11
    (
        .O(eabOut[8]_INST_0_i_11_n_0),
        .I0(selEAB1),
        .I1(PC[12]),
        .I2(Ra[12]),
        .I3(p_0_in)
    );
    LUT4 eabOut[8]_INST_0_i_12
    (
        .O(eabOut[8]_INST_0_i_12_n_0),
        .I0(selEAB1),
        .I1(PC[11]),
        .I2(Ra[11]),
        .I3(p_0_in)
    );
    LUT4 eabOut[8]_INST_0_i_13
    (
        .O(eabOut[8]_INST_0_i_13_n_0),
        .I0(selEAB1),
        .I1(PC[10]),
        .I2(Ra[10]),
        .I3(p_0_in)
    );
    LUT6 eabOut[8]_INST_0_i_14
    (
        .O(eabOut[8]_INST_0_i_14_n_0),
        .I0(addr1[9]),
        .I1(IR[8]),
        .I2(selEAB2[1]),
        .I3(selEAB2[0]),
        .I4(IR[5]),
        .I5(IR[9])
    );
    LUT6 eabOut[8]_INST_0_i_15
    (
        .O(eabOut[8]_INST_0_i_15_n_0),
        .I0(selEAB1),
        .I1(PC[8]),
        .I2(Ra[8]),
        .I3(eabOut[8]_INST_0_i_17_n_0),
        .I4(selEAB2[1]),
        .I5(IR[8])
    );
    LUT5 eabOut[8]_INST_0_i_16
    (
        .O(p_0_in),
        .I0(IR[10]),
        .I1(IR[5]),
        .I2(selEAB2[0]),
        .I3(selEAB2[1]),
        .I4(IR[8])
    );
    LUT2 eabOut[8]_INST_0_i_17
    (
        .O(eabOut[8]_INST_0_i_17_n_0),
        .I0(selEAB2[0]),
        .I1(IR[5])
    );
    LUT3 eabOut[8]_INST_0_i_2
    (
        .O(addr1[13]),
        .I0(Ra[13]),
        .I1(PC[13]),
        .I2(selEAB1)
    );
    LUT3 eabOut[8]_INST_0_i_3
    (
        .O(addr1[12]),
        .I0(Ra[12]),
        .I1(PC[12]),
        .I2(selEAB1)
    );
    LUT3 eabOut[8]_INST_0_i_4
    (
        .O(addr1[11]),
        .I0(Ra[11]),
        .I1(PC[11]),
        .I2(selEAB1)
    );
    LUT3 eabOut[8]_INST_0_i_5
    (
        .O(addr1[10]),
        .I0(Ra[10]),
        .I1(PC[10]),
        .I2(selEAB1)
    );
    LUT3 eabOut[8]_INST_0_i_6
    (
        .O(addr1[9]),
        .I0(Ra[9]),
        .I1(PC[9]),
        .I2(selEAB1)
    );
    LUT3 eabOut[8]_INST_0_i_7
    (
        .O(addr1[8]),
        .I0(Ra[8]),
        .I1(PC[8]),
        .I2(selEAB1)
    );
    LUT4 eabOut[8]_INST_0_i_8
    (
        .O(eabOut[8]_INST_0_i_8_n_0),
        .I0(selEAB1),
        .I1(PC[15]),
        .I2(Ra[15]),
        .I3(p_0_in)
    );
    LUT4 eabOut[8]_INST_0_i_9
    (
        .O(eabOut[8]_INST_0_i_9_n_0),
        .I0(selEAB1),
        .I1(PC[14]),
        .I2(Ra[14]),
        .I3(p_0_in)
    );
endmodule

module IR
(
    clk,
    ldIR,
    reset,
    .Buss[15:0]({Buss[15], Buss[14], Buss[13], Buss[12], Buss[11], Buss[10], Buss[9], Buss[8], Buss[7], Buss[6], Buss[5], Buss[4], Buss[3], Buss[2], Buss[1], Buss[0]}),
    .IR[15:0]({IR[15], IR[14], IR[13], IR[12], IR[11], IR[10], IR[9], IR[8], IR[7], IR[6], IR[5], IR[4], IR[3], IR[2], IR[1], IR[0]})
);

    input clk;
    input ldIR;
    input reset;
    input [15:0]Buss;
    output [15:0]IR;

    wire [15:0]Buss;
    wire [15:0]IR;
    wire clk;
    wire ldIR;
    wire reset;

    FDRE IR_reg[0]
    (
        .Q(IR[0]),
        .C(clk),
        .CE(ldIR),
        .D(Buss[0]),
        .R(reset)
    );
    FDRE IR_reg[10]
    (
        .Q(IR[10]),
        .C(clk),
        .CE(ldIR),
        .D(Buss[10]),
        .R(reset)
    );
    FDRE IR_reg[11]
    (
        .Q(IR[11]),
        .C(clk),
        .CE(ldIR),
        .D(Buss[11]),
        .R(reset)
    );
    FDRE IR_reg[12]
    (
        .Q(IR[12]),
        .C(clk),
        .CE(ldIR),
        .D(Buss[12]),
        .R(reset)
    );
    FDRE IR_reg[13]
    (
        .Q(IR[13]),
        .C(clk),
        .CE(ldIR),
        .D(Buss[13]),
        .R(reset)
    );
    FDRE IR_reg[14]
    (
        .Q(IR[14]),
        .C(clk),
        .CE(ldIR),
        .D(Buss[14]),
        .R(reset)
    );
    FDRE IR_reg[15]
    (
        .Q(IR[15]),
        .C(clk),
        .CE(ldIR),
        .D(Buss[15]),
        .R(reset)
    );
    FDRE IR_reg[1]
    (
        .Q(IR[1]),
        .C(clk),
        .CE(ldIR),
        .D(Buss[1]),
        .R(reset)
    );
    FDRE IR_reg[2]
    (
        .Q(IR[2]),
        .C(clk),
        .CE(ldIR),
        .D(Buss[2]),
        .R(reset)
    );
    FDRE IR_reg[3]
    (
        .Q(IR[3]),
        .C(clk),
        .CE(ldIR),
        .D(Buss[3]),
        .R(reset)
    );
    FDRE IR_reg[4]
    (
        .Q(IR[4]),
        .C(clk),
        .CE(ldIR),
        .D(Buss[4]),
        .R(reset)
    );
    FDRE IR_reg[5]
    (
        .Q(IR[5]),
        .C(clk),
        .CE(ldIR),
        .D(Buss[5]),
        .R(reset)
    );
    FDRE IR_reg[6]
    (
        .Q(IR[6]),
        .C(clk),
        .CE(ldIR),
        .D(Buss[6]),
        .R(reset)
    );
    FDRE IR_reg[7]
    (
        .Q(IR[7]),
        .C(clk),
        .CE(ldIR),
        .D(Buss[7]),
        .R(reset)
    );
    FDRE IR_reg[8]
    (
        .Q(IR[8]),
        .C(clk),
        .CE(ldIR),
        .D(Buss[8]),
        .R(reset)
    );
    FDRE IR_reg[9]
    (
        .Q(IR[9]),
        .C(clk),
        .CE(ldIR),
        .D(Buss[9]),
        .R(reset)
    );
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

module MARMux
(
    selMAR,
    .IR[7:0]({IR[7], IR[6], IR[5], IR[4], IR[3], IR[2], IR[1], IR[0]}),
    .MARMuxOut[15:0]({MARMuxOut[15], MARMuxOut[14], MARMuxOut[13], MARMuxOut[12], MARMuxOut[11], MARMuxOut[10], MARMuxOut[9], MARMuxOut[8], MARMuxOut[7], MARMuxOut[6], MARMuxOut[5], MARMuxOut[4], MARMuxOut[3], MARMuxOut[2], MARMuxOut[1], MARMuxOut[0]}),
    .eabOut[15:0]({eabOut[15], eabOut[14], eabOut[13], eabOut[12], eabOut[11], eabOut[10], eabOut[9], eabOut[8], eabOut[7], eabOut[6], eabOut[5], eabOut[4], eabOut[3], eabOut[2], eabOut[1], eabOut[0]})
);

    input selMAR;
    input [7:0]IR;
    output [15:0]MARMuxOut;
    input [15:0]eabOut;

    wire [7:0]IR;
    wire [15:0]MARMuxOut;
    wire [15:0]eabOut;
    wire selMAR;

    LUT3 MARMuxOut[0]_INST_0
    (
        .O(MARMuxOut[0]),
        .I0(IR[0]),
        .I1(eabOut[0]),
        .I2(selMAR)
    );
    LUT2 MARMuxOut[10]_INST_0
    (
        .O(MARMuxOut[10]),
        .I0(eabOut[10]),
        .I1(selMAR)
    );
    LUT2 MARMuxOut[11]_INST_0
    (
        .O(MARMuxOut[11]),
        .I0(eabOut[11]),
        .I1(selMAR)
    );
    LUT2 MARMuxOut[12]_INST_0
    (
        .O(MARMuxOut[12]),
        .I0(eabOut[12]),
        .I1(selMAR)
    );
    LUT2 MARMuxOut[13]_INST_0
    (
        .O(MARMuxOut[13]),
        .I0(eabOut[13]),
        .I1(selMAR)
    );
    LUT2 MARMuxOut[14]_INST_0
    (
        .O(MARMuxOut[14]),
        .I0(eabOut[14]),
        .I1(selMAR)
    );
    LUT2 MARMuxOut[15]_INST_0
    (
        .O(MARMuxOut[15]),
        .I0(eabOut[15]),
        .I1(selMAR)
    );
    LUT3 MARMuxOut[1]_INST_0
    (
        .O(MARMuxOut[1]),
        .I0(IR[1]),
        .I1(eabOut[1]),
        .I2(selMAR)
    );
    LUT3 MARMuxOut[2]_INST_0
    (
        .O(MARMuxOut[2]),
        .I0(IR[2]),
        .I1(eabOut[2]),
        .I2(selMAR)
    );
    LUT3 MARMuxOut[3]_INST_0
    (
        .O(MARMuxOut[3]),
        .I0(IR[3]),
        .I1(eabOut[3]),
        .I2(selMAR)
    );
    LUT3 MARMuxOut[4]_INST_0
    (
        .O(MARMuxOut[4]),
        .I0(IR[4]),
        .I1(eabOut[4]),
        .I2(selMAR)
    );
    LUT3 MARMuxOut[5]_INST_0
    (
        .O(MARMuxOut[5]),
        .I0(IR[5]),
        .I1(eabOut[5]),
        .I2(selMAR)
    );
    LUT3 MARMuxOut[6]_INST_0
    (
        .O(MARMuxOut[6]),
        .I0(IR[6]),
        .I1(eabOut[6]),
        .I2(selMAR)
    );
    LUT3 MARMuxOut[7]_INST_0
    (
        .O(MARMuxOut[7]),
        .I0(IR[7]),
        .I1(eabOut[7]),
        .I2(selMAR)
    );
    LUT2 MARMuxOut[8]_INST_0
    (
        .O(MARMuxOut[8]),
        .I0(eabOut[8]),
        .I1(selMAR)
    );
    LUT2 MARMuxOut[9]_INST_0
    (
        .O(MARMuxOut[9]),
        .I0(eabOut[9]),
        .I1(selMAR)
    );
endmodule

module Memory
(
    clk,
    ldMAR,
    ldMDR,
    memWE,
    reset,
    selMDR,
    .Buss[15:0]({Buss[15], Buss[14], Buss[13], Buss[12], Buss[11], Buss[10], Buss[9], Buss[8], Buss[7], Buss[6], Buss[5], Buss[4], Buss[3], Buss[2], Buss[1], Buss[0]}),
    .mdrOut[15:0]({mdrOut[15], mdrOut[14], mdrOut[13], mdrOut[12], mdrOut[11], mdrOut[10], mdrOut[9], mdrOut[8], mdrOut[7], mdrOut[6], mdrOut[5], mdrOut[4], mdrOut[3], mdrOut[2], mdrOut[1], mdrOut[0]})
);

    input clk;
    input ldMAR;
    input ldMDR;
    input memWE;
    input reset;
    input selMDR;
    input [15:0]Buss;
    output [15:0]mdrOut;

    wire ground;
    wire [15:0]Buss;
    wire [7:0]MARReg;
    wire clk;
    wire ldMAR;
    wire ldMDR;
    wire [15:0]mdrOut;
    wire [15:0]memOut;
    wire memWE;
    wire reset;
    wire selMDR;

    GND GND
    (
        .G(ground)
    );
    MAR MAR0
    (
        .clk(clk),
        .ldMAR(ldMAR),
        .reset(reset),
        .Buss[15:0]({ground, ground, ground, ground, ground, ground, ground, ground, Buss[7], Buss[6], Buss[5], Buss[4], Buss[3], Buss[2], Buss[1], Buss[0]}),
        .MAR[15:0]({})
    );
    MDR MDR0
    (
        .clk(clk),
        .ldMDR(ldMDR),
        .reset(reset),
        .selMDR(selMDR),
        .Buss[15:0]({Buss[15], Buss[14], Buss[13], Buss[12], Buss[11], Buss[10], Buss[9], Buss[8], Buss[7], Buss[6], Buss[5], Buss[4], Buss[3], Buss[2], Buss[1], Buss[0]}),
        .MDR[15:0]({mdrOut[15], mdrOut[14], mdrOut[13], mdrOut[12], mdrOut[11], mdrOut[10], mdrOut[9], mdrOut[8], mdrOut[7], mdrOut[6], mdrOut[5], mdrOut[4], mdrOut[3], mdrOut[2], mdrOut[1], mdrOut[0]}),
        .memOut[15:0]({memOut[15], memOut[14], memOut[13], memOut[12], memOut[11], memOut[10], memOut[9], memOut[8], memOut[7], memOut[6], memOut[5], memOut[4], memOut[3], memOut[2], memOut[1], memOut[0]})
    );
    RAM256X1S my_memory_reg_0_255_0_0
    (
        .O(memOut[0]),
        .D(mdrOut[0]),
        .WCLK(clk),
        .WE(memWE),
        .A[7:0]({MARReg[7], MARReg[6], MARReg[5], MARReg[4], MARReg[3], MARReg[2], MARReg[1], MARReg[0]})
    );
    RAM256X1S my_memory_reg_0_255_10_10
    (
        .O(memOut[10]),
        .D(mdrOut[10]),
        .WCLK(clk),
        .WE(memWE),
        .A[7:0]({MARReg[7], MARReg[6], MARReg[5], MARReg[4], MARReg[3], MARReg[2], MARReg[1], MARReg[0]})
    );
    RAM256X1S my_memory_reg_0_255_11_11
    (
        .O(memOut[11]),
        .D(mdrOut[11]),
        .WCLK(clk),
        .WE(memWE),
        .A[7:0]({MARReg[7], MARReg[6], MARReg[5], MARReg[4], MARReg[3], MARReg[2], MARReg[1], MARReg[0]})
    );
    RAM256X1S my_memory_reg_0_255_12_12
    (
        .O(memOut[12]),
        .D(mdrOut[12]),
        .WCLK(clk),
        .WE(memWE),
        .A[7:0]({MARReg[7], MARReg[6], MARReg[5], MARReg[4], MARReg[3], MARReg[2], MARReg[1], MARReg[0]})
    );
    RAM256X1S my_memory_reg_0_255_13_13
    (
        .O(memOut[13]),
        .D(mdrOut[13]),
        .WCLK(clk),
        .WE(memWE),
        .A[7:0]({MARReg[7], MARReg[6], MARReg[5], MARReg[4], MARReg[3], MARReg[2], MARReg[1], MARReg[0]})
    );
    RAM256X1S my_memory_reg_0_255_14_14
    (
        .O(memOut[14]),
        .D(mdrOut[14]),
        .WCLK(clk),
        .WE(memWE),
        .A[7:0]({MARReg[7], MARReg[6], MARReg[5], MARReg[4], MARReg[3], MARReg[2], MARReg[1], MARReg[0]})
    );
    RAM256X1S my_memory_reg_0_255_15_15
    (
        .O(memOut[15]),
        .D(mdrOut[15]),
        .WCLK(clk),
        .WE(memWE),
        .A[7:0]({MARReg[7], MARReg[6], MARReg[5], MARReg[4], MARReg[3], MARReg[2], MARReg[1], MARReg[0]})
    );
    RAM256X1S my_memory_reg_0_255_1_1
    (
        .O(memOut[1]),
        .D(mdrOut[1]),
        .WCLK(clk),
        .WE(memWE),
        .A[7:0]({MARReg[7], MARReg[6], MARReg[5], MARReg[4], MARReg[3], MARReg[2], MARReg[1], MARReg[0]})
    );
    RAM256X1S my_memory_reg_0_255_2_2
    (
        .O(memOut[2]),
        .D(mdrOut[2]),
        .WCLK(clk),
        .WE(memWE),
        .A[7:0]({MARReg[7], MARReg[6], MARReg[5], MARReg[4], MARReg[3], MARReg[2], MARReg[1], MARReg[0]})
    );
    RAM256X1S my_memory_reg_0_255_3_3
    (
        .O(memOut[3]),
        .D(mdrOut[3]),
        .WCLK(clk),
        .WE(memWE),
        .A[7:0]({MARReg[7], MARReg[6], MARReg[5], MARReg[4], MARReg[3], MARReg[2], MARReg[1], MARReg[0]})
    );
    RAM256X1S my_memory_reg_0_255_4_4
    (
        .O(memOut[4]),
        .D(mdrOut[4]),
        .WCLK(clk),
        .WE(memWE),
        .A[7:0]({MARReg[7], MARReg[6], MARReg[5], MARReg[4], MARReg[3], MARReg[2], MARReg[1], MARReg[0]})
    );
    RAM256X1S my_memory_reg_0_255_5_5
    (
        .O(memOut[5]),
        .D(mdrOut[5]),
        .WCLK(clk),
        .WE(memWE),
        .A[7:0]({MARReg[7], MARReg[6], MARReg[5], MARReg[4], MARReg[3], MARReg[2], MARReg[1], MARReg[0]})
    );
    RAM256X1S my_memory_reg_0_255_6_6
    (
        .O(memOut[6]),
        .D(mdrOut[6]),
        .WCLK(clk),
        .WE(memWE),
        .A[7:0]({MARReg[7], MARReg[6], MARReg[5], MARReg[4], MARReg[3], MARReg[2], MARReg[1], MARReg[0]})
    );
    RAM256X1S my_memory_reg_0_255_7_7
    (
        .O(memOut[7]),
        .D(mdrOut[7]),
        .WCLK(clk),
        .WE(memWE),
        .A[7:0]({MARReg[7], MARReg[6], MARReg[5], MARReg[4], MARReg[3], MARReg[2], MARReg[1], MARReg[0]})
    );
    RAM256X1S my_memory_reg_0_255_8_8
    (
        .O(memOut[8]),
        .D(mdrOut[8]),
        .WCLK(clk),
        .WE(memWE),
        .A[7:0]({MARReg[7], MARReg[6], MARReg[5], MARReg[4], MARReg[3], MARReg[2], MARReg[1], MARReg[0]})
    );
    RAM256X1S my_memory_reg_0_255_9_9
    (
        .O(memOut[9]),
        .D(mdrOut[9]),
        .WCLK(clk),
        .WE(memWE),
        .A[7:0]({MARReg[7], MARReg[6], MARReg[5], MARReg[4], MARReg[3], MARReg[2], MARReg[1], MARReg[0]})
    );
endmodule

module NZP
(
    N,
    P,
    Z,
    clk,
    flagWE,
    reset,
    .Buss[15:0]({Buss[15], Buss[14], Buss[13], Buss[12], Buss[11], Buss[10], Buss[9], Buss[8], Buss[7], Buss[6], Buss[5], Buss[4], Buss[3], Buss[2], Buss[1], Buss[0]})
);

    output N;
    output P;
    output Z;
    input clk;
    input flagWE;
    input reset;
    input [15:0]Buss;

    wire [15:0]Buss;
    wire N;
    wire P;
    wire P_i_1_n_0;
    wire Z;
    wire Z_i_2_n_0;
    wire Z_i_3_n_0;
    wire Z_i_4_n_0;
    wire Z_i_5_n_0;
    wire clk;
    wire flagWE;
    wire p_0_in;
    wire reset;

    FDRE N_reg
    (
        .Q(N),
        .C(clk),
        .CE(flagWE),
        .D(Buss[15]),
        .R(reset)
    );
    LUT5 P_i_1
    (
        .O(P_i_1_n_0),
        .I0(Z_i_2_n_0),
        .I1(Z_i_3_n_0),
        .I2(Z_i_4_n_0),
        .I3(Z_i_5_n_0),
        .I4(Buss[15])
    );
    FDRE P_reg
    (
        .Q(P),
        .C(clk),
        .CE(flagWE),
        .D(P_i_1_n_0),
        .R(reset)
    );
    LUT4 Z_i_1
    (
        .O(p_0_in),
        .I0(Z_i_2_n_0),
        .I1(Z_i_3_n_0),
        .I2(Z_i_4_n_0),
        .I3(Z_i_5_n_0)
    );
    LUT4 Z_i_2
    (
        .O(Z_i_2_n_0),
        .I0(Buss[14]),
        .I1(Buss[15]),
        .I2(Buss[13]),
        .I3(Buss[12])
    );
    LUT4 Z_i_3
    (
        .O(Z_i_3_n_0),
        .I0(Buss[9]),
        .I1(Buss[8]),
        .I2(Buss[11]),
        .I3(Buss[10])
    );
    LUT4 Z_i_4
    (
        .O(Z_i_4_n_0),
        .I0(Buss[7]),
        .I1(Buss[6]),
        .I2(Buss[5]),
        .I3(Buss[4])
    );
    LUT4 Z_i_5
    (
        .O(Z_i_5_n_0),
        .I0(Buss[1]),
        .I1(Buss[0]),
        .I2(Buss[3]),
        .I3(Buss[2])
    );
    FDRE Z_reg
    (
        .Q(Z),
        .C(clk),
        .CE(flagWE),
        .D(p_0_in),
        .R(reset)
    );
endmodule

module PC
(
    clk,
    ldPC,
    reset,
    .Buss[15:0]({Buss[15], Buss[14], Buss[13], Buss[12], Buss[11], Buss[10], Buss[9], Buss[8], Buss[7], Buss[6], Buss[5], Buss[4], Buss[3], Buss[2], Buss[1], Buss[0]}),
    .PC[15:0]({PC[15], PC[14], PC[13], PC[12], PC[11], PC[10], PC[9], PC[8], PC[7], PC[6], PC[5], PC[4], PC[3], PC[2], PC[1], PC[0]}),
    .eabOut[15:0]({eabOut[15], eabOut[14], eabOut[13], eabOut[12], eabOut[11], eabOut[10], eabOut[9], eabOut[8], eabOut[7], eabOut[6], eabOut[5], eabOut[4], eabOut[3], eabOut[2], eabOut[1], eabOut[0]}),
    .selPC[1:0]({selPC[1], selPC[0]})
);

    input clk;
    input ldPC;
    input reset;
    input [15:0]Buss;
    output [15:0]PC;
    input [15:0]eabOut;
    input [1:0]selPC;

    wire [15:0]Buss;
    wire [15:0]PC;
    wire PC[0]_i_2_n_0;
    wire PC[10]_i_2_n_0;
    wire PC[10]_i_3_n_0;
    wire PC[11]_i_2_n_0;
    wire PC[11]_i_3_n_0;
    wire PC[12]_i_2_n_0;
    wire PC[12]_i_3_n_0;
    wire PC[13]_i_2_n_0;
    wire PC[13]_i_3_n_0;
    wire PC[14]_i_2_n_0;
    wire PC[14]_i_3_n_0;
    wire PC[15]_i_2_n_0;
    wire PC[15]_i_3_n_0;
    wire PC[1]_i_2_n_0;
    wire PC[2]_i_2_n_0;
    wire PC[2]_i_3_n_0;
    wire PC[3]_i_2_n_0;
    wire PC[3]_i_3_n_0;
    wire PC[4]_i_2_n_0;
    wire PC[4]_i_3_n_0;
    wire PC[5]_i_2_n_0;
    wire PC[5]_i_3_n_0;
    wire PC[6]_i_2_n_0;
    wire PC[6]_i_3_n_0;
    wire PC[7]_i_2_n_0;
    wire PC[7]_i_3_n_0;
    wire PC[8]_i_2_n_0;
    wire PC[8]_i_3_n_0;
    wire PC[9]_i_2_n_0;
    wire PC[9]_i_3_n_0;
    wire clk;
    wire [15:0]eabOut;
    wire ldPC;
    wire [15:0]p_0_in;
    wire reset;
    wire [1:0]selPC;

    LUT6 PC[0]_i_1
    (
        .O(p_0_in[0]),
        .I0(eabOut[0]),
        .I1(PC[0]_i_2_n_0),
        .I2(PC[0]),
        .I3(Buss[0]),
        .I4(selPC[1]),
        .I5(selPC[0])
    );
    LUT4 PC[0]_i_2
    (
        .O(PC[0]_i_2_n_0),
        .I0(selPC[0]),
        .I1(eabOut[0]),
        .I2(selPC[1]),
        .I3(PC[0]_i_2_n_0)
    );
    LUT6 PC[10]_i_1
    (
        .O(p_0_in[10]),
        .I0(PC[10]),
        .I1(PC[10]_i_2_n_0),
        .I2(PC[10]_i_3_n_0),
        .I3(selPC[0]),
        .I4(selPC[1]),
        .I5(Buss[10])
    );
    LUT5 PC[10]_i_2
    (
        .O(PC[10]_i_2_n_0),
        .I0(PC[8]),
        .I1(PC[6]),
        .I2(PC[6]_i_2_n_0),
        .I3(PC[7]),
        .I4(PC[9])
    );
    LUT4 PC[10]_i_3
    (
        .O(PC[10]_i_3_n_0),
        .I0(selPC[0]),
        .I1(eabOut[10]),
        .I2(selPC[1]),
        .I3(PC[10]_i_3_n_0)
    );
    LUT6 PC[11]_i_1
    (
        .O(p_0_in[11]),
        .I0(PC[11]),
        .I1(PC[11]_i_2_n_0),
        .I2(PC[11]_i_3_n_0),
        .I3(selPC[0]),
        .I4(selPC[1]),
        .I5(Buss[11])
    );
    LUT6 PC[11]_i_2
    (
        .O(PC[11]_i_2_n_0),
        .I0(PC[9]),
        .I1(PC[7]),
        .I2(PC[6]_i_2_n_0),
        .I3(PC[6]),
        .I4(PC[8]),
        .I5(PC[10])
    );
    LUT4 PC[11]_i_3
    (
        .O(PC[11]_i_3_n_0),
        .I0(selPC[0]),
        .I1(eabOut[11]),
        .I2(selPC[1]),
        .I3(PC[11]_i_3_n_0)
    );
    LUT6 PC[12]_i_1
    (
        .O(p_0_in[12]),
        .I0(PC[12]),
        .I1(PC[12]_i_2_n_0),
        .I2(PC[12]_i_3_n_0),
        .I3(selPC[0]),
        .I4(selPC[1]),
        .I5(Buss[12])
    );
    LUT2 PC[12]_i_2
    (
        .O(PC[12]_i_2_n_0),
        .I0(PC[11]_i_2_n_0),
        .I1(PC[11])
    );
    LUT4 PC[12]_i_3
    (
        .O(PC[12]_i_3_n_0),
        .I0(selPC[0]),
        .I1(eabOut[12]),
        .I2(selPC[1]),
        .I3(PC[12]_i_3_n_0)
    );
    LUT6 PC[13]_i_1
    (
        .O(p_0_in[13]),
        .I0(PC[13]),
        .I1(PC[13]_i_2_n_0),
        .I2(PC[13]_i_3_n_0),
        .I3(selPC[0]),
        .I4(selPC[1]),
        .I5(Buss[13])
    );
    LUT3 PC[13]_i_2
    (
        .O(PC[13]_i_2_n_0),
        .I0(PC[11]),
        .I1(PC[11]_i_2_n_0),
        .I2(PC[12])
    );
    LUT4 PC[13]_i_3
    (
        .O(PC[13]_i_3_n_0),
        .I0(selPC[0]),
        .I1(eabOut[13]),
        .I2(selPC[1]),
        .I3(PC[13]_i_3_n_0)
    );
    LUT6 PC[14]_i_1
    (
        .O(p_0_in[14]),
        .I0(PC[14]),
        .I1(PC[14]_i_2_n_0),
        .I2(PC[14]_i_3_n_0),
        .I3(selPC[0]),
        .I4(selPC[1]),
        .I5(Buss[14])
    );
    LUT4 PC[14]_i_2
    (
        .O(PC[14]_i_2_n_0),
        .I0(PC[12]),
        .I1(PC[11]_i_2_n_0),
        .I2(PC[11]),
        .I3(PC[13])
    );
    LUT4 PC[14]_i_3
    (
        .O(PC[14]_i_3_n_0),
        .I0(selPC[0]),
        .I1(eabOut[14]),
        .I2(selPC[1]),
        .I3(PC[14]_i_3_n_0)
    );
    LUT6 PC[15]_i_1
    (
        .O(p_0_in[15]),
        .I0(PC[15]),
        .I1(PC[15]_i_2_n_0),
        .I2(PC[15]_i_3_n_0),
        .I3(selPC[0]),
        .I4(selPC[1]),
        .I5(Buss[15])
    );
    LUT5 PC[15]_i_2
    (
        .O(PC[15]_i_2_n_0),
        .I0(PC[13]),
        .I1(PC[11]),
        .I2(PC[11]_i_2_n_0),
        .I3(PC[12]),
        .I4(PC[14])
    );
    LUT4 PC[15]_i_3
    (
        .O(PC[15]_i_3_n_0),
        .I0(selPC[0]),
        .I1(eabOut[15]),
        .I2(selPC[1]),
        .I3(PC[15]_i_3_n_0)
    );
    LUT6 PC[1]_i_1
    (
        .O(p_0_in[1]),
        .I0(Buss[1]),
        .I1(PC[1]_i_2_n_0),
        .I2(PC[1]),
        .I3(PC[0]),
        .I4(selPC[1]),
        .I5(selPC[0])
    );
    LUT4 PC[1]_i_2
    (
        .O(PC[1]_i_2_n_0),
        .I0(selPC[0]),
        .I1(eabOut[1]),
        .I2(selPC[1]),
        .I3(PC[1]_i_2_n_0)
    );
    LUT6 PC[2]_i_1
    (
        .O(p_0_in[2]),
        .I0(PC[2]),
        .I1(PC[2]_i_2_n_0),
        .I2(PC[2]_i_3_n_0),
        .I3(selPC[0]),
        .I4(selPC[1]),
        .I5(Buss[2])
    );
    LUT2 PC[2]_i_2
    (
        .O(PC[2]_i_2_n_0),
        .I0(PC[0]),
        .I1(PC[1])
    );
    LUT4 PC[2]_i_3
    (
        .O(PC[2]_i_3_n_0),
        .I0(selPC[0]),
        .I1(eabOut[2]),
        .I2(selPC[1]),
        .I3(PC[2]_i_3_n_0)
    );
    LUT6 PC[3]_i_1
    (
        .O(p_0_in[3]),
        .I0(PC[3]),
        .I1(PC[3]_i_2_n_0),
        .I2(PC[3]_i_3_n_0),
        .I3(selPC[0]),
        .I4(selPC[1]),
        .I5(Buss[3])
    );
    LUT3 PC[3]_i_2
    (
        .O(PC[3]_i_2_n_0),
        .I0(PC[1]),
        .I1(PC[0]),
        .I2(PC[2])
    );
    LUT4 PC[3]_i_3
    (
        .O(PC[3]_i_3_n_0),
        .I0(selPC[0]),
        .I1(eabOut[3]),
        .I2(selPC[1]),
        .I3(PC[3]_i_3_n_0)
    );
    LUT6 PC[4]_i_1
    (
        .O(p_0_in[4]),
        .I0(PC[4]),
        .I1(PC[4]_i_2_n_0),
        .I2(PC[4]_i_3_n_0),
        .I3(selPC[0]),
        .I4(selPC[1]),
        .I5(Buss[4])
    );
    LUT4 PC[4]_i_2
    (
        .O(PC[4]_i_2_n_0),
        .I0(PC[2]),
        .I1(PC[0]),
        .I2(PC[1]),
        .I3(PC[3])
    );
    LUT4 PC[4]_i_3
    (
        .O(PC[4]_i_3_n_0),
        .I0(selPC[0]),
        .I1(eabOut[4]),
        .I2(selPC[1]),
        .I3(PC[4]_i_3_n_0)
    );
    LUT6 PC[5]_i_1
    (
        .O(p_0_in[5]),
        .I0(PC[5]),
        .I1(PC[5]_i_2_n_0),
        .I2(PC[5]_i_3_n_0),
        .I3(selPC[0]),
        .I4(selPC[1]),
        .I5(Buss[5])
    );
    LUT5 PC[5]_i_2
    (
        .O(PC[5]_i_2_n_0),
        .I0(PC[3]),
        .I1(PC[1]),
        .I2(PC[0]),
        .I3(PC[2]),
        .I4(PC[4])
    );
    LUT4 PC[5]_i_3
    (
        .O(PC[5]_i_3_n_0),
        .I0(selPC[0]),
        .I1(eabOut[5]),
        .I2(selPC[1]),
        .I3(PC[5]_i_3_n_0)
    );
    LUT6 PC[6]_i_1
    (
        .O(p_0_in[6]),
        .I0(PC[6]),
        .I1(PC[6]_i_2_n_0),
        .I2(PC[6]_i_3_n_0),
        .I3(selPC[0]),
        .I4(selPC[1]),
        .I5(Buss[6])
    );
    LUT6 PC[6]_i_2
    (
        .O(PC[6]_i_2_n_0),
        .I0(PC[4]),
        .I1(PC[2]),
        .I2(PC[0]),
        .I3(PC[1]),
        .I4(PC[3]),
        .I5(PC[5])
    );
    LUT4 PC[6]_i_3
    (
        .O(PC[6]_i_3_n_0),
        .I0(selPC[0]),
        .I1(eabOut[6]),
        .I2(selPC[1]),
        .I3(PC[6]_i_3_n_0)
    );
    LUT6 PC[7]_i_1
    (
        .O(p_0_in[7]),
        .I0(PC[7]),
        .I1(PC[7]_i_2_n_0),
        .I2(PC[7]_i_3_n_0),
        .I3(selPC[0]),
        .I4(selPC[1]),
        .I5(Buss[7])
    );
    LUT2 PC[7]_i_2
    (
        .O(PC[7]_i_2_n_0),
        .I0(PC[6]_i_2_n_0),
        .I1(PC[6])
    );
    LUT4 PC[7]_i_3
    (
        .O(PC[7]_i_3_n_0),
        .I0(selPC[0]),
        .I1(eabOut[7]),
        .I2(selPC[1]),
        .I3(PC[7]_i_3_n_0)
    );
    LUT6 PC[8]_i_1
    (
        .O(p_0_in[8]),
        .I0(PC[8]),
        .I1(PC[8]_i_2_n_0),
        .I2(PC[8]_i_3_n_0),
        .I3(selPC[0]),
        .I4(selPC[1]),
        .I5(Buss[8])
    );
    LUT3 PC[8]_i_2
    (
        .O(PC[8]_i_2_n_0),
        .I0(PC[6]),
        .I1(PC[6]_i_2_n_0),
        .I2(PC[7])
    );
    LUT4 PC[8]_i_3
    (
        .O(PC[8]_i_3_n_0),
        .I0(selPC[0]),
        .I1(eabOut[8]),
        .I2(selPC[1]),
        .I3(PC[8]_i_3_n_0)
    );
    LUT6 PC[9]_i_1
    (
        .O(p_0_in[9]),
        .I0(PC[9]),
        .I1(PC[9]_i_2_n_0),
        .I2(PC[9]_i_3_n_0),
        .I3(selPC[0]),
        .I4(selPC[1]),
        .I5(Buss[9])
    );
    LUT4 PC[9]_i_2
    (
        .O(PC[9]_i_2_n_0),
        .I0(PC[7]),
        .I1(PC[6]_i_2_n_0),
        .I2(PC[6]),
        .I3(PC[8])
    );
    LUT4 PC[9]_i_3
    (
        .O(PC[9]_i_3_n_0),
        .I0(selPC[0]),
        .I1(eabOut[9]),
        .I2(selPC[1]),
        .I3(PC[9]_i_3_n_0)
    );
    FDRE PC_reg[0]
    (
        .Q(PC[0]),
        .C(clk),
        .CE(ldPC),
        .D(p_0_in[0]),
        .R(reset)
    );
    FDRE PC_reg[10]
    (
        .Q(PC[10]),
        .C(clk),
        .CE(ldPC),
        .D(p_0_in[10]),
        .R(reset)
    );
    FDRE PC_reg[11]
    (
        .Q(PC[11]),
        .C(clk),
        .CE(ldPC),
        .D(p_0_in[11]),
        .R(reset)
    );
    FDRE PC_reg[12]
    (
        .Q(PC[12]),
        .C(clk),
        .CE(ldPC),
        .D(p_0_in[12]),
        .R(reset)
    );
    FDRE PC_reg[13]
    (
        .Q(PC[13]),
        .C(clk),
        .CE(ldPC),
        .D(p_0_in[13]),
        .R(reset)
    );
    FDRE PC_reg[14]
    (
        .Q(PC[14]),
        .C(clk),
        .CE(ldPC),
        .D(p_0_in[14]),
        .R(reset)
    );
    FDRE PC_reg[15]
    (
        .Q(PC[15]),
        .C(clk),
        .CE(ldPC),
        .D(p_0_in[15]),
        .R(reset)
    );
    FDRE PC_reg[1]
    (
        .Q(PC[1]),
        .C(clk),
        .CE(ldPC),
        .D(p_0_in[1]),
        .R(reset)
    );
    FDRE PC_reg[2]
    (
        .Q(PC[2]),
        .C(clk),
        .CE(ldPC),
        .D(p_0_in[2]),
        .R(reset)
    );
    FDRE PC_reg[3]
    (
        .Q(PC[3]),
        .C(clk),
        .CE(ldPC),
        .D(p_0_in[3]),
        .R(reset)
    );
    FDRE PC_reg[4]
    (
        .Q(PC[4]),
        .C(clk),
        .CE(ldPC),
        .D(p_0_in[4]),
        .R(reset)
    );
    FDRE PC_reg[5]
    (
        .Q(PC[5]),
        .C(clk),
        .CE(ldPC),
        .D(p_0_in[5]),
        .R(reset)
    );
    FDRE PC_reg[6]
    (
        .Q(PC[6]),
        .C(clk),
        .CE(ldPC),
        .D(p_0_in[6]),
        .R(reset)
    );
    FDRE PC_reg[7]
    (
        .Q(PC[7]),
        .C(clk),
        .CE(ldPC),
        .D(p_0_in[7]),
        .R(reset)
    );
    FDRE PC_reg[8]
    (
        .Q(PC[8]),
        .C(clk),
        .CE(ldPC),
        .D(p_0_in[8]),
        .R(reset)
    );
    FDRE PC_reg[9]
    (
        .Q(PC[9]),
        .C(clk),
        .CE(ldPC),
        .D(p_0_in[9]),
        .R(reset)
    );
endmodule

module RegFile
(
    clk,
    regWE,
    reset,
    .Buss[15:0]({Buss[15], Buss[14], Buss[13], Buss[12], Buss[11], Buss[10], Buss[9], Buss[8], Buss[7], Buss[6], Buss[5], Buss[4], Buss[3], Buss[2], Buss[1], Buss[0]}),
    .DR[2:0]({DR[2], DR[1], DR[0]}),
    .Ra[15:0]({Ra[15], Ra[14], Ra[13], Ra[12], Ra[11], Ra[10], Ra[9], Ra[8], Ra[7], Ra[6], Ra[5], Ra[4], Ra[3], Ra[2], Ra[1], Ra[0]}),
    .Rb[15:0]({Rb[15], Rb[14], Rb[13], Rb[12], Rb[11], Rb[10], Rb[9], Rb[8], Rb[7], Rb[6], Rb[5], Rb[4], Rb[3], Rb[2], Rb[1], Rb[0]}),
    .SR1[2:0]({SR1[2], SR1[1], SR1[0]}),
    .SR2[2:0]({SR2[2], SR2[1], SR2[0]})
);

    input clk;
    input regWE;
    input reset;
    input [15:0]Buss;
    input [2:0]DR;
    output [15:0]Ra;
    output [15:0]Rb;
    input [2:0]SR1;
    input [2:0]SR2;

    wire [15:0]Buss;
    wire [2:0]DR;
    wire [15:0]Ra;
    wire Ra[0]_INST_0_i_1_n_0;
    wire Ra[0]_INST_0_i_2_n_0;
    wire Ra[10]_INST_0_i_1_n_0;
    wire Ra[10]_INST_0_i_2_n_0;
    wire Ra[11]_INST_0_i_1_n_0;
    wire Ra[11]_INST_0_i_2_n_0;
    wire Ra[12]_INST_0_i_1_n_0;
    wire Ra[12]_INST_0_i_2_n_0;
    wire Ra[13]_INST_0_i_1_n_0;
    wire Ra[13]_INST_0_i_2_n_0;
    wire Ra[14]_INST_0_i_1_n_0;
    wire Ra[14]_INST_0_i_2_n_0;
    wire Ra[15]_INST_0_i_1_n_0;
    wire Ra[15]_INST_0_i_2_n_0;
    wire Ra[1]_INST_0_i_1_n_0;
    wire Ra[1]_INST_0_i_2_n_0;
    wire Ra[2]_INST_0_i_1_n_0;
    wire Ra[2]_INST_0_i_2_n_0;
    wire Ra[3]_INST_0_i_1_n_0;
    wire Ra[3]_INST_0_i_2_n_0;
    wire Ra[4]_INST_0_i_1_n_0;
    wire Ra[4]_INST_0_i_2_n_0;
    wire Ra[5]_INST_0_i_1_n_0;
    wire Ra[5]_INST_0_i_2_n_0;
    wire Ra[6]_INST_0_i_1_n_0;
    wire Ra[6]_INST_0_i_2_n_0;
    wire Ra[7]_INST_0_i_1_n_0;
    wire Ra[7]_INST_0_i_2_n_0;
    wire Ra[8]_INST_0_i_1_n_0;
    wire Ra[8]_INST_0_i_2_n_0;
    wire Ra[9]_INST_0_i_1_n_0;
    wire Ra[9]_INST_0_i_2_n_0;
    wire [15:0]Rb;
    wire Rb[0]_INST_0_i_1_n_0;
    wire Rb[0]_INST_0_i_2_n_0;
    wire Rb[10]_INST_0_i_1_n_0;
    wire Rb[10]_INST_0_i_2_n_0;
    wire Rb[11]_INST_0_i_1_n_0;
    wire Rb[11]_INST_0_i_2_n_0;
    wire Rb[12]_INST_0_i_1_n_0;
    wire Rb[12]_INST_0_i_2_n_0;
    wire Rb[13]_INST_0_i_1_n_0;
    wire Rb[13]_INST_0_i_2_n_0;
    wire Rb[14]_INST_0_i_1_n_0;
    wire Rb[14]_INST_0_i_2_n_0;
    wire Rb[15]_INST_0_i_1_n_0;
    wire Rb[15]_INST_0_i_2_n_0;
    wire Rb[1]_INST_0_i_1_n_0;
    wire Rb[1]_INST_0_i_2_n_0;
    wire Rb[2]_INST_0_i_1_n_0;
    wire Rb[2]_INST_0_i_2_n_0;
    wire Rb[3]_INST_0_i_1_n_0;
    wire Rb[3]_INST_0_i_2_n_0;
    wire Rb[4]_INST_0_i_1_n_0;
    wire Rb[4]_INST_0_i_2_n_0;
    wire Rb[5]_INST_0_i_1_n_0;
    wire Rb[5]_INST_0_i_2_n_0;
    wire Rb[6]_INST_0_i_1_n_0;
    wire Rb[6]_INST_0_i_2_n_0;
    wire Rb[7]_INST_0_i_1_n_0;
    wire Rb[7]_INST_0_i_2_n_0;
    wire Rb[8]_INST_0_i_1_n_0;
    wire Rb[8]_INST_0_i_2_n_0;
    wire Rb[9]_INST_0_i_1_n_0;
    wire Rb[9]_INST_0_i_2_n_0;
    wire [2:0]SR1;
    wire [2:0]SR2;
    wire clk;
    wire regWE;
    wire registers;
    wire registers[0][15]_i_1_n_0;
    wire registers[1][15]_i_1_n_0;
    wire registers[2][15]_i_1_n_0;
    wire registers[3][15]_i_1_n_0;
    wire registers[4][15]_i_1_n_0;
    wire registers[5][15]_i_1_n_0;
    wire registers[6][15]_i_1_n_0;
    wire [15:0]registers_reg[0]__0;
    wire [15:0]registers_reg[1]__0;
    wire [15:0]registers_reg[2]__0;
    wire [15:0]registers_reg[3]__0;
    wire [15:0]registers_reg[4]__0;
    wire [15:0]registers_reg[5]__0;
    wire [15:0]registers_reg[6]__0;
    wire [15:0]registers_reg[7]__0;
    wire reset;

    MUXF7 Ra[0]_INST_0
    (
        .O(Ra[0]),
        .I0(Ra[0]_INST_0_i_1_n_0),
        .I1(Ra[0]_INST_0_i_2_n_0),
        .S(SR1[2])
    );
    LUT6 Ra[0]_INST_0_i_1
    (
        .O(Ra[0]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[0]),
        .I1(registers_reg[2]__0[0]),
        .I2(SR1[1]),
        .I3(registers_reg[1]__0[0]),
        .I4(SR1[0]),
        .I5(registers_reg[0]__0[0])
    );
    LUT6 Ra[0]_INST_0_i_2
    (
        .O(Ra[0]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[0]),
        .I1(registers_reg[6]__0[0]),
        .I2(SR1[1]),
        .I3(registers_reg[5]__0[0]),
        .I4(SR1[0]),
        .I5(registers_reg[4]__0[0])
    );
    MUXF7 Ra[10]_INST_0
    (
        .O(Ra[10]),
        .I0(Ra[10]_INST_0_i_1_n_0),
        .I1(Ra[10]_INST_0_i_2_n_0),
        .S(SR1[2])
    );
    LUT6 Ra[10]_INST_0_i_1
    (
        .O(Ra[10]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[10]),
        .I1(registers_reg[2]__0[10]),
        .I2(SR1[1]),
        .I3(registers_reg[1]__0[10]),
        .I4(SR1[0]),
        .I5(registers_reg[0]__0[10])
    );
    LUT6 Ra[10]_INST_0_i_2
    (
        .O(Ra[10]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[10]),
        .I1(registers_reg[6]__0[10]),
        .I2(SR1[1]),
        .I3(registers_reg[5]__0[10]),
        .I4(SR1[0]),
        .I5(registers_reg[4]__0[10])
    );
    MUXF7 Ra[11]_INST_0
    (
        .O(Ra[11]),
        .I0(Ra[11]_INST_0_i_1_n_0),
        .I1(Ra[11]_INST_0_i_2_n_0),
        .S(SR1[2])
    );
    LUT6 Ra[11]_INST_0_i_1
    (
        .O(Ra[11]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[11]),
        .I1(registers_reg[2]__0[11]),
        .I2(SR1[1]),
        .I3(registers_reg[1]__0[11]),
        .I4(SR1[0]),
        .I5(registers_reg[0]__0[11])
    );
    LUT6 Ra[11]_INST_0_i_2
    (
        .O(Ra[11]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[11]),
        .I1(registers_reg[6]__0[11]),
        .I2(SR1[1]),
        .I3(registers_reg[5]__0[11]),
        .I4(SR1[0]),
        .I5(registers_reg[4]__0[11])
    );
    MUXF7 Ra[12]_INST_0
    (
        .O(Ra[12]),
        .I0(Ra[12]_INST_0_i_1_n_0),
        .I1(Ra[12]_INST_0_i_2_n_0),
        .S(SR1[2])
    );
    LUT6 Ra[12]_INST_0_i_1
    (
        .O(Ra[12]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[12]),
        .I1(registers_reg[2]__0[12]),
        .I2(SR1[1]),
        .I3(registers_reg[1]__0[12]),
        .I4(SR1[0]),
        .I5(registers_reg[0]__0[12])
    );
    LUT6 Ra[12]_INST_0_i_2
    (
        .O(Ra[12]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[12]),
        .I1(registers_reg[6]__0[12]),
        .I2(SR1[1]),
        .I3(registers_reg[5]__0[12]),
        .I4(SR1[0]),
        .I5(registers_reg[4]__0[12])
    );
    MUXF7 Ra[13]_INST_0
    (
        .O(Ra[13]),
        .I0(Ra[13]_INST_0_i_1_n_0),
        .I1(Ra[13]_INST_0_i_2_n_0),
        .S(SR1[2])
    );
    LUT6 Ra[13]_INST_0_i_1
    (
        .O(Ra[13]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[13]),
        .I1(registers_reg[2]__0[13]),
        .I2(SR1[1]),
        .I3(registers_reg[1]__0[13]),
        .I4(SR1[0]),
        .I5(registers_reg[0]__0[13])
    );
    LUT6 Ra[13]_INST_0_i_2
    (
        .O(Ra[13]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[13]),
        .I1(registers_reg[6]__0[13]),
        .I2(SR1[1]),
        .I3(registers_reg[5]__0[13]),
        .I4(SR1[0]),
        .I5(registers_reg[4]__0[13])
    );
    MUXF7 Ra[14]_INST_0
    (
        .O(Ra[14]),
        .I0(Ra[14]_INST_0_i_1_n_0),
        .I1(Ra[14]_INST_0_i_2_n_0),
        .S(SR1[2])
    );
    LUT6 Ra[14]_INST_0_i_1
    (
        .O(Ra[14]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[14]),
        .I1(registers_reg[2]__0[14]),
        .I2(SR1[1]),
        .I3(registers_reg[1]__0[14]),
        .I4(SR1[0]),
        .I5(registers_reg[0]__0[14])
    );
    LUT6 Ra[14]_INST_0_i_2
    (
        .O(Ra[14]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[14]),
        .I1(registers_reg[6]__0[14]),
        .I2(SR1[1]),
        .I3(registers_reg[5]__0[14]),
        .I4(SR1[0]),
        .I5(registers_reg[4]__0[14])
    );
    MUXF7 Ra[15]_INST_0
    (
        .O(Ra[15]),
        .I0(Ra[15]_INST_0_i_1_n_0),
        .I1(Ra[15]_INST_0_i_2_n_0),
        .S(SR1[2])
    );
    LUT6 Ra[15]_INST_0_i_1
    (
        .O(Ra[15]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[15]),
        .I1(registers_reg[2]__0[15]),
        .I2(SR1[1]),
        .I3(registers_reg[1]__0[15]),
        .I4(SR1[0]),
        .I5(registers_reg[0]__0[15])
    );
    LUT6 Ra[15]_INST_0_i_2
    (
        .O(Ra[15]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[15]),
        .I1(registers_reg[6]__0[15]),
        .I2(SR1[1]),
        .I3(registers_reg[5]__0[15]),
        .I4(SR1[0]),
        .I5(registers_reg[4]__0[15])
    );
    MUXF7 Ra[1]_INST_0
    (
        .O(Ra[1]),
        .I0(Ra[1]_INST_0_i_1_n_0),
        .I1(Ra[1]_INST_0_i_2_n_0),
        .S(SR1[2])
    );
    LUT6 Ra[1]_INST_0_i_1
    (
        .O(Ra[1]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[1]),
        .I1(registers_reg[2]__0[1]),
        .I2(SR1[1]),
        .I3(registers_reg[1]__0[1]),
        .I4(SR1[0]),
        .I5(registers_reg[0]__0[1])
    );
    LUT6 Ra[1]_INST_0_i_2
    (
        .O(Ra[1]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[1]),
        .I1(registers_reg[6]__0[1]),
        .I2(SR1[1]),
        .I3(registers_reg[5]__0[1]),
        .I4(SR1[0]),
        .I5(registers_reg[4]__0[1])
    );
    MUXF7 Ra[2]_INST_0
    (
        .O(Ra[2]),
        .I0(Ra[2]_INST_0_i_1_n_0),
        .I1(Ra[2]_INST_0_i_2_n_0),
        .S(SR1[2])
    );
    LUT6 Ra[2]_INST_0_i_1
    (
        .O(Ra[2]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[2]),
        .I1(registers_reg[2]__0[2]),
        .I2(SR1[1]),
        .I3(registers_reg[1]__0[2]),
        .I4(SR1[0]),
        .I5(registers_reg[0]__0[2])
    );
    LUT6 Ra[2]_INST_0_i_2
    (
        .O(Ra[2]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[2]),
        .I1(registers_reg[6]__0[2]),
        .I2(SR1[1]),
        .I3(registers_reg[5]__0[2]),
        .I4(SR1[0]),
        .I5(registers_reg[4]__0[2])
    );
    MUXF7 Ra[3]_INST_0
    (
        .O(Ra[3]),
        .I0(Ra[3]_INST_0_i_1_n_0),
        .I1(Ra[3]_INST_0_i_2_n_0),
        .S(SR1[2])
    );
    LUT6 Ra[3]_INST_0_i_1
    (
        .O(Ra[3]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[3]),
        .I1(registers_reg[2]__0[3]),
        .I2(SR1[1]),
        .I3(registers_reg[1]__0[3]),
        .I4(SR1[0]),
        .I5(registers_reg[0]__0[3])
    );
    LUT6 Ra[3]_INST_0_i_2
    (
        .O(Ra[3]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[3]),
        .I1(registers_reg[6]__0[3]),
        .I2(SR1[1]),
        .I3(registers_reg[5]__0[3]),
        .I4(SR1[0]),
        .I5(registers_reg[4]__0[3])
    );
    MUXF7 Ra[4]_INST_0
    (
        .O(Ra[4]),
        .I0(Ra[4]_INST_0_i_1_n_0),
        .I1(Ra[4]_INST_0_i_2_n_0),
        .S(SR1[2])
    );
    LUT6 Ra[4]_INST_0_i_1
    (
        .O(Ra[4]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[4]),
        .I1(registers_reg[2]__0[4]),
        .I2(SR1[1]),
        .I3(registers_reg[1]__0[4]),
        .I4(SR1[0]),
        .I5(registers_reg[0]__0[4])
    );
    LUT6 Ra[4]_INST_0_i_2
    (
        .O(Ra[4]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[4]),
        .I1(registers_reg[6]__0[4]),
        .I2(SR1[1]),
        .I3(registers_reg[5]__0[4]),
        .I4(SR1[0]),
        .I5(registers_reg[4]__0[4])
    );
    MUXF7 Ra[5]_INST_0
    (
        .O(Ra[5]),
        .I0(Ra[5]_INST_0_i_1_n_0),
        .I1(Ra[5]_INST_0_i_2_n_0),
        .S(SR1[2])
    );
    LUT6 Ra[5]_INST_0_i_1
    (
        .O(Ra[5]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[5]),
        .I1(registers_reg[2]__0[5]),
        .I2(SR1[1]),
        .I3(registers_reg[1]__0[5]),
        .I4(SR1[0]),
        .I5(registers_reg[0]__0[5])
    );
    LUT6 Ra[5]_INST_0_i_2
    (
        .O(Ra[5]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[5]),
        .I1(registers_reg[6]__0[5]),
        .I2(SR1[1]),
        .I3(registers_reg[5]__0[5]),
        .I4(SR1[0]),
        .I5(registers_reg[4]__0[5])
    );
    MUXF7 Ra[6]_INST_0
    (
        .O(Ra[6]),
        .I0(Ra[6]_INST_0_i_1_n_0),
        .I1(Ra[6]_INST_0_i_2_n_0),
        .S(SR1[2])
    );
    LUT6 Ra[6]_INST_0_i_1
    (
        .O(Ra[6]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[6]),
        .I1(registers_reg[2]__0[6]),
        .I2(SR1[1]),
        .I3(registers_reg[1]__0[6]),
        .I4(SR1[0]),
        .I5(registers_reg[0]__0[6])
    );
    LUT6 Ra[6]_INST_0_i_2
    (
        .O(Ra[6]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[6]),
        .I1(registers_reg[6]__0[6]),
        .I2(SR1[1]),
        .I3(registers_reg[5]__0[6]),
        .I4(SR1[0]),
        .I5(registers_reg[4]__0[6])
    );
    MUXF7 Ra[7]_INST_0
    (
        .O(Ra[7]),
        .I0(Ra[7]_INST_0_i_1_n_0),
        .I1(Ra[7]_INST_0_i_2_n_0),
        .S(SR1[2])
    );
    LUT6 Ra[7]_INST_0_i_1
    (
        .O(Ra[7]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[7]),
        .I1(registers_reg[2]__0[7]),
        .I2(SR1[1]),
        .I3(registers_reg[1]__0[7]),
        .I4(SR1[0]),
        .I5(registers_reg[0]__0[7])
    );
    LUT6 Ra[7]_INST_0_i_2
    (
        .O(Ra[7]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[7]),
        .I1(registers_reg[6]__0[7]),
        .I2(SR1[1]),
        .I3(registers_reg[5]__0[7]),
        .I4(SR1[0]),
        .I5(registers_reg[4]__0[7])
    );
    MUXF7 Ra[8]_INST_0
    (
        .O(Ra[8]),
        .I0(Ra[8]_INST_0_i_1_n_0),
        .I1(Ra[8]_INST_0_i_2_n_0),
        .S(SR1[2])
    );
    LUT6 Ra[8]_INST_0_i_1
    (
        .O(Ra[8]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[8]),
        .I1(registers_reg[2]__0[8]),
        .I2(SR1[1]),
        .I3(registers_reg[1]__0[8]),
        .I4(SR1[0]),
        .I5(registers_reg[0]__0[8])
    );
    LUT6 Ra[8]_INST_0_i_2
    (
        .O(Ra[8]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[8]),
        .I1(registers_reg[6]__0[8]),
        .I2(SR1[1]),
        .I3(registers_reg[5]__0[8]),
        .I4(SR1[0]),
        .I5(registers_reg[4]__0[8])
    );
    MUXF7 Ra[9]_INST_0
    (
        .O(Ra[9]),
        .I0(Ra[9]_INST_0_i_1_n_0),
        .I1(Ra[9]_INST_0_i_2_n_0),
        .S(SR1[2])
    );
    LUT6 Ra[9]_INST_0_i_1
    (
        .O(Ra[9]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[9]),
        .I1(registers_reg[2]__0[9]),
        .I2(SR1[1]),
        .I3(registers_reg[1]__0[9]),
        .I4(SR1[0]),
        .I5(registers_reg[0]__0[9])
    );
    LUT6 Ra[9]_INST_0_i_2
    (
        .O(Ra[9]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[9]),
        .I1(registers_reg[6]__0[9]),
        .I2(SR1[1]),
        .I3(registers_reg[5]__0[9]),
        .I4(SR1[0]),
        .I5(registers_reg[4]__0[9])
    );
    MUXF7 Rb[0]_INST_0
    (
        .O(Rb[0]),
        .I0(Rb[0]_INST_0_i_1_n_0),
        .I1(Rb[0]_INST_0_i_2_n_0),
        .S(SR2[2])
    );
    LUT6 Rb[0]_INST_0_i_1
    (
        .O(Rb[0]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[0]),
        .I1(registers_reg[2]__0[0]),
        .I2(SR2[1]),
        .I3(registers_reg[1]__0[0]),
        .I4(SR2[0]),
        .I5(registers_reg[0]__0[0])
    );
    LUT6 Rb[0]_INST_0_i_2
    (
        .O(Rb[0]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[0]),
        .I1(registers_reg[6]__0[0]),
        .I2(SR2[1]),
        .I3(registers_reg[5]__0[0]),
        .I4(SR2[0]),
        .I5(registers_reg[4]__0[0])
    );
    MUXF7 Rb[10]_INST_0
    (
        .O(Rb[10]),
        .I0(Rb[10]_INST_0_i_1_n_0),
        .I1(Rb[10]_INST_0_i_2_n_0),
        .S(SR2[2])
    );
    LUT6 Rb[10]_INST_0_i_1
    (
        .O(Rb[10]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[10]),
        .I1(registers_reg[2]__0[10]),
        .I2(SR2[1]),
        .I3(registers_reg[1]__0[10]),
        .I4(SR2[0]),
        .I5(registers_reg[0]__0[10])
    );
    LUT6 Rb[10]_INST_0_i_2
    (
        .O(Rb[10]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[10]),
        .I1(registers_reg[6]__0[10]),
        .I2(SR2[1]),
        .I3(registers_reg[5]__0[10]),
        .I4(SR2[0]),
        .I5(registers_reg[4]__0[10])
    );
    MUXF7 Rb[11]_INST_0
    (
        .O(Rb[11]),
        .I0(Rb[11]_INST_0_i_1_n_0),
        .I1(Rb[11]_INST_0_i_2_n_0),
        .S(SR2[2])
    );
    LUT6 Rb[11]_INST_0_i_1
    (
        .O(Rb[11]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[11]),
        .I1(registers_reg[2]__0[11]),
        .I2(SR2[1]),
        .I3(registers_reg[1]__0[11]),
        .I4(SR2[0]),
        .I5(registers_reg[0]__0[11])
    );
    LUT6 Rb[11]_INST_0_i_2
    (
        .O(Rb[11]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[11]),
        .I1(registers_reg[6]__0[11]),
        .I2(SR2[1]),
        .I3(registers_reg[5]__0[11]),
        .I4(SR2[0]),
        .I5(registers_reg[4]__0[11])
    );
    MUXF7 Rb[12]_INST_0
    (
        .O(Rb[12]),
        .I0(Rb[12]_INST_0_i_1_n_0),
        .I1(Rb[12]_INST_0_i_2_n_0),
        .S(SR2[2])
    );
    LUT6 Rb[12]_INST_0_i_1
    (
        .O(Rb[12]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[12]),
        .I1(registers_reg[2]__0[12]),
        .I2(SR2[1]),
        .I3(registers_reg[1]__0[12]),
        .I4(SR2[0]),
        .I5(registers_reg[0]__0[12])
    );
    LUT6 Rb[12]_INST_0_i_2
    (
        .O(Rb[12]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[12]),
        .I1(registers_reg[6]__0[12]),
        .I2(SR2[1]),
        .I3(registers_reg[5]__0[12]),
        .I4(SR2[0]),
        .I5(registers_reg[4]__0[12])
    );
    MUXF7 Rb[13]_INST_0
    (
        .O(Rb[13]),
        .I0(Rb[13]_INST_0_i_1_n_0),
        .I1(Rb[13]_INST_0_i_2_n_0),
        .S(SR2[2])
    );
    LUT6 Rb[13]_INST_0_i_1
    (
        .O(Rb[13]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[13]),
        .I1(registers_reg[2]__0[13]),
        .I2(SR2[1]),
        .I3(registers_reg[1]__0[13]),
        .I4(SR2[0]),
        .I5(registers_reg[0]__0[13])
    );
    LUT6 Rb[13]_INST_0_i_2
    (
        .O(Rb[13]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[13]),
        .I1(registers_reg[6]__0[13]),
        .I2(SR2[1]),
        .I3(registers_reg[5]__0[13]),
        .I4(SR2[0]),
        .I5(registers_reg[4]__0[13])
    );
    MUXF7 Rb[14]_INST_0
    (
        .O(Rb[14]),
        .I0(Rb[14]_INST_0_i_1_n_0),
        .I1(Rb[14]_INST_0_i_2_n_0),
        .S(SR2[2])
    );
    LUT6 Rb[14]_INST_0_i_1
    (
        .O(Rb[14]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[14]),
        .I1(registers_reg[2]__0[14]),
        .I2(SR2[1]),
        .I3(registers_reg[1]__0[14]),
        .I4(SR2[0]),
        .I5(registers_reg[0]__0[14])
    );
    LUT6 Rb[14]_INST_0_i_2
    (
        .O(Rb[14]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[14]),
        .I1(registers_reg[6]__0[14]),
        .I2(SR2[1]),
        .I3(registers_reg[5]__0[14]),
        .I4(SR2[0]),
        .I5(registers_reg[4]__0[14])
    );
    MUXF7 Rb[15]_INST_0
    (
        .O(Rb[15]),
        .I0(Rb[15]_INST_0_i_1_n_0),
        .I1(Rb[15]_INST_0_i_2_n_0),
        .S(SR2[2])
    );
    LUT6 Rb[15]_INST_0_i_1
    (
        .O(Rb[15]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[15]),
        .I1(registers_reg[2]__0[15]),
        .I2(SR2[1]),
        .I3(registers_reg[1]__0[15]),
        .I4(SR2[0]),
        .I5(registers_reg[0]__0[15])
    );
    LUT6 Rb[15]_INST_0_i_2
    (
        .O(Rb[15]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[15]),
        .I1(registers_reg[6]__0[15]),
        .I2(SR2[1]),
        .I3(registers_reg[5]__0[15]),
        .I4(SR2[0]),
        .I5(registers_reg[4]__0[15])
    );
    MUXF7 Rb[1]_INST_0
    (
        .O(Rb[1]),
        .I0(Rb[1]_INST_0_i_1_n_0),
        .I1(Rb[1]_INST_0_i_2_n_0),
        .S(SR2[2])
    );
    LUT6 Rb[1]_INST_0_i_1
    (
        .O(Rb[1]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[1]),
        .I1(registers_reg[2]__0[1]),
        .I2(SR2[1]),
        .I3(registers_reg[1]__0[1]),
        .I4(SR2[0]),
        .I5(registers_reg[0]__0[1])
    );
    LUT6 Rb[1]_INST_0_i_2
    (
        .O(Rb[1]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[1]),
        .I1(registers_reg[6]__0[1]),
        .I2(SR2[1]),
        .I3(registers_reg[5]__0[1]),
        .I4(SR2[0]),
        .I5(registers_reg[4]__0[1])
    );
    MUXF7 Rb[2]_INST_0
    (
        .O(Rb[2]),
        .I0(Rb[2]_INST_0_i_1_n_0),
        .I1(Rb[2]_INST_0_i_2_n_0),
        .S(SR2[2])
    );
    LUT6 Rb[2]_INST_0_i_1
    (
        .O(Rb[2]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[2]),
        .I1(registers_reg[2]__0[2]),
        .I2(SR2[1]),
        .I3(registers_reg[1]__0[2]),
        .I4(SR2[0]),
        .I5(registers_reg[0]__0[2])
    );
    LUT6 Rb[2]_INST_0_i_2
    (
        .O(Rb[2]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[2]),
        .I1(registers_reg[6]__0[2]),
        .I2(SR2[1]),
        .I3(registers_reg[5]__0[2]),
        .I4(SR2[0]),
        .I5(registers_reg[4]__0[2])
    );
    MUXF7 Rb[3]_INST_0
    (
        .O(Rb[3]),
        .I0(Rb[3]_INST_0_i_1_n_0),
        .I1(Rb[3]_INST_0_i_2_n_0),
        .S(SR2[2])
    );
    LUT6 Rb[3]_INST_0_i_1
    (
        .O(Rb[3]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[3]),
        .I1(registers_reg[2]__0[3]),
        .I2(SR2[1]),
        .I3(registers_reg[1]__0[3]),
        .I4(SR2[0]),
        .I5(registers_reg[0]__0[3])
    );
    LUT6 Rb[3]_INST_0_i_2
    (
        .O(Rb[3]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[3]),
        .I1(registers_reg[6]__0[3]),
        .I2(SR2[1]),
        .I3(registers_reg[5]__0[3]),
        .I4(SR2[0]),
        .I5(registers_reg[4]__0[3])
    );
    MUXF7 Rb[4]_INST_0
    (
        .O(Rb[4]),
        .I0(Rb[4]_INST_0_i_1_n_0),
        .I1(Rb[4]_INST_0_i_2_n_0),
        .S(SR2[2])
    );
    LUT6 Rb[4]_INST_0_i_1
    (
        .O(Rb[4]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[4]),
        .I1(registers_reg[2]__0[4]),
        .I2(SR2[1]),
        .I3(registers_reg[1]__0[4]),
        .I4(SR2[0]),
        .I5(registers_reg[0]__0[4])
    );
    LUT6 Rb[4]_INST_0_i_2
    (
        .O(Rb[4]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[4]),
        .I1(registers_reg[6]__0[4]),
        .I2(SR2[1]),
        .I3(registers_reg[5]__0[4]),
        .I4(SR2[0]),
        .I5(registers_reg[4]__0[4])
    );
    MUXF7 Rb[5]_INST_0
    (
        .O(Rb[5]),
        .I0(Rb[5]_INST_0_i_1_n_0),
        .I1(Rb[5]_INST_0_i_2_n_0),
        .S(SR2[2])
    );
    LUT6 Rb[5]_INST_0_i_1
    (
        .O(Rb[5]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[5]),
        .I1(registers_reg[2]__0[5]),
        .I2(SR2[1]),
        .I3(registers_reg[1]__0[5]),
        .I4(SR2[0]),
        .I5(registers_reg[0]__0[5])
    );
    LUT6 Rb[5]_INST_0_i_2
    (
        .O(Rb[5]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[5]),
        .I1(registers_reg[6]__0[5]),
        .I2(SR2[1]),
        .I3(registers_reg[5]__0[5]),
        .I4(SR2[0]),
        .I5(registers_reg[4]__0[5])
    );
    MUXF7 Rb[6]_INST_0
    (
        .O(Rb[6]),
        .I0(Rb[6]_INST_0_i_1_n_0),
        .I1(Rb[6]_INST_0_i_2_n_0),
        .S(SR2[2])
    );
    LUT6 Rb[6]_INST_0_i_1
    (
        .O(Rb[6]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[6]),
        .I1(registers_reg[2]__0[6]),
        .I2(SR2[1]),
        .I3(registers_reg[1]__0[6]),
        .I4(SR2[0]),
        .I5(registers_reg[0]__0[6])
    );
    LUT6 Rb[6]_INST_0_i_2
    (
        .O(Rb[6]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[6]),
        .I1(registers_reg[6]__0[6]),
        .I2(SR2[1]),
        .I3(registers_reg[5]__0[6]),
        .I4(SR2[0]),
        .I5(registers_reg[4]__0[6])
    );
    MUXF7 Rb[7]_INST_0
    (
        .O(Rb[7]),
        .I0(Rb[7]_INST_0_i_1_n_0),
        .I1(Rb[7]_INST_0_i_2_n_0),
        .S(SR2[2])
    );
    LUT6 Rb[7]_INST_0_i_1
    (
        .O(Rb[7]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[7]),
        .I1(registers_reg[2]__0[7]),
        .I2(SR2[1]),
        .I3(registers_reg[1]__0[7]),
        .I4(SR2[0]),
        .I5(registers_reg[0]__0[7])
    );
    LUT6 Rb[7]_INST_0_i_2
    (
        .O(Rb[7]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[7]),
        .I1(registers_reg[6]__0[7]),
        .I2(SR2[1]),
        .I3(registers_reg[5]__0[7]),
        .I4(SR2[0]),
        .I5(registers_reg[4]__0[7])
    );
    MUXF7 Rb[8]_INST_0
    (
        .O(Rb[8]),
        .I0(Rb[8]_INST_0_i_1_n_0),
        .I1(Rb[8]_INST_0_i_2_n_0),
        .S(SR2[2])
    );
    LUT6 Rb[8]_INST_0_i_1
    (
        .O(Rb[8]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[8]),
        .I1(registers_reg[2]__0[8]),
        .I2(SR2[1]),
        .I3(registers_reg[1]__0[8]),
        .I4(SR2[0]),
        .I5(registers_reg[0]__0[8])
    );
    LUT6 Rb[8]_INST_0_i_2
    (
        .O(Rb[8]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[8]),
        .I1(registers_reg[6]__0[8]),
        .I2(SR2[1]),
        .I3(registers_reg[5]__0[8]),
        .I4(SR2[0]),
        .I5(registers_reg[4]__0[8])
    );
    MUXF7 Rb[9]_INST_0
    (
        .O(Rb[9]),
        .I0(Rb[9]_INST_0_i_1_n_0),
        .I1(Rb[9]_INST_0_i_2_n_0),
        .S(SR2[2])
    );
    LUT6 Rb[9]_INST_0_i_1
    (
        .O(Rb[9]_INST_0_i_1_n_0),
        .I0(registers_reg[3]__0[9]),
        .I1(registers_reg[2]__0[9]),
        .I2(SR2[1]),
        .I3(registers_reg[1]__0[9]),
        .I4(SR2[0]),
        .I5(registers_reg[0]__0[9])
    );
    LUT6 Rb[9]_INST_0_i_2
    (
        .O(Rb[9]_INST_0_i_2_n_0),
        .I0(registers_reg[7]__0[9]),
        .I1(registers_reg[6]__0[9]),
        .I2(SR2[1]),
        .I3(registers_reg[5]__0[9]),
        .I4(SR2[0]),
        .I5(registers_reg[4]__0[9])
    );
    LUT4 registers[0][15]_i_1
    (
        .O(registers[0][15]_i_1_n_0),
        .I0(regWE),
        .I1(DR[2]),
        .I2(DR[0]),
        .I3(DR[1])
    );
    LUT4 registers[1][15]_i_1
    (
        .O(registers[1][15]_i_1_n_0),
        .I0(regWE),
        .I1(DR[1]),
        .I2(DR[2]),
        .I3(DR[0])
    );
    LUT4 registers[2][15]_i_1
    (
        .O(registers[2][15]_i_1_n_0),
        .I0(regWE),
        .I1(DR[0]),
        .I2(DR[2]),
        .I3(DR[1])
    );
    LUT4 registers[3][15]_i_1
    (
        .O(registers[3][15]_i_1_n_0),
        .I0(regWE),
        .I1(DR[1]),
        .I2(DR[0]),
        .I3(DR[2])
    );
    LUT4 registers[4][15]_i_1
    (
        .O(registers[4][15]_i_1_n_0),
        .I0(regWE),
        .I1(DR[1]),
        .I2(DR[0]),
        .I3(DR[2])
    );
    LUT4 registers[5][15]_i_1
    (
        .O(registers[5][15]_i_1_n_0),
        .I0(regWE),
        .I1(DR[2]),
        .I2(DR[0]),
        .I3(DR[1])
    );
    LUT4 registers[6][15]_i_1
    (
        .O(registers[6][15]_i_1_n_0),
        .I0(regWE),
        .I1(DR[1]),
        .I2(DR[2]),
        .I3(DR[0])
    );
    LUT4 registers[7][15]_i_1
    (
        .O(registers),
        .I0(regWE),
        .I1(DR[2]),
        .I2(DR[0]),
        .I3(DR[1])
    );
    FDRE registers_reg[0][0]
    (
        .Q(registers_reg[0]__0[0]),
        .C(clk),
        .CE(registers[0][15]_i_1_n_0),
        .D(Buss[0]),
        .R(reset)
    );
    FDRE registers_reg[0][10]
    (
        .Q(registers_reg[0]__0[10]),
        .C(clk),
        .CE(registers[0][15]_i_1_n_0),
        .D(Buss[10]),
        .R(reset)
    );
    FDRE registers_reg[0][11]
    (
        .Q(registers_reg[0]__0[11]),
        .C(clk),
        .CE(registers[0][15]_i_1_n_0),
        .D(Buss[11]),
        .R(reset)
    );
    FDRE registers_reg[0][12]
    (
        .Q(registers_reg[0]__0[12]),
        .C(clk),
        .CE(registers[0][15]_i_1_n_0),
        .D(Buss[12]),
        .R(reset)
    );
    FDRE registers_reg[0][13]
    (
        .Q(registers_reg[0]__0[13]),
        .C(clk),
        .CE(registers[0][15]_i_1_n_0),
        .D(Buss[13]),
        .R(reset)
    );
    FDRE registers_reg[0][14]
    (
        .Q(registers_reg[0]__0[14]),
        .C(clk),
        .CE(registers[0][15]_i_1_n_0),
        .D(Buss[14]),
        .R(reset)
    );
    FDRE registers_reg[0][15]
    (
        .Q(registers_reg[0]__0[15]),
        .C(clk),
        .CE(registers[0][15]_i_1_n_0),
        .D(Buss[15]),
        .R(reset)
    );
    FDRE registers_reg[0][1]
    (
        .Q(registers_reg[0]__0[1]),
        .C(clk),
        .CE(registers[0][15]_i_1_n_0),
        .D(Buss[1]),
        .R(reset)
    );
    FDRE registers_reg[0][2]
    (
        .Q(registers_reg[0]__0[2]),
        .C(clk),
        .CE(registers[0][15]_i_1_n_0),
        .D(Buss[2]),
        .R(reset)
    );
    FDRE registers_reg[0][3]
    (
        .Q(registers_reg[0]__0[3]),
        .C(clk),
        .CE(registers[0][15]_i_1_n_0),
        .D(Buss[3]),
        .R(reset)
    );
    FDRE registers_reg[0][4]
    (
        .Q(registers_reg[0]__0[4]),
        .C(clk),
        .CE(registers[0][15]_i_1_n_0),
        .D(Buss[4]),
        .R(reset)
    );
    FDRE registers_reg[0][5]
    (
        .Q(registers_reg[0]__0[5]),
        .C(clk),
        .CE(registers[0][15]_i_1_n_0),
        .D(Buss[5]),
        .R(reset)
    );
    FDRE registers_reg[0][6]
    (
        .Q(registers_reg[0]__0[6]),
        .C(clk),
        .CE(registers[0][15]_i_1_n_0),
        .D(Buss[6]),
        .R(reset)
    );
    FDRE registers_reg[0][7]
    (
        .Q(registers_reg[0]__0[7]),
        .C(clk),
        .CE(registers[0][15]_i_1_n_0),
        .D(Buss[7]),
        .R(reset)
    );
    FDRE registers_reg[0][8]
    (
        .Q(registers_reg[0]__0[8]),
        .C(clk),
        .CE(registers[0][15]_i_1_n_0),
        .D(Buss[8]),
        .R(reset)
    );
    FDRE registers_reg[0][9]
    (
        .Q(registers_reg[0]__0[9]),
        .C(clk),
        .CE(registers[0][15]_i_1_n_0),
        .D(Buss[9]),
        .R(reset)
    );
    FDRE registers_reg[1][0]
    (
        .Q(registers_reg[1]__0[0]),
        .C(clk),
        .CE(registers[1][15]_i_1_n_0),
        .D(Buss[0]),
        .R(reset)
    );
    FDRE registers_reg[1][10]
    (
        .Q(registers_reg[1]__0[10]),
        .C(clk),
        .CE(registers[1][15]_i_1_n_0),
        .D(Buss[10]),
        .R(reset)
    );
    FDRE registers_reg[1][11]
    (
        .Q(registers_reg[1]__0[11]),
        .C(clk),
        .CE(registers[1][15]_i_1_n_0),
        .D(Buss[11]),
        .R(reset)
    );
    FDRE registers_reg[1][12]
    (
        .Q(registers_reg[1]__0[12]),
        .C(clk),
        .CE(registers[1][15]_i_1_n_0),
        .D(Buss[12]),
        .R(reset)
    );
    FDRE registers_reg[1][13]
    (
        .Q(registers_reg[1]__0[13]),
        .C(clk),
        .CE(registers[1][15]_i_1_n_0),
        .D(Buss[13]),
        .R(reset)
    );
    FDRE registers_reg[1][14]
    (
        .Q(registers_reg[1]__0[14]),
        .C(clk),
        .CE(registers[1][15]_i_1_n_0),
        .D(Buss[14]),
        .R(reset)
    );
    FDRE registers_reg[1][15]
    (
        .Q(registers_reg[1]__0[15]),
        .C(clk),
        .CE(registers[1][15]_i_1_n_0),
        .D(Buss[15]),
        .R(reset)
    );
    FDRE registers_reg[1][1]
    (
        .Q(registers_reg[1]__0[1]),
        .C(clk),
        .CE(registers[1][15]_i_1_n_0),
        .D(Buss[1]),
        .R(reset)
    );
    FDRE registers_reg[1][2]
    (
        .Q(registers_reg[1]__0[2]),
        .C(clk),
        .CE(registers[1][15]_i_1_n_0),
        .D(Buss[2]),
        .R(reset)
    );
    FDRE registers_reg[1][3]
    (
        .Q(registers_reg[1]__0[3]),
        .C(clk),
        .CE(registers[1][15]_i_1_n_0),
        .D(Buss[3]),
        .R(reset)
    );
    FDRE registers_reg[1][4]
    (
        .Q(registers_reg[1]__0[4]),
        .C(clk),
        .CE(registers[1][15]_i_1_n_0),
        .D(Buss[4]),
        .R(reset)
    );
    FDRE registers_reg[1][5]
    (
        .Q(registers_reg[1]__0[5]),
        .C(clk),
        .CE(registers[1][15]_i_1_n_0),
        .D(Buss[5]),
        .R(reset)
    );
    FDRE registers_reg[1][6]
    (
        .Q(registers_reg[1]__0[6]),
        .C(clk),
        .CE(registers[1][15]_i_1_n_0),
        .D(Buss[6]),
        .R(reset)
    );
    FDRE registers_reg[1][7]
    (
        .Q(registers_reg[1]__0[7]),
        .C(clk),
        .CE(registers[1][15]_i_1_n_0),
        .D(Buss[7]),
        .R(reset)
    );
    FDRE registers_reg[1][8]
    (
        .Q(registers_reg[1]__0[8]),
        .C(clk),
        .CE(registers[1][15]_i_1_n_0),
        .D(Buss[8]),
        .R(reset)
    );
    FDRE registers_reg[1][9]
    (
        .Q(registers_reg[1]__0[9]),
        .C(clk),
        .CE(registers[1][15]_i_1_n_0),
        .D(Buss[9]),
        .R(reset)
    );
    FDRE registers_reg[2][0]
    (
        .Q(registers_reg[2]__0[0]),
        .C(clk),
        .CE(registers[2][15]_i_1_n_0),
        .D(Buss[0]),
        .R(reset)
    );
    FDRE registers_reg[2][10]
    (
        .Q(registers_reg[2]__0[10]),
        .C(clk),
        .CE(registers[2][15]_i_1_n_0),
        .D(Buss[10]),
        .R(reset)
    );
    FDRE registers_reg[2][11]
    (
        .Q(registers_reg[2]__0[11]),
        .C(clk),
        .CE(registers[2][15]_i_1_n_0),
        .D(Buss[11]),
        .R(reset)
    );
    FDRE registers_reg[2][12]
    (
        .Q(registers_reg[2]__0[12]),
        .C(clk),
        .CE(registers[2][15]_i_1_n_0),
        .D(Buss[12]),
        .R(reset)
    );
    FDRE registers_reg[2][13]
    (
        .Q(registers_reg[2]__0[13]),
        .C(clk),
        .CE(registers[2][15]_i_1_n_0),
        .D(Buss[13]),
        .R(reset)
    );
    FDRE registers_reg[2][14]
    (
        .Q(registers_reg[2]__0[14]),
        .C(clk),
        .CE(registers[2][15]_i_1_n_0),
        .D(Buss[14]),
        .R(reset)
    );
    FDRE registers_reg[2][15]
    (
        .Q(registers_reg[2]__0[15]),
        .C(clk),
        .CE(registers[2][15]_i_1_n_0),
        .D(Buss[15]),
        .R(reset)
    );
    FDRE registers_reg[2][1]
    (
        .Q(registers_reg[2]__0[1]),
        .C(clk),
        .CE(registers[2][15]_i_1_n_0),
        .D(Buss[1]),
        .R(reset)
    );
    FDRE registers_reg[2][2]
    (
        .Q(registers_reg[2]__0[2]),
        .C(clk),
        .CE(registers[2][15]_i_1_n_0),
        .D(Buss[2]),
        .R(reset)
    );
    FDRE registers_reg[2][3]
    (
        .Q(registers_reg[2]__0[3]),
        .C(clk),
        .CE(registers[2][15]_i_1_n_0),
        .D(Buss[3]),
        .R(reset)
    );
    FDRE registers_reg[2][4]
    (
        .Q(registers_reg[2]__0[4]),
        .C(clk),
        .CE(registers[2][15]_i_1_n_0),
        .D(Buss[4]),
        .R(reset)
    );
    FDRE registers_reg[2][5]
    (
        .Q(registers_reg[2]__0[5]),
        .C(clk),
        .CE(registers[2][15]_i_1_n_0),
        .D(Buss[5]),
        .R(reset)
    );
    FDRE registers_reg[2][6]
    (
        .Q(registers_reg[2]__0[6]),
        .C(clk),
        .CE(registers[2][15]_i_1_n_0),
        .D(Buss[6]),
        .R(reset)
    );
    FDRE registers_reg[2][7]
    (
        .Q(registers_reg[2]__0[7]),
        .C(clk),
        .CE(registers[2][15]_i_1_n_0),
        .D(Buss[7]),
        .R(reset)
    );
    FDRE registers_reg[2][8]
    (
        .Q(registers_reg[2]__0[8]),
        .C(clk),
        .CE(registers[2][15]_i_1_n_0),
        .D(Buss[8]),
        .R(reset)
    );
    FDRE registers_reg[2][9]
    (
        .Q(registers_reg[2]__0[9]),
        .C(clk),
        .CE(registers[2][15]_i_1_n_0),
        .D(Buss[9]),
        .R(reset)
    );
    FDRE registers_reg[3][0]
    (
        .Q(registers_reg[3]__0[0]),
        .C(clk),
        .CE(registers[3][15]_i_1_n_0),
        .D(Buss[0]),
        .R(reset)
    );
    FDRE registers_reg[3][10]
    (
        .Q(registers_reg[3]__0[10]),
        .C(clk),
        .CE(registers[3][15]_i_1_n_0),
        .D(Buss[10]),
        .R(reset)
    );
    FDRE registers_reg[3][11]
    (
        .Q(registers_reg[3]__0[11]),
        .C(clk),
        .CE(registers[3][15]_i_1_n_0),
        .D(Buss[11]),
        .R(reset)
    );
    FDRE registers_reg[3][12]
    (
        .Q(registers_reg[3]__0[12]),
        .C(clk),
        .CE(registers[3][15]_i_1_n_0),
        .D(Buss[12]),
        .R(reset)
    );
    FDRE registers_reg[3][13]
    (
        .Q(registers_reg[3]__0[13]),
        .C(clk),
        .CE(registers[3][15]_i_1_n_0),
        .D(Buss[13]),
        .R(reset)
    );
    FDRE registers_reg[3][14]
    (
        .Q(registers_reg[3]__0[14]),
        .C(clk),
        .CE(registers[3][15]_i_1_n_0),
        .D(Buss[14]),
        .R(reset)
    );
    FDRE registers_reg[3][15]
    (
        .Q(registers_reg[3]__0[15]),
        .C(clk),
        .CE(registers[3][15]_i_1_n_0),
        .D(Buss[15]),
        .R(reset)
    );
    FDRE registers_reg[3][1]
    (
        .Q(registers_reg[3]__0[1]),
        .C(clk),
        .CE(registers[3][15]_i_1_n_0),
        .D(Buss[1]),
        .R(reset)
    );
    FDRE registers_reg[3][2]
    (
        .Q(registers_reg[3]__0[2]),
        .C(clk),
        .CE(registers[3][15]_i_1_n_0),
        .D(Buss[2]),
        .R(reset)
    );
    FDRE registers_reg[3][3]
    (
        .Q(registers_reg[3]__0[3]),
        .C(clk),
        .CE(registers[3][15]_i_1_n_0),
        .D(Buss[3]),
        .R(reset)
    );
    FDRE registers_reg[3][4]
    (
        .Q(registers_reg[3]__0[4]),
        .C(clk),
        .CE(registers[3][15]_i_1_n_0),
        .D(Buss[4]),
        .R(reset)
    );
    FDRE registers_reg[3][5]
    (
        .Q(registers_reg[3]__0[5]),
        .C(clk),
        .CE(registers[3][15]_i_1_n_0),
        .D(Buss[5]),
        .R(reset)
    );
    FDRE registers_reg[3][6]
    (
        .Q(registers_reg[3]__0[6]),
        .C(clk),
        .CE(registers[3][15]_i_1_n_0),
        .D(Buss[6]),
        .R(reset)
    );
    FDRE registers_reg[3][7]
    (
        .Q(registers_reg[3]__0[7]),
        .C(clk),
        .CE(registers[3][15]_i_1_n_0),
        .D(Buss[7]),
        .R(reset)
    );
    FDRE registers_reg[3][8]
    (
        .Q(registers_reg[3]__0[8]),
        .C(clk),
        .CE(registers[3][15]_i_1_n_0),
        .D(Buss[8]),
        .R(reset)
    );
    FDRE registers_reg[3][9]
    (
        .Q(registers_reg[3]__0[9]),
        .C(clk),
        .CE(registers[3][15]_i_1_n_0),
        .D(Buss[9]),
        .R(reset)
    );
    FDRE registers_reg[4][0]
    (
        .Q(registers_reg[4]__0[0]),
        .C(clk),
        .CE(registers[4][15]_i_1_n_0),
        .D(Buss[0]),
        .R(reset)
    );
    FDRE registers_reg[4][10]
    (
        .Q(registers_reg[4]__0[10]),
        .C(clk),
        .CE(registers[4][15]_i_1_n_0),
        .D(Buss[10]),
        .R(reset)
    );
    FDRE registers_reg[4][11]
    (
        .Q(registers_reg[4]__0[11]),
        .C(clk),
        .CE(registers[4][15]_i_1_n_0),
        .D(Buss[11]),
        .R(reset)
    );
    FDRE registers_reg[4][12]
    (
        .Q(registers_reg[4]__0[12]),
        .C(clk),
        .CE(registers[4][15]_i_1_n_0),
        .D(Buss[12]),
        .R(reset)
    );
    FDRE registers_reg[4][13]
    (
        .Q(registers_reg[4]__0[13]),
        .C(clk),
        .CE(registers[4][15]_i_1_n_0),
        .D(Buss[13]),
        .R(reset)
    );
    FDRE registers_reg[4][14]
    (
        .Q(registers_reg[4]__0[14]),
        .C(clk),
        .CE(registers[4][15]_i_1_n_0),
        .D(Buss[14]),
        .R(reset)
    );
    FDRE registers_reg[4][15]
    (
        .Q(registers_reg[4]__0[15]),
        .C(clk),
        .CE(registers[4][15]_i_1_n_0),
        .D(Buss[15]),
        .R(reset)
    );
    FDRE registers_reg[4][1]
    (
        .Q(registers_reg[4]__0[1]),
        .C(clk),
        .CE(registers[4][15]_i_1_n_0),
        .D(Buss[1]),
        .R(reset)
    );
    FDRE registers_reg[4][2]
    (
        .Q(registers_reg[4]__0[2]),
        .C(clk),
        .CE(registers[4][15]_i_1_n_0),
        .D(Buss[2]),
        .R(reset)
    );
    FDRE registers_reg[4][3]
    (
        .Q(registers_reg[4]__0[3]),
        .C(clk),
        .CE(registers[4][15]_i_1_n_0),
        .D(Buss[3]),
        .R(reset)
    );
    FDRE registers_reg[4][4]
    (
        .Q(registers_reg[4]__0[4]),
        .C(clk),
        .CE(registers[4][15]_i_1_n_0),
        .D(Buss[4]),
        .R(reset)
    );
    FDRE registers_reg[4][5]
    (
        .Q(registers_reg[4]__0[5]),
        .C(clk),
        .CE(registers[4][15]_i_1_n_0),
        .D(Buss[5]),
        .R(reset)
    );
    FDRE registers_reg[4][6]
    (
        .Q(registers_reg[4]__0[6]),
        .C(clk),
        .CE(registers[4][15]_i_1_n_0),
        .D(Buss[6]),
        .R(reset)
    );
    FDRE registers_reg[4][7]
    (
        .Q(registers_reg[4]__0[7]),
        .C(clk),
        .CE(registers[4][15]_i_1_n_0),
        .D(Buss[7]),
        .R(reset)
    );
    FDRE registers_reg[4][8]
    (
        .Q(registers_reg[4]__0[8]),
        .C(clk),
        .CE(registers[4][15]_i_1_n_0),
        .D(Buss[8]),
        .R(reset)
    );
    FDRE registers_reg[4][9]
    (
        .Q(registers_reg[4]__0[9]),
        .C(clk),
        .CE(registers[4][15]_i_1_n_0),
        .D(Buss[9]),
        .R(reset)
    );
    FDRE registers_reg[5][0]
    (
        .Q(registers_reg[5]__0[0]),
        .C(clk),
        .CE(registers[5][15]_i_1_n_0),
        .D(Buss[0]),
        .R(reset)
    );
    FDRE registers_reg[5][10]
    (
        .Q(registers_reg[5]__0[10]),
        .C(clk),
        .CE(registers[5][15]_i_1_n_0),
        .D(Buss[10]),
        .R(reset)
    );
    FDRE registers_reg[5][11]
    (
        .Q(registers_reg[5]__0[11]),
        .C(clk),
        .CE(registers[5][15]_i_1_n_0),
        .D(Buss[11]),
        .R(reset)
    );
    FDRE registers_reg[5][12]
    (
        .Q(registers_reg[5]__0[12]),
        .C(clk),
        .CE(registers[5][15]_i_1_n_0),
        .D(Buss[12]),
        .R(reset)
    );
    FDRE registers_reg[5][13]
    (
        .Q(registers_reg[5]__0[13]),
        .C(clk),
        .CE(registers[5][15]_i_1_n_0),
        .D(Buss[13]),
        .R(reset)
    );
    FDRE registers_reg[5][14]
    (
        .Q(registers_reg[5]__0[14]),
        .C(clk),
        .CE(registers[5][15]_i_1_n_0),
        .D(Buss[14]),
        .R(reset)
    );
    FDRE registers_reg[5][15]
    (
        .Q(registers_reg[5]__0[15]),
        .C(clk),
        .CE(registers[5][15]_i_1_n_0),
        .D(Buss[15]),
        .R(reset)
    );
    FDRE registers_reg[5][1]
    (
        .Q(registers_reg[5]__0[1]),
        .C(clk),
        .CE(registers[5][15]_i_1_n_0),
        .D(Buss[1]),
        .R(reset)
    );
    FDRE registers_reg[5][2]
    (
        .Q(registers_reg[5]__0[2]),
        .C(clk),
        .CE(registers[5][15]_i_1_n_0),
        .D(Buss[2]),
        .R(reset)
    );
    FDRE registers_reg[5][3]
    (
        .Q(registers_reg[5]__0[3]),
        .C(clk),
        .CE(registers[5][15]_i_1_n_0),
        .D(Buss[3]),
        .R(reset)
    );
    FDRE registers_reg[5][4]
    (
        .Q(registers_reg[5]__0[4]),
        .C(clk),
        .CE(registers[5][15]_i_1_n_0),
        .D(Buss[4]),
        .R(reset)
    );
    FDRE registers_reg[5][5]
    (
        .Q(registers_reg[5]__0[5]),
        .C(clk),
        .CE(registers[5][15]_i_1_n_0),
        .D(Buss[5]),
        .R(reset)
    );
    FDRE registers_reg[5][6]
    (
        .Q(registers_reg[5]__0[6]),
        .C(clk),
        .CE(registers[5][15]_i_1_n_0),
        .D(Buss[6]),
        .R(reset)
    );
    FDRE registers_reg[5][7]
    (
        .Q(registers_reg[5]__0[7]),
        .C(clk),
        .CE(registers[5][15]_i_1_n_0),
        .D(Buss[7]),
        .R(reset)
    );
    FDRE registers_reg[5][8]
    (
        .Q(registers_reg[5]__0[8]),
        .C(clk),
        .CE(registers[5][15]_i_1_n_0),
        .D(Buss[8]),
        .R(reset)
    );
    FDRE registers_reg[5][9]
    (
        .Q(registers_reg[5]__0[9]),
        .C(clk),
        .CE(registers[5][15]_i_1_n_0),
        .D(Buss[9]),
        .R(reset)
    );
    FDRE registers_reg[6][0]
    (
        .Q(registers_reg[6]__0[0]),
        .C(clk),
        .CE(registers[6][15]_i_1_n_0),
        .D(Buss[0]),
        .R(reset)
    );
    FDRE registers_reg[6][10]
    (
        .Q(registers_reg[6]__0[10]),
        .C(clk),
        .CE(registers[6][15]_i_1_n_0),
        .D(Buss[10]),
        .R(reset)
    );
    FDRE registers_reg[6][11]
    (
        .Q(registers_reg[6]__0[11]),
        .C(clk),
        .CE(registers[6][15]_i_1_n_0),
        .D(Buss[11]),
        .R(reset)
    );
    FDRE registers_reg[6][12]
    (
        .Q(registers_reg[6]__0[12]),
        .C(clk),
        .CE(registers[6][15]_i_1_n_0),
        .D(Buss[12]),
        .R(reset)
    );
    FDRE registers_reg[6][13]
    (
        .Q(registers_reg[6]__0[13]),
        .C(clk),
        .CE(registers[6][15]_i_1_n_0),
        .D(Buss[13]),
        .R(reset)
    );
    FDRE registers_reg[6][14]
    (
        .Q(registers_reg[6]__0[14]),
        .C(clk),
        .CE(registers[6][15]_i_1_n_0),
        .D(Buss[14]),
        .R(reset)
    );
    FDRE registers_reg[6][15]
    (
        .Q(registers_reg[6]__0[15]),
        .C(clk),
        .CE(registers[6][15]_i_1_n_0),
        .D(Buss[15]),
        .R(reset)
    );
    FDRE registers_reg[6][1]
    (
        .Q(registers_reg[6]__0[1]),
        .C(clk),
        .CE(registers[6][15]_i_1_n_0),
        .D(Buss[1]),
        .R(reset)
    );
    FDRE registers_reg[6][2]
    (
        .Q(registers_reg[6]__0[2]),
        .C(clk),
        .CE(registers[6][15]_i_1_n_0),
        .D(Buss[2]),
        .R(reset)
    );
    FDRE registers_reg[6][3]
    (
        .Q(registers_reg[6]__0[3]),
        .C(clk),
        .CE(registers[6][15]_i_1_n_0),
        .D(Buss[3]),
        .R(reset)
    );
    FDRE registers_reg[6][4]
    (
        .Q(registers_reg[6]__0[4]),
        .C(clk),
        .CE(registers[6][15]_i_1_n_0),
        .D(Buss[4]),
        .R(reset)
    );
    FDRE registers_reg[6][5]
    (
        .Q(registers_reg[6]__0[5]),
        .C(clk),
        .CE(registers[6][15]_i_1_n_0),
        .D(Buss[5]),
        .R(reset)
    );
    FDRE registers_reg[6][6]
    (
        .Q(registers_reg[6]__0[6]),
        .C(clk),
        .CE(registers[6][15]_i_1_n_0),
        .D(Buss[6]),
        .R(reset)
    );
    FDRE registers_reg[6][7]
    (
        .Q(registers_reg[6]__0[7]),
        .C(clk),
        .CE(registers[6][15]_i_1_n_0),
        .D(Buss[7]),
        .R(reset)
    );
    FDRE registers_reg[6][8]
    (
        .Q(registers_reg[6]__0[8]),
        .C(clk),
        .CE(registers[6][15]_i_1_n_0),
        .D(Buss[8]),
        .R(reset)
    );
    FDRE registers_reg[6][9]
    (
        .Q(registers_reg[6]__0[9]),
        .C(clk),
        .CE(registers[6][15]_i_1_n_0),
        .D(Buss[9]),
        .R(reset)
    );
    FDRE registers_reg[7][0]
    (
        .Q(registers_reg[7]__0[0]),
        .C(clk),
        .CE(registers),
        .D(Buss[0]),
        .R(reset)
    );
    FDRE registers_reg[7][10]
    (
        .Q(registers_reg[7]__0[10]),
        .C(clk),
        .CE(registers),
        .D(Buss[10]),
        .R(reset)
    );
    FDRE registers_reg[7][11]
    (
        .Q(registers_reg[7]__0[11]),
        .C(clk),
        .CE(registers),
        .D(Buss[11]),
        .R(reset)
    );
    FDRE registers_reg[7][12]
    (
        .Q(registers_reg[7]__0[12]),
        .C(clk),
        .CE(registers),
        .D(Buss[12]),
        .R(reset)
    );
    FDRE registers_reg[7][13]
    (
        .Q(registers_reg[7]__0[13]),
        .C(clk),
        .CE(registers),
        .D(Buss[13]),
        .R(reset)
    );
    FDRE registers_reg[7][14]
    (
        .Q(registers_reg[7]__0[14]),
        .C(clk),
        .CE(registers),
        .D(Buss[14]),
        .R(reset)
    );
    FDRE registers_reg[7][15]
    (
        .Q(registers_reg[7]__0[15]),
        .C(clk),
        .CE(registers),
        .D(Buss[15]),
        .R(reset)
    );
    FDRE registers_reg[7][1]
    (
        .Q(registers_reg[7]__0[1]),
        .C(clk),
        .CE(registers),
        .D(Buss[1]),
        .R(reset)
    );
    FDRE registers_reg[7][2]
    (
        .Q(registers_reg[7]__0[2]),
        .C(clk),
        .CE(registers),
        .D(Buss[2]),
        .R(reset)
    );
    FDRE registers_reg[7][3]
    (
        .Q(registers_reg[7]__0[3]),
        .C(clk),
        .CE(registers),
        .D(Buss[3]),
        .R(reset)
    );
    FDRE registers_reg[7][4]
    (
        .Q(registers_reg[7]__0[4]),
        .C(clk),
        .CE(registers),
        .D(Buss[4]),
        .R(reset)
    );
    FDRE registers_reg[7][5]
    (
        .Q(registers_reg[7]__0[5]),
        .C(clk),
        .CE(registers),
        .D(Buss[5]),
        .R(reset)
    );
    FDRE registers_reg[7][6]
    (
        .Q(registers_reg[7]__0[6]),
        .C(clk),
        .CE(registers),
        .D(Buss[6]),
        .R(reset)
    );
    FDRE registers_reg[7][7]
    (
        .Q(registers_reg[7]__0[7]),
        .C(clk),
        .CE(registers),
        .D(Buss[7]),
        .R(reset)
    );
    FDRE registers_reg[7][8]
    (
        .Q(registers_reg[7]__0[8]),
        .C(clk),
        .CE(registers),
        .D(Buss[8]),
        .R(reset)
    );
    FDRE registers_reg[7][9]
    (
        .Q(registers_reg[7]__0[9]),
        .C(clk),
        .CE(registers),
        .D(Buss[9]),
        .R(reset)
    );
endmodule

module LUT1
(
    O,
    I0
);

    output O;
    input I0;


endmodule

module CARRY8
(
    CI,
    CI_TOP,
    CO[7:0],
    O[7:0],
    DI[7:0],
    S[7:0]
);

    input CI;
    input CI_TOP;
    output [7:0]CO[7:0];
    output [7:0]O[7:0];
    input [7:0]DI[7:0];
    input [7:0]S[7:0];


endmodule

module MAR
(
    clk,
    ldMAR,
    reset,
    .Buss[15:0]({}),
    .MAR[15:0]({ground, ground, ground, ground, ground, ground, ground, ground, MAR[7], MAR[6], MAR[5], MAR[4], MAR[3], MAR[2], MAR[1], MAR[0]})
);

    input clk;
    input ldMAR;
    input reset;
    input [7:0]Buss;
    output ground;
    output [7:0]MAR;

    wire ground;
    wire [7:0]Buss;
    wire [7:0]MAR;
    wire clk;
    wire ldMAR;
    wire reset;

    GND GND
    (
        .G(ground)
    );
    FDCE MAR_reg[0]
    (
        .Q(MAR[0]),
        .C(clk),
        .CE(ldMAR),
        .CLR(reset),
        .D(Buss[0])
    );
    FDCE MAR_reg[1]
    (
        .Q(MAR[1]),
        .C(clk),
        .CE(ldMAR),
        .CLR(reset),
        .D(Buss[1])
    );
    FDCE MAR_reg[2]
    (
        .Q(MAR[2]),
        .C(clk),
        .CE(ldMAR),
        .CLR(reset),
        .D(Buss[2])
    );
    FDCE MAR_reg[3]
    (
        .Q(MAR[3]),
        .C(clk),
        .CE(ldMAR),
        .CLR(reset),
        .D(Buss[3])
    );
    FDCE MAR_reg[4]
    (
        .Q(MAR[4]),
        .C(clk),
        .CE(ldMAR),
        .CLR(reset),
        .D(Buss[4])
    );
    FDCE MAR_reg[5]
    (
        .Q(MAR[5]),
        .C(clk),
        .CE(ldMAR),
        .CLR(reset),
        .D(Buss[5])
    );
    FDCE MAR_reg[6]
    (
        .Q(MAR[6]),
        .C(clk),
        .CE(ldMAR),
        .CLR(reset),
        .D(Buss[6])
    );
    FDCE MAR_reg[7]
    (
        .Q(MAR[7]),
        .C(clk),
        .CE(ldMAR),
        .CLR(reset),
        .D(Buss[7])
    );
endmodule

module MDR
(
    clk,
    ldMDR,
    reset,
    selMDR,
    .Buss[15:0]({Buss[15], Buss[14], Buss[13], Buss[12], Buss[11], Buss[10], Buss[9], Buss[8], Buss[7], Buss[6], Buss[5], Buss[4], Buss[3], Buss[2], Buss[1], Buss[0]}),
    .MDR[15:0]({MDR[15], MDR[14], MDR[13], MDR[12], MDR[11], MDR[10], MDR[9], MDR[8], MDR[7], MDR[6], MDR[5], MDR[4], MDR[3], MDR[2], MDR[1], MDR[0]}),
    .memOut[15:0]({memOut[15], memOut[14], memOut[13], memOut[12], memOut[11], memOut[10], memOut[9], memOut[8], memOut[7], memOut[6], memOut[5], memOut[4], memOut[3], memOut[2], memOut[1], memOut[0]})
);

    input clk;
    input ldMDR;
    input reset;
    input selMDR;
    input [15:0]Buss;
    output [15:0]MDR;
    input [15:0]memOut;

    wire [15:0]Buss;
    wire [15:0]MDR;
    wire clk;
    wire ldMDR;
    wire [15:0]memOut;
    wire [15:0]p_0_in;
    wire reset;
    wire selMDR;

    LUT3 MDR[0]_i_1
    (
        .O(p_0_in[0]),
        .I0(memOut[0]),
        .I1(Buss[0]),
        .I2(selMDR)
    );
    LUT3 MDR[10]_i_1
    (
        .O(p_0_in[10]),
        .I0(memOut[10]),
        .I1(Buss[10]),
        .I2(selMDR)
    );
    LUT3 MDR[11]_i_1
    (
        .O(p_0_in[11]),
        .I0(memOut[11]),
        .I1(Buss[11]),
        .I2(selMDR)
    );
    LUT3 MDR[12]_i_1
    (
        .O(p_0_in[12]),
        .I0(memOut[12]),
        .I1(Buss[12]),
        .I2(selMDR)
    );
    LUT3 MDR[13]_i_1
    (
        .O(p_0_in[13]),
        .I0(memOut[13]),
        .I1(Buss[13]),
        .I2(selMDR)
    );
    LUT3 MDR[14]_i_1
    (
        .O(p_0_in[14]),
        .I0(memOut[14]),
        .I1(Buss[14]),
        .I2(selMDR)
    );
    LUT3 MDR[15]_i_1
    (
        .O(p_0_in[15]),
        .I0(memOut[15]),
        .I1(Buss[15]),
        .I2(selMDR)
    );
    LUT3 MDR[1]_i_1
    (
        .O(p_0_in[1]),
        .I0(memOut[1]),
        .I1(Buss[1]),
        .I2(selMDR)
    );
    LUT3 MDR[2]_i_1
    (
        .O(p_0_in[2]),
        .I0(memOut[2]),
        .I1(Buss[2]),
        .I2(selMDR)
    );
    LUT3 MDR[3]_i_1
    (
        .O(p_0_in[3]),
        .I0(memOut[3]),
        .I1(Buss[3]),
        .I2(selMDR)
    );
    LUT3 MDR[4]_i_1
    (
        .O(p_0_in[4]),
        .I0(memOut[4]),
        .I1(Buss[4]),
        .I2(selMDR)
    );
    LUT3 MDR[5]_i_1
    (
        .O(p_0_in[5]),
        .I0(memOut[5]),
        .I1(Buss[5]),
        .I2(selMDR)
    );
    LUT3 MDR[6]_i_1
    (
        .O(p_0_in[6]),
        .I0(memOut[6]),
        .I1(Buss[6]),
        .I2(selMDR)
    );
    LUT3 MDR[7]_i_1
    (
        .O(p_0_in[7]),
        .I0(memOut[7]),
        .I1(Buss[7]),
        .I2(selMDR)
    );
    LUT3 MDR[8]_i_1
    (
        .O(p_0_in[8]),
        .I0(memOut[8]),
        .I1(Buss[8]),
        .I2(selMDR)
    );
    LUT3 MDR[9]_i_1
    (
        .O(p_0_in[9]),
        .I0(memOut[9]),
        .I1(Buss[9]),
        .I2(selMDR)
    );
    FDCE MDR_reg[0]
    (
        .Q(MDR[0]),
        .C(clk),
        .CE(ldMDR),
        .CLR(reset),
        .D(p_0_in[0])
    );
    FDCE MDR_reg[10]
    (
        .Q(MDR[10]),
        .C(clk),
        .CE(ldMDR),
        .CLR(reset),
        .D(p_0_in[10])
    );
    FDCE MDR_reg[11]
    (
        .Q(MDR[11]),
        .C(clk),
        .CE(ldMDR),
        .CLR(reset),
        .D(p_0_in[11])
    );
    FDCE MDR_reg[12]
    (
        .Q(MDR[12]),
        .C(clk),
        .CE(ldMDR),
        .CLR(reset),
        .D(p_0_in[12])
    );
    FDCE MDR_reg[13]
    (
        .Q(MDR[13]),
        .C(clk),
        .CE(ldMDR),
        .CLR(reset),
        .D(p_0_in[13])
    );
    FDCE MDR_reg[14]
    (
        .Q(MDR[14]),
        .C(clk),
        .CE(ldMDR),
        .CLR(reset),
        .D(p_0_in[14])
    );
    FDCE MDR_reg[15]
    (
        .Q(MDR[15]),
        .C(clk),
        .CE(ldMDR),
        .CLR(reset),
        .D(p_0_in[15])
    );
    FDCE MDR_reg[1]
    (
        .Q(MDR[1]),
        .C(clk),
        .CE(ldMDR),
        .CLR(reset),
        .D(p_0_in[1])
    );
    FDCE MDR_reg[2]
    (
        .Q(MDR[2]),
        .C(clk),
        .CE(ldMDR),
        .CLR(reset),
        .D(p_0_in[2])
    );
    FDCE MDR_reg[3]
    (
        .Q(MDR[3]),
        .C(clk),
        .CE(ldMDR),
        .CLR(reset),
        .D(p_0_in[3])
    );
    FDCE MDR_reg[4]
    (
        .Q(MDR[4]),
        .C(clk),
        .CE(ldMDR),
        .CLR(reset),
        .D(p_0_in[4])
    );
    FDCE MDR_reg[5]
    (
        .Q(MDR[5]),
        .C(clk),
        .CE(ldMDR),
        .CLR(reset),
        .D(p_0_in[5])
    );
    FDCE MDR_reg[6]
    (
        .Q(MDR[6]),
        .C(clk),
        .CE(ldMDR),
        .CLR(reset),
        .D(p_0_in[6])
    );
    FDCE MDR_reg[7]
    (
        .Q(MDR[7]),
        .C(clk),
        .CE(ldMDR),
        .CLR(reset),
        .D(p_0_in[7])
    );
    FDCE MDR_reg[8]
    (
        .Q(MDR[8]),
        .C(clk),
        .CE(ldMDR),
        .CLR(reset),
        .D(p_0_in[8])
    );
    FDCE MDR_reg[9]
    (
        .Q(MDR[9]),
        .C(clk),
        .CE(ldMDR),
        .CLR(reset),
        .D(p_0_in[9])
    );
endmodule

module RAM256X1S
(
    O,
    D,
    WCLK,
    WE,
    A[7:0]
);

    output O;
    input D;
    input WCLK;
    input WE;
    input [7:0]A[7:0];


endmodule

module MUXF7
(
    O,
    I0,
    I1,
    S
);

    output O;
    input I0;
    input I1;
    input S;


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

module INV
(
    I,
    O
);

    input I;
    output O;


endmodule

