`timescale 1ns / 1ps

module mac_1_stage#(parameter N=32)(
    input wire clk,
    input wire rst,
    input wire [N-1:0] in_a,
    input wire [N-1:0] in_b,
    output wire [2*N-1:0] out_mac
    );
    reg [2*N-1:0]mac_reg_2,mac_reg_1,mac_prod,mac_sum;
    
    always@(posedge clk or posedge rst) begin 
       if(rst) 
            mac_reg_2<='b0;
       else 
            mac_reg_2<=mac_prod + mac_reg_2;
    end
    
    always@*
        begin
        if(!rst) 
            mac_prod= in_a * in_b;
        else 
            mac_prod='b0;
            //mac_sum=mac_reg_1 + mac_reg_2;
        end
        
assign out_mac= mac_reg_2;
endmodule