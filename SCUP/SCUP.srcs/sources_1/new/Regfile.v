`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/13 11:04:04
// Design Name: 
// Module Name: Regfile
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
module Regfile (CLK,Wre,CLR,RdReg1addr,RdReg2addr,WrRegaddr,indata,reg1dataOut,reg2dataOut);
	input  CLK, Wre,CLR;
	input  [4:0]	RdReg1addr,RdReg2addr,WrRegaddr; // ���Ĵ�����ַ1��2��д�Ĵ�����ַ
	input  [31:0]  indata;                       // �ⲿ���������32λ
	output  [31:0]  reg1dataOut,reg2dataOut;     // �Ĵ���1��2���������
	reg 	[31:0]  register [1:31];                  // �Ĵ������32λ����31����R1 -Rr31
integer  i;                                // ����

	assign reg1dataOut = (RdReg1addr== 0)? 0 : register[RdReg1addr];   // ���Ĵ���1����
	assign reg2dataOut = (RdReg2addr== 0)? 0 : register[RdReg2addr];   // ���Ĵ���2����

	always @(posedge  CLK or negedge CLR) begin
		if (CLR == 0) begin  
			for (i=1; i<32; i=i+1)
			register[i] <= 0;                     // �Ĵ�����0����������ֵ"<="
		end else begin
			if ((WrRegaddr != 0) && (Wre == 1))     // $0�Ĵ��������޸�
			register[WrRegaddr] <= indata;        // д�Ĵ�������������ֵ"<="
		end
	end
endmodule

