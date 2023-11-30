module sqrt_approx(
    input clk,
    input rst,
    input [15:0] rms_radicand,
    output wire [15:0] rms_value
);
integer i;
reg [15:0] sqrt_output=0;
reg [15:0] approx=0;
reg [15:0] temp1=0;
reg [15:0] temp2=0;

always @(posedge clk) begin
    if (rst)begin
        temp1 = 0;
        temp2 = 0;
        approx = 0;
        sqrt_output=0;
    end
    else begin
        if (rms_radicand>0) begin
            approx <= rms_radicand >> 2; // Initial approximation (shift right by 2 bits)
            for (i = 0; i < 10; i = i + 1) begin // Repeat iterations for refinement      
                temp1 <= (approx*approx); 
                temp2 <= (temp1+approx)>>1;
                approx <= temp2;
            end
    
    end
    sqrt_output <= rms_radicand;
    end
end
assign rms_value =sqrt_output;

endmodule
