`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/18 13:43:22
// Design Name: 
// Module Name: Extend
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


module Extend(in, ExtSel, out);
    input wire [15:0] in;
    input wire ExtSel;
    output [31:0] out;
    assign out = (ExtSel) ? {{16{in[15]}}, in[15:0]}:{{16{1'b0}}, in[15:0]};
    
endmodule
