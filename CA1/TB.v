`timescale 1ns/1ns
module TB ();
  reg start,clk,rst;
  wire done;
  wire signed [13:0] w7Copy;
  CA1 ca1(start, clk, rst, done, w7Copy);
  always #100 clk = !clk;
  initial begin
    clk = 0;
    start = 0;
    rst = 0;
    #200
    start = 1;
    rst = 1;
    #200
    start = 1;
    rst = 0;
    #200
    start = 0;
    #5000000    
    $stop;
  end
  
endmodule

