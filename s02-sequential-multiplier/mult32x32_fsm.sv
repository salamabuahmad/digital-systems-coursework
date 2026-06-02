// 32X32 Multiplier FSM
module mult32x32_fsm (
    input logic clk,              // Clock
    input logic reset,            // Reset
    input logic start,            // Start signal
    output logic busy,            // Multiplier busy indication
    output logic [1:0] a_sel,     // Select one byte from A
    output logic b_sel,           // Select one 2-byte word from B
    output logic [2:0] shift_sel, // Select output from shifters
    output logic upd_prod,        // Update the product register
    output logic clr_prod         // Clear the product register
);

// Put your code here
// ------------------
	
	//Declaring the SFM states
	typedef enum {idle_state, start_state, state1, state2, state3, state4, state5, state6, state7} sm_type;
	
	sm_type current_state;
	sm_type next_state;
	
	// FSM synchronous procedural block.
    always_ff @(posedge clk, posedge reset) begin
        if (reset == 1'b1) begin
            current_state <= idle_state;
        end
        else begin
            current_state <= next_state;
        end
    end
	
	//FSM states changes
	always_comb begin
		busy = 1'b1;
		a_sel = 2'b00;
		b_sel = 0;
		shift_sel = 3'b000;
		upd_prod = 1'b1;
		clr_prod = 1'b0;
		case(current_state)
		
			idle_state: begin
				busy = 1'b0;
				upd_prod = 1'b0;
				if(start == 1'b1) begin
					clr_prod = 1'b1;
					next_state = start_state;
				end 
				else begin
					next_state = idle_state;
				end
			end
			start_state: next_state = state1;
			
			state1: begin
				a_sel = 2'b01;
				shift_sel=3'b001;
				next_state = state2;
			end
			
			state2: begin
				a_sel = 2'b10;
				shift_sel=3'b010;
				next_state = state3;
			end
			
			state3: begin
				a_sel = 2'b11;
				shift_sel=3'b011;
				next_state = state4;
			end
			
			state4: begin
				b_sel = 1'b1;
				shift_sel=3'b010;
				next_state = state5;
			end
			
			state5: begin
				a_sel = 2'b01;
				b_sel = 1'b1;
				shift_sel = 3'b011;
				next_state = state6;
			end
			
			state6: begin
				a_sel = 2'b10;
				b_sel = 1'b1;
				shift_sel = 3'b100;
				next_state = state7;
			end
			
			state7: begin
				a_sel = 2'b11;
				b_sel = 1'b1;
				shift_sel = 3'b101;
				next_state = idle_state;
			end
		
		endcase

	end
	
	
	
// End of your code

endmodule
