// 32X32 Multiplier test template
module mult32x32_test;

    logic clk;            // Clock
    logic reset;          // Reset
    logic start;          // Start signal
    logic [31:0] a;       // Input a
    logic [31:0] b;       // Input b
    logic busy;           // Multiplier busy indication
    logic [63:0] product; // Miltiplication product

// Put your code here
// ------------------
	mult32x32 mult (
		.clk(clk),
		.reset(reset),
		.start(start),
		.a(a),
		.b(b),
		.busy(busy),
		.product(product)
	);
	
	always begin
        #5
        clk = ~clk;
    end 
	
	initial begin
		clk = 1'b0;
		start = 1'b0;
		reset = 1'b1;
		
		repeat(4) begin
			@(posedge clk);
		end 
		
		reset = 1'b0;
		
		a = 32'd214657413;
		b = 32'd325486538;
		
		repeat(1) begin
			@(posedge clk);
		end 
		
		start = 1'b1;
		repeat(1) begin
			@(posedge clk);
		end 
		
		start = 1'b0;
		while(busy != 1'b0) begin
			repeat(1) begin
				@(posedge clk);
			end 
		end
		
	end
	
	initial begin
		
	end

// End of your code

endmodule
