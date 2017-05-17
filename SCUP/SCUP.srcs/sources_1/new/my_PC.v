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
   input wire clk, reset, PCWre;    // clkΪʱ���źţ�resetΪ�����źţ�PCWreΪPCʹ���ź�
   input  [31:0] nextPC;       // nextPCΪ�¸�PCֵ
   output  reg [31:0] curPC;   // ��ǰPCֵ
   initial begin
   curPC=0;
   end
	// �����ش���
   always@( posedge clk ) begin
      if( reset == 0 )
         curPC = 0;  // PC��ֵΪ0, ��0��ַ��ʼ
      else if (PCWre)
			curPC = nextPC;  // ����ָ��ĵ�ַ
   end
   
endmodule

