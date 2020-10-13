module MuxMemToReg (MemToReg, MuxOut, ALUOut, Load, ShiftOut, SLT, HI, LO, Val227);

input [2:0]MemToReg;
input [31:0]ALUOut;
input [31:0]Load;
input [31:0]ShiftOut;
input [31:0]SLT;
input [31:0]HI;
input [31:0]LO;
input [31:0]Val227;
output [31:0]MuxOut;


assign MuxOut[0] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[0]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[0]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[0]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[0]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[0]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[0]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[0]));
assign MuxOut[1] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[1]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[1]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[1]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[1]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[1]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[1]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[1]));
assign MuxOut[2] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[2]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[2]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[2]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[2]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[2]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[2]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[2]));
assign MuxOut[3] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[3]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[3]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[3]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[3]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[3]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[3]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[3]));
assign MuxOut[4] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[4]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[4]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[4]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[4]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[4]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[4]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[4]));
assign MuxOut[5] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[5]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[5]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[5]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[5]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[5]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[5]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[5]));
assign MuxOut[6] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[6]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[6]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[6]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[6]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[6]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[6]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[6]));
assign MuxOut[7] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[7]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[7]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[7]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[7]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[7]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[7]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[7]));
assign MuxOut[8] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[8]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[8]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[8]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[8]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[8]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[8]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[8]));
assign MuxOut[9] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[9]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[9]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[9]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[9]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[9]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[9]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[9]));
assign MuxOut[10] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[10]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[10]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[10]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[10]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[10]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[10]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[10]));
assign MuxOut[11] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[11]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[11]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[11]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[11]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[11]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[11]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[11]));
assign MuxOut[12] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[12]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[12]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[12]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[12]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[12]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[12]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[12]));
assign MuxOut[13] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[13]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[13]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[13]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[13]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[13]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[13]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[13]));
assign MuxOut[14] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[14]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[14]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[14]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[14]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[14]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[14]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[14]));
assign MuxOut[15] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[15]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[15]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[15]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[15]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[15]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[15]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[15]));
assign MuxOut[16] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[16]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[16]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[16]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[16]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[16]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[16]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[16]));
assign MuxOut[17] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[17]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[17]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[17]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[17]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[17]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[17]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[17]));
assign MuxOut[18] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[18]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[18]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[18]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[18]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[18]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[18]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[18]));
assign MuxOut[19] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[19]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[19]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[19]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[19]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[19]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[19]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[19]));
assign MuxOut[20] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[20]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[20]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[20]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[20]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[20]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[20]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[20]));
assign MuxOut[21] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[21]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[21]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[21]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[21]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[21]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[21]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[21]));
assign MuxOut[22] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[22]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[22]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[22]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[22]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[22]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[22]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[22]));
assign MuxOut[23] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[23]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[23]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[23]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[23]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[23]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[23]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[23]));
assign MuxOut[24] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[24]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[24]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[24]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[24]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[24]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[24]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[24]));
assign MuxOut[25] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[25]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[25]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[25]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[25]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[25]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[25]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[25]));
assign MuxOut[26] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[26]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[26]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[26]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[26]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[26]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[26]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[26]));
assign MuxOut[27] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[27]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[27]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[27]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[27]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[27]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[27]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[27]));
assign MuxOut[28] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[28]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[28]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[28]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[28]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[28]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[28]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[28]));
assign MuxOut[29] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[29]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[29]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[29]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[29]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[29]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[29]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[29]));
assign MuxOut[30] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[30]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[30]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[30]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[30]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[30]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[30]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[30]));
assign MuxOut[31] = (((~MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & ALUOut[31]) | ((MemToReg[0] & ~MemToReg[1] & ~MemToReg[2] ) & Load[31]) | ((~MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & ShiftOut[31]) | ((MemToReg[0] & MemToReg[1] & ~MemToReg[2] ) & SLT[31]) | ((~MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & HI[31]) | ((MemToReg[0] & ~MemToReg[1] & MemToReg[2] ) & LO[31]) | ((~MemToReg[0] & MemToReg[1] & MemToReg[2] ) & Val227[31]));


endmodule