`include define.v
`timescale 1ns/1ns

module validCache(address, validOut, clk, write, read, reset);
	input [`ADDR_SIZE-1:0] address;
	input clk, write, read, reset;
	output validOut;
	reg validOut;
	reg [`CACHE_SIZE-1:0]validCacheMem;
	
	always @reset
		if(reset)
			validCacheMem = `CACHE_SIZE'b0;
			
	always @write
		@(negedge clk)
			if(!reset)
				validCacheMem[address[`ADDR_SIZE-`TAG_SIZE-1:0]] =1;
				
	always @read
		@(posedge clk)
			validout = validCacheMem[address[`ADDR_SIZE-`TAG_SIZE-1:0]];
			
endmodule 