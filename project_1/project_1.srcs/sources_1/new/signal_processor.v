`timescale 1ns / 1ps

module signal_processor(
input rst,
input [3:0] special_count,
input wire polling_complete_flag,
output [15:0] rms_radicand,
);
reg [15:0] rms_temp;
integer recip = 4096; //2^16/20 = 4096
initial 
     rms_temp=0;
     
always@(posedge polling_complete_flag)begin
    if (rst)  
        rms_temp<=0;
    else begin
        //rms_temp<= ((special_count*special_count*recip)>>16)&8'b1; // divide by power of 2
        rms_temp<= special_count&8'b1; // divide by power of 2
    end
end
assign rms_radicand=rms_temp;
endmodule
