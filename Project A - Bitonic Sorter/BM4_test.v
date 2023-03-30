`timescale 1ns / 1ps

module BM4_test;

reg [31:0] in1, in2, in3, in4;
reg clk = 1'b0, rst, en, direction;
                     
                     
wire [31:0] o1, o2, o3, o4;
BM4 #(.DATA_WIDTH(32)) bm4test( .in1(in1),.in2(in2), .in3(in3), .in4(in4), .clk(clk),
                       .rst(rst),.en(en), .direction(direction), .o1(o1), .o2(o2), .o3(o3), .o4(o4) );
 
always #5 clk = ~clk;

 
 initial begin
 #20 
 rst = 1'b1;
 en=1'b1;
 #20;
 rst = 1'b0;
 direction= 1'b1;
// en=1'b1;
 #20;
 in1= 3'b110;
 in2= 3'b101;
 in3= 3'b100;
 in4= 3'b011;
 #1000;
 $finish;
 
 end
endmodule
