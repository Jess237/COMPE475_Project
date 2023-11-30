`timescale 1ns / 1ps

module signal_interpreter(
input clk,
input rst,
input wire [15:0] in_rms_val, 
output [3:0] burst_counter 
);

reg [3:0] temp_counter;
reg threshold = 2'b11; //harcoded threshold
initial begin
    temp_counter=0;
end
always@(posedge clk)begin
    if (rst) temp_counter<=0;
    if (~rst) begin
        if (in_rms_val>threshold) // arbitrary threshold
            temp_counter <= temp_counter+1;
    end
end
assign burst_counter=temp_counter;

endmodule
