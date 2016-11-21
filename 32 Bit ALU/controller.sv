`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2016 07:32:15 PM
// Design Name: 
// Module Name: controller
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

parameter WIDTH = 32;
module controller(
    input [WIDTH-1:0]in32,
    output RI,
    output rs,
    output rd,
    output fx,
    output rt,
    output imm
    );

    assign RI = in32[WIDTH];
    assign rs = in32[30:25];
    assign rd = in32[24:19];
    assign fx = in32[18:15];
    assign rt = (in32[WIDTH-1]) ? 6'b000000 : in32[14:9] ;
    assign imm = (in32[WIDTH-1]) ? in32[14:0] : in32[8:0] ;    
    
endmodule
