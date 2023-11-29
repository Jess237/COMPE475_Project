`timescale 1ns / 1ps

module signal_interpreter(
input clk,
input rst,
input [81:0] rms_value, 
output [3:0] burst_counter 
);

reg [3:0] temp_counter;
reg threshold = 1<<16;
initial begin
    temp_counter=0;
end
always@(posedge clk)begin
    if (rst) temp_counter<=0;
    if (~rst) begin
        if (rms_value>threshold) // arbitrary threshold
            temp_counter <= temp_counter+1;
    end
end
assign burst_counter=temp_counter;

endmodule
