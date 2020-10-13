module Store(SelStore, MDR, B, StoreOut);

input [1:0] SelStore;
input [31:0] MDR;
input [31:0] B;
output reg [31:0] StoreOut;

always @(SelStore)
begin

case(SelStore)
2'd0: StoreOut <= B;
2'd1: StoreOut <= {MDR[31:8],B[7:0]};
2'd2: StoreOut <= {MDR[31:16],B[15:0]};
endcase

end
endmodule
