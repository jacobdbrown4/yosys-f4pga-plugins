`timescale 1ns / 1ps
/***************************************************************************
* 
* Module: debounce
*
* Author: Jacob Brown
* Class: ECEN 220, Section 1, Winter 2020
* Date: March 16, 2021
*
* Description: this module takes an input signal "noisy" and outputs the debounced signal "debounced" only after 5 ms of no change in the noisy signal. The mod_counter module is instantiated to be the timer.
*
*
****************************************************************************/
`default_nettype none

module debounce(
	input wire logic clk, reset, noisy,
    output logic debounced
    );
    
    //Declare timer internal logic signals
    logic clrTimer, timerDone;
    
    //Declare signal that will be tied to the .clk() signal of the mod_counter module. This is a throw away signal
    logic[18:0] count;
    
    //Define the a states type with next and current state variables of that type
    typedef enum logic[1:0] {s0,s1,s2,s3,ERR='X} stateType;
    stateType ns,cs;
    
    //moves from state to state based on signals
    always_comb
    begin 
        //Assign default values to next state and output signal
        ns = ERR;
        debounced = 0;
        clrTimer = 0;
        
		if (reset)
			begin
				ns = s0;
				//debounced = 0;
			end
        else 
            case (cs)
                s0: begin
                        clrTimer = 1;
                        debounced = 0;
                        if (noisy)
                            ns = s1;
                        else
                            ns = s0;
                    end
                s1: begin 
                        debounced = 0;
                        clrTimer = 0;
                        if(~noisy)
                            ns = s0;
                        else if (noisy && ~timerDone)
                            ns = s1;
                        else if (noisy && timerDone)
                            ns = s2;
                    end
               s2: begin
                        clrTimer = 1;
                        debounced = 1;
                    if (noisy)
                        ns = s2;
                   else if (~noisy)
                        ns = s3;
                   end
               s3: begin 
                        debounced = 1;
                        clrTimer = 0;
                        if(noisy)
                            ns = s2;
                        else if (~noisy && ~timerDone)
                            ns = s3;
                        else 
                            ns = s0;
                   end
            endcase
    end
    
   //instantiate the timer
    mod_counter #(500001, 19) timer (.clk(clk),.reset(clrTimer),.increment(1'b1),.rolling_over(timerDone),.count(count));
    //mod_counter #(10, 5) timer (.clk(clk),.reset(clrTimer),.increment(1'b1),.rolling_over(timerDone),.count(count));            
    
    //State Register
    always_ff @(posedge clk)
		cs <= ns;        
           
endmodule
