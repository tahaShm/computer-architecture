`timescale 1ns/1ns
module PcReg (clk, rst, pcLd, pcIn, pcOut);
  input clk, rst, pcLd;
  input [4:0] pcIn;
  output reg [4:0] pcOut;
  always@(posedge clk, posedge rst) begin
    if (rst)
      pcOut <= 10'b0;
    else if (pcLd)
      pcOut <= pcIn;
  end
endmodule




