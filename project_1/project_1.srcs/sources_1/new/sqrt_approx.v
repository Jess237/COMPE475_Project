module sqrt_approx(
    input [15:0] rms_radicand,
    output wire [15:0] rms_value
);
integer i;
reg [15:0] sqrt_output;
reg [15:0] approx;
reg [15:0] temp1;
reg [15:0] temp2;

always @(*) begin
    approx = rms_radicand >> 2; // Initial approximation (shift right by 2 bits)
    for (i = 0; i < 5; i = i + 1) begin // Repeat iterations for refinement      
        temp1 <= (approx*approx); 
        temp2 <= (temp1+approx)>>1;
        approx <= temp2;
    end
    sqrt_output <= approx;
    
end
assign rms_value =sqrt_output;

endmodule
