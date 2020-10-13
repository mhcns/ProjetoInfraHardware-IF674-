module Load(SelLoad, MDR, LoadOut);

input [1:0] SelLoad;
input [31:0] MDR;

output reg [31:0] LoadOut;

always @ (SelLoad) begin
	
	case(SelLoad)
		2'd0: LoadOut <= MDR;
		2'd1: LoadOut <= {24'b000000000000000000000000, MDR[7:0]};
		2'd2: LoadOut <= {16'b0000000000000000, MDR[15:0]};
	endcase

end

endmodule
