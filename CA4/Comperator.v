`timescale 1ns/1ns
module Comperator (x1, x2, q);
  input signed [31:0] x1, x2;
  output  q;
  assign q = x1 == x2 ? 1 : 0;
endmodule


