`timescale 1ns / 1ps
/***************************************************************************
* 
* Module: toggle
*
* Author: Jacob Brown
*
* Date: <Date file was created>
*
* Description: oscillates between 0 and 1
*
*
****************************************************************************/

`default_nettype none

module toggle(
    input wire logic clk, reset,
    output logic out
    );
    
    always_ff @(posedge clk)
        if (reset)
            out <= 0;
        else
            out <= ~out;
endmodule
