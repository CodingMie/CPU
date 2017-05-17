`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/18 13:21:54
// Design Name: 
// Module Name: InsMem
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


module InsMem(InsMemRW, IAddr, IDataIn, IDataOut);
    input InsMemRW;
    input [31:0] IAddr;
    input [31:0] IDataIn;
    output reg [31:0] IDataOut;
    reg [7:0] IMem [0:47];
    initial begin
    $readmemb("init.data",IMem);
    end
    always @(InsMemRW or IAddr) begin
    if (InsMemRW == 0) begin
            IDataOut[31:24]=IMem[IAddr];
            IDataOut[23:16]=IMem[IAddr+1];
            IDataOut[15:8]=IMem[IAddr+2];
            IDataOut[7:0]=IMem[IAddr+3];
       end
     end
endmodule
