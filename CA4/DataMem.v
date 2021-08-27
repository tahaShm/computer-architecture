`timescale 1ns/1ns
module DataMem (clk, rst, address, writeD, memWrite, memRead, readD );
  input [31:0] address;
  input  signed [31:0] writeD;
  input clk, rst,  memRead,  memWrite;
  output signed [31:0] readD;
  reg [31:0] dMemory [0:4095];
  initial begin
    dMemory[900] = 1000;
    dMemory[901] = 1004;
    dMemory[902] = 1;
    dMemory[1000] = 5;
    dMemory[1001] = 4;
    dMemory[1002] = 6;
    dMemory[1003] = 12;
    dMemory[1004] = 1;
  end
  assign readD = dMemory[address[11:0]];
  always@(negedge clk, posedge rst) begin
    if(memWrite) 
      dMemory[address[11:0]] <= writeD;
  end
endmodule