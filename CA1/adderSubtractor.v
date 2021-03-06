`timescale 1ns/1ns
module adderSubtractor #(parameter n = 13)(x1, x2, mode, q);
  input signed[n:0] x1;
  input signed[n:0] x2;
  input mode;
  output signed [n:0] q;
  assign q = mode ? x2-x1 : x1+x2;
endmodule