`timescale 1ns / 1ps


module mux_4to1 (s0, s1, s2, d0, d1, d2, d3, z1);

input s0, s1, s2, d0, d1, d2, d3;
output z1;

assign z1 = s1 ? (s2 ? d3 : d1) : (s0 ? d2 : d0);
endmodule
