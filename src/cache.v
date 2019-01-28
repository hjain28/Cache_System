`include define.v
`timescale 1ns/1ns


module Cache(procRead, procWrite, procAddress, procData, memRead, memWrite, memAddress, memData, reset, clk);
	input procRead, procWrite, reset, clk;
	input [`ADDR_SIZE-1 :0] procAddress;
	output memRead, memWrite;
	output [`ADDR_SIZE-1:0]memAddress;
	inout [`DATA_SIZE-1 :0]memData, procData;
	
	wire [`DATA_SIZE-1 :0] dataIn, outData, dataOut;
	wire [`TAG_SIZE-1:0] tagOut;
	
	tagCache tc(procAddress, tagOut, clk, write, procRead, reset);
	validCache vc(procAddress, valid, clk, write, procRead, reset);
	dataCache dc(procAddress, dataIn, dataOut, clk, write,read);
	comparator c(tagOut, procAddress[`ADDR_SIZE-1:`ADDR_SIZE-`TAG_SIZE], match);
	cacheControl cc(procRead, procWrite, match, valid, read, write, memWrite, memRead, dataOutSel, dataInSel, clk, reset);
	dataMux dmIn(procData, memData, dataInSel, dataIn);
	dataMux dmOut(dataOut, memData, dataOutSel, outData);

endmodule 
