module tbird_fsm (
    input logic clk,
    input logic reset,
    input logic left,
    input logic right,
    output logic la, lb, lc,
    output logic ra, rb, rc
);
    typedef enum logic [2:0] {
        init, 
        left1, left2, left3, 
        right1, right2, right3
    } states;

    states current_state, next_state;

    always_ff @(posedge clk) 
    begin
        if (reset)
            current_state <= init;
        else
            current_state <= next_state;
    end

    always_comb
    begin
        case (current_state)
            init:
                if (left && ~right) next_state = left1;
                else if (right && ~left) next_state = right1;
                else next_state = init;
            left1:
                next_state = left2;
            left2:
                next_state = left3;
            left3:
                next_state = init;
            right1:
                next_state = right2;
            right2:
                next_state = right3;
            right3:
                next_state = init;
            default: next_state = init;
        endcase
    end

    assign la = (current_state == left1) || (current_state == left2) || (current_state == left3);
    assign lb = (current_state == left2) || (current_state == left3);
    assign lc = (current_state == left3);
    assign ra = (current_state == right1) || (current_state == right2) || (current_state == right3);
    assign rb = (current_state == right2) || (current_state == right3);
    assign rc = (current_state == right3);

endmodule