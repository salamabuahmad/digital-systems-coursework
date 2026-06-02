// 32X32 Multiplier arithmetic unit template
module mult32x32_fast_arith (
    input logic clk,             // Clock
    input logic reset,           // Reset
    input logic [31:0] a,        // Input a
    input logic [31:0] b,        // Input b
    input logic [1:0] a_sel,     // Select one byte from A
    input logic b_sel,           // Select one 2-byte word from B
    input logic [2:0] shift_sel, // Select output from shifters
    input logic upd_prod,        // Update the product register
    input logic clr_prod,        // Clear the product register
    output logic a_msb_is_0,     // Indicates MSB of operand A is 0
    output logic b_msw_is_0,     // Indicates MSW of operand B is 0
    output logic [63:0] product  // Miltiplication product
);

// Put your code here
// ------------------

	//4to1 MUX (A)
	logic [7:0] A_out;
	always_comb begin
		case(a_sel)
			2'd0: A_out = a[7:0];
			2'd1: A_out = a[15:8];
			2'd2: A_out = a[23:16];
			2'd3: A_out = a[31:24];
		endcase
	end
	
	//2to1 MUX (B)
	logic [15:0] B_out;
	always_comb begin
		case(b_sel)
			1'b0: B_out = b[15:0];
			1'b1: B_out = b[31:16];
		endcase
	end
	
	//16x8 Multiplier
	logic [23:0] mul_out;
	always_comb begin
		mul_out = A_out * B_out;
	end
	
	//Shifters and 8to1 MUX
	logic [63:0] C_out;
	always_comb begin
		C_out = 64'd0;
		case(shift_sel)
			3'd0: C_out[23:0] = mul_out;
			3'd1: C_out[31:8] = mul_out;
			3'd2: C_out[39:16] = mul_out;
			3'd3: C_out[47:24] = mul_out;
			3'd4: C_out[55:32] = mul_out;
			3'd5: C_out[63:40] = mul_out;
		endcase
	end

	//64 bit adder and ff
	logic [63:0] p_out;
	always_ff @(posedge clk, posedge reset) begin
		if (reset == 1'b1 || clr_prod == 1'b1) begin
			p_out <= 64'd0;
		end
		else begin
			if(upd_prod == 1'b1) begin
				p_out <= p_out + C_out;
			end
		end
		
	end
	
	always_comb begin
		product = p_out;
		a_msb_is_0 = 1'b0;
		b_msw_is_0 = 1'b0;
		if (a[31:24] == 8'd0) begin
			a_msb_is_0 = 1'b1;
		end
		if(b[31:16] == 16'd0) begin
			b_msw_is_0 = 1'b1;
		end
		
	end

// End of your code


endmodule
