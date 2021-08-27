`timescale 1ns/1ns
module ZeroReg (clk, rst, in, out);
  input clk,rst;
  input [7:0] in;
  output out;
  assign out = (in == 0) ? 1 : 0;
endmodule


