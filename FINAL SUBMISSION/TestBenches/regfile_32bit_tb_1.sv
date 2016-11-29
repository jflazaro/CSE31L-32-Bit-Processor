`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2016 01:18:58 PM
// Design Name: 
// Module Name: regfile_32bit_tb_1
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


module regfile_32bit_tb_1;

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
            
    regfile_32bit R1(
        .ra1(ra1),
        .ra2(ra2),
        .wa(wa),
        .wd(wd),
        .we(we),
        .clk(clk),
        .rd1(rd1),
        .rd2(rd2)
        );
    
    initial begin
        we = 1'b0;
        wa = 6'b000000;
        wd = 32'habcdef12;
        ra1 = 6'b000000;
        ra2 = 6'b101000;
        
        //#100; we won't be on long enough...
        #60;
        we = 1'b1;
        
        #35;
        ra1 = 6'b101000;
        ra2 = 6'b000000;
        
        #5;
        wa = 6'b101000;
        
    end
    
    always #10 clk = ~clk; //#50;  clk won't be on long enough...
    
           
endmodule
