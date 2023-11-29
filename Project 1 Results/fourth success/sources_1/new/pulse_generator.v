`timescale 1ns / 1ps

module pulse_generator(
    input clk,
    input rst,
    input [3:0] mode,
    output pwm,
    output [15:0] count,
    output maxbitwidth
);
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
reg [4:0] counter; // sets the period 11111+1 = 00000 (Daniel Ayala). counts from 0 up to 31. 2^5=32-1=11111
reg [4:0] width; //duty cycle 32/4 = for 8 ticks  output a 1. for the remainder of the 32 tics output a 0.
reg temp_pwm;
reg [3:0] max_bit_width;

initial begin
    counter=0;
    width=0;
    temp_pwm=0;
    max_bit_width=5;
end

//output the signal
always @(posedge clk)begin
    if (rst) begin
        counter<=0;
        temp_pwm<=0;
    end
    else counter<=counter+1;
    if (counter<width)temp_pwm<=1;
    else temp_pwm<=0;
end

always@(mode) begin
    case (mode)
        4'd0: width = 0; // duty cycle percentage
        4'd1: width = (2^max_bit_width)*0.25;
        4'd2: width = (2^max_bit_width)*0.5;
        4'd3: width = (2^max_bit_width)*0.75;
        4'd4: width = (2^max_bit_width);
        4'd5: begin
            max_bit_width=6;
            counter = {counter,1'b0};
            end
        4'd6: begin
            max_bit_width=7;
            counter = {counter,2'b0};
            end
        4'd7: begin
            max_bit_width=8;
            counter = {counter,3'b0};
            end
        4'd8: begin
            max_bit_width=9;
            counter = {counter,4'b0};
            end
        4'd9: begin
            max_bit_width=10;
            counter = {counter,5'b0};
            end
        4'd10: begin
            max_bit_width=11;
            counter = {counter,6'b0};
            end 
        4'd11: begin
            max_bit_width=12;
            counter = {counter,7'b0};
            end
        4'd12: begin
            max_bit_width=13;
            counter = {counter,8'b0};
            end
        4'd13: begin
            max_bit_width=14;
            counter = {counter,9'b0};
            end
        4'd14: begin
            max_bit_width=15;
            counter = {counter,10'b0};
            end
        4'd15: begin
            max_bit_width=16;
            counter = {counter,11'b0};
            end
		default : begin 
			width = 5'd0;
			max_bit_width=5;
		    end
	endcase
	end
assign pwm = temp_pwm;
assign count = counter;
assign maxbitwidth = max_bit_width;
endmodule
