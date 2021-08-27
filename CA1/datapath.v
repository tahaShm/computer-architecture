`timescale 1ns/1ns
module dataPath (input clk, rst, ldx1, ldx2, lda, ldt, ldw1, initw1, ldw2, initb, ldb, initw2, ldyin, inityin, enNEQ, initNQ,
                  onesel,twosel,xwsel,x1sel,wsel,x2sel,fbsel,secbsel,
                  input[3:0] present,
                  output NEQ, NEQOut, EOF,
                  output signed [13:0] w1Out, w2Out, bOut, w7Copy );
  integer  data_file; 
  integer  scan_file;
  reg eof;
  reg signed [6:0] x1, x2;
  reg signed [1:0] t;
  wire signed [1:0] tOut;
  wire signed [13:0] a = 14'b00000011000000;
  wire signed [6:0] x1Out, x2Out, w0, w5;
  wire signed [13:0] yinOut, w1, w2, w3, w4, w6, w7, w8, wUpt, aOut;
  
  lRegister x1Reg (clk, rst, x1, ldx1, x1Out);
  lRegister x2Reg (clk, rst, x2, ldx2, x2Out);
  lRegister #(13) aReg (clk, rst, a, lda, aOut);
  lRegister #(1) tReg (clk, rst, t, ldt, tOut);
  liRegister w1Reg (clk, rst, wUpt, ldw1, initw1, w1Out);
  liRegister w2Reg (clk, rst, wUpt, ldw2, initw2, w2Out);
  liRegister bReg (clk, rst, wUpt, ldb, initb, bOut);
  liRegister yinReg (clk, rst, w4, ldyin, inityin, yinOut);
  NeqReg neqReg (clk, rst, enNEQ, initNQ, NEQOut);
  mux21 #(6) mux1(onesel,twosel, x1Out, x2Out, w0);
  mux21 mux2(onesel,twosel, w1Out, w2Out, w1);
  mux21 mux3(xwsel, fbsel, w2, bOut, w3);
  mux21 #(6) mux4(x1sel, x2sel, x1Out, x2Out, w5);
  mux21 mux5(wsel, secbsel, w6, a, w7);
  mux31 mux6(x1sel, x2sel, secbsel, w1Out, w2Out, bOut, w8);
  assign NEQ = yinOut[13] ^ tOut[1];
  adderSubtractor adder1(yinOut, w3, 1'b0, w4);
  adderSubtractor adder2(w7, w8, tOut[1], wUpt);
  multiplier2 mult2 (w1, w0, w2);
  multiplier2 mult1 (aOut, w5, w6);
  
  initial begin
   data_file = $fopen("data_set.txt", "r");
    if (data_file == 1) begin
      $display("data_file handle was NULL");
      $finish;
    end
end
always @(posedge clk) begin
    
    if (present == 3) begin
      scan_file = $fscanf(data_file, "%b\n", x1);
      scan_file = $fscanf(data_file, "%b\n", x2);
      scan_file = $fscanf(data_file, "%b\n", t);
      if (!$feof(data_file)) begin
        eof = 0;
      end
      else begin
        eof = 1;
        data_file = $fopen("data_set.txt", "r");
      end
    end
  end
  assign EOF = eof;
  assign w7Copy = w7;
endmodule

