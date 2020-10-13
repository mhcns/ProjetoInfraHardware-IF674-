module Controle (clk, reset,Opcode, Funct, overflow, divZero, opcodeInexistente, PCWrite, PCWriteCond, MemRead, MemWrite, IRWrite, MemToReg, RegDst, RegWrite, DoMult, DoDiv, EPCWrite, IorD, SelError, IorE, JumpCond, PCSource, ALUSourceA, ALUSourceB, ALUOp, SelEntDesl, SelShift, Shift, SelHi, SelLo, ALUOutWrite, SelLoad, SelStore, endMult, endDiv);

	input clk;
	input reset;
	input [5:0] Opcode;
	input [5:0] Funct;
	input overflow;
	input divZero;
	input opcodeInexistente;
	input [1:0] endMult;
	input endDiv;

	output reg PCWrite;
	output reg PCWriteCond;
	output reg MemRead;
	output reg MemWrite;
	output reg IRWrite;
	output reg [2:0] MemToReg;
	output reg [1:0] RegDst;
	output reg RegWrite;
	output reg DoMult;
	output reg DoDiv;
	output reg EPCWrite;
	output reg [1:0] IorD;
	output reg [1:0] SelError;
	output reg IorE;
	output reg [1:0] JumpCond;
	output reg [1:0] PCSource;
	output reg [1:0] ALUSourceA;
	output reg [2:0] ALUSourceB;
	output reg [2:0] ALUOp;
	output reg [1:0] SelEntDesl;
	output reg [1:0] SelShift;
	output reg [2:0] Shift;
	output reg SelHi;
	output reg SelLo;
	output reg ALUOutWrite;
	output reg [1:0] SelLoad;
	output reg [1:0] SelStore;

	reg [6:0] State;

	parameter NOT_WRITE = 1'd0;
	parameter WRITE = 1'd1;

	parameter NOT_READ = 1'd0;
	parameter READ = 1'd1;

	parameter NOT_DIVIDE = 1'd0;
	parameter DIVIDE = 1'd1;

	parameter NOT_MULTIPLY = 1'd0;
	parameter MULTIPLY = 1'd1;

	// PCSource
	parameter PCSrc_ALUResult = 2'd0;
	parameter PCSrc_ALUOut = 2'd1;
	parameter PCSrc_Jump = 2'd2;
	parameter PCSrc_EPC = 2'd3;

	// JumpCond
	parameter JumpC_ET = 2'd0;
	parameter JumpC_NotEquals = 2'd1;
	parameter JumpC_LE = 2'd2;
	parameter JumpC_GT = 2'd3;

	// SelHi
	parameter Hi_Mult = 1'd0;
	parameter Hi_Div = 1'd1;

	// SelLo
	parameter Lo_Mult = 1'd0;
	parameter Lo_Div = 1'd1;

	// SelError
	parameter Error_253_Opcode = 2'd0;
	parameter Error_254_Overflow = 2'd1;
	parameter Error_255_Div = 2'd2;

	// SelEntDesl
	parameter EntDesl_A = 2'd0;
	parameter EntDesl_B = 2'd1;
	parameter EntDesl_Immediate = 2'd2;

	// SelShift
	parameter SelShift_B = 2'd0;
	parameter SelShift_Shamt = 2'd1;
	parameter SelShift_16 = 2'd2;

	//RegDst
	parameter RegDst_RT = 2'd0;
	parameter RegDst_RD = 2'd1;
	parameter RegDst_29 = 2'd2;
	parameter RegDst_31 = 2'd3;

	// ALUSourceA
	parameter ALUSrcA_PC = 2'd0;
	parameter ALUSrcA_A = 2'd1;
	parameter ALUSrcA_MDR = 2'd2;

	// ALUSourceB
	parameter ALUSrcB_B = 3'd0;
	parameter ALUSrcB_4 = 3'd1;
	parameter ALUSrcB_Immediate = 3'd2;
	parameter ALUSrcB_Branch = 3'd3;
	parameter ALUSrcB_ImediateUns = 3'd4;

	// IorE
	parameter IorE_PC = 1'd0;
	parameter IorE_E = 1'd1;

	// IorD
	parameter IorD_PC = 2'd0;
	parameter IorD_ALUOut = 2'd1;
	parameter IorD_A = 2'd2;
	parameter IorD_Error = 2'd3;

	// MemToReg
	parameter MemToReg_ALUOut = 3'd0;
	parameter MemToReg_Load = 3'd1;
	parameter MemToReg_ShiftOut = 3'd2;
	parameter MemToReg_SLT = 3'd3;
	parameter MemToReg_Hi = 3'd4;
	parameter MemToReg_Lo = 3'd5;
	parameter MemToReg_227 = 3'd6;

	// ALUOp
	parameter ALUOp_LoadA = 3'd0;
	parameter ALUOp_ADD = 3'd1;
	parameter ALUOp_SUB = 3'd2;
	parameter ALUOp_AND = 3'd3;
	parameter ALUOp_INC = 3'd4;
	parameter ALUOp_NotA = 3'd5;
	parameter ALUOp_XOR = 3'd6;
	parameter ALUOp_COMP = 3'd7;

	// SHIFT
	parameter Shift_Nothing = 3'd0;
	parameter Shift_Load = 3'd1;
	parameter Shift_L = 3'd2;
	parameter Shift_R_L = 3'd3;
	parameter Shift_R_A = 3'd4;
	parameter Shift_RotationR = 3'd5;
	parameter Shift_RotationL = 3'd6;

	// SelLoad
	parameter SelLoad_LW = 2'd0;
	parameter SelLoad_LB = 2'd1;
	parameter SelLoad_LH = 2'd2;

	// SelStore
	parameter SelStore_SW = 2'd0;
	parameter SelStore_SB = 2'd1;
	parameter SelStore_SH = 2'd2;

	parameter RESET = 7'd0;
	parameter SEARCH = 7'd1;
	parameter WAIT_READ = 7'd2;
	parameter DECODE = 7'd3;
	parameter BRANCH = 7'd4;
	parameter TYPE_R = 7'd5;
	parameter ADD = 7'd6;
	parameter SUB = 7'd7;
	parameter AND = 7'd8;
	parameter WRITE_DEST_RESULT_RD = 7'd9;
	parameter MFHI = 7'd10;
	parameter MFLO = 7'd11;
	parameter J = 7'd12;
	parameter DIV = 7'd13;
	parameter MULT = 7'd14;
	parameter JR = 7'd15;
	parameter WRITE_PC_ALUResult = 7'd16;
	parameter ADDI = 7'd17;
	parameter ADDIU = 7'd18;
	parameter SLT = 7'd19;
	parameter SLTI = 7'd20;
	parameter WRITE_DEST_SLT = 7'd21;
	parameter JAL = 7'd22;
	parameter WRITE_DEST_31 = 7'd23;
	parameter JUMP = 7'd24;
	parameter OP_BRANCH = 7'd25;
	parameter BEQ = 7'd26;
	parameter BLE = 7'd27;
	parameter BGT = 7'd28;
	parameter BNE = 7'd29;
	parameter STORES_LOADS = 7'd30;
	parameter MEMORY_READ = 7'd31;		// ALTERAR OS ESTADOS ANTES DOS LOADS E STORES, EXISTEM DOIS ESTADOS IGUAIS PARA LER DA MEMORIA, DEIXAR APENAS UM
	parameter LOAD_BYTE = 7'd32;
	parameter LOAD_HALF = 7'd33;
	parameter LOAD_WORD = 7'd34;
	parameter STORE_WORD = 7'd35;
	parameter STORE_BYTE = 7'd36;
	parameter STORE_HALF = 7'd37;
	parameter SHIFT_SLL = 7'd38;
	parameter SHIFT_SLLV = 7'd39;
	parameter SHIFT_SRA = 7'd40;
	parameter SHIFT_SRAV = 7'd41;
	parameter SHIFT_SRL = 7'd42;
	parameter LUI = 7'd43;
	parameter SHIFT_LEFT = 7'd44;
	parameter SHIFT_RIGHT_A = 7'd45;		// ALTERAR INSTRUCOES DE SHIFT, REUTILIZAR ESTADOS
	parameter SHIFT_RIGHT_L = 7'd46;
	parameter WRITE_DEST_SHIFT = 7'd47;
	parameter WRITE_DEST_LUI = 7'd48;
	parameter BEQM = 7'd49;
	parameter BEQM_COMP = 7'd50;	// ALTERAR O ULTIMO ESTADO DA INSTRUCAO BEQM PARA UTILIZAR O ESTADO DE BEQ
	parameter BREAK = 7'd51;		// ALTERAR O PROXIMO ESTADO PARA SER UM ESTADO QUE JA EXISTE (PCSource com o valor da operacao na ula)
	parameter RTE = 7'd52;
	parameter OPCODE_ERROR = 7'd53;
	parameter OVERFLOW_ALU = 7'd54;
	parameter DIV_ZERO = 7'd55;
	parameter WRITE_PC_ERROR = 7'd56;
	parameter WRITE_DEST_SLTI =7'd57;
	parameter WRITE_DEST_RESULT_RT = 7'd58;
	parameter WAIT_WRITE = 7'd59;
	parameter WAIT_READ_SEARCH = 7'd60;
	parameter START = 7'd61;
	parameter WAIT_WRITE_2 = 7'd62;
	parameter WAIT_WRITE_3 = 7'd63;
	parameter DIV_2 = 7'd64;
	parameter MULT_2 = 7'd65;

	parameter OPCODE_TYPE_R = 6'h0;
	parameter OPCODE_ADDI = 6'h8;
	parameter OPCODE_ADDIU = 6'h9;
	parameter OPCODE_LUI = 6'hf;
	parameter OPCODE_SLTI = 6'ha;
	parameter OPCODE_JAL = 6'h3;
	parameter OPCODE_JUMP = 6'h2;
	parameter OPCODE_BEQM = 6'h1;
	parameter OPCODE_BEQ = 6'h4;
	parameter OPCODE_BNE = 6'h5;
	parameter OPCODE_BLE = 6'h6;
	parameter OPCODE_BGT = 6'h7;
	parameter OPCODE_SW = 6'h2b;
	parameter OPCODE_SB = 6'h28;
	parameter OPCODE_SH = 6'h29;
	parameter OPCODE_LW = 6'h23;
	parameter OPCODE_LB = 6'h20;
	parameter OPCODE_LH = 6'h21;

	parameter FUNCT_ADD = 6'h20;
	parameter FUNCT_SUB = 6'h22;
	parameter FUNCT_AND = 6'h24;
	parameter FUNCT_JR = 6'h8;
	parameter FUNCT_MFHI = 6'h10;
	parameter FUNCT_MFLO = 6'h12;
	parameter FUNCT_SHIFT_SLL = 6'h0;
	parameter FUNCT_SHIFT_SRL = 6'h2;
	parameter FUNCT_SHIFT_SRAV = 6'h7;
	parameter FUNCT_SHIFT_SRA = 6'h3;
	parameter FUNCT_SHIFT_SLLV = 6'h4;
	parameter FUNCT_SLT = 6'h2a;
	parameter FUNCT_BREAK = 6'hd;
	parameter FUNCT_RTE = 6'h13;
	parameter FUNCT_MULT = 6'h18;
	parameter FUNCT_DIV = 6'h1a;


	// CRIAR OPCODES...

	initial
	begin
		State <= RESET;
	end

	always @(posedge clk)
	begin
		if(reset)
			State <= RESET;
		else begin
			case (State)
				RESET: begin
					RegDst <= RegDst_29;
					MemToReg <= MemToReg_227;
					IorE <= IorE_PC;
					RegWrite <= WRITE;

					State <= START;
				end

				START: begin
					IorD <= IorD_PC;
					PCWrite <= NOT_WRITE;
					RegWrite <= NOT_WRITE;
					PCWriteCond <= NOT_WRITE;
					ALUOutWrite <= NOT_WRITE;
					EPCWrite <= NOT_WRITE;
					MemRead <= READ;

					State <= WAIT_WRITE_2;

					//if(Opcode == OPCODE_SW || Opcode == OPCODE_SH || Opcode == OPCODE_SB || Opcode == OPCODE_LW || Opcode == OPCODE_LB || Opcode == OPCODE_LH) 
					//	State <= WAIT_WRITE_2;
					//else
					//	State <= SEARCH;
				end

				SEARCH: begin 
					//MemRead <= READ;
					ALUSourceA <= ALUSrcA_PC;
					ALUSourceB <= ALUSrcB_4;
					ALUOp <= ALUOp_ADD;
					IRWrite <= WRITE;
					
					State <= DECODE; //WAIT_READ_SEARCH;
				end
				WAIT_READ_SEARCH: begin
					ALUOutWrite <= NOT_WRITE;
					IRWrite <= NOT_WRITE;

					State <= DECODE;
				end
				WAIT_READ: begin
					EPCWrite <= NOT_WRITE;
					ALUOutWrite <= NOT_WRITE;
					MemRead <= NOT_READ;

					State <= WAIT_WRITE_3;
				end
				
				WAIT_WRITE_3: begin
					if(overflow || divZero || opcodeInexistente)
						State <= WRITE_PC_ERROR;
					else begin
						case(Opcode)
							OPCODE_LW: State <= LOAD_WORD;
							OPCODE_LB: State <= LOAD_BYTE;
							OPCODE_LH: State <= LOAD_HALF;
							OPCODE_SB: State <= STORE_BYTE;
							OPCODE_SH: State <= STORE_HALF;
							OPCODE_BEQM: State <= BEQM_COMP;
						endcase
					end
				end


				DECODE: begin
					ALUOutWrite <= NOT_WRITE;
					IRWrite <= NOT_WRITE;
					PCSource <= PCSrc_ALUResult;
					PCWrite <= WRITE;
					IorE <= IorE_PC;

					State <= BRANCH;
				end
				BRANCH: begin
					PCWrite <= NOT_WRITE;
					ALUSourceA <= ALUSrcA_PC;
					ALUSourceB <= ALUSrcB_Branch;
					ALUOp <= ALUOp_ADD;
					ALUOutWrite <= WRITE;

					case(Opcode)
						OPCODE_TYPE_R:
						case (Funct)
							FUNCT_ADD: State <= ADD;
							FUNCT_SUB: State <= SUB;
							FUNCT_AND: State <= AND;
							FUNCT_JR: State <= JR;
							FUNCT_MFHI: State <= MFHI;
							FUNCT_MFLO: State <= MFLO;
							FUNCT_SHIFT_SLL: State <= SHIFT_SLL;
							FUNCT_SHIFT_SRL: State <= SHIFT_SRL;
							FUNCT_SHIFT_SRAV: State <= SHIFT_SRAV;
							FUNCT_SHIFT_SRA: State <= SHIFT_SRA;
							FUNCT_SHIFT_SLLV: State <= SHIFT_SLLV;
							FUNCT_SLT: State <= SLT;
							FUNCT_BREAK: State <= BREAK;
							FUNCT_RTE: State <= RTE;
							FUNCT_MULT: State <= MULT;
							FUNCT_DIV: State <= DIV;
						endcase

						OPCODE_ADDI: State <= ADDI;

						OPCODE_ADDIU: State <= ADDIU;

						OPCODE_LUI: State <= LUI;

						OPCODE_SLTI: State <= SLTI;

						OPCODE_JAL: State <= JAL;

						OPCODE_JUMP: State <= JUMP;

						OPCODE_BEQM: State <= BEQM;

						OPCODE_BEQ: State <= OP_BRANCH;
						OPCODE_BNE: State <= OP_BRANCH;
						OPCODE_BLE: State <= OP_BRANCH;
						OPCODE_BGT: State <= OP_BRANCH;

						OPCODE_SW: State <= STORES_LOADS;
						OPCODE_SB: State <= STORES_LOADS;
						OPCODE_SH: State <= STORES_LOADS;
						OPCODE_LW: State <= STORES_LOADS;
						OPCODE_LB: State <= STORES_LOADS;
						OPCODE_LH: State <= STORES_LOADS;
					endcase
					
				end
				ADDI: begin
					PCWrite <= NOT_WRITE;
					ALUSourceA <= ALUSrcA_A;
					ALUSourceB <= ALUSrcB_Immediate;
					ALUOp <= ALUOp_ADD;
					//ALUOutWrite <= WRITE;

					State <= WRITE_DEST_RESULT_RT;
				end
				ADDIU: begin
					PCWrite <= NOT_WRITE;
					ALUSourceA <= ALUSrcA_A;
					ALUSourceB <= ALUSrcB_ImediateUns;
					ALUOp <= ALUOp_ADD;
					//ALUOutWrite <= WRITE;

					State <= WRITE_DEST_RESULT_RT;
				end
				SLT: begin
					PCWrite <= NOT_WRITE;
					ALUSourceA <= ALUSrcA_A;
					ALUSourceB <= ALUSrcB_B;
					ALUOp <= ALUOp_COMP;
					ALUOutWrite <= NOT_WRITE;

					State <= WRITE_DEST_SLT;
				end
				SLTI: begin
					PCWrite <= NOT_WRITE;
					ALUSourceA <= ALUSrcA_A;
					ALUSourceB <= ALUSrcB_Immediate;
					ALUOp <= ALUOp_COMP;
					ALUOutWrite <= NOT_WRITE;

					State <= WRITE_DEST_SLTI;
				end
				WRITE_DEST_SLT: begin
					MemToReg <= MemToReg_SLT;
					RegDst <= RegDst_RD;
					RegWrite <= WRITE;

					State <= START;
				end
				WRITE_DEST_SLTI: begin
					MemToReg <= MemToReg_SLT;
					RegDst <= RegDst_RT;
					RegWrite <= WRITE;

					State <= START;
				end
				WRITE_DEST_RESULT_RD: begin
					if(overflow)
						State <= OVERFLOW_ALU;
					else begin
						ALUOutWrite <= WRITE;
						MemToReg <= MemToReg_ALUOut;
						RegDst <= RegDst_RD;
						RegWrite <= WRITE;

						State <= START;
					end
				end
				WRITE_DEST_RESULT_RT: begin
					if(overflow) 
						State <= OVERFLOW_ALU;
					else begin
						ALUOutWrite <= WRITE;
						MemToReg <= MemToReg_ALUOut;
						RegDst <= RegDst_RT;
						RegWrite <= WRITE;

						State <= START;
					end
				end

				WRITE_DEST_31: begin
 					ALUOutWrite <= WRITE;
 					MemToReg <= MemToReg_ALUOut;
 					RegDst <= RegDst_31;
 					RegWrite <= WRITE;
 					
 					State <= JUMP;
 				end

				ADD: begin
					ALUSourceA <= ALUSrcA_A;
					ALUSourceB <= ALUSrcB_B;
					ALUOp <= ALUOp_ADD;
					//ALUOutWrite <= WRITE;

					State <= WRITE_DEST_RESULT_RD;
				end

				MFHI: begin
					MemToReg <= MemToReg_Hi;
					RegDst <= RegDst_RD;
					RegWrite <= WRITE;

					State <= START;
				end

				MFLO: begin
					MemToReg <= MemToReg_Lo;
					RegDst <= RegDst_RD;
					RegWrite <= WRITE;

					State <= START;
				end


				AND: begin
					ALUSourceA <= ALUSrcA_A;
					ALUSourceB <= ALUSrcB_B;
					ALUOp <= ALUOp_AND;
					//ALUOutWrite <= WRITE;

					State <= WRITE_DEST_RESULT_RD;
				end
				SUB: begin
					ALUSourceA <= ALUSrcA_A;
					ALUSourceB <= ALUSrcB_B;
					ALUOp <= ALUOp_SUB;
					//ALUOutWrite <= WRITE;

					State <= WRITE_DEST_RESULT_RD;
				end
				JR: begin
					ALUSourceA <= ALUSrcA_A;
					ALUSourceB <= ALUSrcB_B;
					ALUOp <= ALUOp_LoadA;
					//ALUOutWrite <= WRITE;			

					State <= WRITE_PC_ALUResult;
				end
				WRITE_PC_ALUResult: begin
					ALUOutWrite <= WRITE;			
					//ALUOutWrite <= NOT_WRITE;
					PCSource <= PCSrc_ALUResult;
					IorE <= IorE_PC;
					PCWrite <= WRITE;

					State <= START;
				end
				BREAK: begin
					ALUSourceA <= ALUSrcA_PC;
					ALUSourceB <= ALUSrcB_4;
					ALUOp <= ALUOp_SUB;

					State <= WRITE_PC_ALUResult;
				end
				RTE: begin
					PCSource <= PCSrc_EPC;
					IorE <= IorE_PC;
					PCWrite <= WRITE;

					State <= START;
				end

				DIV: begin
					DoDiv <= DIVIDE;
					SelHi <= Hi_Div;
					SelLo <= Lo_Div;

					State <= DIV_2;
				end

				DIV_2: begin
					if(divZero)
						State <= DIV_ZERO;
					if(endDiv == 0)
						State <= DIV_2;
					else if(endDiv == 1) begin
						DoDiv <= NOT_DIVIDE;
						State <= START;
					end
				end

				MULT: begin
					DoMult <= MULTIPLY;
					SelHi <= Hi_Mult;
					SelLo <= Lo_Mult;

					State <= MULT_2;
				end

				MULT_2: begin
					if(endMult == 0)
						State <= MULT_2;
					else if(endMult == 1) begin
						DoMult <= NOT_MULTIPLY;

						State <= START;
					end
				end

				JUMP: begin
					PCSource <= PCSrc_Jump;
					PCWrite <= WRITE;
					IorE <= IorE_PC;

					State <= START;
				end
				JAL: begin
					ALUSourceA = ALUSrcA_PC;
					ALUOp <= ALUOp_LoadA;

					State <= WRITE_DEST_31;
				end

				OP_BRANCH: begin
					ALUSourceA <= ALUSrcA_A;
					ALUSourceB <= ALUSrcB_B;
					ALUOp <= ALUOp_COMP;
					ALUOutWrite <= NOT_WRITE;					

					case (Opcode)
						OPCODE_BEQ: State <= BEQ;
						OPCODE_BNE: State <= BNE;
						OPCODE_BLE: State <= BLE;
						OPCODE_BGT: State <= BGT;
					endcase
				end
				BEQ: begin
					ALUOutWrite <= NOT_WRITE;
					PCSource <= PCSrc_ALUOut;
					PCWriteCond <= WRITE;
					JumpCond <= JumpC_ET;

					State <= START;
				end
				BNE: begin
					ALUOutWrite <= NOT_WRITE;
					PCSource <= PCSrc_ALUOut;
					PCWriteCond <= WRITE;
					JumpCond <= JumpC_NotEquals;

					State <= START;
				end
				BLE: begin
					ALUOutWrite <= NOT_WRITE;
					PCSource <= PCSrc_ALUOut;
					PCWriteCond <= WRITE;
					JumpCond <= JumpC_LE;

					State <= START;
				end
				BGT: begin
					ALUOutWrite <= NOT_WRITE;
					PCSource <= PCSrc_ALUOut;
					PCWriteCond <= WRITE;
					JumpCond <= JumpC_GT;

					State <= START;
				end
				STORES_LOADS: begin
					ALUSourceA <= ALUSrcA_A;
					ALUSourceB <= ALUSrcB_Immediate;
					ALUOp <= ALUOp_ADD;
					//ALUOutWrite <= WRITE;

					if(Opcode == OPCODE_SW) 
						State <= STORE_WORD;
					else
						State <= MEMORY_READ;
				
				end
				MEMORY_READ: begin
					ALUOutWrite <= WRITE;
					IorD <= IorD_ALUOut;
					MemRead <= READ;

					State <= WAIT_READ;
				end
				LOAD_WORD: begin
					SelLoad <= SelLoad_LW;
					MemToReg <= MemToReg_Load;
					RegDst <= RegDst_RT;
					RegWrite <= WRITE;

					State <= START;
				end
				LOAD_BYTE: begin
					SelLoad <= SelLoad_LB;
					MemToReg <= MemToReg_Load;
					RegDst <= RegDst_RT;
					RegWrite <= WRITE;

					State <= START;
				end
				LOAD_HALF: begin
					SelLoad <= SelLoad_LH;
					MemToReg <= MemToReg_Load;
					RegDst <= RegDst_RT;
					RegWrite <= WRITE;

					State <= START;
				end
				STORE_WORD: begin
					ALUOutWrite <= WRITE;
					//ALUOutWrite <= NOT_WRITE;
					SelStore <= SelStore_SW;
					IorD <= IorD_ALUOut;
					MemWrite <= WRITE;

					State <= WAIT_WRITE;
				end
				STORE_BYTE: begin
					SelStore <= SelStore_SB;
					IorD <= IorD_ALUOut;
					MemWrite <= WRITE;

					State <= WAIT_WRITE;
				end
				STORE_HALF: begin
					SelStore <= SelStore_SH;
					IorD <= IorD_ALUOut;
					MemWrite <= WRITE;

					State <= WAIT_WRITE;
				end
				BEQM: begin
					IorD <= IorD_A;
					MemRead <= READ;

					State <= WAIT_READ;
				end
				BEQM_COMP: begin
					ALUSourceA <= ALUSrcA_MDR;
					ALUSourceB <= ALUSrcB_B;
					ALUOp <= ALUOp_COMP;

					State <= BEQ;
				end
				SHIFT_SLL: begin
					SelEntDesl <= EntDesl_B;
					SelShift <= SelShift_Shamt;
					Shift <= Shift_Load;

					State <= SHIFT_LEFT;
				end
				SHIFT_SLLV: begin
					SelEntDesl <= EntDesl_A;
					SelShift <= SelShift_B;
					Shift <= Shift_Load;

					State <= SHIFT_LEFT;
				end
				SHIFT_SRA: begin
					SelEntDesl <= EntDesl_B;
					SelShift <= SelShift_Shamt;
					Shift <= Shift_Load;

					State <= SHIFT_RIGHT_A;
				end
				SHIFT_SRAV: begin
					SelEntDesl <= EntDesl_A;
					SelShift <= SelShift_B;
					Shift <= Shift_Load;

					State <= SHIFT_RIGHT_A;
				end
				SHIFT_SRL: begin						
					SelEntDesl <= EntDesl_B;
					SelShift <= SelShift_Shamt;
					Shift <= Shift_Load;

					State <= SHIFT_RIGHT_L;
				end
				LUI: begin
					SelEntDesl <= EntDesl_Immediate;
					SelShift <= SelShift_16;
					Shift <= Shift_Load;

					State <= SHIFT_LEFT;
				end
				SHIFT_LEFT: begin
					Shift <= Shift_L;

					if(Opcode == OPCODE_LUI)
						State <= WRITE_DEST_LUI;
					else
						State <= WRITE_DEST_SHIFT;
				
				end
				SHIFT_RIGHT_A: begin
					Shift <= Shift_R_A;

					State <= WRITE_DEST_SHIFT;
				end
				SHIFT_RIGHT_L: begin
					Shift <= Shift_R_L;

					State <= WRITE_DEST_SHIFT;
				end
				WRITE_DEST_SHIFT: begin
					MemToReg <= MemToReg_ShiftOut;
					RegDst <= RegDst_RD;
					RegWrite <= WRITE;

					State <= START;
				end
				WRITE_DEST_LUI: begin
					MemToReg <= MemToReg_ShiftOut;
					RegDst <= RegDst_RT;
					RegWrite <= WRITE;

					State <= START;
				end
				OVERFLOW_ALU: begin
					ALUSourceA <= ALUSrcA_PC;
					ALUSourceB <= ALUSrcB_4;
					ALUOp <= ALUOp_SUB;
					//EPCWrite <= WRITE;
					SelError <= Error_254_Overflow;
					IorD <= IorD_Error;
					MemRead <= READ;

					State <= WAIT_READ;
				end
				OPCODE_ERROR: begin
					ALUSourceA <= ALUSrcA_PC;
					ALUSourceB <= ALUSrcB_4;
					ALUOp <= ALUOp_SUB;
					//EPCWrite <= WRITE;
					SelError <= Error_253_Opcode;
					IorD <= IorD_Error;
					MemRead <= READ;

					State <= WAIT_READ;
				end
				DIV_ZERO: begin
					ALUSourceA <= ALUSrcA_PC;
					ALUSourceB <= ALUSrcB_4;
					ALUOp <= ALUOp_SUB;
					//EPCWrite <= WRITE;
					SelError <= Error_255_Div;
					IorD <= IorD_Error;
					MemRead <= READ;

					State <= WAIT_READ;
				end
				WRITE_PC_ERROR: begin
					EPCWrite <= WRITE;
					SelLoad <= SelLoad_LB;
					IorE <= IorE_E;
					PCWrite <= WRITE;
					
					State <= START;
				end
				WAIT_WRITE: begin
					ALUOutWrite <= NOT_WRITE;
					MemWrite <= NOT_WRITE;
				
					State <= START;
				end
				WAIT_WRITE_2: begin
					State <= SEARCH;
				end
				
				default:
				State <= OPCODE_ERROR;	
			endcase
		end
	end

endmodule
