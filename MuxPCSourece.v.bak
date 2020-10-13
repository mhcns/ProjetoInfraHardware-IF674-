module MuxPCSource(PCSource, ALUResult, ALUOut, Jump, EPC, MuxOut);

input [1:0] PCSource;
input [31:0] ALUResult;
input [31:0] ALUOut;
input [31:0] Jump;
input [31:0] EPC;
output reg [31:0] MuxOut;

always @(PCSource)
begin

case(PCSource)
2'd0: MuxOut <= ALUResult;
2'd1: MuxOut <= ALUOut;
2'd2: MuxOut <= Jump;
2'd3: MuxOut <= EPC;
endcase

end
endmodule
