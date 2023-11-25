`timescale 1ns / 1ps
// takes frequency as argument.
//used as lowpass or highpass
module n3butterworth(
input cutoff_freq,
input type,
input reg signal
output processed_signal
    );
endmodule
