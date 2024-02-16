`timescale 1ns / 1ps

module my_testbench;

    // Inputs
    reg clock;

    // Instantiate the Unit Under Test (UUT)
    mips uut (
        .clock(clock)
    );

    initial begin
        // Initialize Inputs
        clock = 0;

        // Generate clock
        forever #10 clock = ~clock; // 50 MHz clock
    end
    
    initial begin
        // Run the simulation for a certain time
        #62;
        $finish;
    end

endmodule
