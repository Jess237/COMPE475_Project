`timescale 1ns / 1ps

module pulse_generator(
    input clk,
    input rst,
    input [3:0] sw,
    input [3:0] burst_count,
    output wire [3:0] special_count, //1111+1=0
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
reg [3:0]special_counter; //counts amount of high signals per sample
reg [3:0]special_counter_clock_counts; //number of samples during polling period
reg polling_complete_flag_temp;

initial begin
    counter=0;
    adjusted_counter=0;
    width=0;
    temp_pwm=0;
    special_counter=0;
    special_counter_clock_counts=0;
    polling_complete_flag_temp=0;
end

//output the signal
always @(posedge clk)begin
    if (rst) begin
        counter=0;
        adjusted_counter=0;
        temp_pwm=0;
        special_counter=0;
        special_counter_clock_counts=0;
        temp_burst_count=0;
        polling_complete_flag_temp=0;
    end
    else begin
        polling_complete_flag_temp<=(special_counter_clock_counts>15)?1'b1:1'b0; //poll is complete after 15 samples taken
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
	    
        temp_burst_count<=burst_count;      
        adjusted_counter<=counter+1;
        counter<=counter+1;
        special_counter_clock_counts<=special_counter_clock_counts+1;
        if(counter<width)begin
            temp_pwm<=1;
            //count samples when high to compute rms value of signal
            special_counter<=(special_counter<16)?special_counter+1:0;
        end
        else begin        
            temp_pwm<=0;
            special_counter<=0;
        end
       // if (special_counter_clock_counts>=16)
       //     polling_complete_flag_temp<=1;


    //if(temp_burst_count-burst_count!=0) begin
       
    //end

end
end
assign special_count = special_counter; // only counts when samples high
assign JA1=temp_pwm;
assign number_of_samples=special_counter_clock_counts;
assign polling_complete_flag_g =(polling_complete_flag_temp==1) ? 1'b1 :1'b0;
assign width_sig=width; //test

endmodule