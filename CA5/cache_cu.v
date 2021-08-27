`timescale 1ns/1ns
module control(clk, rst, hit, miss, done, hitCounter, counter, write, read, ready);
  input clk, rst, hit, miss, done;
  output reg [14:0] counter, hitCounter;    
  output reg write, read, ready;
  reg [1:0] ns,ps;
  always@(posedge clk) begin
    if (rst) begin
      ps <= 0;
      counter <= 0;
      hitCounter <= 0;
    end
    else
      ps <= ns;
  end

  always@(ps)
  begin
    {read, write, ready} = 3'b0;
    case(ps)
      0: begin
        ready <= 1;
      end
      1: begin
        hitCounter <= hitCounter + 1;
        counter <= counter + 1;
      end
      2: begin
        read <= 1;
      end
      3: begin
        read <= 0;
        write <= 1;
        counter = counter + 1;
      end
    endcase
  end

  always@(ps,clk,hit,miss,done)
  begin
    case(ps)
      0: ns <= (hit == 0 && miss == 0) ? 0 : ((hit == 1 && miss == 0) ? 1 : ((hit == 0 && miss == 1) ? 2 : 0));
      1: ns <= 0;
      2: ns <= (done == 1) ? 3 : 2;
      3: ns <= 0;
    endcase
  end
endmodule
