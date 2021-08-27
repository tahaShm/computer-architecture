`timescale 1ns/1ns
module PcReg (clk, rst, pcWrite, pcIn, pcOut);
  input clk, rst, pcWrite;
  input [31:0] pcIn;
  output reg [31:0] pcOut;
  always@(posedge clk, posedge rst) begin
    if (rst)
      pcOut <= 32'b0;
    else if (pcWrite)
      pcOut <= pcIn;
  end
endmodule




