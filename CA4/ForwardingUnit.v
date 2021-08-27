`timescale 1ns/1ns
module ForwardingUnit (EX_MEM_RegWrite, EX_MEM_Rd, MEM_WB_RegWrite, MEM_WB_Rd, ID_EX_Rt, ID_EX_Rs, forwardA, forwardB);
  input EX_MEM_RegWrite, MEM_WB_RegWrite;
  input[4:0] EX_MEM_Rd, MEM_WB_Rd, ID_EX_Rt, ID_EX_Rs; 
  output reg [1:0] forwardA, forwardB;
  always@(*) begin
    forwardA = 2'b00;
    forwardB = 2'b00;
    if (EX_MEM_RegWrite == 1 && EX_MEM_Rd == ID_EX_Rs && ID_EX_Rs != 0)
      forwardA = 2'b10;
    else if (MEM_WB_RegWrite == 1 && MEM_WB_Rd == ID_EX_Rs && ID_EX_Rs != 0)
      forwardA = 2'b01;
    if (EX_MEM_RegWrite == 1 && EX_MEM_Rd == ID_EX_Rt && ID_EX_Rt != 0)
      forwardB = 2'b10;
    else if (MEM_WB_RegWrite == 1 && MEM_WB_Rd == ID_EX_Rt && ID_EX_Rt != 0)
      forwardB = 2'b01;
  end
endmodule


