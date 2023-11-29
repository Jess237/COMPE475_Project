`timescale 1ns / 1ps

module signal_receiver(
input clk,
input rst,
input [15:0] rms_value, 
output [3:0] burst_counter 
);

reg [3:0] temp_counter;
inital begin
    temp_counter=0;
end
always@(posedge clk)begin
    if (rst) temp_counter<=0;
    if (~rst) begin
        if (rms_value>55) // arbitrary threshold
            temp_counter <= temp_counter+1;
    end
end
assign burst_counter=temp_counter;

endmodule
