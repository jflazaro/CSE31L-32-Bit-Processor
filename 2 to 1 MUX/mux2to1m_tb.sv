`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2016 11:46:26 AM
// Design Name: 
// Module Name: mux2to1m, modular, testbench
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

module mux2to1m_tb; // Testbenches don't need no ports.

    logic [DWIDTH -1: 0] a;
    logic [DWIDTH -1: 0] b;
    logic sel;
    wire [DWIDTH -1: 0] y;
            
    mux2to1m MM(
        .A(a),
        .B(b),
        .sel(sel),
        .Y(y)
        );
       
    initial begin
        a = 32'hFFFFFFFF;
        b = 32'hEEEEEEEE;
        sel = 1'b0;
        #10;
        sel = 1'b1;
        #10;

        a = 32'h01234567;
        b = 32'hFEDCBA98
        sel = 1'b0;
        #10;
        sel = 1'b1;
        #10;
end
           
endmodule
