`timescale 1ns / 1ps


module Moore_top(

    input clk,
    input clr,
    input [1:0] button,
    output LED,
    output [2:0] prsnt_state
    );
    
    wire inp;
    assign inp = button[0] || button[1];
    
    freq_div f1 (clk,clk_190);
    debounce d1 (clr,clk_190,clr_out);
    clean_pulse c1 (inp,clk_190,clr_out,final_clear);
    FSM_Main m1 (final_clear,clr_out,button[1],LED,prsnt_state);


endmodule
