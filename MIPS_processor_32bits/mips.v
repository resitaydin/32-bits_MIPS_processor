`timescale 1ns / 1ps

module mips (input clock); 

    reg [31:0] PC;
    wire [31:0] instruction;
	 
    wire [31:0] pc_plus4;
	 wire [31:0] alu_result;
	 wire [31:0] write_data_not_move;
	 
	 wire[31:0] instr_sign_extended;
	 wire[31:0] instr_sgn_ext_shift_lefted;
	 
    wire cout;
	 wire zero_bit;
	 
	 wire regDst, branch, memRead, memWrite, ALUsrc, regWrite, jump, byteOperations, move;
	 
	 // Wires for register_block
    wire [31:0] read_data1, read_data2;
    wire [31:0] write_data;
	 
	 // Wires for alu_control inputs and output
    wire [2:0] alu_ctr;
    wire [2:0] ALUop;
	 
	 // Wires for memory_block
	 wire[31:0] read_data;
	 wire[17:0] address;
	 
	 wire[31:0] mux2_result;
	 
	 wire zero_or_branch;
	wire[31:0] mux4_result;
	wire [31:0] adder_shft_left_pc_res;
	 

    // Initialize PC
    initial PC = 0;

    // Simple PC increment logic
    always @(posedge clock) begin
			$display("pc:%d -> instruction %b", PC, instruction);
			// Display control signals
			PC <= mux4_result;
			$display("alu result: %d", alu_result);
			$display("read_data1: %b", read_data1);
			$display("beq: %b", branch);
			
			$display("mux4_result: %d", mux4_result);
			$display("zero_or_branch: %b", zero_or_branch);
			$display("aluOP: %b", ALUop);
			$display("regwrite: %b", regWrite);
			$display("memRead: memRead: %b", memRead);
			$display("memory: read_data: %b", read_data);
			
    end
	 
	 instruction_block instr_block(
        .instruction(instruction),
        .pc(PC)
    );
	 
	 // Instantiate the control_unit
    control_unit cu (
        .regDst(regDst),
        .branch(branch),
        .memRead(memRead),
        .memWrite(memWrite),
        .ALUop(ALUop),
        .ALUsrc(ALUsrc),
        .regWrite(regWrite),
        .jump(jump),
        .byteOperations(byteOperations),
        .move(move),
        .opcode(instruction[31:26]) // Connect to the opcode extracted from the instruction
    );
	 
	 wire[4:0] rt_mux_rd;
	 
	 mux2x1_5bit mux1(
	 .in0(instruction[20:16]),
	 .in1(instruction[15:11]),
	 .sel(regDst),
	 .out(rt_mux_rd) );
	 
	 
	 register_block uut (
        .read_data1(read_data1),
        .read_data2(read_data2),
        .byteOperations(byteOperations),
        .write_data(write_data),
        .read_reg1(instruction[25:21]),
        .read_reg2(instruction[20:16]),
        .write_reg(rt_mux_rd),
        .regWrite(regWrite)
    );
	 	
	 
	  sign_extend sgn_ext(
     .sign_ext_imm(instr_sign_extended),
     .imm(instruction[15:0])     
		);
		
		adder adder1(PC, 32'h00000004, 1'b0, pc_plus4, cout);
		
		shift_left_2 shft_lft(.shifted_address(instr_sgn_ext_shift_lefted), .address(instr_sign_extended) );
		
		adder adder_shft_left_pc(pc_plus4, instr_sgn_ext_shift_lefted, 1'b0, adder_shft_left_pc_res, cout);
		
		and and_gate (zero_or_branch, zero_bit, branch);
		
		mux2x1_32bit mux4(pc_plus4, adder_shft_left_pc_res, zero_or_branch, mux4_result);

	 
	 mux2x1_32bit mux2(
    .out(mux2_result),         
    .in0(read_data2),          
    .in1(instr_sign_extended),
    .sel(ALUsrc)              
	 );

	
	 alu_control alu_cntrl(
    .alu_ctr(alu_ctr),         // Output of the ALU control unit
    .function_code(instruction[5:0]), // Function code part of the instruction
    .ALUop(ALUop)              // ALU operation signal
	 );

	 
	 alu alu1(
    .alu_result(alu_result),       // Output of the ALU
	 .zero_bit(zero_bit),
    .alu_src1(read_data1),            // First operand
    .alu_src2(mux2_result),           // Second operand (result of the mux)
    .alu_ctr(alu_ctr)            // ALU operation control
	);

	 
	 memory_block mem_block (
        .read_data(read_data),
        .byteOperations(byteOperations),
        .address(alu_result[17:0]),
        .write_data(read_data2),
        .memRead(memRead),
        .memWrite(memWrite)
    );

	 
	 mux2x1_32bit mux3(alu_result, read_data, memRead, write_data_not_move);
	 
	 mux2x1_32bit move_mux(write_data_not_move, read_data1, move, write_data); // mux for move operation.

endmodule
