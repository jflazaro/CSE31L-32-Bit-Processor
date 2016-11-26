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


module regfile_32bit_tb;

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
    
    integer i, j, k, l, m;
    
        for(i = 0; i < (2); i++) begin
            ra1 = i;
            for(j = 0; j < (2); i++) begin
                ra2 = j;
                for(k = 0; k < (2); k++) begin
                    wa = k;
                    for(l = 0; l < (1); l++) begin
                        wd = 32'hFFFFAAAA;
                        for(m = 0; m < 2; m++) begin
                            we = m;
                            #20;  
                        end
                    end
                end
            end 
        end
 
    end
    
    always #10 clk = ~clk;
           
endmodule
