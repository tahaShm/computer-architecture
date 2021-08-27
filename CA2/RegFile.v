`timescale 1ns/1ns
module regFile (clk, rst, readReg1, readReg2, writeReg, writeData, regWrite, readData1, readData2);
  input clk, rst, regWrite;
  input [2:0] readReg1, readReg2, writeReg;
  input [15:0] writeData;
  output signed [15:0] readData1, readData2;
  reg signed [15:0] R [0:7];
  assign readData1 = R[readReg1];
  assign readData2 = R[readReg2];
  integer i;
  always@(posedge clk, posedge rst) begin
    if (rst) begin
      for (i = 0 ; i < 8 ; i = i+1) begin
        R[i] = 0;
      end
    end
    else begin
      if (regWrite)
        R[writeReg] = writeData;
    end
  end
endmodule

