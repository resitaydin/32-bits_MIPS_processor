module and_4bits (output[3:0] result  ,input [3:0] in1,  input [3:0] in2);

	and and1 (result[3], in1[3], in2[3]);
	and and2 (result[2], in1[2], in2[2]);
	and and3 (result[1], in1[1], in2[1]);
	and and4 (result[0], in1[0], in2[0]);

endmodule