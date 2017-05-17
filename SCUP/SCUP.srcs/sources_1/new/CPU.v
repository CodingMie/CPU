`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/13 10:13:46
// Design Name: 
// Module Name: CPU
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


module CPU(
input clock,
input reset
    );
    wire [31:0] nextPC, CurPC, Ins, result, DB, PCOut1,PCOut2, Imm, ReadData1, ReadData2, aluA, aluB, DataOut;
    wire PCWre, InsMemRW, RegWre, ALUSrcB, ALUSrcA, 
    ExtSel, zero, DBDataSrc, RD, WR, RegOut;
    wire [4:0] WriRegAddr;
    wire [2:0] ALUOp;
    
    
    PC pc(.clk(clock), .reset(reset),
     .PCWre(PCWre), .nextPC(nextPC), .curPC(CurPC));
     Add_4 add1(.in(CurPC), .out(PCOut1));
     Add add2(.add1(PCOut1), .add2(Imm), .out(PCOut2));
     InsMem insMem(.InsMemRW(InsMemRW), .IAddr(CurPC), .IDataIn(1'b0), .IDataOut(Ins));
     Mux_TwotoOne5 WriReg(.sel(RegOut),.in1(Ins[20:16]),.in2(Ins[15:11]),.out(WriRegAddr));
     Regfile regFile(.CLK(clock),.Wre(RegWre),.CLR(1'b1),.RdReg1addr(Ins[25:21]),.RdReg2addr(Ins[20:16]),.WrRegaddr(WriRegAddr),
     .indata(DB),.reg1dataOut(ReadData1),.reg2dataOut(ReadData2));
     Mux_TwotoOne_sa readData1(.sel(ALUSrcA), .in1(ReadData1), .in2(Ins[10:6]), .out(aluA));
     Mux_TwotoOne readData2(.sel(ALUSrcB), .in1(ReadData2), .in2(Imm), .out(aluB));
     ALU32 alu(.ALUopcode(ALUOp), .rega(aluA), .regb(aluB), .result(result), .zero(zero));
     DataMem DataMem(.RD(RD), .WR(WR), .DAddr(result), .DataIn(ReadData2), .DataOut(DataOut), .CLK(clock));
     Mux_TwotoOne db(.sel(DBDataSrc), .in1(result), .in2(DataOut), .out(DB));
      ControlUnit CU(.decode(Ins[31:26]), .RegOut(RegOut),.PCWre(PCWre),.ALUSrcB(ALUSrcB),.InsMemRW(InsMemRW),
             .RegWre(RegWre),.RD(RD),.WR(WR),.DBDataSrc(DBDataSrc),.PCSrc(PCSrc),.ExtSel(ExtSel),.ALUOp(ALUOp),.ALUSrcA(ALUSrcA), .zero(zero));
      Extend Extend(.in(Ins[15:0]), .ExtSel(ExtSel), .out(Imm));
      Mux_TwotoOne pc_ins(.sel(PCSrc), .in1(PCOut1), .in2(PCOut2), .out(nextPC));
endmodule
