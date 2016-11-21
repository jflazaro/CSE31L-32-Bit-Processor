`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2016 11:16:18 PM
// Design Name: 
// Module Name: alu_1bit_tb
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


module alu_1bit_tb;

logic[ 1:0] op1 ;
logic[ 1:0] op2 ;
logic [1:0] cin;
logic result ;
logic cout;
logic c_flag ;
logic z_flag ;
logic o_flag ;
logic s_flag ;

typedef enum bit[3:0] {
              add=4'h0,
              subwb=4'h1,
              mov=4'h2,
              sub=4'h3,
              inc=4'h4,
              dec=4'h5,
              addinc=4'h6,
              land=4'h8,
              lor=4'h9,
              lxor=4'hA,
              lnot=4'hB,
              lshl=4'hD
              } optype;
              
optype mode_sel;

alu_1bit ALU1(
    .op1(op1),
    .op2(op2),
    .cin(cin),
    .opsel(mode_sel[2:0]),
    .mode(mode_sel[3]),
    .result(result),
    .cout(cout)
);

int i,j,k,l;
    initial begin
        for (i=0; i<2; i++) begin
            op1= i;
            for (j=0; j<2; j++) begin
                op2= j;
                for (k=0; k<2; k++) begin
                    cin=k;
                    mode_sel = add;
                    #15; 
                    mode_sel = subwb; 
                    #15; 
                    mode_sel = sub;
                    #15; 
                    mode_sel = inc;
                    #15; 
                    mode_sel = dec;
                    #15; 
                    mode_sel = addinc;
                    #15; 
                    mode_sel = land;
                    #15; 
                    mode_sel = lshl;
                    #15;                                          
                    mode_sel = lxor;
                    #15; 
                    mode_sel = lnot;
                    #15; 
                    mode_sel = lor;
                end
            end
        end
    end

endmodule
