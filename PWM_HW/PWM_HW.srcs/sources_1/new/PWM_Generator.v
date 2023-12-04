`timescale 1ns / 1ps

module PWM_Generator(
    input clk,
    input rst,
    input [3:0] sw,
    input wire switch_reset_temp,
    input wire [15:0] number_of_samples_logic_high_temp,
    input wire [15:0] sample_counts,
    output wire JA1,
    output wire sw_rst,
    output wire [15:0] number_of_samples_logic_high,
    output wire polling_complete_flag_g,
    output wire [15:0] number_of_samples,
    output wire [15:0] width_sig
    );
   
    


        //reg [1:0] pwm_en_state;

	// Instantiate the Unit Under Test (UUT)
	pulse_generator uut (
        .clk(clk), 
		.rst(rst), 
		.sw(sw),
		.number_of_samples_logic_high_temp(number_of_samples_logic_high_temp), 	
		.sample_counts(sample_counts),
		.switch_reset_temp(switch_reset_temp),
        .number_of_samples_logic_high(number_of_samples_logic_high), 
        .polling_complete_flag_g(polling_complete_flag_g),
        .number_of_samples_out(number_of_samples),
        .width_sig(width_sig),
        .pwm(JA1),
        .switchpressed(sw_rst),
        .adj1(adj1),
        .adj2(adj2),
        .adj3(adj3),
        .adj4(adj4)
        );
//assign JA_1 = JA[0];
    //case
   
    
endmodule