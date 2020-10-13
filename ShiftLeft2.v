module ShiftLeft2 (clk, SignExtend, SLOut);

input clk;
input [31:0] SignExtend;
output reg [31:0] SLOut;

always @(clk)
begin
	SLOut <= SignExtend << 2;

end
endmodule
