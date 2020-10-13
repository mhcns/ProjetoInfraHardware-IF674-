module Div(A, B, doDiv, clock, resetDiv, outLo, outHi, endDiv, divZero);

input signed [31:0] A;
input signed [31:0] B;
input doDiv;
input clock;
input resetDiv;

output signed [31:0] outLo;
output signed [31:0] outHi;
output endDiv;
output reg divZero;

reg signed [31:0] outLo;
reg signed [63:0] tempA;
reg signed [63:0] tempB;
reg signed [63:0] sub;
reg [31:0] compTwo;
reg [31:0] compAux;
reg sign;

parameter AUX = 32'd0;
wire signed [31:0]   
outHi = tempA[15:0];  reg [5:0]     bit;
wire endDiv = !bit;

initial bit = 0;
initial sign = 0;

always @(posedge clock)
begin

  if(resetDiv == 0) begin
  
    if(B == AUX) begin
      divZero <= 1;
    
    end else if (endDiv && doDiv) begin

      if(A[31] == 1) begin
        sign <= 1;
        bit = 32;
        outLo = 0;
        compTwo = (~A + 1);
        tempA = {32'd0, compTwo};
        if(B[31] == 1) begin
          sign <= 0;
          compAux = (~B + 1);
          tempB = {1'b0, compAux, 31'd0};
        end else begin
          tempB = {1'b0, B, 31'd0};
        end
      end else if(B[31] == 1) begin
        sign <= 1;
        bit = 32;
        outLo = 0;
        compTwo = (~B + 1);
        tempA = {32'd0,A};
        tempB = {1'b0, compTwo, 31'd0};
        if(A[31] == 1) begin
          sign <= 0;
          compAux = (~A + 1);
          tempA = {32'd0,compAux};
        end else begin
          tempA = {32'd0,A};
        end
      end else begin
        sign <= 0;
        bit = 32;
        outLo = 0;
        tempA = {31'd0,A};
        tempB = {1'b0, B, 31'd0};
      end

    end else begin

      sub = tempA - tempB;
      outLo = {outLo[14:0], ~sub[63]};
      tempB = {1'b0, tempB[63:1]};
      if (!sub[63]) tempA = sub;
      bit = bit - 1;
      if (bit == 0 && sign == 1) begin
        compTwo = outLo;
        outLo = (~compTwo + 1);
      end
    end

  end else begin
    divZero <= 0;
    outLo <= 0;
    tempA <= 0;
    tempB <= 0;
    sub <= 0;
    compTwo <= 0;
    compAux <= 0;
    sign <= 0;
  end

end
endmodule