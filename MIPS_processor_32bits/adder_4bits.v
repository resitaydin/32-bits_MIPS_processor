module adder_4bits(input[3:0] a, input[3:0] b,input cin, output[3:0] sum, output cout, output P, output G);
	// 4bits Carry Lookahead Adder Implementation

	wire [3:0] p,g,c;
	
	xor_4bits xor_4bits1(p, a, b); 	// propogate bit
	and_4bits  and_4bits1(g, a , b);	// generate bit
	
	// c0 = cin

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
	
	
	my_xor xor1(sum[0], p[0], cin);
	my_xor xor2(sum[1], p[1], c[1]);
	my_xor xor3(sum[2], p[2], c[2]);
	my_xor xor4(sum[3], p[3], c[3]);
	
	and and5(P, p[0], p[1], p[2], p[3]);
	
	and and6(and6_result, p[3], g[2]);
	and and7(and7_result, p[3], p[2], g[1]);
	and and8(and8_result, p[3], p[2], p[1], g[0]);
	or  or11(G, g[3], and6_result, and7_result, and8_result);
	
	

endmodule