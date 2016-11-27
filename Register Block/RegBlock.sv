`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 10/04/2016 02:25:16 PM
// Design Name:
// Module Name: mux2to1
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


module RegBlock(rs, rt, rd, wd, we, clk, mux_sel, imm_in, opA, opB, opBwd, ALUresult, ALUopsel);

    parameter RWIDTH = 6;
    parameter DWIDTH = 32;
    parameter IMM_IN = 15;
    
    input logic [RWIDTH -1:0]   rs;
    input logic [RWIDTH -1:0]   rt;
    input logic [RWIDTH -1:0]   rd;
    input logic [DWIDTH -1:0]   wd;
    input logic                 we;
    input logic                 clk;
    input logic                 mux_sel; //Need to be defined in the controller
    input logic [IMM_IN -1:0]   imm_in;
    input logic [DWIDTH -1:0]  opA;
    input logic [DWIDTH -1:0]  opB;
    input logic [3:0] ALUopsel; //[3]:mode [2:0]:opsel
    output logic [DWIDTH -1:0]  opBwd;    
    output logic [DWIDTH -1:0] ALUresult;
    
    wire [DWIDTH -1:0] IMM_to_MUX;
    //wire [DWIDTH -1:0] RD2_to_MUX;

    regfile_32bit RF(
        .ra1(rs),
        .ra2(rt),
        .wa(rd),
        .wd(wd),
        .we(we),
        .clk(clk),
        .rd1(opA),
        .rd2(opBwd)
    );
    
    sext SE(
        .in(imm_in),
        .out(IMM_to_MUX)
    );
    
    mux2to1 MUX(
        .A(opBwd),
        .B(IMM_to_MUX),
        .sel(mux_sel),
        .Y(opB)
    );
    
    alu_32bit ALU(
        .op1(opA),
        .op2(opB),
        .opsel(ALUopsel[2:0]),
        .mode(ALUopsel[3]),
        .result(ALUresult),
        .c_flag(),
        .z_flag(),
        .o_flag(),
        .s_flag()
    );
endmodule
