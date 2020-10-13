module UnsignExtend_16_to32 (clk, In, Out);

input clk;
input [15:0] In;
output reg [31:0] Out;

always @(clk)
begin
	Out <= {16'd0, In[15:0]};

end
endmodule 