`include define.v
`timescale 1ns/1ns

module comparator(in1, in2, match);
	input[`TAG_SIZE-1:0] in1, in2;
	output match;
	
	assign match = (in1 == in2);
endmodule