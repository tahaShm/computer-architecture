`timescale 1ns/1ns
module LReg (clk, rst, ld, in, out);
  input clk, rst, ld;
  input [7:0] in;
  output reg [7:0] out;
  always@(posedge clk, posedge rst)begin
    if (rst) out <= 0;
    else if (ld)
      out <= in;
  end
endmodule


