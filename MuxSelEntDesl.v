module MuxSelEntDesl(SelEntDesl, A, B, Immediate,  MuxOut);

input [1:0] SelEntDesl;
input [31:0] A;
input [31:0] B;
input [31:0] Immediate;
output reg [31:0] MuxOut;

always @ (SelEntDesl)
begin

case(SelEntDesl)

2'd0:MuxOut <= A;
2'd1:MuxOut <= B;
2'd2:MuxOut <= Immediate;
endcase

end
endmodule
