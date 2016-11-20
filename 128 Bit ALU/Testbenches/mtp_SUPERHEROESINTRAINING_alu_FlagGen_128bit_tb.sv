`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/30/2016 06:24:22 PM
// Design Name: 
// Module Name: FlagGen_128bit_tb
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


module FlagGen_128bit_tb;
logic [2:0] opsel;
logic mode;
logic cin;
logic [127:0] result;
logic c_flag;
logic z_flag;
logic s_flag;
logic o_flag;

FlagGen_128bit FG1(
    .opsel(opsel),
    .mode(mode),
    .cin(cin),
    .result(result),
    .c_flag(c_flag),
    .z_flag(z_flag),
    .s_flag(s_flag),
    .o_flag(o_flag)
);

initial begin

end

endmodule
