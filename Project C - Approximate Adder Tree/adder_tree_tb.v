`timescale 1ns / 1ps
module adder_tree_tb();
reg [7:0]a,b,c,d,e,f,g,h;
reg clk = 1'b0, rst;
wire [10:0]y;
adder_tree tree (.a(a),.b(b),.c(c),.d(d),.e(e),.f(f),.g(g),.h(h),.clk(clk), .rst(rst),
.y(y));

always #10 clk = ~clk;
initial 
begin
#10; rst = 1'b0;
#10; rst = 1'b1;
#10; rst = 1'b0;

a=8'b00000001;
b=8'b00000010;
c=8'b00000011;
d=8'b00000100;
e=8'b00000101;
f=8'b00000110;
g=8'b00000111;
h=8'b00001000;

#200;
end
endmodule
