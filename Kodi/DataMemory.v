`timescale 1ns / 1ps


module DataMemory(input AdresaNeHyrje, input WriteData, input MemWrite, input MemRead, input clk, output ReadData);

wire[15:0] AdresaNeHyrje;
wire[15:0] WriteData;
reg[15:0] ReadData;
wire MemWrite;
wire MemRead;
wire clk;

reg[15:0] DataMemory[127:0];
initial $readmemh("dataMem.mem", DataMemory);

always @ (posedge clk)
begin
if(MemWrite)
    begin
        DataMemory[AdresaNeHyrje] = WriteData;
    end
if(MemRead)
    begin
        ReadData = DataMemory[AdresaNeHyrje];
    end
end

endmodule
