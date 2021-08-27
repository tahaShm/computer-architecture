`timescale 1ns/1ns
module TB ();
  wire ldw, wdsel, regwrite, pc1sel, pc2sel, asel, memread, memwrite, memtoreg;
  reg clk, rst;
  wire[2:0] aluop;
  wire zero;
  wire [15:0] ins;
  dataPath dp (clk, rst, ldw, wdsel, regwrite, pc1sel, pc2sel, asel, memread, memwrite, memtoreg, aluop, zero, ins);
  controller cu (clk, zero, ins, aluop, pc1sel, pc2sel, wdsel, ldw, regwrite, asel, memwrite, memread, memtoreg);
  always # 50 clk = ~clk;
  initial begin
    rst = 1;
    clk = 1;
    #200
    rst = 0;
    #10000
    $stop;
  end
endmodule





