`timescale 1ns / 1ps

module PWM_Generator(
    input clk,
    input rst,
    input [3:0] sw,
    output wire JA1
    );

    wire [15:0] number_of_samples_logic_high;
    wire polling_complete_flag_g;
    wire [15:0] number_of_samples;
    wire [14:0] width_sig;//for testing only

    //reg [1:0] pwm_en_state;

	// Instantiate the Unit Under Test (UUT)
	pulse_generator uut (
        .clk(clk), 
		.rst(rst), 
		.sw(sw),
        .number_of_samples_logic_high(number_of_samples_logic_high), //1111+1=0
        .pwm(JA1),
        .polling_complete_flag_g(polling_complete_flag_g),
        .number_of_samples(number_of_samples),
        .width_sig(width_sig)
        );
//assign JA_1 = JA[0];
    //case
   
    
endmodule
