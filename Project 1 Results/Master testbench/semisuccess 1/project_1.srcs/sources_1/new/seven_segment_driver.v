`timescale 1ns / 1ps
// reference: https://www.fpga4student.com/2017/09/seven-segment-led-display-controller-basys3-fpga.html
module seven_segment_driver( 
    input clk, 
    input rst,
    input [3:0] counter,
    //input [3:0] digit, //counter digit
    output reg [3:0] an, // anode signals of the 7-segment LED display
    output reg [6:0] seg
    ); //seg 
reg [26:0] one_second_counter; // counter for generating 1 second clock enable
wire one_second_enable;// one second enable for counting numbers
reg [15:0] displayed_number; // counting number g 10.5ms refresh period or 380Hz refresh rate
         // the first 2 MSB bits for creating 4 LED-activating signals with 2.6ms digit period
reg [19:0] refresh_counter; // 20-bit for creatin
wire [1:0] LED_activating_counter; 
reg [3:0] LED_BCD;
        
parameter DIGIT0 = 2'b00;//to be displayed

parameter DIGIT1 = 2'b01;
parameter DIGIT2 = 2'b10;
parameter DIGIT3 = 2'b11;

initial LED_BCD=0;
//initial an=4'b1110;

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
        LED_BCD<=counter;
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
                LED_BCD= displayed_number/1000;
                // the first digit of the 16-bit number
                //LED_activating_counter<=LED_activating_counter+1;
                  end
            DIGIT1: begin
                an = 4'b1011; 
                // activate LED2 and Deactivate LED1, LED3, LED4
                LED_BCD = (displayed_number % 1000)/100;
                // the second digit of the 16-bit number
               // LED_activating_counter<=LED_activating_counter+1;
                  end
            DIGIT2: begin
                an = 4'b1101; 
                // activate LED3 and Deactivate LED2, LED1, LED4
                 LED_BCD = ((displayed_number % 1000)%100)/10;
                 //LED_activating_counter<=LED_activating_counter+1;
                // the third digit of the 16-bit number
                    end
            DIGIT3: begin
                an = 4'b1110; 
                // activate LED4 and Deactivate LED2, LED3, LED1
                LED_BCD = ((displayed_number % 1000)%100)%10;
               // LED_activating_counter<=LED_activating_counter+1;
                // the fourth digit of the 16-bit number    
               end
        endcase
        end
        always @(*)begin
            case(LED_BCD)
            4'b0000: seg = 7'b0000001; // "0"     
            4'b0001: seg = 7'b1001111; // "1" 
            4'b0010: seg = 7'b0010010; // "2" 
            4'b0011: seg = 7'b0000110; // "3" 
            4'b0100: seg = 7'b1001100; // "4" 
            4'b0101: seg = 7'b0100100; // "5" 
            4'b0110: seg = 7'b0100000; // "6" 
            4'b0111: seg = 7'b0001111; // "7" 
            4'b1000: seg = 7'b0000000; // "8"     
            4'b1001: seg = 7'b0000100; // "9" 
            4'b1010: seg = 7'b0001000; // "A" 
            4'b1011: seg = 7'b1100000; // "B" 
            4'b1100: seg = 7'b0110001; // "C" 
            4'b1101: seg = 7'b1000010; // "D"     
            4'b1110: seg = 7'b0110000; // "E" 
            4'b1111: seg = 7'b0111000; // "F" 
            default: seg = 7'b0000001; // "0"
            endcase
        end
endmodule