`timescale 1ns/1ns

module MEM_WB (input clk,rst,inRegwrite,inMemtoreg,
            input [31:0] inReadD,inAlu,
            input [4:0] inRd,
            output reg outRegwrite,outMemtoreg,
            output reg [31:0] outResult,outFromAlu,
            output reg [4:0] MemWbRd);
    always@(posedge clk, posedge rst) begin
        if(rst) begin
            {outRegwrite,outMemtoreg} <= 2'b0;
            outResult <= 32'b0; MemWbRd <= 5'b0; outFromAlu <= 32'b0;
        end
        else begin
            outRegwrite <= inRegwrite;
            outMemtoreg <= inMemtoreg;
            outResult <= inReadD; 
            MemWbRd <= inRd; 
            outFromAlu <= inAlu;
        end
    end
endmodule
    
