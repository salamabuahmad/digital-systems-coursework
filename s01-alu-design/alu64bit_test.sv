// 64-bit ALU test bench template
module alu64bit_test;

// Put your code here
// ------------------
	logic [63:0] a;
	logic [63:0] b; 
	logic [1:0] op;
	logic [63:0] s;
	logic cout;
	logic cin;
	
	alu64bit alu (
		.a(a),
		.b(b),
		.cin(cin),
		.op(op),
		.s(s),
		.cout(cout)
	);
	
	
	assign a = {64{1'b1}};
	assign b = {64{1'b0}};
	assign op[1] = 1;
	assign op[0] = 0;
	
	initial begin
	assign cin = 0;
	#1200
	assign cin = 1;
	#1200
	assign cin = 0;
	end
	
// End of your code

endmodule