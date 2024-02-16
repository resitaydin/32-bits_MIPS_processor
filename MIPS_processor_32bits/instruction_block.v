module instruction_block (
    output reg [31:0] instruction,
    input [31:0] pc
);

    reg [7:0] mem[0:1024]; // Adjusted for 8-bit memory locations

    initial begin
        $readmemb("instructions.mem", mem);
    end

    always @(pc) begin
			$display("instruction in block: %b", instruction);
        // Assemble the 32-bit instruction from four 8-bit segments
        instruction = {mem[pc+3], mem[pc + 2], mem[pc + 1], mem[pc]};
    end

endmodule