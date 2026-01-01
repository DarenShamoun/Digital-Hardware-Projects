/*
 * riscv_core.sv
 *
 * Authors: David and Sarah Harris
 * Updated By: Sat Garcia
 *
 * Module for a 32-bit RISC-V pipelined processor core.
 *
 * Recall that a CPU has two main components, the datapath and the control,
 * which we use separate modules for here (core_datapath and core_controller).
 */

module riscv_core(input  logic clk, reset,
					output logic [31:0] pc,
					input  logic [31:0] instr_f,
					output logic dmem_write,
					output logic [31:0] alu_result_m, dmem_write_data,
					input  logic [31:0] dmem_read_data);

	logic pc_src_d, equal_d, alu_src_x, reg_write_w;
	logic [1:0] result_src_w, imm_src_d;
	logic [2:0] alu_ctrl_x;
	logic [31:0] instr_d;

	core_controller c(.op(instr_d[6:0]),
						.funct3(instr_d[14:12]), 
						.funct7_b5(instr_d[30]), 
						.equal_d,
						.dmem_write_m(dmem_write), 
						.pc_src_d,
						.alu_src_x, 
						.reg_write_w, 
						.alu_ctrl_x,
						.result_src_w,
						.imm_src_d,
						.clk,
						.reset);

	core_datapath dp(.clk, .reset,
						.pc_src_d, 
						.instr_f,
						.alu_src_x, 
						.reg_write_w, 
						.alu_ctrl_x, 
						.result_src_w,
						.imm_src_d,
						.equal_d, 
						.pc, 
						.instr_d,
						.alu_result_m,
						.dmem_write_data_m(dmem_write_data),
						.dmem_read_data_m(dmem_read_data));
endmodule
