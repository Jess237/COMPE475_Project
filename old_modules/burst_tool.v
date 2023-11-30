`timescale 1ns / 1ps

module burst_tool(
input clk,
input rst,
input [3:0] sw,
output [6:0] seg,
output [3:0] an,
output wire JA1,
output wire[3:0] special_count,
output wire [15:0] rms_radicand,
output wire [15:0] rms_value_out,
output [3:0] burst_counter 
);

//wire polling_complete_flag_p=0;
wire [15:0] number_of_samples_p;
wire [3:0] burst_count;

//instantiate all modules
pulse_generator uut0(
    .clk(clk),
    .rst(rst),
    .sw(sw),
    .burst_count(burst_counter),
    .special_count(special_count),
    .JA1(JA1),
    .polling_complete_flag_g(polling_complete_flag_g),
    .number_of_samples(number_of_samples_p)
);
signal_processor uut1(
.clk(clk),
.rst(rst),
.special_count(special_count),
.polling_complete_flag_s(polling_complete_flag_g),
.samp_num(number_of_samples),
.rms_radicand(rms_radicand)
);

sqrt_approx dut9(
    .clk(clk),
    .rst(rst),
    .rms_radicand(rms_radicand),
    .rms_val(rms_value_out)
);

signal_interpreter uut2(
.clk(clk),
.rst(rst),
.in_rms_val(rms_val),
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

