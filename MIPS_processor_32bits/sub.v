module sub (input signed [31:0] a, input signed [31:0] b, output signed [31:0] out, output cout);
wire [31:0] b_not;

// 32 Bits subtractor design using the adder I designed.
// a + NOT(b) + 1 = a - b (2s complement)

not_32bits not1(b_not, b);


adder adder1(a, b_not, 1'b1, out, cout); // out = a + b_not + 1


endmodule