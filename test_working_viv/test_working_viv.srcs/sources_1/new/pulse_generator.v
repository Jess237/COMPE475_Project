`timescale 1ns / 1ps

module pulse_generator(
    input clk,
    input rst,
    input [3:0] sw,
    input [3:0] burst_count,
    output wire [3:0] number_of_samples_logic_high, //1111+1=0
    output wire JA1,
    output wire polling_complete_flag_g,
    output wire [15:0] number_of_samples,
    output wire [14:0] width_sig //test
);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
reg [4:0] counter; // sets the period 11111+1 = 00000 (Daniel Ayala). counts from 0 up to 31. 2^5=32-1=11111
reg [4:0] adjusted_counter; 
reg [14:0] width; //duty cycle 32/4 = for 8 ticks  output a 1. for the remainder of the 32 tics output a 0.
reg temp_pwm;
reg [3:0] temp_burst_count;
reg [3:0]number_of_samples_logic_high_temp; //counts amount of high signals per sample
reg [3:0]sample_counts; //number of samples during polling period
reg polling_complete_flag_temp;
wire div_clk_out;
	
clk_divider uut1 (
    .clk(clk),              // Connect testbench clock to counter clock
    .rst(rst),
    .scaled_clk(div_clk_out)   // Connect output to wire 
);

initial begin
    counter=0;
    adjusted_counter=0;
    width=0;
    temp_pwm=0;
    number_of_samples_logic_high_temp=0;
    sample_counts=0;
    polling_complete_flag_temp=0;
    temp_burst_count=0;
end

//output the signal
always @(posedge clk)begin
    if (rst) begin
        counter=0;
        adjusted_counter=0;
        temp_pwm=0;
        number_of_samples_logic_high_temp=0;
        sample_counts=0;
        temp_burst_count=0;
        polling_complete_flag_temp=0;
    end
    else begin
        polling_complete_flag_temp<=(sample_counts>15)?1'b1:1'b0; 
        polling_complete_flag_temp<=(burst_count-temp_burst_count!=0)?1'b1:1'b0; 
        case (sw)
        4'b0000: width = 6'd0; // duty cycle percentage 0%
        4'b0001: width = 6'd8;//(2^5)*0.25;
        4'b0010: width = 6'd16;//(2^5)*0.5;
        4'b0011: width = 6'd24;//(2^5)*0.75;
        4'b0100: width = 6'd0; //off
        4'b0101: begin
            width = 8'd32;//(2^10)*0.5; max bit width =8;
            adjusted_counter = {counter,3'b0}; // 5+3=8 max bit width
            end
        4'b0111: begin
            width = 8'd96;//(2^10)*0.75;
            adjusted_counter = {counter,3'b0}; // 5+3=8 max bit width
            end
        4'b1000: begin
            width = 5'd0;
            end
        4'b1001: begin
            width = 12'd1024; //25%
            adjusted_counter = {counter,7'b0}; //12-5=7
            end
        4'b1010: begin
            width = 12'd2048; // 50%
            adjusted_counter = {counter,7'b0}; //12-5=7
            end
        4'b1011: begin
            width = 12'd3072; //75%
             adjusted_counter = {counter,7'b0}; //12-5=7
            end
        4'b1100:width=15'd0;
        4'b1101:begin
            width = 15'd8192; //25%
            adjusted_counter= {counter,10'b0};
        end
        4'b1110: begin
            width = 15'd16384; // 50%
            adjusted_counter={counter,10'b0};
            end
        4'b1111: begin
            width = 15'd12288;
            adjusted_counter={counter,10'b0};
        end
		default : begin 
			width = 6'd0;
		    end
	endcase
	    
          
        adjusted_counter<=(adjusted_counter<=counter)? (counter+1):(adjusted_counter+1); 
        
        if(adjusted_counter<width)begin
            temp_pwm<=1;
        end
        else begin        
            temp_pwm<=0;
        end
        if (div_clk_out) begin
            sample_counts<=sample_counts+1;
            if (temp_pwm)begin
                number_of_samples_logic_high_temp<=(number_of_samples_logic_high_temp<16)?number_of_samples_logic_high_temp+1:0;
            end
        end
        temp_burst_count<=burst_count;    
end
end

assign number_of_samples_logic_high = number_of_samples_logic_high_temp; // only counts when samples high
assign JA1=temp_pwm;
assign number_of_samples=sample_counts;
assign polling_complete_flag_g =(number_of_samples_logic_high_temp==15) ? polling_complete_flag_temp :1'b0;
assign width_sig=width; //test

endmodule