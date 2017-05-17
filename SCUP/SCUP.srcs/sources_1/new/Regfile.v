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
	input  [4:0]	RdReg1addr,RdReg2addr,WrRegaddr; // 读寄存器地址1、2，写寄存器地址
	input  [31:0]  indata;                       // 外部输入的数据32位
	output  [31:0]  reg1dataOut,reg2dataOut;     // 寄存器1、2输出的数据
	reg 	[31:0]  register [1:31];                  // 寄存器宽度32位，共31个，R1 -Rr31
integer  i;                                // 变量

	assign reg1dataOut = (RdReg1addr== 0)? 0 : register[RdReg1addr];   // 读寄存器1数据
	assign reg2dataOut = (RdReg2addr== 0)? 0 : register[RdReg2addr];   // 读寄存器2数据

	always @(posedge  CLK or negedge CLR) begin
		if (CLR == 0) begin  
			for (i=1; i<32; i=i+1)
			register[i] <= 0;                     // 寄存器清0，非阻塞赋值"<="
		end else begin
			if ((WrRegaddr != 0) && (Wre == 1))     // $0寄存器不能修改
			register[WrRegaddr] <= indata;        // 写寄存器，非阻塞赋值"<="
		end
	end
endmodule

