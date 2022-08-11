`timescale 1ns / 1ps
/***************************************************************************
* 
* Module: tx
*
* Author: Jacob Brown
* Class: ECEN 220, Section 1, Winter 2020
* Date: March 23, 2021
*
* Description: this module is a UART Transmitter
*
*
****************************************************************************/
// `default_nettype none

module tx(
    input wire logic clk,Reset,Send,
    input wire logic [7:0] Din,
    output logic Sent, Sout
    );
    logic[13:0] count; //used in the timer
    logic[3:0] bitCount; // used to count the bits
    logic timerDone; //indicates when timer is done
    logic incBit; //tells bit counter to add 1
    logic startBit, dataBit, parityBit; //used in the datapath
    logic clrTimer, clrBit;
    logic bitDone;
    
    //timer
    always_ff @(posedge clk)
        if (clrTimer || timerDone)
            count <= 0;
        else
            count <= count+1;
    // 9600 baud is count == 1250
	// 115200 baud is count == 104.1667
    assign timerDone = (count == 5208)?1:0;
    
    //bit counter
    always_ff @(posedge clk)
        if (clrBit)
            bitCount <= 0;
        else if (incBit)
            bitCount <= bitCount + 1;
    assign bitDone = (bitCount == 7);
    
    //data path
    always_ff @(posedge clk)
        if (startBit)
            Sout <= 0;
        else if (dataBit)
            Sout <= Din[bitCount];
        else if (parityBit)
            Sout <= ~^Din;
        else
            Sout <= 1;
            
    //Finite State Machine
    typedef enum logic[2:0] {sIdle,sStart,sBits,sPar,sStop,sAck,ERR='X} stateType;
    stateType ns,cs;
    always_comb
    begin
        //default values
        ns = ERR;
        clrTimer = 0;
        clrBit = 0;
        startBit = 0;
        dataBit = 0;
        parityBit = 0;
        incBit = 0;
        Sent = 0;
        
        if (Reset)
            ns = sIdle;
        else
            case (cs)
                sIdle: begin
                       clrTimer = 1;                  
                       if (Send)
                            ns = sStart;
                       else
                            ns = sIdle;
                       end
                sStart: begin
                        startBit = 1;
                        if (timerDone)
                           begin
                           ns = sBits;
                           clrBit = 1;
                           end
                        else
                            ns = sStart;
                        end
                sBits: begin
                       dataBit = 1;
                       if (timerDone && bitDone)
                            ns = sPar;
                       else if (timerDone && !bitDone)
                            begin
                            ns = sBits;
                            incBit = 1;
                            end
                       else 
                            ns = sBits;
                       end
                sPar: begin
                      parityBit = 1;
                      if (timerDone)
                           ns = sStop;
                      else
                           ns = sPar;
                      end
                sStop: begin
                       if (timerDone)
                            ns = sAck;
                       else
                            ns = sStop;
                       end
                sAck: begin
                      Sent = 1;
                      if (!Send)
                            ns = sIdle;
                      else
                            ns = sAck;
                      end
            endcase
     end
     
     always_ff @(posedge clk)
        cs <= ns;
    
endmodule
