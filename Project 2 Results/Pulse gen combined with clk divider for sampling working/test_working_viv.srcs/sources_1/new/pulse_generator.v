`timescale 1ns/1ps

module pulse_generator#(DEFAULT_BITWIDTH=5)(
    input clk,
    input rst,
    input [3:0] sw,
    input [3:0] burst_count,
    output wire [15:0] number_of_samples_logic_high, //1111+1=0
    output wire JA1,
    output wire polling_complete_flag_g,
    output wire [15:0] number_of_samples,
    output wire [14:0] width_sig, //test
    output wire [14:0]adjusted_counter_out //test
);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
//reg [DEFAULT_BITWIDTH-1:0] counter; // sets the period 11111+1 = 00000 (Daniel Ayala). counts from 0 up to 31. 2^5=32-1=11111
reg [DEFAULT_BITWIDTH-1:0] adjusted_counter1; 
reg [DEFAULT_BITWIDTH+2:0] adjusted_counter2; 
reg [DEFAULT_BITWIDTH+6:0] adjusted_counter3; 
reg [DEFAULT_BITWIDTH+9:0] adjusted_counter4; 

reg [14:0] width; //duty cycle 32/4 = for 8 ticks  output a 1. for the remainder of the 32 tics output a 0.
reg [DEFAULT_BITWIDTH-1:0] zero = 0;
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
    adjusted_counter1=0; 
    adjusted_counter2=0; 
    adjusted_counter3=0; 
    adjusted_counter4=0; 
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
        adjusted_counter1=0;
        adjusted_counter2=0;
        adjusted_counter3=0;
        temp_pwm=0;
        number_of_samples_logic_high_temp=0;
        sample_counts=0;
        temp_burst_count=0;
        polling_complete_flag_temp=0;
    end
    else begin
        if (~sw[3] & ~sw[2])begin
            if(adjusted_counter1<width)temp_pwm<=1;
            else temp_pwm<=0;
            adjusted_counter1<=adjusted_counter1+1;
        end
        if (~sw[3]& sw[2])begin   
            if(adjusted_counter2<width)temp_pwm<=1;
            else temp_pwm<=0;
            adjusted_counter2<=adjusted_counter2+1;
        end
        if (sw[3] & ~sw[2])begin
            if(adjusted_counter3<width)temp_pwm<=1;
            else temp_pwm<=0;
            adjusted_counter3<=adjusted_counter3+1;
        end
        if (sw[3] & sw[2]) begin
            if(adjusted_counter4<width)temp_pwm<=1;
            else temp_pwm<=0;
            adjusted_counter4<=adjusted_counter4+1;
        end
        
        temp_burst_count<=burst_count;    
        //polling_complete_flag_temp<=(sample_counts>=15)?1'b1:1'b0; 
        //polling_complete_flag_temp<=(burst_count-temp_burst_count!=0)?1'b1:1'b0; 
        case (sw)
        4'b0000: width = 15'd0; // duty cycle percentage 0%
        4'b0001: width = 15'd8;//(2^5)*0.25;
        4'b0010: width = 15'd16;//(2^5)*0.5;
        4'b0011: width = 15'd24;//(2^5)*0.75;
        4'b0100: width = 15'd0; //off   
        4'b0101: begin
            width = 15'd32;//(2^10)*0.5; max bit width =8;
            adjusted_counter2 = 0;
            end
        4'b0110: begin 
            width = 15'd64;//(2^10)*0.5; max bit width =8;
            adjusted_counter2 = 0;
            end
        4'b0111: begin
            width = 15'd96;//(2^10)*0.75;
            adjusted_counter2 = 0;
            end
        4'b1000: begin
            adjusted_counter3 = 0; 
            width = 15'd0;
            end
        4'b1001: begin
            width = 15'd1024; //25%
            adjusted_counter3 = 0;
            end
        4'b1010: begin
            width = 15'd2048; // 50%
            adjusted_counter3 = 0;
            end
        4'b1011: begin
            width = 15'd3072; //75%
            adjusted_counter3 = 0;
            end
        4'b1100: begin
            width=15'd0;
            adjusted_counter4=0;
            end
        4'b1101:begin
            width = 15'd8192; //25%
            adjusted_counter4= 0;
        end
        4'b1110: begin
            width = 15'd12288; // 50%
            adjusted_counter4=0;
            end
        4'b1111: begin
            width = 15'd16384;
            adjusted_counter4=0;
        end
		default : begin 
			width = 15'd0;
		    end
	endcase
    
end
end
always@(posedge div_clk_out) begin
            sample_counts<=sample_counts+1;
            polling_complete_flag_temp =(number_of_samples_logic_high_temp==15) ? 1'b1 :1'b0;
            if (temp_pwm)begin
                number_of_samples_logic_high_temp<=(number_of_samples_logic_high_temp<16)?number_of_samples_logic_high_temp+1:0;
                
            end
        end


assign number_of_samples_logic_high = number_of_samples_logic_high_temp; // only counts when samples high
assign JA1=temp_pwm;
assign number_of_samples=sample_counts;
assign polling_complete_flag_g = polling_complete_flag_temp;
assign width_sig=width; //test
assign adjusted_counter_out=adjusted_counter3;

endmodule