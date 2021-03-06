`timescale 1ns/1ns
module DataPath (input clk, rst, input pcWrite, pcWriteCond, pcSrc, IorD, memRead, memWrite, IrWrite, MtoS, ldA, ldB, srcA, srcB, push, pop, tos, input[1:0] AluOp,  output [7:0] inst);       
  wire w1, w2, zero;
  wire [4:0] w3, w5, pcOut;
  wire [7:0] w4, Inst, IR, MDR, data, Aout, Bout, wa, wb, pc8Out, AluOut, AluRegOut;
  PcReg pc (clk, rst, w2, w5, pcOut);
  DataMem dm (w3, Aout, memWrite, memRead, Inst);
  IrReg ir (clk, rst, Inst, IrWrite, IR);
  MdrReg mdr (clk, rst, Inst, MDR);
  Stack stk (clk, rst, w4, push, pop, tos, data);
  LReg A (clk, rst, ldA, data, Aout);
  LReg B (clk, rst, ldB, data, Bout);
  ZeroReg Z (clk, rst, data, zero);
  ALU AluModule(wa, wb, AluOp, AluOut);
  Reg AluReg (clk, rst, AluOut, AluRegOut);
  ZeroExtender ZExt(pcOut, pc8Out);
  
  assign w1 = zero & pcWriteCond;
  assign w2 = w1 | pcWrite;
  assign w3 = IorD ? IR[4:0] : pcOut;
  assign w4 = MtoS ? MDR : AluRegOut;
  assign wa = srcA ? pc8Out : Aout;
  assign wb = srcB ? 1 : Bout;
  assign w5 = pcSrc ? IR[4:0] : AluOut[4:0]; 
  
  assign inst = Inst;
endmodule





