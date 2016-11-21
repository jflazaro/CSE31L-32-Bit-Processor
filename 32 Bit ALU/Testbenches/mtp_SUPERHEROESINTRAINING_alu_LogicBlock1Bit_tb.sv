`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2016 09:06:27 PM
// Design Name: 
// Module Name: LogicBlock1Bit_tb
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


module LogicBlock1Bit_tb;
    logic [1:0] a;
    logic [1:0] b;
    logic cin;
    //logic [2:0] opsel;
    logic result;
    logic cout;
    
    typedef enum bit[2:0] {
          land=3'h8,
          lor=3'h9,
          lxor=3'hA,
          lnot=3'hB,
          lshl=3'hD
          } optype;
                  
    optype opsel;
    
    LogicBlock1Bit LB(
        .A(a),
        .B(b),
        .Cin(cin),
        .Opsel(opsel),
        .Result(result),
        .Cout(cout)
    );
    
    int i,j,k,l;
    initial begin
        for (i=0; i<2; i++) begin
            a= i;
            for (j=0; j<2; j++) begin
                b= j;
                for (k=0; k<2; k++) begin
                    cin=k;
                    #15; 
                    opsel = land;
                    #15; 
                    opsel = lshl;
                    #15;                                          
                    opsel = lxor;
                    #15; 
                    opsel = lnot;
                    #15; 
                    opsel = lor;
                end
            end
        end
    end
    
    /*for (l=0; l<8; l++) begin
        opsel=l;
        #10;
    end*/
    
    
endmodule
