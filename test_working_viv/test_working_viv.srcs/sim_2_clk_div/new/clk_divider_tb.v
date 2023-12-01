`timescale 1ns / 1ps

module clk_divider_tb;
    reg clk; // Input clock signal
    reg rst;
    wire div_counter_out;
    
//reg [7:0]div;
//reg state [1:0] = 1'b0; //disabled
//assign div_counter_out = (state==1'b1)?div:0; //enable state

// Instantiate the module under test
clk_divider uut1 (
    .clk(clk),              // Connect testbench clock to counter clock
    .rst(rst),
    .div_counter(div_counter_out)   // Connect counter output to wire for observation
);

initial begin
    clk = 0;                // Initialize clock to 0
    rst = 0;
    #10
    rst=1;
    #10
    rst=0;
   // @ (posedge clk) state=1'b1;
end
 
always #1 clk = ~clk;


endmodule
