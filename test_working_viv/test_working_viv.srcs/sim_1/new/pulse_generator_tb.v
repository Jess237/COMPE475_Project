`timescale 100ps / 1ps

module pulse_generator_tb();
	reg clk;
    reg rst;
    reg [3:0] sw;
    reg [3:0] burst_count;
    wire [15:0] number_of_samples_logic_high;
    wire JA1;
    wire polling_complete_flag_g;
    wire [15:0] number_of_samples;
    wire [14:0] width_sig;//for testing only
    wire [14:0]adjusted_counter_out; //for adjusting pwm freq

	// Instantiate the Unit Under Test (UUT)
	pulse_generator uut (
        .clk(clk), 
		.rst(rst), 
		.sw(sw),
        .burst_count(burst_count),
        .number_of_samples_logic_high(number_of_samples_logic_high), //1111+1=0
        .JA1(JA1),
        .polling_complete_flag_g(polling_complete_flag_g),
        .number_of_samples(number_of_samples),
        .width_sig(width_sig),
        .adjusted_counter_out(adjusted_counter_out)
	);

	initial begin
		clk = 0;
		rst = 0;
		sw = 0;
		burst_count=0;
		// Wait 100 ns for global reset to finish
		#10
//        sw=4'b0001;
//        rst=0;
//        #300
//        sw = 4'b0010;
//        rst=0;
//        #300
//        sw=4'b0011;
//        rst=0;
//        #300
        rst=1;
        #300
        sw=4'b0100;
        rst=0;
        #300
        sw=4'b0100; //off
        #600
        #600
        #600
        sw=4'b0101;
        #600
        #600
        #600
        sw=4'b0110;
        #600
        #600
        #600
        sw=4'b0111;
        #600
        #600
        #600
        sw=4'b1000; //off
        #600
        #600
        #600
        sw=4'b1001;
        #600
        #600
        #600
        sw =4'b1010; 
        #600
        #600
        #600
        sw =4'b1011;
        #600
        #600
        #600
        sw =4'b1100;
        #600
        #600
        #600
        sw =4'b1101;
        #600
        #600
        #600
        sw =4'b1110;
        #600
        #600
        #600
        sw = 4'b1111;
        #600
        #600
        #600
           
        rst=0;  
	end
always #1 clk=~clk;
    
    
    
endmodule
