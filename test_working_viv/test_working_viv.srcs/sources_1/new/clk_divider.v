`timescale 1ns / 1ps

module clk_divider(
    input clk, // Input clock signal
    input rst,
    output wire [7:0] div_counter // 8-bit div_counter as an example
);

    reg [1:0] divider=2'b00;
    reg toggle=1'b1;
    reg [7:0] div_counter_temp;
    always @(posedge clk) begin
        if(~rst) begin
        // Increment the div_counter when the divided clock toggles
        if (toggle==1'b1) div_counter_temp <= div_counter_temp + 1;
        
        // Generate a divided clock signal
        if (divider == 2'b00) begin
            toggle <= ~toggle;
            divider <= 2'b01;
        end 
        else divider <= divider + 1; 
    end
        else div_counter_temp<=0;
    end
assign div_counter=toggle?div_counter_temp:0;
endmodule

