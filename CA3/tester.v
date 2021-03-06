`timescale 1ns/1ns
module Tester ();
  reg clk = 0, rst = 0, push = 0, pop = 0, tos = 0;
  reg [7:0] d_in;
  wire  [7:0] d_out;
  Stack theStack (clk, rst, d_in, push, pop, tos, d_out);
  always #10 clk = ~clk;
  initial begin
    rst = 1;
    #1000
    rst = 0;
    d_in = 10;
    push = 1;
    #100
    d_in = 20;
    push = 0;
    tos = 1;
    #1000
    $stop;
  end
endmodule



