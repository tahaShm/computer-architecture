`timescale 1ns/1ns
module lRegister #(parameter n = 6)(clk, rst, inp, load, out);
  input clk,rst;
  input signed [n:0] inp;
  input load;
  output reg signed[n:0] out;
  always@(posedge clk, posedge rst)begin
    if (rst) out <= 0;
    else if (load) out <= inp;
    else out <= out;
  end
endmodule
