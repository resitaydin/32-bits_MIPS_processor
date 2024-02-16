module alu (output [31:0] alu_result, output zero_bit, input [31:0] alu_src1, input [31:0] alu_src2, input [2:0] alu_ctr);

reg cin = 0;
wire cout_adder, cout_sub;

wire[31:0] and_result;
// module and_32bits (output[31:0] result  ,input [31:0] in1,  input [31:0] in2);
and_32bits alu_and (and_result, alu_src1 , alu_src2);

wire[31:0] or_result;
// module or_32bits (output[31:0] result  ,input [31:0] in1,  input [31:0] in2);
or_32bits alu_or (or_result, alu_src1, alu_src2);

wire[31:0] xor_result;
// module xor_32bits (output[31:0] result  ,input [31:0] in1,  input [31:0] in2);
xor_32bits alu_xor(xor_result, alu_src1, alu_src2);

wire[31:0] nor_result;
// module nor_32bits (output[31:0] result  ,input [31:0] in1,  input [31:0] in2);
nor_32bits alu_nor(nor_result, alu_src1, alu_src2);

// module less_than (output res, input [31:0] a, input [31:0] b);
wire alu_lt_res; // Declare a 1-bit wire
less_than alu_lt(alu_lt_res, alu_src1, alu_src2); // Use the 1-bit wire here

wire [31:0] lessThan_result = {31'b0, alu_lt_res}; // Zero-extend the 1-bit result

wire[31:0] add_result;
// module adder (input [31:0] a, input [31:0] b, input cin, output [31:0] sum, output cout);
adder alu_adder(alu_src1, alu_src2, cin, add_result, cout_adder);

wire[31:0] sub_result;
// module sub (input signed [31:0] a, input signed [31:0] b, output signed [31:0] out, output cout);
sub alu_sub(alu_src1, alu_src2, sub_result, cout_sub);

//wire[31:0] mod_result;
// module mod (input [31:0] a, input [31:0] b, input reset, input clk, output [31:0] result);
//mod alu_mod(alu_src1, alu_src2, reset, clk, mod_result);

nor zero_gate1 (zero_bit, sub_result[31], sub_result[30], sub_result[29], sub_result[28], sub_result[27],
 sub_result[26], sub_result[25], sub_result[24], sub_result[23], sub_result[22], sub_result[21],
 sub_result[20], sub_result[19], sub_result[18], sub_result[17], sub_result[16], sub_result[15],
 sub_result[14], sub_result[13], sub_result[12], sub_result[11], sub_result[10], sub_result[9],
 sub_result[8], sub_result[7], sub_result[6], sub_result[5], sub_result[4], sub_result[3],
 sub_result[2], sub_result[1], sub_result[0]);



mux8to1 mux(.result(alu_result), .in0(and_result), .in1(or_result),
.in2(xor_result), .in3(nor_result), .in4(lessThan_result),
.in5(add_result), .in6(sub_result), .in7(32'b0), .sel(alu_ctr));


/*
	AND 000 
	OR 001 
	XOR 010 
	NOR 011 
	LESS THAN 100 
	ADD 101 
	SUB 110 
	MOD 111 
*/


endmodule