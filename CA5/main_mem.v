`timescale 1ns/1ns
module mainMem(clk, read, modAdr, done, data1, data2, data3, data4);
  input read, clk;
  input [14:0] modAdr;
  output reg [31:0] data1,data2,data3,data4;
  output  reg done;
  reg [31:0] Memory [32767:0];
  integer i;
  initial begin
    for (i=0; i < 32768; i = i+1)
      Memory[i] = i;
  end
  always @(posedge clk) begin
    if (read == 1) begin
      data1 <= Memory[modAdr];
      data2 <= Memory[modAdr + 1];
      data3 <= Memory[modAdr + 2];
      data4 <= Memory[modAdr + 3];
      done <= 1;
    end
    else begin
      data1 <= 0;
      data2 <= 0;
      data3 <= 0;
      data4 <= 0;
      done <= 0;
    end
  end
endmodule

