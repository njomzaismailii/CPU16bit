`timescale 1ns / 1ps


module ALUControl(input[1:0] ALUOp, input[3:0] Funct, output reg[3:0] Operacioni);

always @(ALUOp)
begin

case(ALUOp)
2'b00:
begin
assign Operacioni = 4'b0100; //add operacioni
end
2'b01:
begin
assign Operacioni = 4'b1100; //sub
end
2'b10:
begin
    case(Funct)
    6'b100000:
    begin
    assign Operacioni = 4'b0000;//and
    end
    6'b100010:
    begin
    assign Operacioni = 4'b0010;//or
    end
    6'b100100:
    begin
    assign Operacioni = 4'b0011;//xor
    end
    6'b100101:
    begin
    assign Operacioni = 4'b0110;//ror
    end
    6'b101010:
    begin
    assign Operacioni = 4'b0111;//mul
    end
    6'b100111:
    begin
    assign Operacioni = 4'b0101;//addi
    end
    endcase
end
endcase
end

endmodule
