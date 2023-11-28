//mode goes from 0 - 16 due to the 16 switches
//reference Daniel Ayala video on Youtube
always@(*) begin
    case (mode)
        2'd0: width = 5'd0;
        2'd1: width = 5'd4;
        2'd2: width = 5'd8;
        2'd3: width = 5'd12;
        2'd4: width = 5'd14;
        2'd5: width = 5'd16;
        2'd6: width = 5'd18;
        2'd7: width = 5'd24;
        2'd8: width = 5'd28;
        2'd9: width = 5'd32;
        2'd10: freq = 1;
        2'd11: freq = 10;
        2'd12: freq = 15;
        2'd13: freq = 20;
        2'd14: freq = 30;
        2'd15: freq = 50;
        2'd16: freq = 60;
		default : begin 
			width = 5d'0;
			freq = 0;
		end
	endcase
	end
        