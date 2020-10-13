module InstructionJump (Instrucion_25_21, Instrucion_20_16, Instrucion_15_0, Instruction_25_0);

input [4:0] Instrucion_25_21;
input [4:0] Instrucion_20_16;
input [15:0] Instrucion_15_0;
output wire [25:0] Instruction_25_0;

assign Instruction_25_0 = {Instrucion_25_21[4:0], Instrucion_20_16[4:0], Instrucion_15_0[15:0]};

endmodule 