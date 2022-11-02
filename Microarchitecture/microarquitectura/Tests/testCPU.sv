module testCPU();
	
	parameter DATA_WIDTH = 19; 
	parameter INSTRUCTION_WIDTH = 32;
	parameter VECTOR_SIZE = 8; 
	parameter PC_WIDTH = 19;
	parameter SCALAR_REGNUM = 16; 
	parameter VECTOR_REGNUM = 16;
	parameter REG_ADDRESS_WIDTH = 4; 
	parameter OPCODE_WIDTH = 5;
	parameter OUTPUT_WIDTH = 8;
	logic reset;
	logic clock;
	logic outFlag;
	logic [VECTOR_SIZE*OUTPUT_WIDTH-1:0] out;	
	logic [PC_WIDTH-1:0]PC;
	
	CPU CPU(clock, reset, out, outFlag,PC);
	
	integer i;
	
	initial begin	
			reset = 1;
		clock = 0;
		#10;
		clock = 1;
		#10;
		clock = 0;
		reset = 0;
		#10;
		
		i = 0;
		while(i<20) begin
		   i += 1;
			clock = 1;
			#1	
				
			clock = 0;
			#1;
		end
	end
	
endmodule 