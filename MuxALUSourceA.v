module MuxALUSourceA(ALUSrcA, PC, MDR, A, MuxOut);

input [1:0] ALUSrcA;
input [31:0] PC;
input [31:0] A;
input [31:0] MDR;
output reg [31:0] MuxOut;

always @ (ALUSrcA)
begin

case(ALUSrcA)
2'd0:MuxOut <= PC;
2'd1:MuxOut <= A;
2'd2:MuxOut <= MDR;
endcase

end
endmodule
