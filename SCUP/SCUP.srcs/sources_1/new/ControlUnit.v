`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/04/17 20:28:47
// Design Name: 
// Module Name: ControlUnit
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

module ControlUnit(
    decode, RegDst,PCWre,ALUSrcB,InsMemRW,
    RegWre,RD,WR,DBDataSrc,PCSrc,ExtSel,ALUOp,ALUSrcA,zero,WrRegDSrc,IRWre
    );
	 input [5:0] decode;
	 input zero;
	 output reg RegOut,PCWre,ALUSrcB,ALUSrcA,InsMemRW,RegWre,RD,WR,DBDataSrc,ExtSel;
	 output reg [1:0]PCSrc, RegDst;
	 output reg [2:0] ALUOp;
	 //若decode(指令操作码)有变化，都会触发以下部分产生新的控制信号
      initial begin
               PCWre = 0;
ALUSrcA=0;
ALUSrcB = 0;
DBDataSrc=0;
RegWre=0;
WrRegDSrc=0;
InsMemRW=0;
RD=0;
WR=0;
IRWre=0;
ExtSel=0;
PCSrc=00;
RegDst=11;
ALUOp = 000;
     end
     always@( decode or zero) begin
         case( decode )
            // add, R-format
            6'b000000:
            begin   //以下都是控制单元产生的控制信号
            PCWre = 1;
            ALUSrcA=0;
            ALUSrcB = 0;
            DBDataSrc=0;
            RegWre=1;
            WrRegDSrc=1;
            InsMemRW=0;
            RegOut = 1;
            RD=0;
            WR=0;
            IRWre=1;
            ExtSel=0;
            PCSrc=00;
            RegDst=10;
            ALUOp = 000;
            end
                        // sub, R-format
        6'b000001:
        begin
        PCWre = 1;
        ALUSrcA=0;
        ALUSrcB = 0;
        DBDataSrc=0;
        RegWre=1;
        WrRegDSrc=1;
        InsMemRW=0;
        RD=0;
        WR=0;
        IRWre=1;
        ExtSel=0;
        PCSrc=00;
        RegDst=10;
        ALUOp = 001;
        end
        // addi
        6'b000010:
        begin
        PCWre = 1;
        ALUSrcA=0;
        ALUSrcB = 1;
        DBDataSrc=0;
        RegWre=1;
        WrRegDSrc=1;
        InsMemRW=0;
        RD=0;
        WR=0;
        IRWre=1;
        ExtSel=1;
        PCSrc=00;
        RegDst=01;
        ALUOp = 000;
        end
        // or
        6'b010000:
        begin
        PCWre = 1;
        ALUSrcA=0;
        ALUSrcB = 0;
        DBDataSrc=0;
        RegWre=1;
        WrRegDSrc=1;
        InsMemRW=0;
        RD=0;
        WR=0;
        IRWre=1;
        ExtSel=0;
        PCSrc=00;
        RegDst=10;
        ALUOp = 101;
        end
        // and
        6'b010001:
        begin
        PCWre = 1;
        ALUSrcA=0;
        ALUSrcB = 0;
        DBDataSrc=0;
        RegWre=1;
        WrRegDSrc=1;
        InsMemRW=0;
        RD=0;
        WR=0;
        IRWre=1;
        ExtSel=0;
        PCSrc=00;
        RegDst=10;
        ALUOp = 110;
        end
        // ori
        6'b010010:
        begin
        PCWre = 1;
        ALUSrcA=0;
        ALUSrcB = 1;
        DBDataSrc=0;
        RegWre=1;
        WrRegDSrc=1;
        InsMemRW=0;
        RD=0;
        WR=0;
        IRWre=1;
        ExtSel=0;
        PCSrc=00;
        RegDst=10;
        ALUOp = 101;
        end
        // sll
        6'b011000:
        begin
        PCWre = 1;
        ALUSrcA=1;
        ALUSrcB = 0;
        DBDataSrc=0;
        RegWre=1;
        WrRegDSrc=1;
        InsMemRW=0;
        RD=0;
        WR=0;
        IRWre=1;
        ExtSel=0;
        PCSrc=00;
        RegDst=10;
        ALUOp = 100;
        end
        //slt
        6'b100110:
        begin
        PCWre = 1;
        ALUSrcA=0;
        ALUSrcB = 0;
        DBDataSrc=0;
        RegWre=1;
        WrRegDSrc=1;
        InsMemRW=0;
        RD=0;
        WR=0;
        IRWre=1;
        ExtSel=0;
        PCSrc=00;
        RegDst=10;
        ALUOp = 010;
        end
        // slti
        6'b100111:
        begin
        PCWre = 1;
        ALUSrcA=0;
        ALUSrcB = 1;
        DBDataSrc=0;
        RegWre=1;
        WrRegDSrc=1;
        InsMemRW=0;
        RD=0;
        WR=0;
        IRWre=1;
        ExtSel=1;
        PCSrc=00;
        RegDst=01;
        ALUOp = 010;
         end
         // sw
         6'b110000:
         begin
         PCWre = 1;
         ALUSrcA=0;
         ALUSrcB = 1;
         DBDataSrc=0;
         RegWre=1;
         WrRegDSrc=0;
         InsMemRW=0;
         RD=0;
         WR=1;
         IRWre=1;
         ExtSel=1;
         PCSrc=00;
         RegDst=11;
         ALUOp = 000;
          end
          // lw
          6'b110001:
          begin
          PCWre = 1;
          ALUSrcA=0;
          ALUSrcB = 1;
          DBDataSrc=1;
          RegWre=1;
          WrRegDSrc=1;
          InsMemRW=0;
          RD=1;
          WR=0;
          IRWre=1;
          ExtSel=1;
          PCSrc=00;
          RegDst=01;
          ALUOp = 000;
           end
        //beq
        6'b110100:
        begin
        PCWre = 1;
        ALUSrcA=0;
        ALUSrcB = 0;
        DBDataSrc=0;
        RegWre=0;
        WrRegDSrc=0;
        InsMemRW=0;
        RD=0;
        WR=0;
        IRWre=1;
        ExtSel=1;
        if (zero) begin
          PCSrc = 01;
        end else begin
          PCSrc = 00;
        end
        RegDst=11;
        ALUOp = 000;
        end
        // j
         6'b111000:
         begin
         PCWre = 1;
         ALUSrcA=0;
         ALUSrcB = 0;
         DBDataSrc=0;
         RegWre=0;
         WrRegDSrc=0;
         InsMemRW=0;
         RD=0;
         WR=0;
         IRWre=1;
         ExtSel=0;
         PCSrc=11;
         RegDst=11;
         ALUOp = 000;
          end
           // jr
           6'b111001:
           begin
           PCWre = 1;
           ALUSrcA=0;
           ALUSrcB = 0;
           DBDataSrc=0;
           RegWre=0;
           WrRegDSrc=0;
           InsMemRW=0;
           RD=0;
           WR=0;
           IRWre=1;
           ExtSel=0;
           PCSrc=10;
           RegDst=11;
           ALUOp = 000;
            end
            // jal
             6'b111010:
             begin
             PCWre = 1;
             ALUSrcA=0;
             ALUSrcB = 0;
             DBDataSrc=0;
             RegWre=1;
             WrRegDSrc=0;
             InsMemRW=0;
             RD=0;
             WR=0;
             IRWre=1;
             ExtSel=0;
             PCSrc=11;
             RegDst=00;
             ALUOp = 000;
              end
        // halt
               6'b111111:
               begin
               PCWre = 0;
               ALUSrcA=0;
               ALUSrcB = 0;
               DBDataSrc=0;
               RegWre=0;
               WrRegDSrc=0;
               InsMemRW=0;
               RD=0;
               WR=0;
               IRWre=0;
               ExtSel=0;
               PCSrc=00;
               RegDst=11;
               ALUOp = 000;
                end
      default:begin
               PCWre = 0;
      ALUSrcA=0;
      ALUSrcB = 0;
      DBDataSrc=0;
      RegWre=0;
      WrRegDSrc=0;
      InsMemRW=0;
      RD=0;
      WR=0;
      IRWre=0;
      ExtSel=0;
      PCSrc=00;
      RegDst=11;
      ALUOp = 000;
      end
endcase
end
endmodule
