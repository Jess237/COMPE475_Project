`timescale 1ns / 1ps

module tb_pulse_generator;

	// Inputs
	reg clk;
	reg clr;
	reg [15:0] mode;
	

	// Outputs
	wire [6:0] seg;
	wire [3:0] an;
	wire alarm;

	// Instantiate the Unit Under Test (UUT)
	pulse_generator uut (
		.clk(clk), 
		.rst(rst), 
		.mode(mode), 
		.pwm(pwm), 
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		mode = 0;
		pwm = 0;

		// Wait 100 ns for global reset to finish
		#100;
        mode[0]=0;
          #100000;
          #100000;
          #100000;
          #100000;
          mode[0]=1;
          #10;
          mode[15]=1;
          #100000;
          #100000;
          #100000;
          #100000;
          rst=1;
          #100000;
          #100000;
          #100000;
          #100000;
          mode=1;
          #500;
          mode=1;
          #500;
          mode=1;
          #500;
          mode=1;
          #500;
	end
      always #1 clk=~clk;
    
    
    
endmodule
