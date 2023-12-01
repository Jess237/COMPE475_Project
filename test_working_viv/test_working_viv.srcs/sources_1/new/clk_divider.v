`timescale 1ns / 1ps

module clk_divider(
    input clk, // Input clock signal
    input rst,
    output wire div_counter // 8-bit div_counter as an example
);

    reg [1:0] divider=2'b00;
    reg toggle=1'b1;
    //reg [7:0] sample_counter_temp;
    always @(posedge clk or negedge rst) begin
        if(~rst) begin
            // Increment the div_counter when the divided clock toggles
            //if (toggle==1'b1) sample_counter_temp <= sample_counter_temp + 1; 
            // Generate a divided clock signal
            if (divider == 2'b00) begin
                toggle <= ~toggle;
                divider <= 2'b01;
            end 
            else divider <= divider + 1; 
        end
        else begin
            //sample_counter_temp<=0;
            toggle<=0;
            //toggle<=~toggle;
        end
    end
assign div_counter=toggle; //div_counter_out is 4 sys clock counts
//assign div_counter=sample_counter_temp;
endmodule

