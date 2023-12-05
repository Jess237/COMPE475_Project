`timescale 1ns/1ps

module pulse_generator#(DEFAULT_BITWIDTH=5)(
    input clk,
    input rst,
    input [3:0] sw,
    output reg [15:0] number_of_samples_logic_high, //1111+1=0
    output wire polling_complete_flag,
    output reg [15:0] number_of_samples,
    output wire pwm
);
reg sw_rst;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
reg [DEFAULT_BITWIDTH-1:0] adjusted_counter1; 
reg [DEFAULT_BITWIDTH+2:0] adjusted_counter2; 
reg [DEFAULT_BITWIDTH+6:0] adjusted_counter3; 
reg [DEFAULT_BITWIDTH+9:0] adjusted_counter4; 
reg [14:0] width; 
reg temp_pwm;
reg polling_complete_flag_temp;
wire switch_reset_temp;
wire [15:0] number_of_samples_logic_high_temp;
wire div_clk_out;

	
clk_divider uut1 (
    .clk(clk),              // Connect testbench clock to counter clock
    .rst(rst),
    .scaled_clk(div_clk_out)   // Connect output to wire 
);


always @(posedge div_clk_out)begin
    if (rst) begin
        temp_pwm<=0;
    end
    else begin
        if (~switch_reset_temp) begin
            if (~sw[3] & ~sw[2] )begin
                if(adjusted_counter1<width)temp_pwm<=1;
                else temp_pwm<=0;
            end
            if (~sw[3]& sw[2])begin   
                if(adjusted_counter2<width)temp_pwm<=1;
                else temp_pwm<=0;
            end
            if (sw[3] & ~sw[2])begin
                if(adjusted_counter3<width)temp_pwm<=1;
                else temp_pwm<=0;
            end
            if (sw[3] & sw[2]) begin
                if(adjusted_counter4<width)temp_pwm<=1;
                else temp_pwm<=0;
            end
        end
       
   end
end
   
always@(sw or rst) begin     
    if (~rst) begin  
        sw_rst<=(sw)?1'b1:1'b0;
        case (sw)
        4'b0000: width = 15'd0; // duty cycle percentage 0%
        4'b0001: width = 15'd8;//(2^5)*0.25;
        4'b0010: width = 15'd16;//(2^5)*0.5;
        4'b0011: width = 15'd24;//(2^5)*0.75;
        4'b0100: width = 15'd0; //off   
        4'b0101: width = 15'd32;//(2^10)*0.5; max bit width =8;
        4'b0110: width = 15'd64;//(2^10)*0.5; max bit width =8;
        4'b0111: width = 15'd96;//(2^10)*0.75;
        4'b1000: width = 15'd0;
        4'b1001: width = 15'd1024; //25%
        4'b1010: width = 15'd2048; // 50%
        4'b1011: width = 15'd3072; //75%
        4'b1100: width=15'd0;
        4'b1101: width = 15'd8192; //25%
        4'b1110: width = 15'd12288; // 50%
        4'b1111: width = 15'd16384;
		default : width = 15'd0;
		
	   endcase
	   #1 sw_rst<=~sw_rst;
end
end


always @(posedge clk) begin 
    if (rst | switch_reset_temp) begin
        adjusted_counter1<=0;
        adjusted_counter2<=0;
        adjusted_counter3<=0;
        adjusted_counter4<=0;
    end
    else begin
        if (~sw[3] & ~sw[2] )begin  
            adjusted_counter1<=adjusted_counter1+1;
             if (temp_pwm)begin
            number_of_samples_logic_high<=number_of_samples_logic_high+1;
            end
            number_of_samples <= number_of_samples+1;
             polling_complete_flag_temp <=(number_of_samples_logic_high==15) ? 1'b1 :1'b0;
        end
        
        if (~sw[3]& sw[2])begin   
            adjusted_counter2<=adjusted_counter2+1;
             if (temp_pwm)begin
                number_of_samples_logic_high<=number_of_samples_logic_high+1;   
            end
              number_of_samples <= number_of_samples+1;
               polling_complete_flag_temp <=(number_of_samples_logic_high==15) ? 1'b1 :1'b0;
        end
        
        if (sw[3] & ~sw[2])begin
            adjusted_counter3<=adjusted_counter3+1;
             if (temp_pwm)begin
            number_of_samples_logic_high<=number_of_samples_logic_high+1;   
            end
              number_of_samples <= number_of_samples+1;
               polling_complete_flag_temp <=(number_of_samples_logic_high==15) ? 1'b1 :1'b0;
            end
            
        if (sw[3] & sw[2]) begin
            adjusted_counter4<=adjusted_counter4+1;
             if (temp_pwm)begin
            number_of_samples_logic_high<=number_of_samples_logic_high+1;   
            end
              number_of_samples <= number_of_samples+1;
              polling_complete_flag_temp <=(number_of_samples_logic_high==15) ? 1'b1 :1'b0;
            end
    end 
end 
assign switch_reset_temp=sw_rst;
assign pwm=temp_pwm;
assign polling_complete_flag = polling_complete_flag_temp;

endmodule