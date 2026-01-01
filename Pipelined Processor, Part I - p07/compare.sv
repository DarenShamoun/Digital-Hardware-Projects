/*
 * compare.sv
 *
 * Comparison module for branches in the Decode stage.
 */
module compare #(parameter WIDTH = 32) 
    (input logic [WIDTH-1:0] a, b, 
    output logic equal);
    
    assign equal = (a == b);
endmodule