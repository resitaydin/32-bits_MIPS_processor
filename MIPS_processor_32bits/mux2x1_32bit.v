module mux2x1_32bit (
    input wire [31:0] in0, // input 0
    input wire [31:0] in1, // input 1
    input wire sel,        // select input
    output wire [31:0] out // output
);
// if sel==1 in1, if sel==0 in2 is choosen.
    wire [31:0] mux_out0;
    wire [31:0] mux_out1;
	 
	 not (sel_not, sel);

    and (mux_out0[0], in0[0], sel_not);
    and (mux_out1[0], in1[0], sel);
    or  (out[0], mux_out0[0], mux_out1[0]);

    and (mux_out0[1], in0[1], sel_not);
    and (mux_out1[1], in1[1], sel);
    or  (out[1], mux_out0[1], mux_out1[1]);

    and (mux_out0[2], in0[2], sel_not);
    and (mux_out1[2], in1[2], sel);
    or  (out[2], mux_out0[2], mux_out1[2]);

    and (mux_out0[3], in0[3], sel_not);
    and (mux_out1[3], in1[3], sel);
    or  (out[3], mux_out0[3], mux_out1[3]);

    and (mux_out0[4], in0[4], sel_not);
    and (mux_out1[4], in1[4], sel);
    or  (out[4], mux_out0[4], mux_out1[4]);

    and (mux_out0[5], in0[5], sel_not);
    and (mux_out1[5], in1[5], sel);
    or  (out[5], mux_out0[5], mux_out1[5]);

    and (mux_out0[6], in0[6], sel_not);
    and (mux_out1[6], in1[6], sel);
    or  (out[6], mux_out0[6], mux_out1[6]);

    and (mux_out0[7], in0[7], sel_not);
    and (mux_out1[7], in1[7], sel);
    or  (out[7], mux_out0[7], mux_out1[7]);

    and (mux_out0[8], in0[8], sel_not);
    and (mux_out1[8], in1[8], sel);
    or  (out[8], mux_out0[8], mux_out1[8]);

    and (mux_out0[9], in0[9], sel_not);
    and (mux_out1[9], in1[9], sel);
    or  (out[9], mux_out0[9], mux_out1[9]);

    and (mux_out0[10], in0[10], sel_not);
    and (mux_out1[10], in1[10], sel);
    or  (out[10], mux_out0[10], mux_out1[10]);

    and (mux_out0[11], in0[11], sel_not);
    and (mux_out1[11], in1[11], sel);
    or  (out[11], mux_out0[11], mux_out1[11]);

    and (mux_out0[12], in0[12], sel_not);
    and (mux_out1[12], in1[12], sel);
    or  (out[12], mux_out0[12], mux_out1[12]);

    and (mux_out0[13], in0[13], sel_not);
    and (mux_out1[13], in1[13], sel);
    or  (out[13], mux_out0[13], mux_out1[13]);

    and (mux_out0[14], in0[14], sel_not);
    and (mux_out1[14], in1[14], sel);
    or  (out[14], mux_out0[14], mux_out1[14]);

    and (mux_out0[15], in0[15], sel_not);
    and (mux_out1[15], in1[15], sel);
    or  (out[15], mux_out0[15], mux_out1[15]);

    and (mux_out0[16], in0[16], sel_not);
    and (mux_out1[16], in1[16], sel);
    or  (out[16], mux_out0[16], mux_out1[16]);

    and (mux_out0[17], in0[17], sel_not);
    and (mux_out1[17], in1[17], sel);
    or  (out[17], mux_out0[17], mux_out1[17]);

    and (mux_out0[18], in0[18], sel_not);
    and (mux_out1[18], in1[18], sel);
    or  (out[18], mux_out0[18], mux_out1[18]);

    and (mux_out0[19], in0[19], sel_not);
    and (mux_out1[19], in1[19], sel);
    or  (out[19], mux_out0[19], mux_out1[19]);

    and (mux_out0[20], in0[20], sel_not);
    and (mux_out1[20], in1[20], sel);
    or  (out[20], mux_out0[20], mux_out1[20]);

    and (mux_out0[21], in0[21], sel_not);
    and (mux_out1[21], in1[21], sel);
    or  (out[21], mux_out0[21], mux_out1[21]);

    and (mux_out0[22], in0[22], sel_not);
    and (mux_out1[22], in1[22], sel);
    or  (out[22], mux_out0[22], mux_out1[22]);

    and (mux_out0[23], in0[23], sel_not);
    and (mux_out1[23], in1[23], sel);
    or  (out[23], mux_out0[23], mux_out1[23]);

    and (mux_out0[24], in0[24], sel_not);
    and (mux_out1[24], in1[24], sel);
    or  (out[24], mux_out0[24], mux_out1[24]);

    and (mux_out0[25], in0[25], sel_not);
    and (mux_out1[25], in1[25], sel);
    or  (out[25], mux_out0[25], mux_out1[25]);

    and (mux_out0[26], in0[26], sel_not);
    and (mux_out1[26], in1[26], sel);
    or  (out[26], mux_out0[26], mux_out1[26]);

    and (mux_out0[27], in0[27], sel_not);
    and (mux_out1[27], in1[27], sel);
    or  (out[27], mux_out0[27], mux_out1[27]);

    and (mux_out0[28], in0[28], sel_not);
    and (mux_out1[28], in1[28], sel);
    or  (out[28], mux_out0[28], mux_out1[28]);

    and (mux_out0[29], in0[29], sel_not);
    and (mux_out1[29], in1[29], sel);
    or  (out[29], mux_out0[29], mux_out1[29]);

    and (mux_out0[30], in0[30], sel_not);
    and (mux_out1[30], in1[30], sel);
    or  (out[30], mux_out0[30], mux_out1[30]);

    and (mux_out0[31], in0[31], sel_not);
    and (mux_out1[31], in1[31], sel);
    or  (out[31], mux_out0[31], mux_out1[31]);

endmodule
