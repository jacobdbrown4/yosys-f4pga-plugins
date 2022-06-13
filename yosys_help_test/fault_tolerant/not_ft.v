module $not
(
    A,
    Y
);
    parameter A_SIGNED = 0;
    parameter A_WIDTH  = 1;
    parameter Y_WIDTH = 1;

    input A;
    output Y;

not_ft #(.A_SIGNED(A_SIGNED), .A_WIDTH(A_WIDTH), .Y_WIDTH(Y_WIDTH)) _TECHMAP_REPLACE_ (.A_TMR_0(A), .Y_TMR_0(Y));

endmodule