`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2016 06:01:03 PM
// Design Name: 
// Module Name: ArithmeticBlock1Bit_tb
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


module ArithmeticBlock1Bit_tb;

    logic [1:0] a;
    logic [1:0] b;
    logic cin;
    //logic [2:0] opsel;
    logic result;
    logic cout;
    
    typedef enum bit[2:0] {
          add=3'h0,
          subwb=3'h1,
          mov=3'h2,
          sub=3'h3,
          inc=3'h4,
          dec=3'h5,
          addinc=3'h6
          } optype;
                  
    optype opsel;
    
    
    ArithmeticBlock1Bit AB1(
        .A(a),
        .B(b),
        .Cin(cin),
        .opsel(opsel),
        .Result(result),
        .Cout(cout)
        );
    
    int i,j,k,l;
    initial begin
        a=0;
        b=0;
        cin=0;
        
        for(i=0; i<2; i++) begin
            a = i;
            for (j = 0; j<2; j++) begin
                b = j;
                for (k = 0; k<2; k++) begin
                    cin = k;
                    opsel = add;
                    #15; 
                    opsel = subwb; 
                    #15; 
                    opsel = sub;
                    #15; 
                    opsel = inc;
                    #15; 
                    opsel = dec;
                    #15; 
                    opsel = addinc;
                end
            end
        end
    end

endmodule
