
module Mult(clock, resetMult, DoMult, A, B, endMult, outHi, outLo);

input [31:0] A;
input [31:0] B;
input clock;
input DoMult;
input resetMult;

output reg endMult;
output reg [31:0] outHi;
output reg [31:0] outLo;


reg [64:0] add;
reg [64:0] subRes;
reg [64:0] partialProduct;
reg [64:0] opB;
reg [31:0] comp2A;

reg [5:0] count;

initial count = 0;

always@(posedge clock)begin
	
	if(DoMult == 1) begin // incerteza sobre a corretude dessa linha

		if(resetMult) begin
					
			opB = 64'b0;
			partialProduct = 64'b0;
			add = 64'b0;
			subRes = 64'b0;
			
			comp2A = 32'b0;
			outHi = 32'b0;
			outLo = 32'b0;

			endMult <= 0;
			count = 6'b0;
		end

		// algoritmo de booth
		if(count == 0) begin
			opB = {32'b0, B}; // concatena com B 
			partialProduct = {opB, 1'b0}; //coloca um zero no lsb// prod parcial
			add = {A, 33'b0};
			comp2A = (~A + 1);  // complemento a 2
			subRes = {comp2A,33'b0}; // concatena com 0s pra fazer a soma
			
		end
		else if(count == 33) begin //finalizando
			outHi = partialProduct[64:33];
			outLo = partialProduct[32:1];
			endMult <= 1;
			count = 6'b0;
		end
		
		else begin
			case(partialProduct[1:0])

				2'b01: begin	
					partialProduct = partialProduct + add; 

				end
				
				2'b10: begin
					partialProduct = partialProduct + subRes;
					
				end
			endcase
			
			partialProduct = $signed(partialProduct) >>> 1;
		end
		count = count + 1;
	end
end
endmodule
	


