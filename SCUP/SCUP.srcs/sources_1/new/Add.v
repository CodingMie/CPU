`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/18 13:33:06
// Design Name: 
// Module Name: Add
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


module Add( add1, add2, out);
    input [31:0] add1, add2;
    output  [31:0]  out;
    assign out = add1 + add2 * 4;
endmodule
