`timescale 1ns/1ns
module TB ();       
  reg clk = 0, rst = 0;
  wire pcWrite, pcWriteCond, pcSrc, IorD, memRead, memWrite, Irwrite, MtoS, ldA, ldB, srcA, srcB, push, pop, tos;
  wire [1:0] AluOp;
  wire [7:0] inst;
  DataPath dp (clk, rst, pcWrite, pcWriteCond, pcSrc, IorD, memRead, memWrite, IrWrite, MtoS, ldA, ldB, srcA, srcB, push, pop, tos, AluOp, inst);
  control cu (clk, rst, inst, pcWrite, pcWriteCond, pcSrc, IorD, memRead, memWrite, IrWrite, MtoS, ldA, ldB, srcA, srcB, push, pop, tos, AluOp);       
  always #10 clk = ~clk;
  initial begin 
    rst = 1;
    #100
    rst = 0;
    #5000
    $stop;
  end
endmodule






