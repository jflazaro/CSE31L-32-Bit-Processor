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

parameter RWIDTH = 6;
parameter DWIDTH = 32;
parameter IMM_IN = 15;

module RegBlock_tb; // Testbenches don't need any ports.
    logic [RWIDTH -1:0]   rs;
    logic [RWIDTH -1:0]   rt;
    logic [RWIDTH -1:0]   rd;
    logic [DWIDTH -1:0]   wd;
    logic                 we;
    logic                 clk = 0;
    logic                 mux_sel; //Need to be defined in the controller
    logic [IMM_IN -1:0]   imm_in;
    logic [DWIDTH -1:0]  opA;
    logic [DWIDTH -1:0]  opB;
    logic [DWIDTH -1:0]  opBwd;    
            
    RegBlock RB1(
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .wd(wd),
        .we(we),
        .clk(clk),
        .mux_sel(mux_sel),
        .imm_in(imm_in),
        .opA(opA),
        .opB(opB),
        .opBwd(opBwd)
    );
       
    initial begin
    
    imm_in = 15'b001111111111111;
    mux_sel = 1'b0;         
      
    we = 1'b0;
    rd = 6'b000000;
    wd = 32'h000000;
    rs = 6'b000000;
    rt = 6'b101001;
    mux_sel = 1;
    #50;
    mux_sel = 0;
    
    #50;
    rs = 6'b100011;
    mux_sel = 1;
    #50;
    mux_sel = 0;
    #50;
    
    we = 1'b1;
    rd = 6'b111111;
    wd = 32'hFFAAFFAA;
    rs = 6'b000000;
    rt = 6'b000000;
    
    mux_sel = 1;
    #50;
    mux_sel = 0;
    
    #50;
    
    we = 1'b1;
    rd = 6'b001100;
    wd = 32'hAAAAAAAA;
    rs = 6'b001011;
    rt = 6'b111111;
    
    mux_sel = 1;
    #50;
    mux_sel = 0;
    
    #50;        
    we = 1'b0;
    rs = 6'b001100;
    rt= 6'b111111;
    rd = 6'b000000;
    wd = 32'h00000000;
    
    #50;
    mux_sel = 1;
    
//    #50;
//    ra1 = 6'b000000;
//    ra2 = 6'b000111;
    
//    #50;
//    we = 1'b1;
//    wa = 6'b000000;
//    wd = 32'hBBBBBBBB;
//    ra2 = 6'b111111;
    
//    #50;
//    we = 0'b0;
//    ra1 = 6'b000000;
    
//    #4;
//    ra1 = 6'b111111;
//    #3;
//    ra2 = 6'b001100;
    
//    #50;
end
           
always #10 clk = ~clk;
endmodule
