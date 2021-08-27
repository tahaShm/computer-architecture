`timescale 1ns/1ns
module DataMem (address, writeData, memWrite, memRead, readData );
  input [9:0] address;
  input  signed [15:0] writeData;
  input memRead,  memWrite;
  output reg signed [15:0] readData;
  reg [15:0] dMemory [0:999];
  initial begin
    dMemory[500] = 16'b0000000000000001; 
    dMemory[501] = 16'b0000000000000010; 
    dMemory[502] = 16'b0000000000000011; 
    dMemory[503] = 16'b0000000000000100; 
    dMemory[504] = 16'b0000000000000101; 
    dMemory[505] = 16'b0000000000000110; 
    dMemory[506] = 16'b0000000000000111; 
    dMemory[507] = 16'b0000000000001000; 
    dMemory[508] = 16'b0000000000001001; 
    dMemory[509] = 16'b0000000000001010; 
  end
  always@(memRead, memWrite) begin
    if (memRead)
      readData <= dMemory[address];
    else if(memWrite) 
      dMemory[address] <= writeData;
  end
endmodule