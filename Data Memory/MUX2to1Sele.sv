`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2016 04:20:47 PM
// Design Name: 
// Module Name: MUX2to1Sele
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


module MUX2to1Sele(MS2, ReaDat, Addr, WD );

parameter AWIDTH = 32;

input logic MS2;
input logic [AWIDTH - 1:0] ReaDat;
input logic [AWIDTH - 1:0] Addr;
output logic WD;

assign WD = (MS2 == 1'b1)? ReaDat:
            (MS2 == 1'b0)? Addr:
            1'bz; 

endmodule
