`timescale 1ns/1ns
module DataMem (address, writeData, memWrite, memRead, readData );
  input [4:0] address;
  input  signed [7:0] writeData;
  input memRead,  memWrite;
  output reg signed [7:0] readData;
  reg [7:0] dMemory [0:31];
  initial begin
    dMemory[0] = 8'b10011001;      
    dMemory[1] = 8'b10011010;      
    dMemory[2] = 8'b10011011;      
    dMemory[3] = 8'b10011100;      
    dMemory[4] = 8'b10011101;
    
    dMemory[5] = 8'b00000000;      
    dMemory[6] = 8'b00000000;      
    dMemory[7] = 8'b00000000;      
    dMemory[8] = 8'b00000000;      
    dMemory[9] = 8'b00000000;
    
    
    dMemory[25] = 8'b00000001;      
    dMemory[26] = 8'b00000010;      
    dMemory[27] = 8'b00000011;      
    dMemory[28] = 8'b00000100;      
    dMemory[29] = 8'b00000101;
          
  end
  always@(memRead, memWrite) begin
    if (memRead)
      readData <= dMemory[address];
    else if(memWrite) 
      dMemory[address] <= writeData;
  end
endmodule