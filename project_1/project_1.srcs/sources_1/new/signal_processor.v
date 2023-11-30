`timescale 1ns / 1ps

module signal_processor(
input rst,
input [3:0] special_count,
input wire polling_complete_flag_s,
input wire [15:0]samp_num,
output wire [15:0] rms_radicand
);
reg [15:0] rms_temp;
reg [15:0] rms_temp1;
reg [15:0] rms_temp2;
reg [3:0] num_logic_high_samples;
reg [15:0] recip = 1;
//16 bit fixed pt arithmetic
//integer recip = 4096; //2^16/20 = 4096
initial begin
     rms_temp=0;
     num_logic_high_samples=0;
end
always@(posedge polling_complete_flag_s)begin
    if (rst)  begin
        rms_temp<=0;
        num_logic_high_samples<=0;
    end
    else begin
        //rms_temp<= ((special_count*special_count*recip)>>16)&8'b1; // divide by power of 2
        num_logic_high_samples<=special_count;
        if (num_logic_high_samples>0) begin
            rms_temp1<= num_logic_high_samples*num_logic_high_samples*recip; //take the square of the sum
            rms_temp2<= rms_temp1>>16;
            rms_temp<=rms_temp2;
        end
    end
//reciprocal_approximation
    case(samp_num)
        4'd1: recip = 65536;
        4'd2: recip = 32768;
        4'd3: recip = 21845;
        4'd4: recip = 16384;
        4'd5: recip = 13107;
        4'd6: recip = 10923;
        4'd7: recip = 9362;
        4'd8: recip = 8192;
        4'd9: recip = 7282;
        4'd10: recip = 6554;
        4'd11: recip = 5958;
        4'd12: recip = 5461;
        4'd13: recip = 5041;
        4'd14: recip = 4681;
        4'd15: recip = 4369;
        default: recip=0;
endcase
end

assign rms_radicand=4;
endmodule
