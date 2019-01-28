`include define.v
`timescale 1ns/1ns

module dataMux(data0, data1, dataSel, outData);
	input [`DATA_SIZE-1:0] data0,data1;
	input dataSel;
	output [`DATA_SIZE-1:0] outData;
	
	assign outData = dataSel ? data0 : data1 ;
endmodule 