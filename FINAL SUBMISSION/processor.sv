`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2016 05:10:47 PM
// Design Name: 
// Module Name: processor
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

module processor(
    input logic clk,
    input logic rst,
    output logic [31:0]    reg_write_data
    );

parameter ADDR = 6;
parameter DATA = 32;
parameter IMM = 15;
parameter INC = 1;
parameter ALUOPSEL = 4;
parameter FX = 4;

wire [DATA-1:0] IMtoControl;
wire [ADDR-1:0] ControltoRA1;
wire [ADDR-1:0] ControltoRA2;
wire [ADDR-1:0] ControltoWA;
wire [IMM-1:0] ControltoSext;
wire [ALUOPSEL-1:0] ControltoALUopsel;
wire ControltoMuxSel1;
wire ControltoMuxSel2;
wire ControltoWriteEnable1;
wire ControltoWriteEnable2;
wire [DATA-1:0] RegtoOpBwd;
wire [DATA-1:0] RegtoAddr;

Instruction_Block_32bit InstrBlock(
    .inc(INC),
    .clk(clk),
    .rst(rst),
    .read_data(IMtoControl) //[DATA-1:0] wire
);

RegBlock RBlock(
    .rs(ControltoRA1), //[ADDR-1:0] wire
    .rt(ControltoRA2), //[ADDR-1:0] wire
    .rd(ControltoWA), //[ADDR-1:0] wire
    .wd(reg_write_data), //[DATA-1:0] wire
    //.wd(RegtoAddr),
    .we(ControltoWriteEnable1),
    .clk(clk),
    .muxsel1(ControltoMuxSel1),
    .imm_in(ControltoSext), //[IMM-1:0] wire
    .ALUopsel(ControltoALUopsel), //[ALUOPSEL-1:0] wire
    .opBwd(RegtoOpBwd), //[DATA-1:0] wire
    .ALUresult(RegtoAddr) //[DATA-1:0] wire
    //.ALUresult(reg_write_data)
);

DM DataMem(
    .MS2(ControltoMuxSel2),
    .WE2(ControltoWriteEnable2),
    .Addr(RegtoAddr), //[DATA-1:0] wire
    //.Addr(reg_write_data),
    .WriDat(RegtoOpBwd), //[DATA-1:0] wire
    .WD(reg_write_data) //[DATA-1:0] wire
    //.WD(RegtoAddr)
);

controller Control(
    .in32(IMtoControl), //[DATA-1:0] wire
    //.ri(),
    .rs(ControltoRA1), //[ADDR-1:0] wire
    .rd(ControltoWA), //[ADDR-1:0] wire
    //.fx(), //[FX-1:0] wire
    .rt(ControltoRA2), //[ADDR-1:0] wire
    .imm(ControltoSext), //[IMM-1:0] wire
    .ALUopsel(ControltoALUopsel), //[ALUOPSEL-1:0] wire
    .MUXsel1(ControltoMuxSel1),
    .MUXsel2(ControltoMuxSel2),
    .WE1(ControltoWriteEnable1),
    .WE2(ControltoWriteEnable2)
);



endmodule
