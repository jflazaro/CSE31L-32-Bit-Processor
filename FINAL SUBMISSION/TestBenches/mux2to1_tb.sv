`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2016 08:06:39 PM
// Design Name: 
// Module Name: MUX2to1_TB
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


module MUX2to1_TB;
   
   parameter AWIDTH = 32;
   
   logic [AWIDTH -1: 0] Addr;
   logic [AWIDTH -1: 0] ReaDat;
   logic MS2;
   logic [AWIDTH -1: 0] WD;
           
   MUX2to1Sele MM(
       .Addr(Addr),
       .ReaDat(ReaDat),
       .MS2(MS2),
       .WD(WD)
       );
      
   initial begin
       Addr= 32'b11111111111111111111111111111111;
       ReaDat = 32'b00000000000000000000000000000000;
       MS2 = 1'b0;
       #10;
       MS2 = 1'b1;
       #10;

       Addr = 32'b101010101010101010101010101010100;
       ReaDat = 32'b01010010110101010011001101111011;
       MS2 = 1'b0;
       #10;
       MS2 = 1'b1;
       #10;
end
          
endmodule