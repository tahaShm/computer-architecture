`timescale 1ns/1ns
module mux31 #(parameter n = 13)(sel1, sel2, sel3,  x1, x2, x3, q);
  input sel1;
  input sel2;
  input sel3;
  input signed[n:0] x1;
  input signed[n:0] x2;
  input signed[n:0] x3;
  output signed [n:0] q;
  reg signed[n:0] qr;
  
  assign q = sel1 ? x1 : (sel2 ? x2 : (sel3 ? x3 : 0));
endmodule

