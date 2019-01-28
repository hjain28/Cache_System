`include define.v
`timescale 1ns/1ns

module cacheControl( procRead, procWrite, match, valid, read, write, memWrite, memRead, dataOutSel, dataInSel, clk, reset);
		
	input procRead, procWrite, match, valid, clk, reset;
	output memWrite, memRead, dataOutSel, dataInSel, read, write;
	
	reg memWrite, memRead, dataOutSel, dataInSel, read, write;
	reg [7:0] state, nextState;
	
	always @(posedge clk)
		state = reset ?`IDLE : nextState;
		
	always @(state or procWrite or match or valid)
		case (state)
		
		`IDLE : if(procRead)
					nextState = `READ;
				else if (procWrite)
					nextState = `WRITE;
				else
					nextState = `IDLE;
				
		`READ :	if (match && valid)
					nextState = `IDLE;
				else
					nextState = `READ_MISS1;
		
		`READ_MISS1 :
				nextState = `READ_MISS2;
		
		`READ_MISS2 :
				nextState = `IDLE ;
				
		`WRITE :
				nextState =`WRITE_MEM;
			
		`WRITE_MEM :
				nextState = `IDLE ;
	
	endcase
	
	
	always @(state)
		case(state)
		
		`READ :
			begin 
			read =1;
			dataOutSel = ~(match & valid)
			end
		
		`READ_MISS1 :
			begin
			memRead =1;
			dataInSel = 1;
			end
		
		`READ_MISS2 :
			begin
			memRead <= #`CP 0;
			write =1 ;
			write <= #`CP 0;
			end
			
		`WRITE :
			begin 
			memWrite =1;
			write = 1;
			dataInSel =0;
			end
	
		`WRITE_MEM :
			begin	
			memWrite =0;
			write= 0;
			memWrite <= #`CP 0;
			dataInSel <= #`CP 1;
			end
		endcase
		
endmodule
			