`timescale 1ns / 1ps



module cu(input  [2:0] opcode, output reg RegDst, output reg ALUSrc, output reg MemToReg , 
output reg RegWrite , output reg MemRead , output reg MemWrite, output reg [1:0] ALUOp, output reg Branch);


always @(opcode)
begin
case(opcode)
3'b111: //R format       // AND, OR, XOR, ADD, SUB, SLL, SRL, MUL 
begin 
assign RegDst = 1; 
assign ALUSrc = 0; 
assign MemToReg = 0; 
assign RegWrite = 1; 
assign MemRead = 0; 
assign MemWrite = 0; 
assign ALUOp = 10; 
assign Branch=0;
end

3'b100: //I format       // ADDI
begin 
assign RegDst = 0; 
assign ALUSrc = 1; 
assign MemToReg = 0; 
assign RegWrite = 1; 
assign MemRead = 0; 
assign MemWrite = 0; 
assign ALUOp = 10;
assign Branch=0; 
end

3'b111: //R format       // sub
begin 
assign RegDst = 1; 
assign ALUSrc = 0; 
assign MemToReg = 0; 
assign RegWrite = 1; 
assign MemRead = 0; 
assign MemWrite = 0; 
assign ALUOp = 10; 
assign Branch=0;
end

3'b101: //I format       // Slli
begin 
assign RegDst = 0; 
assign ALUSrc = 1; 
assign MemToReg = 0; 
assign RegWrite = 1; 
assign MemRead = 0; 
assign MemWrite = 0; 
assign ALUOp = 10; 
assign Branch=0;
end


3'b000: //I format       // LW
begin 
assign RegDst = 0; 
assign ALUSrc = 1; 
assign MemToReg = 1; 
assign RegWrite = 1; 
assign MemRead = 1; 
assign MemWrite = 0; 
assign ALUOp =00; 
assign Branch=0;
end

3'b001: //I format       // SW
begin 
assign RegDst = 0; 
assign ALUSrc = 1; 
assign MemToReg = 0; 
assign RegWrite = 0; 
assign MemRead = 0; 
assign MemWrite = 1; 
assign ALUOp =00; 
assign Branch=0;
end


3'b011: //I format       // BEQ
begin 
assign RegDst = 0; 
assign ALUSrc = 0; 
assign MemToReg = 0; 
assign RegWrite = 0; 
assign MemRead = 0; 
assign MemWrite = 0; 
assign ALUOp =01; 
assign Branch=1;
end
endcase
end
endmodule
