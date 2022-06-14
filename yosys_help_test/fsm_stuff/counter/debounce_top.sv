`timescale 1ns / 1ps
/***************************************************************************
* 
* Module: debounce_top
*
* Author: Jacob Brown
* Class: ECEN 220, Section 1, Winter 2020
* Date: March 16, 2021
*
* Description: This module contains two counters. One counts the signal after it is debounced and the other counts the signal without debouncing it.
*
*
****************************************************************************/
`default_nettype none

module debounce_top(
    input wire logic clk, reset, increment, 
	output logic[6:0] debouncedOutput, noisyOutput
	//output logic[3:0] anode,
    //output logic[7:0] segment
    );
    
    logic[1:0] buttonPush; //used in synchronization of button pushes
    logic debouncedPush; //the output of the debounce state machine
    logic F1, F2, F3, F4, pulse1, pulse2; //signals used for one shot detecter flip flops
    logic[6:0] debouncedCount, noisyCount;
    
    //synchronize button pushes
    always_ff @(posedge clk)
        buttonPush[0] <= ~increment;
    always_ff @(posedge clk)
        buttonPush[1] <= buttonPush[0];
		
	debounce debouncer (.clk(clk),.reset(~reset),.noisy(buttonPush[1]),.debounced(debouncedPush));
    
    //one shot detector for debounced signal
    always_ff @(posedge clk)
        F1 <= debouncedPush;
    always_ff @(posedge clk)
        F2 <= F1;
    assign pulse1 = (~F2 && F1);
    
    //Counter 1 (debounced)
    always_ff @(posedge clk)
		if (~reset)
			debouncedCount <= 7'b0000000;
			// debouncedCount <= 7'b1111111;
		else if (pulse1)
			begin
				debouncedCount <= debouncedCount+1;
				// debouncedCount <= 7'b1111111;
			end
    
    //one shot detector for noisy signal
    always_ff @(posedge clk)
        F3 <= buttonPush[1];
    always_ff @(posedge clk)
        F4 <= F3;
    assign pulse2 = (~F4 && F3);
    
    //Counter 2 (not debounced)
    always_ff @(posedge clk)
        if (~reset)
            noisyCount <= 7'b0000000;
			//noisyCount <= 7'b1111111;
        else if (pulse2)
			begin
				noisyCount <= noisyCount+1;
				// noisyCount <= 7'b1111111;
            end
	assign debouncedOutput = ~debouncedCount;
	assign noisyOutput = ~noisyCount;
     // SevenSegmentControl SSC (.clk(clk),.reset(reset),.dataIn({noisyCount,debouncedCount}),.digitDisplay(4'b1111),.digitPoint(4'b0000),.anode(anode),.segment(segment));
    
endmodule
