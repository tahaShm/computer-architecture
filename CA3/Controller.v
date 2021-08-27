`timescale 1ns/1ns
module control(input clk, rst, input[7:0] inst, output reg pcWrite, pcWriteCond, pcSrc, IorD, memRead, memWrite, IrWrite, MtoS, ldA, ldB, srcA, srcB, push, pop, tos, output reg [1:0] AluOp);       
reg [3:0] ns,ps;
wire [2:0] opcode;
assign opcode = inst[7:5];
always@(posedge clk, posedge rst) begin
  if (rst) ps <= 0;
  else
   ps <= ns;
end

always@(ps)
begin
  {pcWrite, pcWriteCond, pcSrc, IorD, memRead, memWrite, IrWrite, MtoS, ldA, ldB, srcA, srcB, push, pop, tos} = 0;
  AluOp <= 2'b00;
  case(ps)
    0:begin
      IorD <= 0;
      srcA <= 1;
      srcB <= 1;
      AluOp <= 2'b0;
      pcSrc <= 0;
      pcWrite <= 1;
      memRead <= 1;
      IrWrite <= 1;
    end
    
    1: begin
     tos <= 1;
    end
    
    2:begin 
      pcSrc <= 1;
      pcWrite <= 1;
    end
      
    3: begin
      pop <= 1;
    end
    
    4: begin
      ldA <= 1;
    end
    
    5: begin
      IorD <= 1;
      memWrite <= 1;
    end
    
    6: begin
      AluOp <= 2'b11;
    end
    
    7: begin
      pop <= 1;
    end
    
    8: begin
      ldB <= 1;
    end
    
    9: begin 
      AluOp <= inst[6:5];
    end
    
    10:begin
      push <= 1;
    end
    
    11: begin
      IorD <= 1;
      memRead <= 1;
    end
    
    12: begin
      MtoS <= 1;
      push <= 1;
    end
    
    13: begin
      pcWriteCond <= 1;
      pcSrc <= 1;
    end
    
  endcase
end

always@(ps,opcode)
begin
  case(ps)
    0: ns <= 1;
    1: ns <= (opcode == 3'b110) ? 2 : (opcode == 3'b111 ? 13 : (opcode == 3'b100 ? 11 : 3));
    2: ns <= 0;
    3: ns <= 4;
    4: ns <= (opcode == 3'b101) ? 5 : (opcode == 3'b011 ? 6 : 7);
    5: ns <= 0;
    6: ns <= 10;
    7: ns <= 8;
    8: ns <= 9;
    9: ns <= 10;
    10: ns <= 0;
    11: ns <= 12;
    12: ns <= 0;
    13: ns <= 0;
  endcase
end
endmodule
    
    
  