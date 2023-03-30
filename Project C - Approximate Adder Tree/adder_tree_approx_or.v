`timescale 1ns / 1ps

module adder_tree_approx_or( input wire [7:0]a,b,c,d,e,f,g,h, 
                    input wire clk, rst,
                   output wire [10:0]y );

reg [8:0] i11,i12,i13,i14;
reg [9:0] i21, i22;
reg [10:0] i31;
always@(posedge clk, posedge rst) begin
 if(rst) begin
 i11<=0; 
 i12<=0; 
 i13<=0; 
 i14<=0; 
 i21<=0;
 i22<=0;

 end
 else begin
 i11<= {a[7:3]+b[7:3], a[2:0]|b[2:0]} ;
 i12<= {c[7:3]+d[7:3], c[2:0]|d[2:0]} ;
 i13<= {e[7:3]+f[7:3], e[2:0]|f[2:0]} ;
 i14<= {g[7:3]+h[7:3], g[2:0]|h[2:0]} ;
 i21<= {i11[8:3]+i12[8:3], i11[2:0]|i12[2:0]} ;
 i22<= {i13[8:3]+i14[8:3], i13[2:0]|i14[2:0]} ;
 i31<={i21[9:3]+i22[9:3],i21[2:0]|i22[2:0]} ;
 end
 
end 

assign y = i31;


endmodule
