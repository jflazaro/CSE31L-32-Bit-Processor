`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2016 06:10:17 PM
// Design Name: 
// Module Name: IB32bit_Adder_tb
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


module IB32bit_Adder_tb;
parameter AWIDTH = 6;
parameter RWIDTH = 32;
logic [AWIDTH-1:0] addr;
logic [AWIDTH-1:0] toPCaddr;
IB32bit_Adder Adder1(
    .inc(1),
    .addr(addr),
    .addr_out(toPCaddr)
);

int i;
initial begin
    /*addr = 6'b000000;
    for(i=0; i<10; i++) begin
        addr=addr+1;
        #10;
    end*/
    addr = 6'b111110;
    #10;
    addr = addr + 1;
    #10;
    addr = addr + 1;
    #10;
end
endmodule
