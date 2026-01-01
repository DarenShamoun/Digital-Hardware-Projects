/*
 * File: alu8_tb.sv
 *
 * SystemVerilog self-checking testbench for a 8-bit version of the ALU
 * module.
 *
 * Note that this testbench reads test vectors from a file named alu8.tv.
 */
module testbench();

	// wires to connect to input/output of alu module
	logic [7:0] a, b, y;
	logic [2:0] f;
	logic zero, carry, overflow;

	// The clk isn't used by the ALU since it is a combinational circuit.
	// However, we'll use it in this testbench to give us a reference for when
	// to apply the inputs and then check the outputs.
	logic clk;

	integer test_num; // Number of the test vector we are currently testing.
	integer num_errors; // Number of errors encountered by testbench

	logic [7:0] expected_y;
	logic expected_zero;
	logic expected_carry_out;
	logic expected_overflow;

	logic [39:0] test_vectors [29:0]; // will contain data we read from vector file.

	alu #(8) alu8(.a, .b, .f, .y, .zero, .carry_out(carry), .overflow(overflow));

	initial
		forever
		begin
			clk = 0; #25; clk = 1; #25;
		end

	initial
	begin
		// Read test vector data from the alu8.tv file into our test_vectors
		// array.
		$readmemh("alu8.tv", test_vectors);

		num_errors = 0;

		// Go through all the test vectors and do the following three steps.
		//
		// 1. Advanced to the next negedge of the clk, set the ALU inputs
		//    to the values for those inputs contained in the test vectors,
		//    and assign the expected ALU outputs (from the test vectors) to
		//    the variables you created to hold those "expected" values).
		// 2. Advance time in the simulation to the next negative or positive
		//    edge of the clock to allow for the ALU inputs to propagate to
		//    the outputs.
		// 3. Use an assert/else statement to check that all alu outputs are the same
		//    as the expected outputs. If they are not, use $error to print
		//    out the following information:
		// 	  - The test number (in decimal format))
		// 	  - The inputs in HEX (%h) format
		// 	  - The actual and expected ALU outputs, also HEX format
		//
		// 	  Note that you should aim to have a single assert statement that
		// 	  checks all of the outputs, not a single assert for each output;
		// 	  this will reduce code duplication in your testbench.
		for (test_num = 0; test_num < 30; test_num = test_num + 1)
		begin
			$display("Beginning test number %d", test_num); // indicate which test we are doing now (don't modify this line)

			// Step 1 (Test Vector Setup)
			@(negedge clk);
			f = test_vectors[test_num][38:36];
			a = test_vectors[test_num][35:28];
			b = test_vectors[test_num][27:20];
			expected_y = test_vectors[test_num][19:12];
			expected_zero = test_vectors[test_num][8];
			expected_carry_out = test_vectors[test_num][4];
			expected_overflow = test_vectors[test_num][0];

			// Step 2 (Advance time)
			@(posedge clk);

			// Step 3 (Output Validation)
			assert( (y === expected_y) && (zero === expected_zero) && (carry === expected_carry_out) && (overflow === expected_overflow))
			else 
			begin
				$error("Test %0d failed: Inputs: a=%h, b=%h, f=%h | Expected: y=%h, zero=%b, carry=%b, overflow=%b | Actual: y=%h, zero=%b, carry=%b, overflow=%b",
					test_num, a, b, f, expected_y, expected_zero, expected_carry_out, expected_overflow, y, zero, carry, overflow);
				num_errors = num_errors + 1;
			end
		end

		// Print a summary of your test results here.
		$display("Simulation Complete: %d out of %d tests failed", num_errors, 30);

		$stop(0); // stops the simulation
	end

endmodule
