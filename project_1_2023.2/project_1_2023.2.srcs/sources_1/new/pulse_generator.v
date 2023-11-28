`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 11:32:32 PM
// Design Name: 
// Module Name: pulse_generator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pulse_generator #(parameter db_switch_pressed = 15)
(input clk,
rst,
input[db_switch_pressed:0] mode, // array passed from button debounce module
output pwm);

integer i;
reg freq;
reg duty_cycle;

//adjust the frequency and duty cycle based on the mode
always @(posedge clk)begin
    for (i=0;i<=db_switch_pressed;i=i+1) begin
        if (i<=7)begin
            if (mode[i]==1) duty_cycle <= i*0.1;
        end
        else begin
        
    end
end
endmodule
