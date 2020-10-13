module MuxIorE(IorE, PC, E, MuxOut);

input IorE;
input [31:0] PC;
input [31:0] E;
output reg [31:0] MuxOut;

always @ (IorE)
begin

case(IorE)
1'd0:MuxOut <= PC;
1'd1:MuxOut <= E;
endcase

end
endmodule
