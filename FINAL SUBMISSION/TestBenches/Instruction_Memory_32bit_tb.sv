`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2016 10:02:29 PM
// Design Name: 
// Module Name: Instruction_Memory_32bit_tb
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


module Instruction_Memory_32bit_tb;
parameter AWIDTH = 6;
parameter RWIDTH = 32;

logic [AWIDTH-1:0] addr;
logic [RWIDTH-1:0] read_data;

Instruction_Memory_32bit IM1(
    .addr(addr),
    .read_data(read_data)
    );

int i;
initial begin
    for (i=0;i<(2**AWIDTH);i++) begin
        addr=i;
        #20;
    end
end
endmodule
