`timescale 1ns/1ns
module ALU (A, B, ALUOp, zero, Result);
  input signed [31:0] A, B;
  input [2:0] ALUOp;
  output zero;
  output signed [31:0] Result;
  assign Result = (ALUOp == 3'b000) ? 15'b0 : 
                      ((ALUOp == 3'b001) ? A + B : 
                        ((ALUOp == 3'b010) ? A - B : 
                          ((ALUOp == 3'b011) ? A & B : 
                            ((ALUOp == 3'b100) ? A | B : 
                              ((ALUOp == 3'b101) ? (B > A ? 1 : 0) : 15'b0)))));
  assign zero = (Result == 0) ? 1'b1 : 1'b0;
endmodule



