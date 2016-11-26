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


module RegBlock_tb; // Testbenches don't need any ports.

    logic a;
    logic b;
    logic sel;
    wire y;
            
    RegBlock M1(
        .A(a),
        .B(b),
        .sel(sel),
        .Y(y)
        );
       
    initial begin
        a = 1'b0;
        b = 1'b0;
        sel = 1'b0;
        #10;
        sel = 1'b1;
        #10;

        a = 1'b0;
        b = 1'b1;
        sel = 1'b0;
        #10;
        sel = 1'b1;
        #10;
        
        a = 1'b1;
        b = 1'b0;
        sel = 1'b0;
        #10;
        sel = 1'b1;
        #10;

        a = 1'b1;
        b = 1'b1;
        sel = 1'b0;
        #10;
        sel = 1'b1;
        #10;
end
           
endmodule
