`timescale 1ns/1ns
module PcReg (clk, rst, pcIn, pcOut);
  input clk, rst;
  input [9:0] pcIn;
  output reg [9:0] pcOut;
  always@(posedge clk, posedge rst) begin
    if (rst)
      pcOut <= 10'b0;
    else
      pcOut <= pcIn;
  end
endmodule




