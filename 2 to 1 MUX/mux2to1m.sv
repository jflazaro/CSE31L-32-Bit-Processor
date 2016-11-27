`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 10/04/2016 02:25:16 PM
// Design Name:
// Module Name: mux2to1m, modular	
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

parameter DWIDTH = 32;

module mux2to1m( 
    input logic [DWIDTH -1: 0] A,
    input logic [DWIDTH -1: 0] B,
    input logic sel,
    output logic [DWIDTH -1: 0] Y
    );

    assign Y = (sel == 1'b0)? A : B;

endmodule
