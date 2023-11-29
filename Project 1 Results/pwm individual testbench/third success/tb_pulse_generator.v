`timescale 1ns / 1ps

module tb_pulse_generator();
	reg clk;
	reg rst;
	reg [3:0] mode;
    wire pwm;
    wire [15:0] count;
    wire maxbitwidth;

	// Instantiate the Unit Under Test (UUT)
	pulse_generator uut (
        .clk(clk), 
		.rst(rst), 
		.mode(mode), 
		.pwm(pwm),
		.count(count),
		.maxbitwidth(maxbitwidth)
	);

	initial begin
		clk = 0;
		rst = 0;
		mode = 0;
		// Wait 100 ns for global reset to finish
		#10;
        mode=1;
        rst=0;
        #300
        mode = 2;
        rst=0;
        #300
        mode=3;
        rst=0;
        #300
        mode=4;
        rst=1;
        #300
        mode=0;
        rst=0;  
	end
always #1 clk=~clk;
    
    
    
endmodule
