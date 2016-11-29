`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2016 10:01:47 PM
// Design Name: 
// Module Name: Instruction_Memory_32bit
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


module Instruction_Memory_32bit(addr, read_data);

parameter AWIDTH = 6;
parameter RWIDTH = 32;

input logic [AWIDTH-1:0] addr;
output logic [RWIDTH-1:0] read_data;

logic [RWIDTH-1:0] inst_mem [(2**AWIDTH)-1:0];

assign inst_mem[0] = 32'b00000000000001111000000000000000; //NOP
assign inst_mem[1] = 32'b10000000000010000000000000000001; //R1 = R0 + 1
assign inst_mem[2] = 32'b10000010000100000000000000000001; //R2 = R1 + 1
assign inst_mem[3] = 32'b00000010000111010000010000000000; //R3 = R1 XOR R2
assign inst_mem[4] = 32'b00000110001001101000000000000000; //R4 = SLL R3 by 1
assign inst_mem[5] = 32'b00001000001111001000011000000000; //R7 = R4 OR R3
assign inst_mem[6] = 32'b00001110001010011000010000000000; //R5 = R7 - R2
assign inst_mem[7] = 32'b10000000001100000000000000000110; //R6 = R0 + 6
assign inst_mem[8] = 32'b00001100000000110000101000000000; //Store DM(R6) <- R5
assign inst_mem[9] = 32'b00001100001100100000000000000000; //Load R6 <- DM(R6)


//using generate statement assign all other memory addresses to NOP
genvar i;
generate
    for (i=10;i<(2**AWIDTH);i++) begin: generate_inst_mem
        assign inst_mem[i] = 32'b00000000000001111000000000000000; //NOP
    end
endgenerate

assign read_data = inst_mem[addr];

endmodule
