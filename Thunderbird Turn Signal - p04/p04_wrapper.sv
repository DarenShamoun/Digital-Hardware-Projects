/* 
 * File: p04_wrapper.sv
 *
 * This file makes it easier to match your FSM inputs/outputs to the DE0-Nano
 * inputs/outputs.
 */

module p04_wrapper( input  logic [2:0] SW,
					input  logic [0:0] KEY,
					output logic [7:0] LED );
          
  // Use button (i.e. Key0) for clk
  // switches for inputs (left and right)
  // LEDs for output (la, lb, etc.)
  
  // create an instance of the tbird_fsm module named fsm
  tbird_fsm fsm(.clk(KEY[0]), .reset(SW[0]), .left(SW[2]), .right(SW[1]),
				  .la(LED[5]), .lb(LED[6]), .lc(LED[7]), 
				  .ra(LED[2]), .rb(LED[1]), .rc(LED[0]));
endmodule
