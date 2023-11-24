`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//source: https://www.youtube.com/watch?v=G6T0v-qJ180
//LED Blink BASYS3 using Verilog in Vivado
//////////////////////////////////////////////////////////////////////////////////

module tenHz_generator(
input clk_100MHz,
output clk_1Hz
    );
    
    reg [25:0] counter_reg=0;
    reg clk_out_reg=0;
    
    always @(posedge clk_100MHz) begin
        if(counter_reg=49_999_999) begin // duty cycle 50%
            counter_reg<=0;
            clk_out_reg<=~clk_out_reg;
        end
        else
            counter_reg<=counter_reg+1;        
    end    
    assign clk_1Hz = clk_out_reg;
endmodule
