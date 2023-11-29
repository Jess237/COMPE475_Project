module sqrt_approx(
    input [15:0] rms_radicand,
    output [15:0] rms_value
);
integer i;
reg [15:0] sqrt_output;
reg [15:0] approx;

always @(*) begin
    // Perform a simple square root approximation
    approx = rms_radicand >> 2; // Initial approximation (shift right by 2 bits)
    for (i = 0; i < 5; i = i + 1) begin // Repeat iterations for refinement
        approx = (approx + (rms_radicand / approx)) >> 1; // Newton-Raphson iteration
    end
    sqrt_output = approx;
end
assign rms_value =sqrt_output;

endmodule
