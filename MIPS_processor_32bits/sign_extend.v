module sign_extend(
    output [31:0] sign_ext_imm,
    input [15:0] imm
);

// Instantiate 16 NOT gates to invert the sign bit
wire not_sign;
not not_gate(not_sign, imm[15]);

// Instantiate 16 AND gates to generate the high bits
wire [15:0] high_bits;
genvar i;
generate
    for (i = 0; i < 16; i = i + 1) begin : and_gates
        and and_gate(high_bits[i], not_sign, 1'b0);
    end
endgenerate

// Instantiate 16 OR gates to generate the high bits when sign bit is 1
generate
    for (i = 0; i < 16; i = i + 1) begin : or_gates
        or or_gate(sign_ext_imm[i+16], high_bits[i], imm[15]);
    end
endgenerate

// Connect the lower 16 bits directly
generate
    for (i = 0; i < 16; i = i + 1) begin : direct_connect
        buf buf1(sign_ext_imm[i], imm[i]);
    end
endgenerate

endmodule
