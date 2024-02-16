`timescale 1ns / 1ps

module register_block (
    output reg [31:0] read_data1, 
    output reg [31:0] read_data2, 
    input byteOperations,
    input [31:0] write_data, 
    input [4:0] read_reg1,
    input [4:0] read_reg2, 
    input [4:0] write_reg, 
    input regWrite
);
    reg [31:0] registers [127:0];

    // Initialize register file from "registers.mem"
    initial begin
        $readmemb("registers.mem", registers);
    end

    // Read operations (Combinational Logic)
    always @(*) begin
        read_data1 = registers[read_reg1];
        read_data2 = registers[read_reg2];
    end

    // Write operations (Level-Sensitive)
    always @(*) begin
        if (regWrite) begin
            if (byteOperations) begin
                // Implement byte-level write operations
            end else begin
                // Standard word-level write operation
                registers[write_reg] = write_data; // Using blocking assignment for level-sensitive block
            end
            // Optional: Write the updated registers to the file (for debugging purposes)
            $writememb("registers.mem", registers);
        end
    end

endmodule
