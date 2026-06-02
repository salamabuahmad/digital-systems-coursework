// 4->1 multiplexer test bench template
module mux4_test;
	
// Put your code here
// ------------------
	logic d0, d1, d2, d3,z;
	logic [1:0] sel ;
	
	assign d0 = 1;
	assign d1 = 0;
	assign d2 = 0;
	assign d3 = 1;
	assign sel[1] = 1;
	
	mux4 mux(
		.d0(d0),
		.d1(d1),
		.d2(d2),
		.d3(d3),
		.sel(sel),
		.z(z)
	);
	
	initial begin
		sel[0] = 0;
		#40
		sel[0] = 1;
		#40
		sel[0] = 0;
	end

// End of your code

endmodule
