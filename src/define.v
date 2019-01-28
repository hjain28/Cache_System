`define TAG_SIZE 6
`define CACHE_SIZE 2*1024
`define IDLE 0
`define READ 1
`define WRITE 2
`define READ_MISS 3
`define READ_CACHE 4
`define WRITE_MISS 5
`define WRITE_CACHE 6
`define READ_WRITE_DIRTY 7
`define WRITE_WRITE_DIRTY 8

`define READ_MISS1 9
`define READ_MISS2 10
`define WRITE_MEM 11

`define DATA_SIZE 64
`define MEM_SIZE 128*1024

`define CP 100
`define CACHE_DRV 1
`define NON_CACHE_DRV 0
`define FULL 1

`ifdef FULL
module Processor(procRead, procWrite, procAddress, procData, procClock, reset);
	output procRead, procWrite;;
	inout [`ADDR_SIZE-1 :0] procAddress;
	inout [`DATA_SIZE -1:0] procData;
	inout procClock, reset;

endmodule 

module MainMemory(memRead, memWrite, memAddress, memData,memClock, reset);
	input memRead, memWrite, memClock, reset;
	input [`ADDR_SIZE-1 :0]memAddress;
	output [`DATA_SIZE -1:0]memData;

endmodule
`endif