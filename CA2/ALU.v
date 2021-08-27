`timescale 1ns/1ns
module ALU (A, B, ALUOp, zero, ALUResult);
  input signed [15:0] A, B;
  input [2:0] ALUOp;
  output zero;
  output signed [15:0] ALUResult;
  assign ALUResult = (ALUOp == 3'b000) ? 15'b0 : 
                      ((ALUOp == 3'b001) ? A + B : 
                        ((ALUOp == 3'b010) ? A - B : 
                          ((ALUOp == 3'b011) ? A & B : 
                            ((ALUOp == 3'b100) ? A | B : 
                              ((ALUOp == 3'b101) ? ~B : 15'b0)))));
  assign zero = (ALUResult == 0) ? 1'b1 : 1'b0;
endmodule



