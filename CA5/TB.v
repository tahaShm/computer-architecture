`timescale 1ns/1ns
module TB();
  reg clk = 0, mClk = 1, rst = 1;
  reg [14:0] address =  1024 ;
  wire hit, miss, write, read, done, ready;
  wire [14:0] modAdr, counter, hitCounter;
  wire [31:0] data1, data2, data3, data4, out;

  Cache cModule (clk, address, data1, data2, data3, data4, write, modAdr, hit, miss, out);
  mainMem mmModule (mClk, read, modAdr, done, data1, data2, data3, data4);
  control cu (clk, rst, hit, miss, done, hitCounter, counter, write, read, ready);

  always #10 clk = ~clk;
  always #50 mClk = ~ mClk;
  initial begin
    #100
    rst = 0;
    while (address < 9216) begin
      if (ready)
        address = address + 1;
      #25;
    end
    $stop;
  end

endmodule
