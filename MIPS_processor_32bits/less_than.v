module less_than (output res, input [31:0] a, input [31:0] b);
	wire[31:0] sub_result;
	wire cout;

	// if a - b is negative then res=1 else res = 0
	// if subtractor result's MSB [0]. bits is 1 then it means it is negative, if not it is positive
	// simply return result's MSB.
	
	sub sub1(a, b, sub_result, cout);
	or or1(res, sub_result[31], sub_result[31]); // res = sub_result[31]
	
	
	// module sub(input signed [31:0] a, input signed [31:0] b, output signed [31:0] out, output cout);

endmodule