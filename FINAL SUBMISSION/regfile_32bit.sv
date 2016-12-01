`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2016 05:12:38 PM
// Design Name: 
// Module Name: regfile_32bit
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

module regfile_32bit(ra1, ra2, wa, wd, we, clk, rd1, rd2);

    parameter RWIDTH = 6;
    parameter DWIDTH = 32;

    input logic [RWIDTH - 1:0]  ra1;
    input logic [RWIDTH - 1:0]  ra2;
    input logic [RWIDTH - 1:0]  wa;
    input logic [DWIDTH - 1:0]  wd;
    input logic                 we;
    input logic                 clk;
    output logic [DWIDTH - 1:0] rd1;
    output logic [DWIDTH - 1:0] rd2;
    logic [DWIDTH-1:0] Mem[(2**RWIDTH)-1:0];
    
//    genvar i;
//    generate
//    for (i=0; i<(2**RWIDTH)-1; i=i+1) begin: clear_mem
//         assign Mem[i] = 32'h00000000;
//    end
//    endgenerate

    // Hardcode zero for Register 0.
    //Needs to be fixed
    //assign Mem[0] = 32'h00000000;

    always_ff @ (posedge clk) begin
       if ((we) && (wa)) begin
                /*Writable only on non-zero register*/
                Mem[wa] <= wd;
       end
       Mem[0] <= 32'h00000000;
    end
    
    always_comb begin
        /*read mode, not confined to clk*/
        rd1 <= Mem[ra1];
        rd2 <= Mem[ra2];
    end
            
    
endmodule
