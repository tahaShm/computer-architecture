`timescale 1ns/1ns
module multiplier1 #(parameter n = 6)(x1, x2, q);
  input signed[n:0] x1;
  input signed[n:0] x2;
  output signed [2*n+1:0] q;
  assign q = x1*x2;
endmodule

