`timescale 1ns / 1ps

module InstrMemory(input clk, input wire[15:0] Hyrja, output reg[15:0] Dalja);
    

reg[15:0] instrMemory[127:0];

initial $readmemh("instrMem.mem", instrMemory);
always @ (posedge clk)
begin
assign Dalja = instrMemory[Hyrja];    
end
endmodule
