`timescale 1ns/1ns
module liRegister #(parameter n = 13)(clk, rst, a, load, init, out);
  input clk,rst;
  input signed [n:0] a;
  input load, init;
  output reg signed[n:0] out;
  always@(posedge clk, posedge rst)begin
    if (rst) out <= 0;
    else if (init) out <= 0;
    else if (load) out <= a;
    else out <= out;
  end
endmodule