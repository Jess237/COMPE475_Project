`timescale 1ns / 1ps

module signal_receiver(
input clk,
rst,
input[3:0]counter, //goes up to 9999
input[7:0]threshold_value, //threshold value is output from signal_processor
input[7:0]pwm, // 8 bit data stream directly from pulse generator
output counter_adusted_value //can be positive or negative
);

reg temp = 0;

always@(posedge clk)begin
    if (~rst) begin
        if (pwm>=threshold_value) begin // valid for square wave only
            temp <= 1;
        end
    end
end
assign counter_adjusted_value = counter+temp;

endmodule
