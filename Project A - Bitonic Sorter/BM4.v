`timescale 1ns / 1ps

module BM4#(parameter DATA_WIDTH=32)(
                        input wire [31:0]in1, in2, in3, in4,
                        input wire clk,
                        input wire rst,
                        input wire en,
                        input wire direction,
                        output wire [31:0]o1, o2, o3, o4
                        );
                        
                        
                        wire [31:0] o11, o12, o13, o14;
                        wire [31:0] o21, o22, o23, o24;
                        wire [31:0] o31, o32, o33, o34;
                        
                        CAS_dual #(.DATA_WIDTH(32)) STAGE1_1 (.i1(in1), .i2(in2), .dir(direction), .clk(clk), .rst(rst), .en(en), .o1(o11), .o2(o12));
                        
                        CAS_dual #(.DATA_WIDTH(32)) STAGE1_2 (.i1(in3), .i2(in4), .dir(direction), .clk(clk), .rst(rst), .en(en), .o1(o13), .o2(o14));

                    
                        CAS_dual #(.DATA_WIDTH(32)) STAGE2_1 (.i1(o11), .i2(o14), .dir(direction), .clk(clk), .rst(rst), .en(en), .o1(o21), .o2(o24));
                        
                        CAS_dual #(.DATA_WIDTH(32)) STAGE2_2 (.i1(o12), .i2(o13), .dir(direction), .clk(clk), .rst(rst), .en(en), .o1(o22), .o2(o23));

                        
                        CAS_dual #(.DATA_WIDTH(32)) STAGE3_1 (.i1(o21), .i2(o22), .dir(direction), .clk(clk), .rst(rst), .en(en), .o1(o31), .o2(o32));
                        
                        CAS_dual #(.DATA_WIDTH(32)) STAGE3_2 (.i1(o23), .i2(o24), .dir(direction), .clk(clk), .rst(rst), .en(en), .o1(o33), .o2(o34));
                        assign o1 = o31;
                        assign o2 = o32;               
                        assign o3 = o33;
                        assign o4 = o34;
                            
endmodule
