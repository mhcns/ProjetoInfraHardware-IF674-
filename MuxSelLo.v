module MuxSelLo (SelLo, MultLo, DivLo, MuxOut);

input SelLo;
input [31:0] MultLo;
input [31:0] DivLo;
output reg [31:0] MuxOut;

always @(SelLo)
begin

case(SelLo)
1'd0: MuxOut <= MultLo;
1'd1: MuxOut <= DivLo;
endcase

end
endmodule
