`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2016 05:18:23 PM
// Design Name: 
// Module Name: Instruction_Block_32bit_tb
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


module Instruction_Block_32bit_tb;
parameter AWIDTH = 6;

logic [AWIDTH-1:0] addr;
logic inc = 1;
logic clk;

Instruction_Block_32bit IB1(
    .addr(addr),
    .inc(inc),
    .clk(clk)
);

int i;
initial begin
clk=0;
for(i=0;i<20;i++) begin
    if(clk==0)
        clk=1;
    else
        clk=0;
    #20;
end
end
endmodule
