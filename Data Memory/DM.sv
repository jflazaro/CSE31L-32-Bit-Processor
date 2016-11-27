`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2016 01:21:28 AM
// Design Name: 
// Module Name: DM
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


module DM(WE2, Addr, WriDat, WD, MS2);

parameter AWIDTH = 32;
parameter ALENGTH = 128;

output logic [AWIDTH - 1:0]WD;
input logic MS2;    
input logic WE2;
input logic [AWIDTH - 1:0] Addr;
input logic [AWIDTH - 1:0] WriDat;

wire [AWIDTH - 1:0] toReaddata;

Datmem DM(
          .ReaDat(toReaddata),
          .WE2(WE2), 
          .Addr(Addr), 
          .WriDat(WriDat)
          ); 
MUX2to1Sele MUXSEL2(
          .MS2(MS2), 
          .ReaDat(toReaddata), 
          .Addr(Addr), 
          .WD(WD) );
endmodule
