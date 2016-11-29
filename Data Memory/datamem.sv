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

//Hardcode index 0 to 32'b0
//Make it so that you cannot write into index 0.
module Datmem (ReaDat, WE2, Addr, WriDat);

parameter AWIDTH = 32;
parameter ALENGTH = 128;

output logic ReaDat;   
input logic WE2;
input logic [AWIDTH - 1:0] Addr;
input logic [AWIDTH - 1:0] WriDat;

logic [AWIDTH - 1:0] MEM [ALENGTH -1: 0];

/*genvar i;
generate
    for (i=0;i<ALENGTH;i++) begin: gen_dm
        assign MEM[0] = 0;
    end
endgenerate*/

assign MEM[0] = 0;

always_comb begin
    if (WE2 && Addr) begin
        MEM[Addr] <= WriDat;
        ReaDat <= MEM[Addr];
        end else ReaDat <= MEM[Addr];
    end 
endmodule