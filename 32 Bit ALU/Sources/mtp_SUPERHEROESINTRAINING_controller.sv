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
    input logic [WIDTH-1:0]in32,
    output logic ri,
    output logic [5:0]rs,
    output logic [5:0]rd,
    output logic [3:0]fx,
    output logic [5:0]rt,
    output logic [14:0]imm
    );

    assign ri = in32[WIDTH-1];
    assign rs = in32[30:25];
    assign rd = in32[24:19];
    assign fx = in32[18:15];
    assign rt = (in32[WIDTH-1]) ? 6'b000000 : in32[14:9] ;
    assign imm = (in32[WIDTH-1]) ? in32[14:0] : in32[8:0] ;    
    
endmodule
