module MuxJumpCond (JumpCond, ET, NotEquals, LE, GT, MuxOut);

input [1:0] JumpCond;
input ET;
input NotEquals;
input LE;
input GT;
output reg MuxOut;

always @(JumpCond)
begin

case(JumpCond)
2'd0: MuxOut <= ET;
2'd1: MuxOut <= NotEquals;
2'd2: MuxOut <= LE;
2'd3: MuxOut <= GT;
endcase

end
endmodule
