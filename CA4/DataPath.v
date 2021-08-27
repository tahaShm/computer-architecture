`timescale 1ns/1ns
module Datapath (clk, rst, IF_Flush, pcSrc, RegWrite, ALUSrc, ALUOp, RegDst, memRead, memWrite, memToReg, equal, func, opcode);
  input clk, rst, IF_Flush, RegWrite, ALUSrc, RegDst, memRead, memWrite, memToReg; 
  input [1:0] pcSrc;
  input [2:0] ALUOp;
  output equal;
  output [5:0] func, opcode;
  wire zIn, zOut, ID_EX_RegWrite, ID_EX_memToReg, ID_EX_memRead, ID_EX_memWrite, ID_EX_ALUSrc, ID_EX_RegDst
          , EX_MEM_Regwrite, EX_MEM_Memtoreg, EX_MEM_Memwrite, EX_MEM_Memread, MEM_WB_RegWrite, MEM_WB_MemtoReg
          , inAlusrc, inRegdst, inMemread, inMemwrite, inRegwrite, inMemToReg, pcWrite, IF_ID_write, controlSel;
  wire signed [31:0] A, B, Result;
  wire [31:0] pcIn, pcOut, pcAdd, inInst, IF_ID_Pc, Inst, forwardIn, ALUOut, forwardOut, RD1, RD2, WD, w1
          , extended, pcBranch, RDIn, pcJump, extOut, ALUOut2, RdOut2, RD1out, RD2out;
  wire [4:0] RdOut, EX_MEM_Rd, MEM_WB_Rd, Rs, Rt, Rd, ID_EX_Rt, ID_EX_Rd, ID_EX_Rs;
  wire [1:0] forwardA, forwardB;
  wire [2:0] inAluop, ID_EX_ALUOp;

  ALU aluModule (A, B, ID_EX_ALUOp, zIn, Result);
  PcReg pcModule (clk, rst, pcWrite, pcIn, pcOut);
  IF_ID ifidModule (clk, rst, IF_ID_write, IF_Flush, pcAdd, inInst, IF_ID_Pc, Inst);
  EX_MEM exmemModule (clk, rst, ID_EX_RegWrite, ID_EX_memToReg, ID_EX_memWrite, ID_EX_memRead, zIn,
            Result,forwardIn,
            RdOut,
            EX_MEM_Regwrite, EX_MEM_Memtoreg, EX_MEM_Memwrite, EX_MEM_Memread, zOut,
            ALUOut, forwardOut,
            EX_MEM_Rd);

  Comperator compModule (RD1, RD2, equal);
  regFile rfModule (clk, rst, Rs, Rt, MEM_WB_Rd, WD, MEM_WB_RegWrite, RD1, RD2);
  Adder add1 (w1, pcOut, pcAdd);
  Adder add2 (IF_ID_Pc, extended, pcBranch);
  HazardUnit hazard (ID_EX_memRead, ID_EX_Rt, Rs, Rt, IF_ID_write, pcWrite, controlSel);
  ForwardingUnit forwarding (EX_MEM_Regwrite, EX_MEM_Rd, MEM_WB_RegWrite, MEM_WB_Rd, ID_EX_Rt, ID_EX_Rs, forwardA, forwardB);
  MEM_WB memwbModule (clk, rst, EX_MEM_Regwrite, EX_MEM_Memtoreg,
            RDIn,ALUOut,
            EX_MEM_Rd,
            MEM_WB_RegWrite,MEM_WB_MemtoReg,
            RdOut2, ALUOut2,
            MEM_WB_Rd);

  Extender extModule(Inst[15:0], extended);
  DataMem dmModule (clk, rst, ALUOut, forwardOut, EX_MEM_Memwrite, EX_MEM_Memread, RDIn);
  insMem imModule (pcOut, inInst);
  ID_EX idexModule (clk, rst, inAlusrc, inRegdst, inMemread, inMemwrite, inRegwrite, inMemToReg,
            inAluop,
            RD1, RD2, extended,
            Rt, Rd, Rs,
            ID_EX_ALUSrc, ID_EX_RegDst, ID_EX_memRead, ID_EX_memWrite, ID_EX_RegWrite, ID_EX_memToReg,
            RD1out,RD2out,extOut,
            ID_EX_Rt, ID_EX_Rd, ID_EX_Rs,
            ID_EX_ALUOp);

            
  
  assign Rs = Inst[25:21];
  assign Rt = Inst[20:16];
  assign Rd = Inst[15:11];
  assign w1 = 1;
  assign inAlusrc = controlSel == 1 ? ALUSrc : 0;
  assign inRegdst = controlSel == 1 ? RegDst : 0;
  assign inMemread = controlSel == 1 ? memRead : 0;
  assign inMemwrite = controlSel == 1 ? memWrite : 0;
  assign inRegwrite = controlSel == 1 ?  RegWrite: 0;
  assign inMemToReg = controlSel == 1 ? memToReg : 0;
  assign inAluop = controlSel == 1 ? ALUOp : 0;
  assign pcJump = {pcOut[31:26], Inst[25:0]};

  assign pcIn = pcSrc == 0 ? pcAdd : (pcSrc == 1 ? pcBranch : (pcSrc == 2 ? pcJump : pcAdd));
  assign A = forwardA == 0 ? RD1out : (forwardA == 1 ? WD : (forwardA == 2 ? ALUOut : RD1out));
  assign forwardIn = forwardB == 0 ? RD2out : (forwardB == 1 ? WD : (forwardB == 2 ? ALUOut : RD2out));
  assign B = ID_EX_ALUSrc == 0 ? forwardIn : (ID_EX_ALUSrc == 1 ? extOut : forwardIn);
  assign RdOut = ID_EX_RegDst == 0 ? ID_EX_Rt : (ID_EX_RegDst == 1 ? ID_EX_Rd : ID_EX_Rt);
  assign WD = MEM_WB_MemtoReg == 0 ? ALUOut2 : (MEM_WB_MemtoReg == 1 ? RdOut2 : ALUOut2);

  assign func = Inst[5:0];
  assign opcode = Inst[31:26];

endmodule
