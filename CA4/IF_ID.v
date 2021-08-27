`timescale 1ns/1ns

module IF_ID (input clk, rst, IF_ID_write, flush, input [31:0] inpc, inInst, output reg [31:0] outpc, outInst);
    always@(posedge clk, posedge rst) begin
        if(rst) begin 
            outpc <= 32'b0;
            outInst <= 32'b0;
        end
        else if(IF_ID_write == 1) begin
            if(flush == 1) begin
              outInst <= 32'b0;
              outpc <= inpc;
            end
            else begin
              outInst <= inInst;
              outpc <= inpc;
            end
        end
    end
endmodule