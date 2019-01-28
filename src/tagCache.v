`include define.v
`timescale 1ns/1ns

module tagCache(address, tagOut, clk, write, read, reset);
		input [`ADDR_SIZE-1 :0] address;
		input clk, write, read, reset;
		output [`TAG_SIZE-1:0] tagOut;
		
		reg [`TAG_SIZE-1:0] tagOut;
		reg [`TAG_SIZE-1:0] tagCacheMem[`CACHE_SIZE-1:0];
		
		always @write
			if(write)
				@(negedge clk)
					tagCacheMem[address[`ADDR_SIZE-`TAG_SIZE -1: 0]]= address[`ADDR_SIZE-1 :`ADDR_SIZE-`TAG_SIZE];
					
		always @read
			if(read)
				@(posedge clk)
					tagOut = tagCacheMem[address[`ADDR_SIZE-`TAG_SIZE -1: 0]];
					
endmodule