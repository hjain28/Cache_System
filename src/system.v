`include define.v
`timescale 1ns/1ns

module System();
		wire [`ADDR_SIZE-1:0] memAddress;
		wire [`DATA_SIZE-1:0] memData;
		wire [`ADDR_SIZE-1:0] procAddress;
		wire [`DATA_SIZE-1:0] procData;
		
		Processor p(procRead, procWrite, procAddress, procData, procClock, reset);
		MainMemory m(memRead, memWrite, memAddress, memData, memClock, reset);
		Cache c(procRead, procWrite, procAddress, procData, memRead, memWrite, memAddress, memData, reset, clk);
endmodule