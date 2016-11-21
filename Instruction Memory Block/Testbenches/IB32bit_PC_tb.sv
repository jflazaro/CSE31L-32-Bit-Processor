`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2016 06:37:25 PM
// Design Name: 
// Module Name: IB32bit_PC_tb
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


module IB32bit_PC_tb;
parameter AWIDTH = 6;

logic [AWIDTH-1:0] addr;
logic clk;
logic [AWIDTH-1:0] fromPCaddr;

IB32bit_PC PC1(
    .addr(addr),
    .clk(clk),
    .addr_out(fromPCaddr)
);

int i_clk;
initial begin
    clk<=0;
    addr=0;
    for(i_clk=0;i_clk<20;i_clk++) begin
        if (clk==0)
            clk<=1;
        else
            clk<=0;
        addr<=addr+1;        
        #20;
    end
end
endmodule
