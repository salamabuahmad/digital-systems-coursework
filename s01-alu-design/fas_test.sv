// Full Adder/Subtractor test bench template
module fas_test;

// Put your code here
// ------------------
	logic a,b,cin,a_ns,s,cout;
	assign a_ns = 0;
	assign cin = 0;
	
	fas ft(
		.a(a),
		.b(b),
		.a_ns(a_ns),
		.cin(cin),
		.cout(cout),
		.s(s)
	);
	
	initial begin
		assign a = 1;
		assign b = 0;
		#15
		assign b = 1;
		#15
		assign b = 0;
		#15
		assign a = 0;
		#10
		assign a = 1;
	end

// End of your code

endmodule
