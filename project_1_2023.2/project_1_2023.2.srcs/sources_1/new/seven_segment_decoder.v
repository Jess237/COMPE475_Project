`timescale 1ns / 1ps

module seven_segment_decoder( 
    input clk, 
    input rst,
    input digit, //counter digit value
    output reg [3:0] an, // anode signals of the 7-segment LED display
    output reg [6:0] seg); //seg 
 
// Cathode patterns of the 7-segment LED display 
always @(*)
begin

//Create a simple segment counter that controls the display using a state machine.
always@(*) begin 
    case(digit)
    DIGIT0:
        an=4'b1110;
        seven_seg_counter <=DIGIT1;
    DIGIT1:
        //an=4'b1110;
        seven_seg_counter <=DIGIT2;
    DIGIT2:
        seven_seg_counter <=DIGIT3;
    DIGIT3:
        seven_seg_counter <=DIGIT0;
    default:
        seven_seg_counter <=DIGIT0;
    endcase

end
always @(*)
begin
 case(digit)
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
 default: seg = 7'b0000001; // "0"
 endcase
end
endmodule