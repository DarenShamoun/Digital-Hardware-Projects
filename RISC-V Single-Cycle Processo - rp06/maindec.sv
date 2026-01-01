/*
 * maindec.sv
 *
 * Authors: David and Sarah Harris
 * Updated By: Sat Garcia
 *
 * Module that computes all non-ALU control signals.
 */
module maindec(input  logic [6:0] op,
               output logic       alu_src,
               output logic       dmem_write, reg_write,
               output logic       branch, jump,
               output logic [2:0] imm_src, 
			   output logic [1:0]  result_src,
               output logic [1:0] alu_op);

	logic [11:0] controls;

	assign {reg_write, imm_src, alu_src, dmem_write,
			  result_src, branch, alu_op, jump} = controls;

	always_comb
	begin
		case(op)
			7'b0000011: controls = 12'b1_000_1_0_01_0_00_0; // lw
			7'b0100011: controls = 12'b0_001_1_1_00_0_00_0; // sw
			7'b0110011: controls = 12'b1_xxx_0_0_00_0_10_0; // Rtype
			7'b1100011: controls = 12'b0_010_0_0_00_1_01_0; // beq
			7'b0010011: controls = 12'b1_000_1_0_00_0_10_0; // I-type ALU 
			7'b1101111: controls = 12'b1_011_0_0_10_0_00_1; // jal
			7'b0110111: controls = 12'b1_100_x_0_11_0_xx_0; // lui
			default:    controls = 12'bx_xxx_x_x_xx_x_xx_x; // ???
		endcase
	end
endmodule
