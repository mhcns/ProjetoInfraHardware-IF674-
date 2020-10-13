module MuxSelError(MuxSelError, MuxOut);

input [1:0] MuxSelError;
output reg [31:0] MuxOut;

always @ (MuxSelError)
begin

case(MuxSelError)

2'd0:MuxOut <= 32'd253;
2'd1:MuxOut <= 32'd254;
2'd2:MuxOut <= 32'd254;
endcase

end
endmodule
