module MuxSelHi (SelHi, MultHi, DivHi, MuxOut);

input SelHi;
input [31:0] MultHi;
input [31:0] DivHi;
output reg [31:0] MuxOut;

always @(SelHi)
begin

case(SelHi)
1'd0: MuxOut <= MultHi;
1'd1: MuxOut <= DivHi;
endcase

end
endmodule
