`timescale 1ns / 1ps

module top_module_tb;

reg clk;
reg rst;
reg [3:0] sw;
reg [3:0] counter_sev;
wire [6:0] seg;
wire [3:0] an;
wire [19:0] special_count;
wire done;
wire [15:0] rms_value;
wire [3:0] burst_counter; 


//instantiate all modules
pulse_generator uut0(
    .clk(clk),
    .rst(rst),
    .sw(sw),
    .special_count(special_count)
);
signal_processor uut1(
.clk(clk),
.rst(rst),
.special_counter(special_counter),
.done(done),
.rms_value(rms_value)
);

signal_receiver uut2(
.clk(clk),
.rst(rst),
.rms_value(rms_value),
.burst_counter(burst_counter) 
);

seven_segment_driver uut3( 
    .clk(clk), 
    .rst(rst),
    .counter(counter_sev),
    .an(an), 
    .seg(seg)
    ); 

initial begin
    // Initialize Inputs
    clk = 0;
    rst=0;
    sw=0;
    counter_sev=0;
    
    #100
    sw=4;
    rst=0;
    #300
    sw=15;
    rst=0;
    #300
    sw=11;
    rst=0;
    #300
    sw=12;
    rst=1;
    #300
    sw=0;
    rst=0;  
   
end
always #1 clk=~clk;

endmodule
