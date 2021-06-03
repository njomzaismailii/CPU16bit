`timescale 1ns / 1ps
module CPU(input clk);
    
    wire pcFill = 16'd10;
    wire RegDst;
    wire Alusrc, MemToReg, RegWrite, MemRead, MemWrite;
    wire [1:0] ALUOp;
    wire [2:0] opcode;
 
    cu CPU_CU(opcode, RegDst, ALUSrc, MemToReg , RegWrite , MemRead , MemWrite, ALUOp);
    
    DataPath CPU_DP(clk, pcFill, RegDst, ALUSrc, MemToReg , RegWrite , MemRead , MemWrite, ALUOp, opcode);
    

endmodule