`timescale 1ns/1ns
module Extender (x, q);
  input [15:0] x;
  output [31:0] q;
  assign q = x;
endmodule
