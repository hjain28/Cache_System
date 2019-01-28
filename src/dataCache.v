`include define.v
`timescale 1ns/1ns

module dataCache(address, dataIn, dataOut, clk, write, read);
	input [`ADDR_SIZE-1:0] address;
	input clk, write, read;
	input [`DATA_SIZE-1:0] dataIn;
	output [`DATA_SIZE-1:0] dataOut;
	
	reg [`DATA_SIZE-1 :0] dataOut;
	reg [`DATA_SIZE -1:0] dataCache[`CACHE_SIZE-1:0];
	
	always @write	
		if(write)
		 @(posedge clk)
			dataCache[address[`ADDR_SIZE-`TAG_SIZE-1:0]]= dataIn;
			
	always @read
		if(read)
		 @(posedge clk)
				dataOut= dataCache[address[`ADDR_SIZE-`TAG_SIZE-1:0]];
endmodule