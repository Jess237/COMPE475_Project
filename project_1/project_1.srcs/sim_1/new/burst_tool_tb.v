`timescale 1ns / 1ps
module burst_tool_tb;
`timescale 1ns / 1ps

module top_module_tb;
reg clk;
reg rst;
reg [3:0] sw;
reg [3:0] counter_sev;
wire [6:0] seg;
wire [3:0] an;
wire [7:0] JA;
wire pwm;
wire [19:0] special_count;
wire done;
wire [15:0] rms_value;
wire [3:0] burst_counter; 

burst_tool DUT00(
.clk(clk),
.rst(rst),
.sw(sw),
.counter_sev(counter_sev),
.seg(seg),
.an(an),
.JA(JA),
.pwm(pwm),
.special_count(special_count),
.done(done),
.rms_value(rms_value),
.burst_counter(burst_counter) 
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
