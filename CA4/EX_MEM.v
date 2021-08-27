`timescale 1ns/1ns

module EX_MEM (input clk,rst,inRegwrite,inMemtoreg,inMemwrite,inMemread,inAluz,
            input [31:0] inResult,inForward,
            input [4:0] inRdout,
            output reg outRegwrite,outMemtoreg,outMemwrite,outMemread,outAluz,
            output reg [31:0] outResult,outForward,
            output reg [4:0] ExMemRd);
    always@(posedge clk, posedge rst) begin
        if(rst) begin
            {outRegwrite,outMemtoreg,outMemwrite,outMemread, outAluz} <= 5'b0;
            outResult <= 32'b0; ExMemRd <= 5'b0; outForward <= 32'b0;
        end
        else begin
            outRegwrite <= inRegwrite;
            outMemtoreg <= inMemtoreg;
            outMemwrite <= inMemwrite;
            outMemread <= inMemread;
            outAluz <= inAluz;
            outResult <= inResult; 
            ExMemRd <= inRdout; 
            outForward <= inForward;
        end
    end
endmodule
    