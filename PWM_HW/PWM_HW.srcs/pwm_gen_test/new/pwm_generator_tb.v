`timescale 1ns / 1ps

module pwm_generator_tb;
    reg clk;
    reg rst;
    reg [3:0] sw;
    reg [15:0] number_of_samples_logic_high_temp;
    reg [15:0] sample_counts;
    reg switch_reset_temp;
    reg [15:0] number_of_samples_logic_high; //1111+1=0
    wire polling_complete_flag_g;
    wire [15:0] number_of_samples_out;
    wire [15:0] width_sig; //test
    wire pwm;
    wire switchpressed;
    wire adj1;
    wire adj2;
    wire adj3;
     wire adj;
     wire JA1;
 
 pulse_generator uut (
        .clk(clk), 
		.rst(rst), 
		.sw(sw),
		.number_of_samples_logic_high_temp(number_of_samples_logic_high_temp), 	
		.sample_counts(sample_counts),
		.switch_reset_temp(switch_reset_temp),
        .number_of_samples_logic_high(number_of_samples_logic_high), 
        .polling_complete_flag_g(polling_complete_flag_g),
        .number_of_samples_out(number_of_samples_out),
        .width_sig(width_sig),
        .pwm(JA1),
        .switchpressed(switchpressed),
        .adj1(adj1),
        .adj2(adj2),
        .adj3(adj3),
        .adj4(adj4)
        );
 
 
initial begin
        switch_reset_temp = 0;
        number_of_samples_logic_high_temp = 0;
        sample_counts=0;
		clk = 0;
		rst = 0;
		sw = 0;
		// Wait 100 ns for global reset to finish
		#10
        sw=4'b0001;
        rst=0;
        #1000
        sw = 4'b0010;
        rst=0;
        #1000
        sw=4'b0011;
        rst=0;
        #1000
        rst=1;
        #10
        rst=0;
        #10
        sw=4'b0100; //off
        #1000
        sw=4'b0101;
        #1000
        sw=4'b0110;
        #1000
        sw=4'b0111;
        #1000
        sw=4'b1000; //off
        #1000
        sw=4'b1001;
        #50000
        #50000
        sw =4'b1010; 
        #50000
        #50000
        sw =4'b1011;
        #50000
        #50000
        sw =4'b1100; //off
        #200000
        #200000
        sw =4'b1101;
        #200000
        #200000
        sw =4'b1110;
        #200000
        #200000
        sw = 4'b1111;
        #200000
        #200000
        rst=1;
        #10  
        rst=0;
end

always #1 clk=~clk;
 
 
 
endmodule
