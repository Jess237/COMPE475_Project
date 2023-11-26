`timescale 1ns / 1ps

module tenHz_generator_tb;
    reg clk_100MHz;
    wire clk_10Hz;
    parameter clockperiod = 10;
    // generate clock signal
    initial clk_100MHz<=0;
    always#(clockperiod/2)clk_100MHz<=~clk_100MHz;
    tenHz_generator DUT0(.clk_100MHz(clk_100MHz),.clk_10Hz(clk_10Hz));
    initial begin
        repeat(100000000)
            @(posedge clk_100MHz);
        repeat(100000000)
            @(posedge clk_100MHz);
        repeat(100000000)
            @(posedge clk_100MHz);
        #1000000
        #1000000
        #1000000
        #1000000
        #1000000
        #1000000
        #1000000
        #1000000
        #1000000
        #1000000
        #1000000
        #1000000
        $finish;
        end

endmodule
