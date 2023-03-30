`timescale 1ns / 1ps

module adder_tree( input wire [7:0]a,b,c,d,e,f,g,h, 
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
 i11<= a+b;
 i12<= c+d;
 i13<= e+f;
 i14<= g+h;
 i21<= i11+i12;
 i22<= i13+i14;
 i31<=i21+i22;
 end
 
end 

assign y = i31;


endmodule