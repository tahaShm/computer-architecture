`timescale 1ns/1ns
module control(input [5:0] func,input [5:0] opcode, input equal, 
				output reg [2:0] ALUOP, output reg [1:0] pcSrc, output reg MemRead, MemToReg,
				MemWrite, ALUSrc, RegWrite, RegDst, IF_Flush);

  always @(*) begin
    {MemRead,MemToReg,MemWrite,ALUSrc,RegWrite,RegDst,IF_Flush} = 7'b0;
    ALUOP = 2'b0;
    pcSrc = 2'b0;
    case(opcode)
      6'b000000: begin  //Rtype
			 case(func)
				6'b100000:begin //add 
						ALUOP <= 1;
						ALUSrc <= 0; MemToReg <= 0; RegWrite <= 1;
						RegDst <= 1;
				end
				6'b100010:begin //sub 
						ALUOP <= 2;
						ALUSrc <= 0; MemToReg <= 0; RegWrite <= 1;
						RegDst <= 1;
				end
				6'b101010:begin //slt 
						ALUOP <= 5;
						ALUSrc <= 0; MemToReg <= 0; RegWrite <= 1;
						RegDst <= 1;
				end
				6'b100101:begin //or 
						ALUOP <= 4;
						ALUSrc <= 0; MemToReg <= 0; RegWrite <= 1;
						RegDst <= 1;
				end
				6'b100100:begin //and 
						ALUOP <= 3;
						ALUSrc <= 0; MemToReg <= 0; RegWrite <= 1;
						RegDst <= 1;
				end
			 endcase
	    end
      6'b100011: begin // lw
			 ALUOP <= 1;
			 ALUSrc <= 1;
			 MemRead <= 1; MemToReg <= 1; RegWrite <= 1;
			 RegDst <= 0;
      end
	    6'b000010: begin // jump
			 pcSrc <= 2;
			 IF_Flush <= 1;
	    end
      6'b101011: begin // sw
			 ALUOP <= 1;
			 ALUSrc <= 1;
			 MemWrite <= 1;
      end
	    6'b000100: begin // beq
		   pcSrc <= equal == 1 ? 1 : 0;
		   IF_Flush <= equal == 1 ? 1 : 0;
	    end
	    6'b000101: begin // bne
			pcSrc <= equal == 0 ? 1 : 0;
		   	IF_Flush <= equal == 0 ? 1 : 0;
	    end
    endcase
  end 
endmodule 






