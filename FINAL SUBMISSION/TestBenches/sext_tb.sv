`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2016 11:46:26 AM
// Design Name: 
// Module Name: mux2to1_tb
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


module sext_tb; // Testbenches don't need any ports.

    logic [14:0] in;
    logic [31:0] out;
            
    sext S1(
        .in(in),
        .out(out)
        );
       
    initial begin
        in = 15'b000000010101011;
        #10;
        in = 15'b111111110101010;
        #10;
        in = 15'b000000001000000;
        #10;
        in = 15'b111010101010101;
    end
           
endmodule
