`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2016 02:53:15 PM
// Design Name: 
// Module Name: mux8to1
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


module mux8to1(
    input logic A,
    input logic B,
    input logic C,
    input logic D,
    input logic E,
    input logic F,
    input logic G,
    input logic H,
    input logic [2:0] opsel,
    output logic out
    );
    
    wire net1;
    wire net2;
    
    mux4to1 L1(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .sel(opsel[1:0]),
        .Y(net1)
    );
    
    mux4to1 L2(
        .A(E),
        .B(F),
        .C(G),
        .D(H),
        .sel(opsel[1:0]),
        .Y(net2)
    );
    
    mux2to1 L3(
        .A(net1),
        .B(net2),
        .sel(opsel[2]),
        .Y(out)
    );
endmodule
