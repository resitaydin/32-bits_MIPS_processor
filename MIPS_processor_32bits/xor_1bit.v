module my_xor (output result, input a, b);
	and a1 (and1, a, b);
	and a2 (and2, !and1, a);
	and a3 (and3, !and1, b);
	and a4 (and4, !and2, !and3);
	not (result, and4);
endmodule