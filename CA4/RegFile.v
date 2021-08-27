`timescale 1ns/1ns
module regFile (clk, rst, readR1, readR2, writeR, writeD, regWrite, readD1, readD2);
  input clk, rst, regWrite;
  input [4:0] readR1, readR2, writeR;
  input signed [31:0] writeD;
  output signed [31:0] readD1, readD2;
  reg signed [31:0] R [0:31];
  assign readD1 = R[readR1];
  assign readD2 = R[readR2];
  integer i;
  always@(negedge clk, posedge rst) begin
    R[0] = 0;
    if (rst) begin
      for (i = 0 ; i < 8 ; i = i+1) begin
        R[i] = 0;
      end
    end
    else begin
      if (regWrite)
        R[writeR] = writeD;
    end
  end
endmodule

