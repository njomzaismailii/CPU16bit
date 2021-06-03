`timescale 1ns / 1ps


module ALU_Testbench(

    );
    
    
reg a, b, cin,ainvert, bnegate;
reg[2:0] op;
wire result;
wire cout;


initial 
$monitor ("a = %b, b = %b, cin = %b,ainvert=%b, cout = %b, op2 = %b, op1 = %b, op0 = %b,  bnegate = %b, result = %b",
a, b, cin, ainvert, cout,op[2], op[1], op[0], bnegate, result);

initial
begin

//AND
 #10 a=0; b=0; cin=0; ainvert=0;  op[0]=0; op[1]=0; op[2]=0;bnegate=0;
  #10 a=0; b=1; cin=0;ainvert=0;  op[0]=0; op[1]=0; op[2]=0;bnegate=0;
  #10 a=1; b=0; cin=0; ainvert=0; op[0]=0; op[1]=0; op[2]=0;bnegate=0;
  #10 a=1; b=1; cin=0;ainvert=0;  op[0]=0; op[1]=0; op[2]=0;bnegate=0;
//OR
  #10 a=0; b=0; cin=0; ainvert=0;  op[0]=0; op[1]=1; op[2]=0;bnegate=0;
  #10 a=0; b=1; cin=0;ainvert=0;  op[0]=0; op[1]=1; op[2]=0;bnegate=0;
  #10 a=1; b=0; cin=0; ainvert=0; op[0]=0; op[1]=1; op[2]=0;bnegate=0;
  #10 a=1; b=1; cin=0;ainvert=0;  op[0]=0; op[1]=1; op[2]=0;bnegate=0;
//XOR
  #10 a=0; b=0; cin=0; ainvert=0;  op[0]=0; op[1]=1; op[2]=1;bnegate=0;
  #10 a=0; b=1; cin=0;ainvert=0;  op[0]=0; op[1]=1; op[2]=1;bnegate=0;
  #10 a=1; b=0; cin=0; ainvert=0; op[0]=0; op[1]=1; op[2]=1;bnegate=0;
  #10 a=1; b=1; cin=0;ainvert=0;  op[0]=0; op[1]=1; op[2]=1;bnegate=0;

#10 $stop;
end


alu_1bit a1(a, b, cin,ainvert,bnegate, op, result,cout);

endmodule
