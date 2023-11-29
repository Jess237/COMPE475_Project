`timescale 1ns / 1ps

module signal_processor(
input clk,
input rst,
input special_counter,
input done,
output [15:0] rms_value
);
reg [15:0] rms_temp;

initial begin
     rms_temp=0;
end
always@(posedge clk)begin
    if (rst) begin 
        rms_temp<=0;
    end
    else begin
    if (done==1)
        rms_temp= ((special_counter)^2/999_999)^0.5;
assign rms_value=rms_temp;
endmodule
