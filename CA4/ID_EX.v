`timescale 1ns/1ns

module ID_EX (input clk, rst, inAlusrc, inRegdst, inMemread, inMemwrite, inRegwrite, inMemtoreg,
            input [2:0] inAluop,
            input [31:0] inR1,inR2,inim,
            input [4:0] inRt,inRd,inRs,
            output reg outAlusrc, outRegdst, outMemread, outMemwrite, outRegwrite, outMemtoreg,
            output reg [31:0] outR1,outR2,outim,
            output reg [4:0] outRt, outRd, outRs,
            output reg [2:0] outAluop);
    always@(posedge clk, posedge rst) begin
        if(rst) begin
            {outAlusrc, outRegdst, outMemread, outMemwrite, outRegwrite, outMemtoreg} <= 6'b0;
            outAluop <= 3'b0;
            outRt <= 5'b0; outRd <= 5'b0; outRs <= 5'b0;
            outR1 <= 31'b0; outR2 <= 31'b0; outim <= 31'b0;
        end
        else begin
            outRegwrite <= inRegwrite;
            outMemtoreg <= inMemtoreg;
            outMemwrite <= inMemwrite;
            outMemread <= inMemread;
            outAlusrc <= inAlusrc;
            outRegdst <= inRegdst;
            outAluop <= inAluop;
            outRt <= inRt; outRd <= inRd; outRs <= inRs;
            outR1 <= inR1; outR2 <= inR2; outim <= inim;
        end
    end
endmodule
    
