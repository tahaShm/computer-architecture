`timescale 1ns/1ns
module Stack (clk, rst, d_in, push, pop, tos, d_out);
  input clk, rst, push, pop, tos;
  input [7:0] d_in;
  output reg  [7:0] d_out;
  reg [7:0] sMemory [0:255];
  reg [7:0] pointer = 8'b0; 
  always@(posedge clk, posedge rst) begin
    if (rst) begin
      d_out <= 8'b0;
      pointer <= 8'b0;
    end
    else if (tos) begin
      d_out <= sMemory[pointer - 1];
    end
    else if (pop) begin
      d_out <= sMemory[pointer - 1];
      sMemory[pointer - 1] = 0;
      pointer <= pointer - 1;
    end 
    else if (push) begin
      sMemory[pointer] <= d_in;
      pointer <= pointer + 1;
    end 
  end
endmodule

