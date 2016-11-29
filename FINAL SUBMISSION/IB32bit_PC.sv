`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2016 05:55:48 PM
// Design Name: 
// Module Name: IB32bit_PC
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

module IB32bit_PC(addr, clk, addr_out, rst);
    parameter AWIDTH = 6;
    
    input logic [AWIDTH-1:0] addr;
    input clk;
    input rst;
    output logic [AWIDTH-1:0] addr_out;
    
    always_ff@(posedge clk) begin
        if (rst==1) begin
            addr_out <= 0;
        end
        else
            addr_out <= addr;
    end
endmodule
