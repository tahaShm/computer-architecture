module controller(input clk, zero, input [15:0] ins, output reg [2:0] aluop, output reg pc1sel,pc2sel,wdsel,ldw,regwrite,asel,memwrite,memread,memtoreg);
  wire [3:0] opcode;
  wire [7:0] func;
  assign opcode = ins[15:12];
  assign func = ins[7:0];
  always @ (ins, posedge clk) begin
    pc1sel = 0; pc2sel = 0; wdsel = 0; aluop = 3'b000; ldw = 0; regwrite = 0;
    asel = 0; memwrite = 0; memread = 0; memtoreg = 0;
    case(opcode)
      4'b1000: begin
        pc1sel = 0;
        pc2sel = 0;
        if(func[7] == 0) begin
          if(func[0] == 1) begin //move
            aluop = 3'b000;
            wdsel = 0;
            regwrite = 1;
          end
          else if(func[1] == 1) begin //add
            aluop = 3'b001;
            asel = 0;
            memtoreg = 0;
            wdsel = 1;
            regwrite = 1;
          end
          if(func[2] == 1) begin //sub
            aluop = 3'b010;
            asel = 0;
            memtoreg = 0;
            wdsel = 1;
            regwrite = 1;
          end
          if(func[3] == 1) begin //and
            aluop = 3'b011;
            asel = 0;
            memtoreg = 0;
            wdsel = 1;
            regwrite = 1;
          end
          if(func[4] == 1) begin //or
            aluop = 3'b100;
            asel = 0;
            memtoreg = 0;
            wdsel = 1;
            regwrite = 1;
          end
          if(func[5] == 1) begin //not
            aluop = 3'b101;
            asel = 0;
            memtoreg = 0;
            wdsel = 1;
            regwrite = 1;
          end
          if(func[6] == 1) //nop
            aluop = 3'b000;
        end
        else if(func[7] == 1) begin
          ldw = 1;
        end
      end
      4'b0000: begin //load
        pc1sel = 0;
        pc2sel = 0;
        memread = 1;
        memtoreg = 1;
        wdsel = 1;
        regwrite = 1;
      end
      4'b0001: begin //store
        pc1sel = 0;
        pc2sel = 0;
        memwrite = 1;      
      end
      4'b0010: begin //jump
        pc2sel = 1;
      end
      4'b0100: begin //branchz
        pc1sel = 1;
        pc2sel = 0;
      end
      4'b1100: begin //addi
        pc1sel = 0;
        pc2sel = 0;
        asel = 1;
        aluop = 3'b001;
        memtoreg = 0;
        wdsel = 1;
        regwrite = 1;
      end
      4'b1101: begin //subi
        pc1sel = 0;
        pc2sel = 0;
        asel = 1;
        aluop = 3'b010;
        memtoreg = 0;
        wdsel = 1;
        regwrite = 1;
      end
      4'b1110: begin //andi
        pc1sel = 0;
        pc2sel = 0;
        asel = 1;
        aluop = 3'b011;
        memtoreg = 0;
        wdsel = 1;
        regwrite = 1;
      end
      4'b1111: begin //ori
        pc1sel = 0;
        pc2sel = 0;
        asel = 1;
        aluop = 3'b100;
        memtoreg = 0;
        wdsel = 1;
        regwrite = 1;
      end
    endcase
  end
endmodule
       
          
            
          
            
            
          
        
      
