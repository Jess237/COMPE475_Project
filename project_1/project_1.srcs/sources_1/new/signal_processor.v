`timescale 1ns / 1ps

module signal_processor(
input clk,
input rst,
input special_counter,
input done,
output [31:0] rms_radicand
);
reg [31:0] rms_temp;
reg samp = 1<<16; //reciprocal of 999999 approximate
initial begin
     rms_temp=0;
end
always@(posedge clk)begin
    if (rst) begin 
        rms_temp<=0;
    end
    else begin
       // if (done==1)
        //    rms_temp<= special_counter*special_counter*(1/999_999);
       // end
        rms_temp<= ((special_counter*special_counter*samp)>>20)&(8'hFF);
end
end
assign rms_radicand=rms_temp;
endmodule
