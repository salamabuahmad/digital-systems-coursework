// Full Adder/Subtractor template
module fas (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic a_ns,        // A_nS (add/not subtract) control
    output logic s,          // Output S
    output logic cout        // Carry out
);

// Put your code here
// ------------------
	logic c,d,e,f,g,h,i,j;
	
	XNOR2 #(
		.Tpdhl(6),
		.Tpdlh(6)
	)xnor1(
		.A(cin),
		.B(b),
		.Z(c)
	);
	XNOR2 #(
		.Tpdhl(6),
		.Tpdlh(6)
	)xnor2(
		.A(a),
		.B(c),
		.Z(s)
	);
	
	NAND2 #(
		.Tpdhl(5),
		.Tpdlh(5)
	) nand1(
		.A(cin),
		.B(b),
		.Z(d)
	);
	
	XNOR2 #(
		.Tpdhl(6),
		.Tpdlh(6)
	)xnor3(
		.A(a_ns),
		.B(a),
		.Z(e)
	);

	OR2 #(
		.Tpdhl(7),
		.Tpdlh(7)
	) or1 (
		.A(cin),
		.B(b),
		.Z(f)
	);
	
	
	NAND2 #(
		.Tpdhl(5),
		.Tpdlh(5)
	) nand2(
		.A(f),
		.B(e),
		.Z(g)
	);
	
	NAND2 #(
		.Tpdhl(5),
		.Tpdlh(5)
	) nand3(
		.A(d),
		.B(g),
		.Z(cout)
	);
// End of your code

endmodule
