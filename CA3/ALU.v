`timescale 1ns/1ns
module ALU (A, B, ALUOp, ALUResult);
  input signed [7:0] A, B;
  input [1:0] ALUOp;
  output signed [7:0] ALUResult;
  assign ALUResult = (ALUOp == 2'b00) ? A + B : 
                      ((ALUOp == 2'b01) ? A - B : 
                        ((ALUOp == 2'b10) ? A & B : 
                          ((ALUOp == 2'b11) ? ~A : 7'b0)));
endmodule



