module washing_machine(
    input clk,
    input reset,
    input start,
    output reg wash,
    output reg rinse,
    output reg spin,
    output reg done
);

parameter IDLE  = 3'd0;
parameter WASH  = 3'd1;
parameter RINSE = 3'd2;
parameter SPIN  = 3'd3;
parameter DONE  = 3'd4;

reg [2:0] state,next_state;

always @(posedge clk or posedge reset) begin

    if(reset)
        state <= IDLE;
    else
        state <= next_state;

end

always @(*) begin

    case(state)

        IDLE:
            if(start)
                next_state = WASH;
            else
                next_state = IDLE;

        WASH:
            next_state = RINSE;

        RINSE:
            next_state = SPIN;

        SPIN:
            next_state = DONE;

        DONE:
            next_state = IDLE;

        default:
            next_state = IDLE;

    endcase

end

always @(*) begin

    wash   = (state == WASH);

    rinse  = (state == RINSE);

    spin   = (state == SPIN);

    done   = (state == DONE);

end

endmodule
