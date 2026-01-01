/*
 * riscv_core.sv
 *
 * Authors: David and Sarah Harris
 * Updated By: Sat Garcia
 *
 * Module for a Single-cycle 32-bit RISC-V processor core.
 * Recall that a CPU has two main components, the datapath and the control,
 * which we use separate modules for here (core_datapath and core_controller).
 */
module riscv_core(	input  logic clk, reset,
					output logic [31:0] pc,
					input  logic [31:0] instr,
					output logic dmem_write,
					output logic [31:0] alu_out, dmem_write_data,
					input  logic [31:0] dmem_read_data);

	logic pc_src, zero, alu_src, reg_write, jump;
	logic [2:0] alu_ctrl;
	logic [2:0] imm_src;
	logic [1:0] result_src;

	core_controller c(.op(instr[6:0]), .funct3(instr[14:12]),
						.funct7_b5(instr[30]), .zero,
						.result_src, .dmem_write, .pc_src,
						.alu_src, .reg_write, .jump,
						.alu_ctrl, .imm_src);

	core_datapath dp(.clk, .reset,
						.pc_src, .alu_src, .imm_src, .result_src,
						.reg_write, 
						.alu_ctrl, .zero, .pc, .instr,
						.alu_out, .dmem_write_data, .dmem_read_data);
endmodule
