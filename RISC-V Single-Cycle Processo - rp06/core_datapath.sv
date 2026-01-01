/*
 * core_datapath.sv
 *
 * Authors: David and Sarah Harris
 * Updated By: Sat Garcia
 *
 * Module that implements datapath component of RISC-V core.
 */

module core_datapath(input  logic   clk, reset,
                input  logic        pc_src,
                input  logic        alu_src,
                input  logic        reg_write,
                input  logic [2:0]  imm_src, 
				input  logic [1:0]  result_src,
                input  logic [2:0]  alu_ctrl,
                output logic        zero,
                output logic [31:0] pc,
                input  logic [31:0] instr,
                output logic [31:0] alu_out, dmem_write_data,
                input  logic [31:0] dmem_read_data);

	logic [31:0] pc_next, pc_plus_4, pc_target;
	logic [31:0] imm_ext;
	logic [31:0] srca, srcb;
	logic [31:0] result;

	logic carry_out, overflow;

	// logic for determining next PC
	flopr #(32) pcreg(.clk, .reset, .d(pc_next), .q(pc));

	adder #(32) pcadd4(.a(pc), .b(32'd4), .y(pc_plus_4));

	adder #(32) pcaddbranch(.a(pc), .b(imm_ext), .y(pc_target));

	mux2 #(32) pcmux(.d0(pc_plus_4), .d1(pc_target), .sel(pc_src), .y(pc_next));

	// logic associated with register file
	regfile #(32,32) rf(.clk, 
						.ra1(instr[19:15]), .ra2(instr[24:20]),
						.wa3(instr[11:7]), .wd3(result), .we3(reg_write & ~reset),
						.rd1(srca), .rd2(dmem_write_data));

	extend ext(.instr(instr[31:7]), .imm_src, .imm_ext);

	// logic associated with the ALU
	mux2 #(32) srcbmux(.d0(dmem_write_data), .d1(imm_ext),
						.sel(alu_src), .y(srcb));

	alu #(32) alu(.a(srca), .b(srcb), .f(alu_ctrl), .y(alu_out),
					.zero(zero), .carry_out, .overflow);

	mux4 #(32) resmux(.d0(alu_out), .d1(dmem_read_data), .d2(pc_plus_4),
					.d3(imm_ext), .sel(result_src), .y(result));

endmodule
