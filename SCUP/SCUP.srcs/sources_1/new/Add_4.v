`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/19 00:27:53
// Design Name: 
// Module Name: Add_4
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


module Add_4(in, out);
    input wire [31:0] in;
    output  wire  [31:0]  out;
    assign out[31:0] = in[31:0] + 4;
endmodule