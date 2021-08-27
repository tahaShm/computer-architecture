`timescale 1ns/1ns
module signExtender (x, q);
  input signed[7:0] x;
  output signed [15:0] q;
  assign q = x;
endmodule


