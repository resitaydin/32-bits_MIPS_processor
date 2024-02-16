module nor_32bits (output [31:0] result  ,input [31:0] in1,  input [31:0] in2);

	nor_4bits nor4_1(result[31:28], in1[31:28], in2[31:28]);
	nor_4bits nor4_2(result[27:24], in1[27:24], in2[27:24]);
	nor_4bits nor4_3(result[23:20], in1[23:20], in2[23:20]);
	nor_4bits nor4_4(result[19:16], in1[19:16], in2[19:16]);
	nor_4bits nor4_5(result[15:12], in1[15:12], in2[15:12]);
	nor_4bits nor4_6(result[11:8],  in1[11:8],  in2[11:8]);
	nor_4bits nor4_7(result[7:4],   in1[7:4],   in2[7:4]);
	nor_4bits nor4_8(result[3:0],   in1[3:0],   in2[3:0]);

endmodule