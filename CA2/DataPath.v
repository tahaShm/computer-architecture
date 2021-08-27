`timescale 1ns/1ns
module dataPath (input clk, rst, ldw, wdsel, regwrite, pc1sel, pc2sel, asel, memread, memwrite, memtoreg, input[2:0] aluop, output zero, output[15:0] inst);
  wire [9:0] w1, w2, w3, pcOut, pcIn;
  wire signed [15:0] w4, w5, rd1, rd2, rd, rdout, aluout, wd;
  wire [15:0] ins;
  wire [2:0] rr1, rr2, wOut;
  PcReg pcmodule(clk, rst, pcIn, pcOut);
  insMem insmodule(pcOut, ins);
  regFile regmodule(clk, rst, rr1, rr2, rr1, wd, regwrite, rd1, rd2);
  ALU alumodule(w5, rd2, aluop, zero, aluout);
  DataMem memmodule(ins[9:0], rd1, memwrite, memread, rd);
  signExtender signmodule(ins[7:0], w4);
  wndReg wndmodule(clk, rst, ins[1:0], ldw, wOut);
  assign w5 = asel ? w4 : rd1;
  assign rdout = memtoreg ? rd : aluout;
  assign rr1 = ins[11:10] + wOut;
  assign rr2 = ins[9:8] + wOut;
  assign w1 = 1 + pcOut;
  assign w2 = {w1[9:8],ins[7:0]};
  assign w3 = pc1sel ? w2 : w1;
  assign pcIn = pc2sel ? ins[9:0] : w3;
  assign wd = wdsel ? rdout : rd2;
  assign inst = ins;
endmodule




