`timescale 1ns / 1ps

module pulse_generator #(parameter db_switch_pressed = 15)(
    input clk,
    rst,
    input[db_switch_pressed:0] mode, // speed. array passed from button debounce module
    output pwm
);

//integer i;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  
reg [4:0] counter; // sets the period 11111+1 = 00000 (Daniel Ayala). counts from 0 up to 31. 2^5=32-1=11111
reg [4:0] width; //duty cycle 32/4 = for 8 ticks  output a 1. for the remainder of the 32 tics output a 0.
reg freq;
reg temp_pwm;

initial begin
    counter=0;
    freq=0;
    width=0;
    temp_pwm=0;
end
                 
//adjust the frequency and duty cycle based on the mode
//always @(posedge clk or posedge rst)begin
//    if (~rst) begin
//        for (i=0;i<=db_switch_pressed;i=i+1) begin
//            if (i<=7)begin
//                if (mode[i]==1) duty_cycle <= i*0.1;
//            end
//            else if (i>7) begin
//                if (mode[i]==1) freq <= i*0.01;
//            end
//        end    
//    end
//    else begin
//        duty_cycle<=0;
//        freq<=0;
//    end
//end
//output the signal
always @(posedge clk or posedge rst)begin
    if (rst) counter<=0;
    else counter<=counter+1;
    if (counter<width)temp_pwm<=1;
    else temp_pwm<=0;
end

always@(*) begin
    case (mode)
        2'd0: width = 5'd0;
        2'd1: width = 5'd8;
        2'd2: width = 5'd16;
        2'd3: width = 5'd24;
        default: width = 5'd0;
    endcase
    end
assign pwm = temp_pwm;
endmodule
