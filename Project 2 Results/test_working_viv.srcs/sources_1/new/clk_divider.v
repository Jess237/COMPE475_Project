`timescale 1ns / 1ps

module clk_divider#(BITWIDTH=5)(
    input clk, 
    input rst,
    output wire scaled_clk
);

    reg [BITWIDTH-1:0] counter_div=0;
    reg [BITWIDTH-1:0] temp=0;
    
    reg toggle=1'b0;
    
    always @(posedge clk or negedge rst) begin
        if(~rst) begin
            
            if (counter_div == 2^BITWIDTH-1) begin
                toggle <= ~toggle;
                counter_div <= temp;
            end 
            else begin 
                counter_div <= counter_div + 1; 
            end
            end
        else      
            toggle<=0;
    end
assign scaled_clk=toggle; 

endmodule

