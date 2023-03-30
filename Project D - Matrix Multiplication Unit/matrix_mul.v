`timescale 1ns / 1ps

module matrix_mul( 
input wire clk,
input wire rst,
input wire [31:0] in_a0,
input wire [31:0] in_a1,
input wire [31:0] in_b0,
input wire [31:0] in_b1,
output wire [63:0] o00,o01,o10,o11
);

reg [31:0] a1_s1,a0_s2,a1_s2,b1_s1,b0_s2,b1_s2;

always@(posedge clk or posedge rst)
 begin
    if(rst)
    begin 
        {a0_s2,a1_s1,a1_s2,b0_s2,b1_s1,b1_s2}<='b0;
    end
    else begin
        a0_s2<=in_a0;    
        {a1_s1,a1_s2}<={in_a1,a1_s1};
        
        b0_s2<=in_b0;  
        {b1_s1,b1_s2}<={in_b1,b1_s1};
        end
 end
 mac_1_stage mac_00(.clk(clk),.rst(rst),.in_a(in_a0),.in_b(in_b0),.out_mac(o00));
 mac_1_stage mac_10(.clk(clk),.rst(rst),.in_a(a1_s1),.in_b(b0_s2),.out_mac(o10));
 mac_1_stage mac_01(.clk(clk),.rst(rst),.in_a(a0_s2),.in_b(b1_s1),.out_mac(o01));
 mac_1_stage mac_11(.clk(clk),.rst(rst),.in_a(a1_s2),.in_b(b1_s2),.out_mac(o11));

endmodule
