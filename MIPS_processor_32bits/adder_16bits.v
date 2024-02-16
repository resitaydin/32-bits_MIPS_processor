module adder_16bits(input [15:0] a, input [15:0] b, input cin, output [15:0] sum, output cout);
	
	wire [3:0] p,g;
	wire [3:0] c, c1;

	 // First level: 4-bit adders
    adder_4bits adder1 (.a(a[3:0]), .b(b[3:0]), .cin(cin), .sum(sum[3:0]), .cout(c1[0]), .P(p[0] ), .G(g[0] ) );
    adder_4bits adder2 (.a(a[7:4]), .b(b[7:4]), .cin(c[1]), .sum(sum[7:4]), .cout(c1[1]) , .P(p[1] ), .G(g[1] ) );
    adder_4bits adder3 (.a(a[11:8]), .b(b[11:8]), .cin(c[2]), .sum(sum[11:8]), .cout(c1[2]) , .P(p[2] ), .G(g[2] ) );
    adder_4bits adder4 (.a(a[15:12]), .b(b[15:12]), .cin(c[3]), .sum(sum[15:12]), .cout(c1[3]) , .P(p[3] ), .G(g[3] ) );


	// c1 = g0 + p0c0
	and or1 (or_result1, p[0], cin);	// p0c0
	or and1 (c[1], g[0], or_result1); // c1 = g0 + p0c0
	
	and or2 (or_result2, p[1], g[0]);  // p1g0
	and or3 (or_result3, p[1], p[0], cin);	// p1p0c0
	or and2 (c[2], g[1], or_result2, or_result3); // c2 = g1 + p1g0 + p1p0c0
	
	and or4 (or_result4, p[2], g[1]); // p2g1
	and or5 (or_result5, p[2], p[1], g[0]); // p2p1g0
	and or6 (or_result6, p[2], p[1], p[0], cin); // p2p1p0c0
	or and3(c[3], g[2], or_result4, or_result5, or_result6); // c3 = g2 + p2g1 + p2p1g0 + p2p1p0c0
	
	
	and or7 (or_result7, p[3], g[2]); 	// p3g2
	and or8 (or_result8, p[3], p[2], g[1]); 	// p3p2g1
	and or9 (or_result9, p[3], p[2], p[1], g[0]); 	// p3p2p1g0
	and or10 (or_result10, p[3], p[2], p[1], p[0], cin);  // p3p2p1p0c0
	or and4(cout, g[3], or_result7, or_result8, or_result9, or_result10);
	// c4 = g3 + p3g2 + p3p2g1 + p3p2p1g0 + p3p2p1p0c0
	 

endmodule