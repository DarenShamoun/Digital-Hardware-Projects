/*
 * File: alu.sv
 *
 * Module for an ALU with the following operations: ADD, SUB, AND, OR, XOR,
 * NOR, SLT.
 *
 * Authors: 
 * Daren Shamoun darenshamoun@sandiego.edu
 * Tony Abelson tabelson@sandiego.edu 
 */

module alu
		#(parameter WIDTH=16)
		 (input logic [WIDTH-1:0] a, b,
          input  logic [2:0]  f,
          output logic [WIDTH-1:0] y,
          output logic zero, carry_out, overflow);

        logic [WIDTH:0] sub_result;
        logic sub_overflow;

        assign sub_result = {1'b0, a} - {1'b0, b};
        assign sub_overflow = (a[WIDTH-1] & ~b[WIDTH-1] & ~sub_result[WIDTH-1]) | (~a[WIDTH-1] & b[WIDTH-1] & sub_result[WIDTH-1]);

        always_comb 
        begin
            logic [WIDTH:0] overflow_result;
            y = '0;
            zero = 1'b0;
            carry_out = 1'b0;
            overflow = 1'b0;
            overflow_result = '0;
            
            case (f)
                // Add
                3'b010:
                begin
                    overflow_result = {1'b0, a} + {1'b0, b};
                    y = overflow_result[WIDTH-1:0];
                    carry_out = overflow_result[WIDTH];
                    overflow = (a[WIDTH-1] & b[WIDTH-1] & ~y[WIDTH-1]) | (~a[WIDTH-1] & ~b[WIDTH-1] & y[WIDTH-1]);
                end

                // Subtract
                3'b110: 
                begin
                    y = sub_result[WIDTH-1:0];
                    carry_out = sub_result[WIDTH];
                    overflow = sub_overflow;
                end

                // AND
                3'b000:
                begin
                    y = a & b;
                end

                // OR
                3'b001:
                begin
                    y = a | b;
                end

                // XOR
                3'b100:
                begin
                    y = a ^ b;
                end

                // NOR
                3'b101:
                begin
                    y = ~(a | b);
                end

                // SLT
                3'b111: 
                begin
                    y = {{(WIDTH-1){1'b0}}, sub_result[WIDTH-1] ^ sub_overflow};
                    carry_out = sub_result[WIDTH];
                    overflow = sub_overflow;
                end

                default:
                begin
                    y = '0;
                end
            endcase

            if (y == {WIDTH{1'b0}}) 
            begin
                zero = 1'b1;
            end
            else 
            begin
                zero = 1'b0;
            end
        end

endmodule
