`timescale 1ns/1ns
module TB ();
  reg clk = 1, rst = 1;
  wire IF_Flush,RegWrite, ALUSrc, RegDst, memRead, memWrite, memToReg, equal;
  wire [1:0] pcSrc;
  wire [2:0] ALUOp;
  wire [5:0] func, opcode;
  Datapath dp (clk, rst, IF_Flush, pcSrc, RegWrite, ALUSrc, ALUOp, RegDst, memRead, memWrite, memToReg, equal, func, opcode);
  control cu (func, opcode, equal, ALUOp, pcSrc, memRead, memToReg, memWrite, ALUSrc, RegWrite, RegDst, IF_Flush);
  always # 10 clk = ~clk;
  initial begin
    #100
    rst = 0;
    #100000
    $stop;
  end
endmodule

