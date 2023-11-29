`timescale 1ns / 1ps

module burst_tool(
input clk,
input rst,
input [3:0] sw,
output [6:0] seg,
output [3:0] an,
output JA1,
output pwm,
output [19:0] special_count,
output done,
output [31:0] rms_radicand,
output [31:0] rms_value,
output [3:0] burst_counter 
);
reg [15:0]rms_value_radicand;

//instantiate all modules
pulse_generator uut0(
    .clk(clk),
    .rst(rst),
    .sw(sw),
    .special_count(special_count),
    .JA1(JA1),
    .pwm(pwm),
    .done_sp_count(done)
);
signal_processor uut1(
.clk(clk),
.rst(rst),
.special_counter(special_counter),
.done(done_sp_count),
.rms_radicand(rms_radicand)
);

sqrt_approx dut9(
    .rms_radicand(rms_radicand),
    .rms_value(rms_value)
);

signal_interpreter uut2(
.clk(clk),
.rst(rst),
.rms_value(rms_value),
.burst_counter(burst_counter) 
);

seven_segment_driver uut3( 
    .clk(clk), 
    .rst(rst),
    .counter(burst_counter),
    .an(an),
    .seg(seg)
    ); 

endmodule

