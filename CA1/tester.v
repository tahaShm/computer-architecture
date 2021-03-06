`timescale 1ns/1ns
module Tester ();
  reg signed [13:0] x1, x2;
  reg mode;
  wire signed [13:0] q;
  lRegister tester(x1, x2, mode, q);
  initial begin
    x1 = 14'b00000111010010;
    x2 = 14'b11100000101010;
    mode = 0;
    #100
    mode = 1;
    #1000
    $stop;
  end
  
endmodule


