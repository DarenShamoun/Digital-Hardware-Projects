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

	logic pc_src_x, zero_x, alu_src_x, reg_write_w;
	logic [1:0] result_src_w, imm_src_d;
	logic [2:0] alu_ctrl_x;
	logic [31:0] instr_d;

	logic stall_f, stall_d;
	logic flush_d, flush_x;
	logic [1:0] forward_a_x, forward_b_x;
	logic [4:0] rs1_d, rs2_d;
	logic [4:0] rs1_x, rs2_x, rd_x;
	logic [4:0] rd_m, rd_w;
	logic [4:0] rs2_m;
	logic forward_m;

	core_controller c(.op(instr_d[6:0]),
						.funct3(instr_d[14:12]), 
						.funct7_b5(instr_d[30]), 
						.zero_x,
						.dmem_write_m(dmem_write), 
						.pc_src_x,
						.alu_src_x, 
						.reg_write_w, 
						.alu_ctrl_x,
						.result_src_w,
						.imm_src_d,
						.clk,
						.reset,
						.stall_f,
						.stall_d,
						.flush_d,    
						.rs1_d,
						.rs2_d,
						.flush_x,
						.rs1_x,
						.rs2_x,
						.rd_x,
						.forward_a_x,
						.forward_b_x,
						.rd_m,
						.rd_w,
						.rs2_m,
						.forward_m);

	core_datapath dp(.clk, .reset,
						.pc_src_x, 
						.instr_f,
						.alu_src_x, 
						.reg_write_w, 
						.alu_ctrl_x, 
						.result_src_w,
						.imm_src_d,
						.zero_x, 
						.pc, 
						.instr_d,
						.alu_result_m, 
						.dmem_write_data_m(dmem_write_data),
						.dmem_read_data_m(dmem_read_data),
						.stall_f,
						.stall_d,
						.flush_d,
						.rs1_d,
						.rs2_d,
						.flush_x,
						.rs1_x,
						.rs2_x,
						.rd_x,
						.forward_a_x,
						.forward_b_x,
						.rd_m,
						.rd_w,
						.rs2_m,
						.forward_m);
endmodule
