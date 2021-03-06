`timescale 1ns/1ns
module multiplier2 (x1, x2, q);
  input signed[13:0] x1;
  input signed[6:0] x2;
  output signed [13:0] q;
  wire signed [20:0] qAll;
  assign qAll = x1*x2;
  assign q = qAll[17:4];
endmodule

