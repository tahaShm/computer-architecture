`timescale 1ns/1ns
module Reg (clk, rst, in, out);
  input clk,rst;
  input [7:0] in;
  output reg [7:0] out;
  always@(posedge clk, posedge rst)begin
    if (rst) out <= 0;
    else out <= in;
  end
endmodule
