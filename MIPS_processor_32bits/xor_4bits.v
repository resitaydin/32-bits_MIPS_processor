module xor_4bits (output[3:0] result  ,input [3:0] in1,  input [3:0] in2);

	my_xor xor1 (result[3], in1[3], in2[3]);
	my_xor xor2 (result[2], in1[2], in2[2]);
	my_xor xor3 (result[1], in1[1], in2[1]);
	my_xor xor4 (result[0], in1[0], in2[0]);

endmodule