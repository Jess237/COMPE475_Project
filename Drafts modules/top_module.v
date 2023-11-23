// Moore machine with 3 always blocks

// state register with sync reset
always @(posedge CLK) //sync. reset	'
	begin
		if (RESET)
			current_state<=state_0;
		else current_state<=next_state;
	end
	
	// Next state combinational logic
	//use blocking assignments
	always @(inputs or current_state)
		next_state = ...
	end
	//output combinational logic
	//use blocking assignments
	always @(current_state)
		outputs = ...
	end
		
// Moore Machine with two always blocks
// next state logic and state regsiter
always @(posedge CLK)
	if (RESET) current_state <= state_0;
	else
		case(current_state)
		state1:
			if(input1)
				current_state<=state2;
			else
				current_state<=state3;
			...
		endcase
		
	// output combinational logic
	//use blocking assignments
	always @(current_state)
		outputs = ...