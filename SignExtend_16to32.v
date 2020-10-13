module SignExtend_16to32 (clk, In, Out);

input clk;
input [15:0] In;
output reg [31:0] Out;

always @(clk)
begin
	Out <= $signed(In);

end
endmodule 