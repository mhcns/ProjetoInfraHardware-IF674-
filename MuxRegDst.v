module MuxRegDst(RegDst, RT, RD, MuxOut);

input [1:0] RegDst;
input [20:16] RT;
input [15:11] RD;
output reg [4:0] MuxOut;

always @ (RegDst)
begin

case(RegDst)
2'd0:MuxOut <= RT;
2'd1:MuxOut <= RD;
2'd2:MuxOut <= 5'd29;
2'd3:MuxOut <= 5'd31;
endcase

end
endmodule
