`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 11/20/2016 05:55:48 PM
// Design Name:
// Module Name: IB32bit_Adder
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module IB32bit_Adder(inc, addr, addr_out);
    parameter AWIDTH = 6;
    
    input logic inc;
    input logic [AWIDTH-1:0] addr;
    output logic [AWIDTH-1:0] addr_out;
    
    assign addr_out = addr + inc;
endmodule
