`timescale 1ns/1ns
module ZeroExtender (x, q);
  input [4:0] x;
  output [7:0] q;
  assign q = x;
endmodule


