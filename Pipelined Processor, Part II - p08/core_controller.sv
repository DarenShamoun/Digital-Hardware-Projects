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
						input  logic       zero_x,
						output logic       dmem_write_m,
						output logic [1:0] result_src_w, imm_src_d,
						output logic       pc_src_x, alu_src_x,
						output logic       reg_write_w,
						output logic [2:0] alu_ctrl_x,
						output logic stall_f,
						output logic stall_d,
						output logic flush_d,
						input logic [4:0] rs1_d,
						input logic [4:0] rs2_d,
						output logic flush_x,
						input logic [4:0] rs1_x,
						input logic [4:0] rs2_x,
						input logic[4:0] rd_x,
						output logic [1:0] forward_a_x,
						output logic [1:0] forward_b_x,
						input logic [4:0] rd_m,
						input logic [4:0] rd_w,
						input logic [4:0] rs2_m,
						output logic forward_m);

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

	hazard_unit hazard(
		.rs1_d(rs1_d), 
		.rs2_d(rs2_d),
		.rs1_x(rs1_x), 
		.rs2_x(rs2_x), 
		.rd_x(rd_x),
		.result_src_x(result_src_x),
		.pc_src_x(pc_src_x),
		.rd_m(rd_m), 
		.rd_w(rd_w),
		.rs2_m(rs2_m),
		.reg_write_m(reg_write_m), 
		.reg_write_w(reg_write_w),
		.dmem_write_m(dmem_write_m),
		.dmem_write_d(dmem_write_d),
		.stall_f(stall_f), 
		.stall_d(stall_d),
		.flush_d(flush_d), 
		.flush_x(flush_x),
		.forward_a_x(forward_a_x), 
		.forward_b_x(forward_b_x),
		.forward_m(forward_m)
	);
	
	assign pc_src_x = (branch_x & zero_x) | jump_x;

	// D-X Inter-stage registers	
	flopr #(1) reg_write_reg_d_x(.clk, .reset(flush_x | reset), .d(reg_write_d), .q(reg_write_x));
	flopr #(2) result_src_reg_d_x(.clk, .reset(flush_x | reset), .d(result_src_d), .q(result_src_x));
	flopr #(1) dmem_write_reg_d_x(.clk, .reset(flush_x | reset), .d(dmem_write_d), .q(dmem_write_x));
	flopr #(1) jump_reg_d_x(.clk, .reset(flush_x | reset), .d(jump_d), .q(jump_x));
	flopr #(1) branch_reg_d_x(.clk, .reset(flush_x | reset), .d(branch_d), .q(branch_x));
	flopr #(3) alu_ctrl_reg_d_x(.clk, .reset(flush_x | reset), .d(alu_ctrl_d), .q(alu_ctrl_x));
	flopr #(1) alu_src_reg_d_x(.clk, .reset(flush_x | reset), .d(alu_src_d), .q(alu_src_x));

	// X-M Inter-stage registers
	flopr #(1) reg_write_reg_x_m(.clk, .reset, .d(reg_write_x), .q(reg_write_m));
	flopr #(2) result_src_reg_x_m(.clk, .reset, .d(result_src_x), .q(result_src_m));
	flopr #(1) dmem_write_reg_x_m(.clk, .reset, .d(dmem_write_x), .q(dmem_write_m));

	// M-W Inter-stage registers
	flopr #(1) reg_write_reg_m_w(.clk, .reset, .d(reg_write_m), .q(reg_write_w));
	flopr #(2) result_src_reg_m_w(.clk, .reset, .d(result_src_m), .q(result_src_w));
	
endmodule
