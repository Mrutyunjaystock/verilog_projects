`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.05.2026 11:40:39
// Design Name: 
// Module Name: Alu
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


module Alu(
input [3:0]a,
input [3:0]b,
output reg [4:0]result,
input [2:0]sel

    );
       
always@(*)begin
case(sel)
3'b000:result=a|b;
3'b001:result=a&b;
3'b010:result=a+b;
3'b011:result=a-b;
3'b100:result=a<<2;
3'b101:result=a>>2;
3'b110:result=a^b;
3'b111:result=~(a^b);

default:result=5'b00000;
endcase
end

    
    
endmodule
