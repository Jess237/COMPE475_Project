`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//source: https://www.youtube.com/watch?v=G6T0v-qJ180
//LED Blink BASYS3 using Verilog in Vivado
//////////////////////////////////////////////////////////////////////////////////
// Need 10 Hz. 100 MHz/10 Hz -1 = 9_999_999 counts needed to get 10 Hz
module tenHz_generator(
input clk_100MHz,
output clk_10Hz
    );
    //counter_reg used to divide frequency
    reg [25:0] counter_reg=0; 
    reg clk_out_reg=0;
    
    always @(posedge clk_100MHz) begin
        if (counter_reg==9_999_999) begin 
            counter_reg<=0;
            clk_out_reg<=~clk_out_reg;
        end else begin
            counter_reg<=counter_reg+1;        
        end  
      end
      assign clk_10Hz = clk_out_reg;
endmodule
