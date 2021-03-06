`timescale 1ns/1ns
module IrReg (clk, rst, inst, IrWrite, IrOut);
  input [7:0] inst;
  input clk, rst, IrWrite;
  output reg [7:0] IrOut;
  always@(posedge clk, posedge rst) begin
    if (rst)
      IrOut <= 8'b0;
    else if(IrWrite) 
      IrOut <= inst;
  end
endmodule

