`timescale 1ns / 1ps



module DataPath(input clk, input pcFill, input RegDst, input ALUSrc, 
input  MemToReg , input  RegWrite , input MemRead , input MemWrite, input ALUOp, output opcode);


wire [15:0]instruksioni;

wire [2:0] RS;
wire [2:0] RT;
wire [2:0] RD;
wire [3:0] funct;
wire [6:0] immediate;
wire [15:0] WD;
wire MemWrite, MemRead, clk;
wire [15:0] RD1, RD2, alu2, imm_long, AdresaNeHyrje;
wire ainvert,bnegate, s0, s1, s2;
wire [2:0] op;

reg s;          // e kthyer nga wire s ne reg s
reg [15:0] pc;  // e shtuar

wire[15:0] ReadData; 
wire result, cout;
wire RFwe;
wire[15:0] pcFill, pc2;

PCcounter pcdp(pc, b, cin, pc_now, cout);
initial begin
    assign pc = 16'd0;
end


always @(posedge clk)
begin
    assign pc = pcFill;
end

assign pc2 = pc + 16'd2; 

InstrMemory DPIM(clk, pcFill, instruksioni);


assign opcode = instruksioni[15:13];
assign RS = instruksioni[12:10];
assign RT = instruksioni[9:7];
assign RD = instruksioni[6:4];
assign funct = instruksioni[3:0];
assign immediate = instruksioni[6:0];


always @(opcode)
begin
    if(opcode == 3'd00)
    //formati R
    s = 1;
    else
    //formati I;
    s = 0;
    
end

mux_2to1 M21HyrjeRF(s, RT, RD, z);
RegisterFile RF(RS, RT, RD, WD, RFwe, RD1, RD2);


assign imm_long = {{7{immediate[5]}}, immediate[6:0]};
assign alu2 = s ? imm_long : RD2;

ALUControl ALUControl(s, funct, op);

alu_16bit aluRF( RD1, alu2,bnegate,ainvert,bnegate, op, result,cout);
DataMemory DPDM(AdresaNeHyrje, WD, MemWrite, MemRead, clk, ReadData );


assign RFwe = 1;
assign WD = s  ?  (MemToReg==1 ? ReadData : 0): result;

endmodule
