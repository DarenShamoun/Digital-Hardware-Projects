/*
 * core_controller.sv
 *
 * Authors: David and Sarah Harris
 * Updated By: Sat Garcia
 *
 * Module that implements control component of processor.
 */

module core_controller(input  logic [6:0] op,
		input  logic [2:0] funct3,
		input  logic       funct7_b5,
		input  logic       zero,
		output logic       pc_src, alu_src,
		output logic       reg_write, dmem_write,
		output logic       jump,
		output logic [2:0] imm_src, 
		output logic [1:0] result_src,
		output logic [2:0] alu_ctrl);

	logic [1:0] alu_op;
	logic       branch;

	maindec md(.op, .result_src, .dmem_write, .branch,
				.alu_src, .reg_write, .jump,
				.alu_op, .imm_src);

	aludec  ad(.op_b5(op[5]), .funct3, .funct7_b5, .alu_op, .alu_ctrl);

	assign pc_src = branch & (zero ^ funct3[0]) | jump;
endmodule
