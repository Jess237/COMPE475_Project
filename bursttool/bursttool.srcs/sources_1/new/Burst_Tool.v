`timescale 1ns / 1ps

module Burst_Tool(
input clk,
input rst,
input [3:0] sw,
output JA1
);

PWM_Generator DUT00(
    .clk(clk),
    .rst(rst),
    .sw(sw),
    .JA1(JA1)
   );


endmodule
