`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2026 11:51:59
// Design Name: 
// Module Name: Alu_tb
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


module Alu_tb(

    );
    
    reg [3:0]a;
    reg [3:0]b;
    reg[2:0]sel;
    wire[4:0]result;
    
    Alu uut(
    .a(a),
    .b(b),
    .sel(sel),
    .result(result)
    );
    
    initial
    begin
    a=4'b1111;
    b=4'b1010;
   
    #10 sel=3'b000;
    #10 sel=3'b001;
    #10 sel=3'b010;
    #10 sel=3'b011;
    #10 sel=3'b100;
    #10 sel=3'b101;
    #10 sel=3'b110;
    #10 sel=3'b111;
    
    #10 $finish;
    end
    
     
endmodule
