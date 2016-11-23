`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2016 05:12:12 PM
// Design Name: 
// Module Name: Instruction_Block_32bit
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

///////////////////////////////////////////////////////////////////////////////////
// THIS WILL BE USED TO TEST INSTRUCTION BLOCK BEFORE INSTRUCTION MEMORY IS REACHED
/////////////////////////////////////////////////////////////////////////////////// 

module Instruction_Block_32bit(addr, clk, inc, rst);//addr, read_data, clk, inc, Mem);
    parameter AWIDTH = 6;
    parameter RWIDTH = 32;
    
    output logic [AWIDTH-1:0] addr;
    input logic [AWIDTH-1:0] inc;
    input logic clk;
    input logic rst;
    
    logic [RWIDTH-1:0] Mem[2**AWIDTH];
    
    //wire [AWIDTH-1:0] fromPCaddr;
    wire [AWIDTH-1:0] toPCaddr;
    
    IB32bit_Adder Adder1(
        .inc(inc),
        .addr(addr),
        .addr_out(toPCaddr)
        );
        
    IB32bit_PC PC1(
        .addr(toPCaddr),
        .clk(clk),
        .addr_out(addr),
        .rst(rst)
        );
    
    //assign addr = fromPCaddr;
    //assign read_data = Mem[addr];
    /*always_ff@(posedge clk) begin
        addr <= fromPCaddr;
        //read_data <= Mem[addr];
    end */
    /*always_comb begin
        addr = fromPCaddr;
    end*/
endmodule
