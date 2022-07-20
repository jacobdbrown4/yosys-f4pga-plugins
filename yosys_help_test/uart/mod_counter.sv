// `timescale 1ns / 1ps
/***************************************************************************
* 
* Module: mod_counter
*
* Author: Jacob Brown
* Class: ECEN 220, Section 1, Winter 2020
* Date: March 9th, 2021
*
* Description: this module implements a modulo counter.
*
*
****************************************************************************/

// `default_nettype none

module mod_counter #(parameter MOD_VALUE = 10, parameter COUNTER_WIDTH = 4) (
    input wire logic clk,
    input wire logic reset,
    input wire logic increment,
    output logic rolling_over,
    output logic[(COUNTER_WIDTH-1):0] count
    );
    
    //increments count until reset is 1 or it rolls over
    always_ff @(posedge clk)
       if (reset || rolling_over)
        count <= 4'b0000;
       else if (increment)
        count <= count+1;
    
    //OFL
    assign rolling_over = (increment && count == (MOD_VALUE - 1))?1:0;
        
endmodule
