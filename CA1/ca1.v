`timescale 1ns/1ns
module CA1 (input start,clk,rst, output done, output[13:0] w7Copy);
  wire ldx1, ldx2, lda, ldt, ldw1, initw1, ldw2, initb, ldb, initw2, ldyin, inityin, enNEQ, initNQ;
  wire onesel, twosel, xwsel, x1sel, wsel, x2sel, fbsel, secbsel;
  wire NEQ, NEQOutM, EOF;
  wire [3:0] present;
  wire signed[13:0] w1,w2,b;
  dataPath dp (.clk(clk), .rst(rst), .ldx1(ldx1), .ldx2(ldx2), .lda(lda), .ldt(ldt), .ldw1(ldw1), .initw1(initw1), .ldw2(ldw2), .initb(initb), .ldb(ldb), .initw2(initw2), .ldyin(ldyin), .inityin(inityin), .enNEQ(enNEQ), .initNQ(initNQ),
                  .onesel(onesel), .twosel(twosel), .xwsel(xwsel), .x1sel(x1sel), .wsel(wsel), .x2sel(x2sel), .fbsel(fbsel), .secbsel(secbsel),
                  .NEQ(NEQ), .NEQOut(NEQOut), .EOF(EOF),
                  .w1Out(w1), .w2Out(w2), .bOut(b), .present(present), .w7Copy(w7Copy));
  control cu (start,clk,rst,EOF,NEQ,NEQOut,
               lda,ldx1,ldx2,ldt,ldyin,ldw1,ldw2,ldb,enNEQ,initb,initw1,initw2,inityin,initNQ,
                          onesel,twosel,xwsel,x1sel,wsel,x2sel,fbsel,secbsel, done, present);
endmodule
