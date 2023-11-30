`timescale 1ns / 1ps
module burst_tool_tb;
reg clk;
reg rst;
reg [3:0] sw;
wire [6:0] seg;
wire [3:0] an;
wire JA1;
wire [3:0] special_count;
wire [15:0] rms_radicand;
wire [15:0] rms_value;
wire [3:0] burst_counter; 

burst_tool DUT00(
.clk(clk),
.rst(rst),
.sw(sw),
.seg(seg),
.an(an),
.JA1(JA1),
.special_count(special_count),
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
    sw=4'b0001;
    rst=0;
    #300
    sw=4'b0010;
    rst=0;
    #300
    sw=4'b0011;
    rst=0;
    #300
    sw=4'b0011;
    rst=1;
    #300
    sw=0;
    rst=0;  
   
end
always #1 clk=~clk;

endmodule
