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
parameter D = 32;
parameter RWIDTH = 6;
parameter IMM_IN = 15;
module controller(
    input logic [D-1:0]in32,
    output logic [RWIDTH-1:0]rs,
    output logic [RWIDTH-1:0]rd,
    output logic [RWIDTH-1:0]rt,
    output logic [IMM_IN -1:0]imm,
	
	/*flags*/
	output logic [3:0]ALUopsel,
	output logic MUXsel1,
	output logic MUXsel2,
	output logic WE1, /*RegWrite*/
	output logic WE2	 /*MemWrite*/
    );

    
    
    
    
    assign rs = in32[30:25];
    assign rd = in32[24:19];
    assign rt = (in32[D-1]) ? 6'b000000 : in32[14:9] ;
    assign imm = (in32[D-1]) ? in32[14:0] : in32[8:0] ;    
	
	assign ALUopsel = (
	                  (in32[18:15]==4'b1111) ?  4'b0010 : /*NOP*/
	                  (in32[18:15]==4'b0000) ?  4'b0000 : /*ADD / ADDI*/
	                  (in32[18:15]==4'b0011) ?  4'b0011 : /*SUB / SUBI*/
	                  (in32[18:15]==4'b1000) ?  4'b1000 : /*AND / ANDI */
	                  (in32[18:15]==4'b1001) ?  4'b1001 : /*OR / ORI */
	                  (in32[18:15]==4'b1011) ?  4'b1011 : /* NOT */
	                  (in32[18:15]==4'b1010) ?  4'b1010 : /* XOR/ XORI*/
	                  (in32[18:15]==4'b1101) ?  4'b1101 : /* SLL / SLLI */
	                  (in32[18:15]==4'b0010) ?  4'b0010 : /* MOV / MOVI */
	                  (in32[18:15]==4'b0100) ?  4'b0010 : /* LOAD */
	                  (in32[18:15]==4'b0110) ?  4'b0010 : /* STORE */
	                  4'b0010 ); /*default value, do nothing*/
	                                    /*0010 is the ALU opcode for MOVE, which does nothing.*/
	                                    /*This is apparent in NOP, MOV, LOAD, STORE */
	assign MUXsel1 = in32[D-1] ? 1 : 0; /*if immediate mode, then MUXsel1 = 1 */
    assign MUXsel2 = (in32[18:15]==4'b0100) ? 1 : /*if load or store function is called, muxsel2 = 1*/
                     (in32[18:15]==4'b0110) ? 1 :
                     0;
    assign WE1 = (in32[18:15]==4'b0100) ? 1: 0; /*load function*/
    assign WE2 = (in32[18:15]==4'b0110) ? 1: 0; /*store function */
    
endmodule