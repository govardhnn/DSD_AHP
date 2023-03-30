module cpu
(
  input  wire CLK  ,
  input  wire RST  ,
  output wire HALT  
);

  reg [4:0] pc;         // program counter
  reg [7:0] ac;         // accumulator
  reg [7:0] mem [0:31]; // memory

  wire [7:0] instruction = mem[pc];
  wire [7:5] opcode      = instruction[7:5];
  wire [4:0] operand     = instruction[4:0];
  wire [7:0] rvalue      = mem[operand];

  always @(posedge CLK)
    if ( RST )
      pc <= 0 ;
    else
      case ( opcode )
        0: begin                    pc<=pc;         end // HLT
        1: begin                    pc<=pc+1+(!ac); end // SKZ
        2: begin ac <= ac + rvalue; pc<=pc+1;       end // ADD
        3: begin ac <= ac & rvalue; pc<=pc+1;       end // AND
        4: begin ac <= ac ^ rvalue; pc<=pc+1;       end // XOR
        5: begin ac <=      rvalue; pc<=pc+1;       end // LDA
        6: begin mem[operand]<=ac;  pc<=pc+1;       end // STO
        7: begin                    pc<=operand;    end // JMP
      endcase

  assign HALT = opcode == 0;

endmodule
