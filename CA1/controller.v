`timescale 1ns/1ns
module control(input start,clk,rst,EOF,NEQ,NEQOut,
               output reg lda,ldx1,ldx2,ldt,ldyin,ldw1,ldw2,ldb,enNEQ,initb,initw1,initw2,inityin,initNQ,
                          onesel,twosel,xwsel,x1sel,wsel,x2sel,fbsel,secbsel, done,
                output reg [3:0] present);       
reg [3:0] ns,ps;
parameter [3:0] idle = 0,starting = 1,nqstate = 2, reading = 3, waiting = 4, reseting = 5, firstx = 6, secx = 7, addb = 8, check = 9, firstupt = 10, secupt = 11, uptb = 12;
always@(posedge clk,posedge rst) begin
  if (rst) ps <= idle;
  else
   ps <= ns;
  present <= ps;  
end

always@(ps)
begin
  {lda,ldx1,ldx2,ldt,ldyin,ldw1,ldw2,ldb} = 0;
  {initb,initw1,initw2,inityin,initNQ} = 0;
  {onesel,twosel,xwsel,x1sel,wsel,x2sel,fbsel,secbsel} = 0;
  done = 0;
  enNEQ = 0;
  case(ps)
    idle:
      done = 1;
    starting: begin
     lda = 1;
     initb = 1;
     initw1 = 1;
     initw2 = 1;
    end
    
    nqstate: 
      initNQ = 1;
      
    reseting: begin
      inityin = 1;
      ldx1 = 1;
      ldx2 = 1;
      ldt = 1;
    end
    
    firstx: begin
      onesel = 1;
      xwsel = 1;
      ldyin = 1;
    end
    secx: begin
      twosel = 1;
      xwsel = 1;
      ldyin = 1;
    end
    
    addb: begin
      fbsel = 1;
      ldyin = 1;
    end
    
    firstupt: begin
      x1sel = 1;
      wsel = 1;
      ldw1 = 1;
      enNEQ = 1;
    end
    
    secupt: begin
      x2sel = 1;
      wsel = 1;
      ldw2 = 1;
    end
    
    uptb: begin 
      secbsel = 1;
      ldb = 1;
    end
    
  endcase
end

always@(ps,start,NEQ,EOF,NEQOut)
begin
  case(ps)
    idle: ns <= start ? starting : idle;
    starting: ns <= nqstate;
    nqstate: ns <= reading;
    reading: ns <= waiting;
    waiting: ns <= reseting;
    reseting: ns <= firstx;
    firstx: ns <= secx;
    secx: ns <= addb;
    addb: ns <= check;
    check: begin
      if (NEQ) 
       ns <= firstupt;
      else if (NEQ == 0 && EOF == 0)
        ns <= reading;
      else if (NEQ == 0 && EOF && NEQOut)
        ns <= nqstate;
      else if (NEQ == 0 && EOF && NEQOut == 0)
        ns <= idle;
      else begin
        ns <= idle; 
      end
    end
    firstupt: ns <= secupt;
    secupt: ns <= uptb;
    uptb: ns <= EOF ? nqstate : reading;
  endcase
end
endmodule
    
    
  