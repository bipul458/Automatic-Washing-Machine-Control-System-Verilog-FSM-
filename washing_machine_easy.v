`timescale 1ns / 1ps

module washing_machine_easy(
    input clk,
    input rst,
    input start,
    input door_close,
    output reg fill_valve,
    output reg motor_on,
    output reg drain_valve,
    output reg door_lock,
    output reg done
);

    // State encoding
    localparam CHECK_DOOR   = 3'b000,
               FILL_WATER   = 3'b001,
               ADD_DETERGENT= 3'b010,
               CYCLE        = 3'b011,
               DRAIN_WATER  = 3'b100,
               SPIN         = 3'b101;

    reg [2:0] state, next_state;
    reg [7:0] timer;  // small timer for delays

    // Sequential block
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= CHECK_DOOR;
            timer <= 0;
        end else begin
            state <= next_state;
            if (timer < 8'd50)
                timer <= timer + 1;
            else
                timer <= 0;
        end
    end

    // Combinational next state logic
    always @(*) begin
        // default outputs
        fill_valve = 0;
        motor_on   = 0;
        drain_valve= 0;
        door_lock  = 0;
        done       = 0;
        next_state = state;

        case (state)
            CHECK_DOOR: begin
                if (start && door_close)
                    next_state = FILL_WATER;
            end

            FILL_WATER: begin
                door_lock = 1;
                fill_valve = 1;
                if (timer == 8'd50)
                    next_state = ADD_DETERGENT;
            end

            ADD_DETERGENT: begin
                door_lock = 1;
                if (timer == 8'd50)
                    next_state = CYCLE;
            end

            CYCLE: begin
                door_lock = 1;
                motor_on = 1;
                if (timer == 8'd50)
                    next_state = DRAIN_WATER;
            end

            DRAIN_WATER: begin
                door_lock = 1;
                drain_valve = 1;
                if (timer == 8'd50)
                    next_state = SPIN;
            end

            SPIN: begin
                door_lock = 1;
                if (timer == 8'd50) begin
                    next_state = CHECK_DOOR;
                    done = 1;
                end
            end
        endcase
    end

endmodule
