`timescale 1ns / 1ps

module PWM_Generator_tb;
reg clk;
reg rst;
reg [3:0] sw;
wire JA1;
wire [15:0] number_of_samples_logic_highP;
wire polling_complete_flagP;
wire [15:0] number_of_samplesP;

PWM_Generator DUT00(
    .clk(clk),
    .rst(rst),
    .sw(sw),
    .JA1(JA1),
    .number_of_samples_logic_high(number_of_samples_logic_high),
    .polling_complete_flag(polling_complete_flag),
    .number_of_samples(number_of_samples)
   );

initial begin
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
