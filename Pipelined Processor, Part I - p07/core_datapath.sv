/*
 * core_datapath.sv
 *
 * Authors: David and Sarah Harris
 * Updated By: Sat Garcia
 *
 * Module that implements datapath component of MIPS core.
 */

module core_datapath(input  logic   clk, reset,
                input  logic        pc_src_d,
                input  logic [1:0]  result_src_w, imm_src_d,
                input  logic        alu_src_x,
                input  logic        reg_write_w,
                input  logic [2:0]  alu_ctrl_x,
                output logic        equal_d,
                output logic [31:0] pc,
                input  logic [31:0] instr_f,
                output logic [31:0] instr_d,
                output logic [31:0] alu_result_m, dmem_write_data_m,
                input  logic [31:0] dmem_read_data_m);

	// Fetch (F) stage signals
	logic [31:0] pc_plus_4_f, pc_next_f;

	// Decode (D) stage signals
	logic [31:0] pc_d, pc_plus_4_d;
	logic [31:0] srca_d, rd2_d, imm_ext_d;
	logic [31:0] pc_target_d;

	// Execute (X) stage signals
	logic [31:0] pc_plus_4_x;
	logic [31:0] srca_x, rd2_x, imm_ext_x;
	logic [4:0] rd_x;
	logic [31:0] srcb_x, alu_result_x;
	logic carry_x, overflow_x;

	// Memory (M) stage signals
	logic [4:0] rd_m;
	logic [31:0] pc_plus_4_m;
	
	// Writeback (W) stage signals
	logic [31:0] alu_result_w, dmem_read_data_w, result_w, pc_plus_4_w;
	logic [4:0] rd_w;

	// Fetch (F) stage datapath components
	
	flopr #(32) pcreg(.clk, .reset, .d(pc_next_f), .q(pc));

	adder #(32) pcadd4(.a(pc), .b(32'd4), .y(pc_plus_4_f));

	mux2 #(32) pcmux(.d0(pc_plus_4_f), .d1(pc_target_d), .sel(pc_src_d), .y(pc_next_f));


	// Fetch-to-Decode Inter-stage Registers
	flopr #(32) pc_reg_f_d(.clk, .reset, .d(pc), .q(pc_d));
	flopr #(32) pc_plus_4_reg_f_d(.clk, .reset, .d(pc_plus_4_f), .q(pc_plus_4_d));
	flopr #(32) instr_reg_f_d(.clk, .reset, .d(instr_f), .q(instr_d));



	// Decode (D) stage datapath components 
	
	// Note: reg file also used WB
	regfile #(32,32) rf(.clk(~clk), .we3(reg_write_w & ~reset), 
						.ra1(instr_d[19:15]), .ra2(instr_d[24:20]),
						.rd1(srca_d), .rd2(rd2_d),
						.wa3(rd_w), .wd3(result_w)
					);

	extend ext(.instr(instr_d[31:7]), .imm_src(imm_src_d), .imm_ext(imm_ext_d));

	// Comparing to decide branch in decode stage
	compare #(32) comp(.a(srca_d), .b(rd2_d), .equal(equal_d));

	// PC target calculation is now in decode stage
	adder #(32) pcaddbranch(.a(pc_d), .b(imm_ext_d), .y(pc_target_d));

	// Decode-to-Execute Inter-stage Registers
	flopr #(32)	pc_plus_4_reg_d_x(.clk, .reset, .d(pc_plus_4_d), .q(pc_plus_4_x));
	flopr #(32) srca_reg_d_x(.clk, .reset, .d(srca_d), .q(srca_x));
	flopr #(32) rd2_reg_d_x(.clk, .reset, .d(rd2_d), .q(rd2_x));
	flopr #(32) imm_ext_reg_d_x(.clk, .reset, .d(imm_ext_d), .q(imm_ext_x));
	flopr #(5) rd_reg_d_x(.clk, .reset, .d(instr_d[11:7]), .q(rd_x));

	// Execute (X) stage datapath components
	
	// selects if alu's 2nd input is immediate or register
	mux2 #(32) srcbmux(.d0(rd2_x), .d1(imm_ext_x),
						.sel(alu_src_x), .y(srcb_x));

	alu #(32) alu(.a(srca_x), .b(srcb_x), .f(alu_ctrl_x), .y(alu_result_x),
					.zero(), .carry(carry_x), .overflow(overflow_x));

	// Execute-to-Memory Inter-stage Registers
	flopr #(32) alu_result_reg_x_m(.clk, .reset, .d(alu_result_x), .q(alu_result_m));
	flopr #(32) dmem_write_data_reg_x_m(.clk, .reset, .d(rd2_x), .q(dmem_write_data_m));

	flopr #(5) rd_reg_x_m(.clk, .reset, .d(rd_x), .q(rd_m));
	flopr #(32) pc_plus_4_reg_x_m(.clk, .reset, .d(pc_plus_4_x), .q(pc_plus_4_m));



	// Memory (M) stage datapath components
	
	// Wait, where are they?!?! 
	// Oh, that's right. Data memory is its own module that we hook up to via
	// inputs and outputs of this module.


	// Memory-to-Writeback Inter-stage Registers
	flopr #(32) alu_result_reg_m_w(.clk, .reset, .d(alu_result_m), .q(alu_result_w));
	flopr #(32) dmem_read_data_reg_m_w(.clk, .reset, 
										.d(dmem_read_data_m), .q(dmem_read_data_w));
	flopr #(5) rd_reg_m_w(.clk, .reset, .d(rd_m), .q(rd_w));
	flopr #(32) pc_plus_4_reg_m_w(.clk, .reset, .d(pc_plus_4_m), .q(pc_plus_4_w));



	// Writeback (W) stage datapath components
	
	mux3 #(32) resmux(.d0(alu_result_w), .d1(dmem_read_data_w), .d2(pc_plus_4_w),
						 .sel(result_src_w), .y(result_w));

endmodule
