`timescale 1ns/1ns
module Cache(clk, address, data1, data2, data3, data4, write, modAdr, hit, miss, out);
  input clk;
  input [31:0] data1,data2,data3,data4;
  output reg [31:0] out;
  output reg hit, miss;
  input write;
  input [14:0] address;
  output [14:0] modAdr;
  reg [35:0] cMemory [0:4095];
  wire [11:0] index;
  wire [2:0] cTag, adrTag;
  wire valid;
  assign index = address[11:0];
  assign adrTag = address[14:12];
  assign cTag = cMemory[index][34:32];
  assign valid = cMemory[index][35];
  always @ (posedge clk) begin
    miss <= 0;
    hit <= 0;
    if ((cTag == adrTag) && (valid == 1))
      hit <= 1;
    else
      miss <= 1;
  end
  assign modAdr = address  - (address % 4);
  always @(*) begin
    cMemory[modAdr] <= (write == 1) ?  {1'b1, adrTag , data1} : cMemory[modAdr];
    cMemory[modAdr + 1] <= (write == 1) ? {1'b1, adrTag , data2} : cMemory[modAdr + 1];
    cMemory[modAdr + 2] <= (write == 1) ? {1'b1, adrTag , data3} : cMemory[modAdr + 2];
    cMemory[modAdr + 3] <= (write == 1) ? {1'b1, adrTag , data4} : cMemory[modAdr + 3];
    out <= cMemory[index][31:0];
  end


endmodule


