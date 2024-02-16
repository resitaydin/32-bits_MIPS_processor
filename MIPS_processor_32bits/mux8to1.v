`timescale 1ns / 1ps

module mux8to1 (output reg [31:0] result, input [31:0] in0, in1, in2, in3, in4, in5, in6, in7, input [2:0] sel);
  always @(sel) begin
	#4
    case(sel)
      3'b000: result = in0;
      3'b001: result = in1;
      3'b010: result = in2;
      3'b011: result = in3;
      3'b100: result = in4;
      3'b101: result = in5;
      3'b110: result = in6;
      3'b111: result = in7;
      default: result = 32'b0;
    endcase
	 $display("mux result: %b", result);
  end
endmodule