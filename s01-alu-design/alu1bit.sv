// 1-bit ALU template
module alu1bit (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic s,          // Output S
    output logic cout        // Carry out
);

// Put your code here
// ------------------
	logic t1, t2, t3, t4, t5, t6;
	
	OR2 #(
		.Tpdlh(7),
		.Tpdhl(7)
	) g1 (
		.A(a),
		.B(b),
		.Z(t1)
	);
	
	NAND2 #(
		.Tpdhl(5),
		.Tpdlh(5)
	) g2 (
		.A(t1),
		.B(t1),
		.Z(t2)
	);
	
	XNOR2 #(
		.Tpdlh(6),
		.Tpdhl(6)
	) g3 (
		.A(a),
		.B(b),
		.Z(t3)
	);
	
	NAND2 #(
		.Tpdhl(5),
		.Tpdlh(5)
	) g4 (
		.A(t3),
		.B(t3),
		.Z(t4)
	);
	
	NAND2 #(
		.Tpdhl(5),
		.Tpdlh(5)
	) g5 (
		.A(op[0]),
		.B(op[0]),
		.Z(t5)
	);
	
	fas FAS(
		.a(a),
		.b(b),
		.cin(cin),
		.a_ns(t5),
		.cout(cout),
		.s(t6)
	);
	
	mux4 mux(
		.d0(t2),
		.d1(t4),
		.d2(t6),
		.d3(t6),
		.sel(op),
		.z(s)
	);
		

// End of your code

endmodule
