`timescale 1ns / 1ps



module full_adder(a, b, cin, sum, cout);


input a, b, cin;
output sum, cout;

xor inst1 (net1, a, b);
and inst2 (net2, a, b);
xor inst3 (sum, net1, cin);
and inst4 (net3, net1, cin);
or inst5 (cout, net3, net2);

endmodule
