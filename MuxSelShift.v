module MuxSelectShift(SelShift, B,  shamt, MuxOut);

input [1:0] SelShift;
input [4:0] B;
input [4:0] shamt;
output reg [4:0] MuxOut;

always @ (SelShift)
begin

case(SelShift)

2'd0:MuxOut <= B;
2'd1:MuxOut <= shamt;
2'd2:MuxOut <= 5'd16;
endcase

end
endmodule
