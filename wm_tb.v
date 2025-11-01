`timescale 1ns / 1ps

module wm_tb();

    reg clk;
    reg rst;
    reg start;
    reg door_close;
    wire fill_valve;
    wire motor_on;
    wire drain_valve;
    wire door_lock;
    wire done;

    // Instantiate DUT
    washing_machine_easy uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .door_close(door_close),
        .fill_valve(fill_valve),
        .motor_on(motor_on),
        .drain_valve(drain_valve),
        .door_lock(door_lock),
        .done(done)
    );

    // Clock
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    // Stimulus
    initial begin
        rst = 1; start = 0; door_close = 0;
        #40;
        rst = 0;
        door_close = 1;    // close door
        #40;
        start = 1;         // press start
        #20;
        start = 0;
        #2000;
        $stop;
    end

endmodule
