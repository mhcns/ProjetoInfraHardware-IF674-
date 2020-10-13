module ConcJumpPC (InstrucionJump, PC, Instruction);

input [27:0] InstrucionJump;
input [31:0] PC;
output wire [31:0] Instruction;

assign Instruction = {PC[31:28], InstrucionJump[27:0]};

endmodule 