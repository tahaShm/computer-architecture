`timescale 1ns/1ns
module Adder (x1, x2, q);
  input signed [31:0] x1, x2;
  output signed [31:0] q;
  assign q = x1 + x2;
endmodule




