`timescale 1ns/1ns
module insMem (address, instruction);
  input [9:0] address;
  output [15:0] instruction;
  reg [15:0] iMemory [0:999];
  assign instruction = iMemory[address];
  initial begin
    iMemory[0] = 16'b1000000010000000; // window0
    iMemory[1] = 16'b0000000111110100; // load from 500 to R0
    iMemory[2] = 16'b1000010000000010; // add R1 <- R1 + R0
    iMemory[3] = 16'b0000000111110101; // load from 501 to R0
    iMemory[4] = 16'b1000010000000010; // add R1 <- R1 + R0 
    iMemory[5] = 16'b0000000111110110; // load from 502 to R0
    iMemory[6] = 16'b1000010000000010; // add R1 <- R1 + R0
    iMemory[7] = 16'b0000000111110111; // load from 503 to R0
    iMemory[8] = 16'b1000010000000010; // add R1 <- R1 + R0
    iMemory[9] = 16'b0000000111111000; // load from 504 to R0
    iMemory[10] = 16'b1000010000000010; // add R1 <- R1 + R0
    iMemory[11] = 16'b0000000111111001; // load from 505 to R0
    iMemory[12] = 16'b1000010000000010; // add R1 <- R1 + R0
    iMemory[13] = 16'b0000000111111010; // load from 506 to R0
    iMemory[14] = 16'b1000010000000010; // add R1 <- R1 + R0
    iMemory[15] = 16'b0000000111111011; // load from 507 to R0
    iMemory[16] = 16'b1000010000000010; // add R1 <- R1 + R0
    iMemory[17] = 16'b0000000111111100; // load from 508 to R0
    iMemory[18] = 16'b1000010000000010; // add R1 <- R1 + R0
    iMemory[19] = 16'b0000000111111101; // load from 509 to R0
    iMemory[20] = 16'b1000010000000010; // add R1 <- R1 + R0
    iMemory[21] = 16'b0001010000000001; // store mem[1] = R1   
    
    
    
  end
endmodule






