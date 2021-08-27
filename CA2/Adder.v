`timescale 1ns/1ns
module adder #(parameter n = 2)(x1, x2, q);
  input [n:0] x1;
  input [n:0] x2;
  output [n:0] q;
  assign q = x1+x2;
endmodule
