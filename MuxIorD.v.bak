module MuxIorD(IorD, PC, ALUOut, A, Error, MuxOut);

input [1:0] IorD;
input [31:0] PC;
input [31:0] ALUOut;
input [31:0] A;
input [31:0] Error;
output reg [31:0] MuxOut;

always @ (IorD)
begin

case(IorD)
2'd0:MuxOut <= PC;
2'd1:MuxOut <= ALUOut;
2'd2:MuxOut <= A;
2'd3:MuxOut <= Error;
endcase

end
endmodule
