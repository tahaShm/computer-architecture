`timescale 1ns/1ns
module MdrReg (clk, rst, inst, MdrOut);
  input [7:0] inst;
  input clk, rst;
  output reg [7:0] MdrOut;
  always@(posedge clk, posedge rst) begin
    if (rst)
      MdrOut <= 8'b0;
    else 
      MdrOut <= inst;
  end
endmodule



