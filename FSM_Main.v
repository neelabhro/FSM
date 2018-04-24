`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.10.2017 00:23:19
// Design Name: 
// Module Name: FSM_Main
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


module FSM_Main(

    input clk,
    input clr,
    input Din,
    output reg Dout,
    output reg [2:0] prsnt_state
    );
    
    reg [2:0] prsnt_state,nxt_state;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;
    
    
    always @(posedge clk or posedge clr)
    begin
        if (clr == 1)
            
            prsnt_state <= S0;
           
        else 
            prsnt_state <= nxt_state;
    end

    always @(*)
    begin
    case(prsnt_state)
                    S0: if (Din == 1)
                            nxt_state <= S1;
                        else
                            nxt_state <= S0;
                    
                    S1: if (Din == 1)
                            nxt_state <= S1;
                        else
                            nxt_state <= S2;

                    S2: if (Din == 1)
                            nxt_state <= S3;
                        else
                            nxt_state <= S0;

                    S3: if (Din == 1)
                            nxt_state <= S1;
                        else
                            nxt_state <= S4;                                            

                    S4: if (Din == 1)
                            nxt_state <= S5;
                        else
                            nxt_state <= S0;

                    S5: if (Din == 1)
                            nxt_state <= S1;
                        else
                            nxt_state <= S0;
                
                    default: nxt_state <= S0;
            endcase
    end
     
     always @(*)
     begin
     if (prsnt_state == S5)
        Dout = 1;
     else if (((clr == 1) || (prsnt_state != S5)))
        Dout = 0;
     end      
       

endmodule