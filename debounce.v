`timescale 1ns / 1ps


module debounce(

    input inp1,
    input clk,
    output clear_out
    );

    reg A,B,C;
    always@(posedge clk)  
    begin
        A <= inp1;
        B <= A;
        C <= B;
    end
    assign clear_out =  A && B && C ;


endmodule
