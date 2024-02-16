module mux2x1_5bit (
    input [4:0] in0,
    input [4:0] in1,
    input sel,
    output wire [4:0] out
);

    // AND gates for each bit
    wire [4:0] and_out0;
    wire [4:0] and_out1;
	 
	 not(sel_not, sel);

    and (and_out0[0], in0[0], sel_not);
    and (and_out1[0], in1[0], sel);
    or  (out[0], and_out0[0], and_out1[0]);

    and (and_out0[1], in0[1], sel_not);
    and (and_out1[1], in1[1], sel);
    or  (out[1], and_out0[1], and_out1[1]);

    and (and_out0[2], in0[2], sel_not);
    and (and_out1[2], in1[2], sel);
    or  (out[2], and_out0[2], and_out1[2]);

    and (and_out0[3], in0[3], sel_not);
    and (and_out1[3], in1[3], sel);
    or  (out[3], and_out0[3], and_out1[3]);

    and (and_out0[4], in0[4], sel_not);
    and (and_out1[4], in1[4], sel);
    or  (out[4], and_out0[4], and_out1[4]);

endmodule
