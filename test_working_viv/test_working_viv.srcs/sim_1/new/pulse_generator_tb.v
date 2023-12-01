`timescale 1ns / 1ps

module pulse_generator_tb();
	reg clk;
    reg rst;
    reg [3:0] sw;
    reg [3:0] burst_count;
    wire [3:0] special_count; //1111+1=0
    wire JA1;
    wire polling_complete_flag_g;
    wire [15:0] number_of_samples;
    wire [14:0] width_sig;//for testing only

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
        .width_sig(width_sig)
	);

	initial begin
		clk = 0;
		rst = 0;
		sw = 0;
		burst_count=0;
		// Wait 100 ns for global reset to finish
		#10;
        sw=4'b0001;
        rst=0;
        #300
        sw = 4'b0010;
        rst=0;
        #300
        sw=4'b0011;
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
