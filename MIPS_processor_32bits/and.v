module and_32bits (output[31:0] result  ,input [31:0] in1,  input [31:0] in2);

	and_4bits and4_1(result[31:28], in1[31:28], in2[31:28]);
	and_4bits and4_2(result[27:24], in1[27:24], in2[27:24]);
	and_4bits and4_3(result[23:20], in1[23:20], in2[23:20]);
	and_4bits and4_4(result[19:16], in1[19:16], in2[19:16]);
	and_4bits and4_5(result[15:12], in1[15:12], in2[15:12]);
	and_4bits and4_6(result[11:8],  in1[11:8],  in2[11:8]);
	and_4bits and4_7(result[7:4],   in1[7:4],   in2[7:4]);
	and_4bits and4_8(result[3:0],   in1[3:0],   in2[3:0]);

endmodule