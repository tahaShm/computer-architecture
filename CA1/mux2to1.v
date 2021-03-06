`timescale 1ns/1ns
module mux21 #(parameter n = 13)(sel1, sel2, x1, x2, q);
  input sel1;
  input sel2;
  input signed[n:0] x1;
  input signed[n:0] x2;
  output signed [n:0] q;
  assign q = sel1 ? x1 : x2;
endmodule
