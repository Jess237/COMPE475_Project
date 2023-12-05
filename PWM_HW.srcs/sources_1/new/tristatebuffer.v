`timescale 1ns / 1ps

module tristatebuffer(
    input enable,
    input in_signal,
    output reg out_signal
);

    always @ (enable, in_signal)
    begin
        if (enable)
            out_signal <= in_signal;
        else
            out_signal <= 1'bz; // Tri-state the output
    end

endmodule
