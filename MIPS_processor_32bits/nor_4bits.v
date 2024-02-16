module nor_4bits (output[3:0] result  ,input [3:0] in1,  input [3:0] in2);

	nor nor1 (result[3], in1[3], in2[3]);
	nor nor2 (result[2], in1[2], in2[2]);
	nor nor3 (result[1], in1[1], in2[1]);
	nor nor4 (result[0], in1[0], in2[0]);

endmodule