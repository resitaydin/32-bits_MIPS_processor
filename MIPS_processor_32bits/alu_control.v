
module alu_control (
output [2:0] alu_ctr,
input [5:0] function_code,
input [2:0] ALUop 
);

wire [2:0] alu_ctr_non_func;
wire [2:0] alu_ctr_func;
wire sel;
wire [2:0] mux_out0;
wire [2:0] mux_out1;

or or1(alu_ctr_non_func[0], ALUop[0], 1'b0);
or or6(alu_ctr_non_func[1], ALUop[1], 1'b0);
or or7(alu_ctr_non_func[2], ALUop[2], 1'b0);


// ALUctr for R-type inst. (has function codes)


 // ALUctr[2] = f1
or or2(alu_ctr_func[2], function_code[1], 1'b0);


// ALUctr[1] = f0f2'
not not1(not_f2, function_code[2]);
and and1(alu_ctr_func[1], function_code[0], not_f2); 


// ALUctr[0] = f0 xor f1
xor xor1(alu_ctr_func[0], function_code[0], function_code[1]);



// selects one of the alu_controls and assign it to actual alu_ctr

// Check if ALUop is 111
	
	and and2(sel, ALUop[2], ALUop[1], ALUop[0]);
	not not2(sel_not, sel);

	and and3(mux_out0[0], alu_ctr_non_func[0], sel_not);
	and and4(mux_out1[0], alu_ctr_func[0], sel);
	or  or3(alu_ctr[0], mux_out0[0], mux_out1[0]);

	and and5(mux_out0[1], alu_ctr_non_func[1], sel_not);
	and and6(mux_out1[1], alu_ctr_func[1], sel);
	or  or4(alu_ctr[1], mux_out0[1], mux_out1[1]);

	and and7(mux_out0[2], alu_ctr_non_func[2], sel_not);
	and and8(mux_out1[2], alu_ctr_func[2], sel);
	or  or5(alu_ctr[2], mux_out0[2], mux_out1[2]);


endmodule