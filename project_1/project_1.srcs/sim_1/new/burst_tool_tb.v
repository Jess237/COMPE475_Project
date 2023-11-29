`timescale 1ns / 1ps
module burst_tool_tb;
reg clk;
reg rst;
reg [3:0] sw;
reg done_sp_count;
wire [6:0] seg;
wire [3:0] an;
wire JA1;
wire [3:0] special_count;
wire done;
wire [15:0] rms_value;
wire [3:0] burst_counter; 

burst_tool DUT00(
.clk(clk),
.rst(rst),
.done_sp_count(done_sp_count),
.sw(sw),
.seg(seg),
.an(an),
.JA1(JA1),
.pwm(pwm),
.special_count(special_count),
.done(done),
.rms_radicand(rms_radicand),
.rms_value(rms_value),
.burst_counter(burst_counter) 
);

initial begin
    // Initialize Inputs
    clk = 0;
    rst=0;
    sw=0;
    
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
