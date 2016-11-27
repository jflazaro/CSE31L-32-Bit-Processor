`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2016 07:27:45 PM
// Design Name: 
// Module Name: mtp_SUPERHEROESINTRAINING_controller_tb
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


module controller_tb;

    logic [31:0]a;
    logic ri;
    logic [5:0]rs;
    logic [5:0]rd;
    logic [3:0]fx;
    logic [5:0]rt;
    logic [14:0]imm;
    logic [3:0] ALUopsel;
	wire WE1;
	wire WE2;
	
    controller C1(
        .in32(a),
        .ri(ri),
        .rs(rs),
        .rd(rd),
        .fx(fx),
        .rt(rt),
        .imm(imm),
		
		.ALUopsel(ALUopsel),
		.WE1(WE1),
		.WE2(WE2)
        );
    
initial begin
    #50;
    a = 32'b10111101010101000111111000000000; /*rt and imm should be 0, rt is set to 6'b000000*/
    #50;
    a = 32'b01111010101010000111111000000000; /*we should see 111111 for rt and imm should be 0*/
    #50;
    a = 32'b00001100000000110000101000000000; /*WE2 flag (store) should be enabled. Instruction taken
                                                from instruction block */
    #50;
    a = 32'b00001100001100100000000000000000; /*WE1 flag (load) should be enabled. Instruction taken
                                                from instruction block */
    end    
    
    
endmodule
