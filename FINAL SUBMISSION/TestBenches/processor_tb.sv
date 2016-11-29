`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2016 09:00:49 PM
// Design Name: 
// Module Name: processor_tb
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


module processor_tb;
logic clk = 0;
logic rst = 1;
logic [31:0]    reg_write_data;

/*logic [31:0]in32;
logic [5:0]rs;
logic [5:0]rd;
logic [5:0]rt;
logic [14:0]imm;
logic [3:0]ALUopsel*/

processor pc(
    .clk(clk),
    .rst(rst),
    .reg_write_data(reg_write_data)
);

always #20 clk=~clk;
always #40 rst=0;


endmodule
