`timescale 1ns / 1ps



module mux_2to1(s, d0, d1, z);

input s, d0, d1;
output z;

assign z = s ? d1 : d0;
endmodule
