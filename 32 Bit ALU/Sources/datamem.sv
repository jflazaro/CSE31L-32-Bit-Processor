`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2016 04:21:54 PM
// Design Name: 
// Module Name: datamem
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


module Datmem (ReaDat, WE2, addr, WriDat);

parameter AWIDTH = 32;
parameter ALENGTH = 128;

output logic ReaDat;   
input logic WE2;
input logic [AWIDTH - 1:0] addr;
input logic WriDat;

logic [AWIDTH - 1:0] MEM [ALENGTH -1: 0];

always begin
    if (WE2) begin
        MEM[addr] <= WriDat;
        ReaDat <= MEM[addr];
        end else ReaDat <= MEM[addr];
    end 
endmodule