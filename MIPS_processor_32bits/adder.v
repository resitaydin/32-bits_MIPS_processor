module adder (input [31:0] a, input [31:0] b, input cin, output [31:0] sum, output cout);
	// 32 Bits Carry Lookahead Adder
	
	wire adder_1_cout;
	
	
	adder_16bits adder_1 (a[15:0], b[15:0], cin, sum[15:0], adder_1_cout);
	adder_16bits adder_2 (a[31:16], b[31:16], adder_1_cout, sum[31:16], cout);


endmodule