`timescale 1ns / 1ps
// reference: https://www.fpga4student.com/2017/09/seven-segment-led-display-controller-basys3-fpga.html
module seven_segment_driver( 
    input clk, 
    input rst,
    input [3:0] counter,
    input [3:0] digit, //counter digit
    output reg [3:0] an, // anode signals of the 7-segment LED display
    output reg [6:0] seg
    ); //seg 
reg [26:0] one_second_counter; // counter for generating 1 second clock enable
wire one_second_enable;// one second enable for counting numbers
reg [15:0] displayed_number; // counting number to be displayed
reg [19:0] refresh_counter; // 20-bit for creating 10.5ms refresh period or 380Hz refresh rate
         // the first 2 MSB bits for creating 4 LED-activating signals with 2.6ms digit period
wire [1:0] LED_activating_counter; 
        
parameter DIGIT0 = 2'b00;
parameter DIGIT1 = 2'b01;
parameter DIGIT2 = 2'b10;
parameter DIGIT3 = 2'b11;

reg [1:0] seven_seg_counter = 0;
//Instantiate the seven-segment decoder 4 times.
seven_seg_decoder_hex uut3 (
		.clk(clk), 
		.rst(rst), 
		.LED_BCD(counter), 
		.an(an), 
        .seg(seg)
	);
	
//seven_seg_decoder_hex uut2 (
//		.clk(clk), 
//		.rst(rst), 
//		.digit(counter[2]), 
//		.an(an), 
//        .seg(seg)
//	);
   
//seven_seg_decoder_hex uut1 (
//		.clk(clk), 
//		.rst(rst), 
//		.digit(counter[1]), 
//		.an(an), 
//        .seg(seg)
//	);	
   
//seven_seg_decoder_hex uut0 (
//		.clk(clk), 
//		.rst(rst), 
//		.digit(counter[0]), 
//		.an(an), 
//        .seg(seg)
//	); 
	
always @(posedge clk or posedge rst)
    begin
       if(rst==1)
            one_second_counter <= 0;
        else begin
            if(one_second_counter>=99999999) 
                 one_second_counter <= 0;
            else
                one_second_counter <= one_second_counter + 1;
        end
    end 
    assign one_second_enable = (one_second_counter==99999999)?1:0;
    always @(posedge clk or posedge rst)
    begin
        if(rst==1)
            displayed_number <= 0;
        else if(one_second_enable==1)
            displayed_number <= displayed_number + 1;
    end
    always @(posedge clk or posedge rst)
    begin 
        if(rst==1)
            refresh_counter <= 0;
        else
            refresh_counter <= refresh_counter + 1;
    end 
    assign LED_activating_counter = refresh_counter[19:18];
    // anode activating signals for 4 LEDs, digit period of 2.6ms
    // decoder to generate anode signals 
    always @(*)
    begin
        case(LED_activating_counter)
        DIGIT0: begin
            an = 4'b0111; 
            // activate LED1 and Deactivate LED2, LED3, LED4
            digit= displayed_number/1000;
            // the first digit of the 16-bit number
              end
        DIGIT1: begin
            an = 4'b1011; 
            // activate LED2 and Deactivate LED1, LED3, LED4
            digit = (displayed_number % 1000)/100;
            // the second digit of the 16-bit number
              end
        DIGIT2: begin
            an = 4'b1101; 
            // activate LED3 and Deactivate LED2, LED1, LED4
            digit = ((displayed_number % 1000)%100)/10;
            // the third digit of the 16-bit number
                end
        DIGIT3: begin
            an = 4'b1110; 
            // activate LED4 and Deactivate LED2, LED3, LED1
            digit = ((displayed_number % 1000)%100)%10;
            // the fourth digit of the 16-bit number    
               end
        default: 
        endcase
    end

end
endmodule