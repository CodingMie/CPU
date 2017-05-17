`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/13 10:18:50
// Design Name: 
// Module Name: my_PC
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


module PC( clk, reset, PCWre, nextPC, curPC);
   input wire clk, reset, PCWre;    // clk为时钟信号；reset为重置信号；PCWre为PC使能信号
   input  [31:0] nextPC;       // nextPC为下个PC值
   output  reg [31:0] curPC;   // 当前PC值
   initial begin
   curPC=0;
   end
	// 上升沿触发
   always@( posedge clk ) begin
      if( reset == 0 )
         curPC = 0;  // PC初值为0, 从0地址开始
      else if (PCWre)
			curPC = nextPC;  // 下条指令的地址
   end
   
endmodule

