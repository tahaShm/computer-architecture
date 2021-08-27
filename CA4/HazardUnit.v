`timescale 1ns/1ns
module HazardUnit (ID_EX_memRead, ID_EX_Rt, Rs, Rt, IF_ID_write, pcWrite, controlSel);
  input ID_EX_memRead;
  input[4:0] ID_EX_Rt, Rs, Rt; 
  output reg pcWrite, IF_ID_write, controlSel;
  always@(*) begin
    pcWrite <= 1;
    IF_ID_write <= 1;
    controlSel <= 1;
    if (ID_EX_memRead == 1 && (ID_EX_Rt == Rs || ID_EX_Rt == Rt)) begin
      pcWrite <= 0;
      IF_ID_write <= 0;
      controlSel <= 0;
    end
  end
endmodule




