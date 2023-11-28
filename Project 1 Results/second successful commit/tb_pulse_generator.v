`timescale 1ns / 1ps

module tb_pulse_generator();
	reg clk;
	reg rst;
	reg [1:0] mode;
    wire pwm;

	// Instantiate the Unit Under Test (UUT)
	pulse_generator uut (
        .clk(clk), 
		.rst(rst), 
		.mode(mode), 
		.pwm(pwm)
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
        mode=0;
        rst=1;
        #10
        mode=0;
        rst=0;  
	end
always #1 clk=~clk;
    
    
    
endmodule
