`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2026 20:46:34
// Design Name: 
// Module Name: fifo_tb
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


module fifo_tb(

    );
    
    reg clk;
    reg rst;
    reg [31:0]data_in;
    reg wr_en;
    reg rd_en;
    
    wire[31:0]data_out;
    wire full;
    wire empty;
    wire overflow;
    wire underflow;
    
    fifo uut(
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .rd_en(rd_en),
    .wr_en(wr_en),
    .data_out(data_out),
    .full(full),
    .empty(empty),
    .overflow(overflow),
    .underflow(underflow));
    
    
    always #5 clk=~clk;
    
    initial
    begin
    clk=0;
    rst=1;
    wr_en=0;
    rd_en=0;
    data_in=0;
    
    #10 rst=0;
    
    repeat(20)
    begin
    @(posedge clk)
    wr_en=1;
    data_in=data_in+1;
    end
    
    wr_en=0;
    repeat(12)
    begin
    @(posedge clk)
    rd_en=1;
    end
    
    rd_en=0;
    #20 $finish;
    end
      
endmodule
