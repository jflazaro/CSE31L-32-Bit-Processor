`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2016 05:12:38 PM
// Design Name: 
// Module Name: sign extender 15 to 32
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

module sext(in, out);

    parameter INWIDTH = 15;
    parameter OUTWIDTH = 32;

    input logic [INWIDTH - 1:0] in;
    output logic [OUTWIDTH - 1:0] out;

    assign out[OUTWIDTH-1:0] = {{((OUTWIDTH-1)-(INWIDTH-1)){in[INWIDTH - 1]}}, in[INWIDTH - 1:0]};

endmodule
