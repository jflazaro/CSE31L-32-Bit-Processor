`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2016 10:17:47 PM
// Design Name: 
// Module Name: DataMemoryGeneral_TB
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


module DataMemoryGeneral_TB;

parameter AWIDTH = 32;
parameter ALENGTH = 128;

logic [AWIDTH - 1:0]WD;
logic MS2;    
logic WE2;
logic [AWIDTH - 1:0] Addr;
logic [AWIDTH - 1:0] WriDat;


DM GeneralDataMemory(
    .WE2(WE2), 
    .Addr(Addr), 
    .WriDat(WriDat), 
    .WD(WD), 
    .MS2(MS2));

initial begin    
   
   MS2 = 1'b0; //should give address as the answer
   Addr = 32'b00000000000000000000000000110111; //should write in MEM[00000000000000000000000000110111] space and read when WE2 =1
   WriDat = 32'b00000000000000000110000000000000;
   WE2 = 1'b0;
   #10;
   WE2 = 1'b1;
   #10;

   Addr = 32'b00000000000000000000000000000000; //should only read MEM[0] and not wirte
   WriDat = 32'b00000000000000000110000000000001;
   WE2 = 1'b0;
   #10;
   WE2 = 1'b1;
   #10;
     
   Addr = 32'b11111111111111111111111111111111; // code should not work because address is too big for the memory
   WriDat = 32'b00000000000000000110000000000001;
   WE2 = 1'b0;
   #10;
   WE2 = 1'b1;
   #10;
    
   MS2 = 1'b1; //should give the answers for the Memory
   Addr = 32'b00000000000000000000000000110111; //should write in MEM[00000000000000000000000000110111] space and read when WE2 =1
   WriDat = 32'b00000000000000000110000000000000;
   WE2 = 1'b0;
   #10;
   WE2 = 1'b1;
   #10;
    
   Addr = 32'b00000000000000000000000000000000; //should only read MEM[0] and not wirte
   WriDat = 32'b00000000000000000110000000000001;
   WE2 = 1'b0;
   #10;
   WE2 = 1'b1;
   #10;
      
   Addr = 32'b11111111111111111111111111111111; // code should not work because address is too big for the memory
   WriDat = 32'b00000000000000000110000000000001;
   WE2 = 1'b0;
   #10;
   WE2 = 1'b1;
   #10;

end
endmodule
