/*
 * Module that sign-extends a value.
 */
module extend(	input  logic [31:7] instr,
				input  logic [2:0]  imm_src,
				output logic [31:0] imm_ext);
              
	always_comb
		case (imm_src)
			3'b000: // I-type
				imm_ext = {{20{instr[31]}}, instr[31:20]};
			3'b001: // S-type (stores)
				imm_ext = {{20{instr[31]}}, instr[31:25], instr[11:7]};
			3'b010: // B-type (branches)
				imm_ext = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};
			3'b011: // J-type (jal)
				imm_ext = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};
			3'b100: //U-type (lui)
				imm_ext = {instr[31:12], 12'b0};
			default: // undefined
				imm_ext = 32'bx;
		endcase

endmodule
