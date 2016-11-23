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


module regfile_32bit_tb; // Testbenches don't need any ports.

    parameter RWIDTH = 6;
    parameter DWIDTH = 32;

    logic [RWIDTH - 1:0]  ra1;
    logic [RWIDTH - 1:0]  ra2;
    logic [RWIDTH - 1:0]  wa;
    logic [DWIDTH - 1:0]  wd;
    logic                 we;
    logic                 clk = 0;
    logic [DWIDTH - 1:0] rd1;
    logic [DWIDTH - 1:0] rd2;
    logic [DWIDTH-1:0] Mem[2**RWIDTH];
            
    regfile_32bit R1(
        .ra1(ra1),
        .ra2(ra2),
        .wa(wa),
        .wd(wd),
        .we(we),
        .clk(clk),
        .rd1(rd1),
        .rd2(rd2)
        //.Mem(Mem) /*DO i need to hook up memory? */
        );
    
    initial begin
        
        we = 1'b0;
        wa = 6'b000000;
        wd = 32'h000000;
        ra1 = 6'b000000;
        ra2 = 6'b101001;
        
        #50;
        ra1 = 6'b100011;
        
        #50;
        
        we = 1'b1;
        wa = 6'b111111;
        wd = 32'hFFAAFFAA;
        ra1 = 6'b000000;
        ra2 = 6'b000000;
        
        #50;
        
        we = 1'b1;
        wa = 6'b001100;
        wd = 32'hAAAAAAAA;
        ra1 = 6'b001011;
        ra2 = 6'b111111;
        
        #50;        
        we = 1'b0;
        ra1 = 6'b001100;
        ra2 = 6'b111111;
        wa = 6'b000000;
        wd = 32'h00000000;
        
        #50;
        ra1 = 6'b010101;
        ra2 = 6'b111000;
        
        #50;
        ra1 = 6'b000000;
        ra2 = 6'b000111;
        
        #50;
        we = 1'b1;
        wa = 6'b000000;
        wd = 32'hBBBBBBBB;
        ra2 = 6'b111111;
        
        #50;
        we = 0'b0;
        ra1 = 6'b000000;
        
        #4;
        ra1 = 6'b111111;
        #3;
        ra2 = 6'b001100;
        
        #50;
    end
    
    always #10 clk = ~clk;
           
endmodule
