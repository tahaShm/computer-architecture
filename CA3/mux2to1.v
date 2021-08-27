`timescale 1ns/1ns
module mux21 #(parameter n = 1)(sel, x1, x2, q);
  input sel;
  input signed[n:0] x1;
  input signed[n:0] x2;
  output signed [n:0] q;
  assign q = sel ? x2 : (sel == 0 ? x1 : x1);
endmodule

