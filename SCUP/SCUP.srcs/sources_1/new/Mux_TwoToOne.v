`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/13 10:54:21
// Design Name: 
// Module Name: Mux_TwoToOne
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


module Mux_TwotoOne(sel,in1,in2,out);
	 input  sel;        // sel=0，选择in1输出，否则选择in2输出
	 input  [31:0]  in1;
	 input  [31:0]  in2;
	 output  reg  [31:0]  out;
	 
	 always@( in1 or in2 or sel) begin
		if( sel== 0 )
			out=in1;        
		else
			out=in2;      
	 end

endmodule
