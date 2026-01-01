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
						input  logic	   clk, reset,
						input  logic       equal_d,
						output logic       dmem_write_m,
						output logic [1:0] result_src_w, imm_src_d,
						output logic       pc_src_d, alu_src_x,
						output logic       reg_write_w,
						output logic [2:0] alu_ctrl_x);

	logic [1:0] alu_op_d;

	logic reg_write_d, reg_write_x, reg_write_m;
	logic [1:0] result_src_d, result_src_x, result_src_m;
	logic dmem_write_d, dmem_write_x;
	logic branch_d, branch_x;
	logic jump_d, jump_x;
	logic [2:0] alu_ctrl_d;
	logic alu_src_d;

	// Note: Controller is active in Decode (D) stage so we need to make sure we
	// wire the maindec and aludec inputs/outputs up to our "_d" signals (e.g.
	// reg_write_d).
	maindec md(.op, .result_src(result_src_d), .dmem_write(dmem_write_d), 
				.branch(branch_d), .alu_src(alu_src_d),
				.reg_write(reg_write_d), .jump(jump_d),
				.alu_op(alu_op_d), .imm_src(imm_src_d));

	aludec  ad(.op_b5(op[5]), .funct3, .funct7_b5, .alu_op(alu_op_d), .alu_ctrl(alu_ctrl_d));
	
	assign pc_src_d = (branch_d & equal_d) | jump_d;

	// D-X Inter-stage registers
	flopr #(1) reg_write_reg_d_x(.clk, .reset, .d(reg_write_d), .q(reg_write_x));
	flopr #(2) result_src_reg_d_x(.clk, .reset, .d(result_src_d), .q(result_src_x));
	flopr #(1) dmem_write_reg_d_x(.clk, .reset, .d(dmem_write_d), .q(dmem_write_x));
	flopr #(3) alu_ctrl_reg_d_x(.clk, .reset, .d(alu_ctrl_d), .q(alu_ctrl_x));
	flopr #(1) alu_src_reg_d_x(.clk, .reset, .d(alu_src_d), .q(alu_src_x));

	// X-M Inter-stage registers
	flopr #(1) reg_write_reg_x_m(.clk, .reset, .d(reg_write_x), .q(reg_write_m));
	flopr #(2) result_src_reg_x_m(.clk, .reset, .d(result_src_x), .q(result_src_m));
	flopr #(1) dmem_write_reg_x_m(.clk, .reset, .d(dmem_write_x), .q(dmem_write_m));

	// M-W Inter-stage registers
	flopr #(1) reg_write_reg_m_w(.clk, .reset, .d(reg_write_m), .q(reg_write_w));
	flopr #(2) result_src_reg_m_w(.clk, .reset, .d(result_src_m), .q(result_src_w));
	
endmodule
