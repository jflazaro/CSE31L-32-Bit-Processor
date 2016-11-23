`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 11/20/2016 05:55:48 PM
// Design Name:
// Module Name: IB32bit_Adder
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


module IB32bit_Adder(inc, addr, addr_out);
    parameter AWIDTH = 6;
    
    input logic [AWIDTH-1:0] inc;
    input logic [AWIDTH-1:0] addr;
    output logic [AWIDTH-1:0] addr_out;
    
    //wire toFA0;
    /*wire [AWIDTH:1] toFAnext;
    
    FullAdder1Bit FA0(
        .A(addr[0]),
        .B(inc[0]),
        .Cin(0),
        .Result(addr_out[0]),
        .Cout(toFAnext[1])
    );
    
    genvar i;
    generate
        for (i=1; i<AWIDTH; i++) begin: generate_6bitFA
            FullAdder1Bit FAnext(
                .A(addr[i]),
                .B(inc[i]),
                .Cin(toFAnext[i]),
                .Result(addr_out[i]),
                .Cout(toFAnext[i+1])
            );
        end
    endgenerate*/
    
    assign addr_out = addr + inc;
    
    /*always_comb begin
        addr_out<=addr+inc;
    end*/
endmodule
