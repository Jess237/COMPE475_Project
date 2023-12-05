`timescale 1ns / 1ps

module PWM_Generator(
    input clk,
    input rst,
    input [3:0] sw,
    output wire JA1,
    output wire [15:0] number_of_samples_logic_highP,
    output wire polling_complete_flagP,
    output wire number_of_samplesP
    );
 

	pulse_generator uut (
        .clk(clk), 
		.rst(rst), 
		.sw(sw),	
        .number_of_samples_logic_high(number_of_samples_logic_high), 
        .polling_complete_flag(polling_complete_flag),
        .number_of_samples(number_of_samples),
        .pwm(JA1)
        );
    
    
    
    
endmodule