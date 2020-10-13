module ShiftLeft2C (SLIn, SLOut);

input [25:0] SLIn;
output reg [27:0] SLOut;

always
begin
	//26 -> 28
	SLOut <= {SLIn[25:0], 2'd0};
end
endmodule
