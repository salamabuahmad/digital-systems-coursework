// 2->1 multiplexer template
module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);

// Put your code here
// ------------------
	logic a,b,c,d;
	OR2 #(
		.Tpdlh(7),
		.Tpdhl(7)
	) or1 (
		.Z(a),
		.B(d0),
		.A(sel)
	);
	
	NAND2 #(
		.Tpdlh(5),
		.Tpdhl(5)
	) nand1 (
		.Z(b),
		.A(sel),
		.B(sel)
	);
	
	OR2 #(
		.Tpdlh(7),
		.Tpdhl(7)
	) or2 (
		.Z(c),
		.A(b),
		.B(d1)
	);
	
	NAND2 #(
		.Tpdlh(5),
		.Tpdhl(5)
	) nand2 (
		.Z(d),
		.A(a),
		.B(c)
	);
	
	
	NAND2 #(
		.Tpdlh(5),
		.Tpdhl(5)
	) nand3 (
		.Z(z),
		.A(d),
		.B(d)
	);
	
	
// End of your code

endmodule
