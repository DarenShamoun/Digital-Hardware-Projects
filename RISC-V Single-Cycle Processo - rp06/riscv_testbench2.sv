/*
 * riscv_testbench2.sv
 *
 * Author: David Harris (Updated by Sat Garcia)
 *
 * Testbench for RISC-V processor, using p06-test2.asm
 */

module testbench2;

	logic        clk;
	logic        reset;

	logic [31:0] write_data, data_addr;
	logic        mem_write;

	// instantiate device to be tested
	top dut(.clk, .reset, .dmem_write_data(write_data), 
			.dmem_addr(data_addr), .dmem_write(mem_write));
	  
	// initialize test
	initial
	begin
		@(negedge clk);
		reset <= 1; 
		@(negedge clk);
		reset <= 0;
	end

	// generate clock to sequence tests
	initial
		forever
		begin
			clk <= 0; #5; clk <= 1; #5;
		end

	// check that 25 gets written to address 100
	always@(negedge clk)
	begin
		$display("pc = %h, instr = %h, alu_out = %h", dut.pc, dut.instr, dut.core.alu_out);

		// written to memory by p06-test2.asm 
		if(mem_write) begin
			if(data_addr === 42 & write_data === 32'hABCDE000)
			 begin
				$display("Simulation succeeded!");
				$stop;
			 end
			else if (data_addr !== 96)
			 begin
				$display("Simulation failed! Incorrect result: %d (should be 42)", write_data);
				$stop;
			 end
		end
	end
endmodule
