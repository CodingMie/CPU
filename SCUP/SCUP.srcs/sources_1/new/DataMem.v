`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/18 11:32:16
// Design Name: 
// Module Name: DataMem
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


module DataMem(RD, WR, DAddr, DataIn, DataOut,CLK);
    input CLK;
    input RD, WR;
    input [31:0]  DAddr, DataIn;
    output reg [31:0] DataOut;
    reg [7:0] Mem [0:100];
    initial begin
    DataOut=0;
    end
    always @(negedge CLK) begin
    if (RD == 1) begin
            DataOut[31:24]=Mem[DAddr];
            DataOut[23:16]=Mem[DAddr+1];
            DataOut[15:8]=Mem[DAddr+2];
            DataOut[7:0]=Mem[DAddr+3];
     end else begin
       if (WR == 1) begin
            Mem[DAddr]=DataIn[31:24];
            Mem[DAddr+1]=DataIn[23:16];
            Mem[DAddr+2]=DataIn[15:8];
            Mem[DAddr+3]=DataIn[7:0];
       end
       end
     end
endmodule
