`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.09.2017 22:37:19
// Design Name: 
// Module Name: clean_pulse
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


module clean_pulse(

    input X,
    input clk,
    input clr,
    output Y
    );

    reg A,B,C;

    always @(posedge(clk) or posedge(clr))
        begin
        if (clr == 1)
            begin
                A <= 1'b0;
                B <= 1'b0;
                C <= 1'b0;
            end
        else
            begin
                A <= X;
                B <= A;
                C <= ~B;
            end
       
        end
        
        assign Y = (A && B && C);

endmodule
