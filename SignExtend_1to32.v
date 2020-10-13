module SignExtend_1to32 (clk, LT, Out);

input clk;
input LT;
output reg [31:0] Out;

always @(clk)
begin
	Out <= $signed(LT);

end
endmodule 