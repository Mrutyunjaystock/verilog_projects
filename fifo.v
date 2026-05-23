`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2026 19:59:16
// Design Name: 
// Module Name: fifo
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo(
input clk,
input rst,
input wr_en,
input rd_en,
input [31:0] data_in,
output reg[31:0] data_out,
output full,
output empty,
output reg overflow,
output reg underflow
    );
    
    assign full = (count==16);
    assign empty = (count==0);
    
    reg [31:0] fifo[0:15]; //[31:0] for number of bits per location and [0:15] for number of location.
    reg[3:0]wrpt;
    reg[3:0]rdpt;
    reg[5:0] count;
    
    always@(posedge clk or posedge rst)
    begin
    if(rst)begin
    wrpt<=0;
    data_out<=0;
    overflow<=0;
    end
    else begin
    overflow<=0;
    if(wr_en && !full)begin
    fifo[wrpt]<=data_in;
    wrpt<=wrpt+1;
    end
    else if(wr_en && full)
    overflow<=1;
    end
    end
    
    always@(posedge clk or posedge rst)
    begin
    if(rst)begin
    rdpt<=0;
    underflow<=0;
    end
    else begin
    underflow<=0;
    if(rd_en && !empty) begin
    data_out<=fifo[rdpt];
    rdpt<=rdpt+1;
    end
    else if(rd_en && empty)
    underflow<=1;
    end
    end
    
    
    always@(posedge clk or posedge rst)begin
    if(rst)
    count<=0;
    else begin
    case({wr_en,rd_en})
    2'b10:if(!full) count<=count+1;
    2'b01:if(!empty) count<=count-1;
    2'b11:count<=count;
    default:count<=count;
    endcase
    end
    end
       
endmodule
