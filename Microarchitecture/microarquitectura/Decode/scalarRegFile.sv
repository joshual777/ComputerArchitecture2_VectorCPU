
/**
	Scalar register module 
	Inputs:
	- ra1 and ra2 indicate de registers to be read
   - we3 indicates whether to write into the registers
	- wa3 indicates the register on which to write
	- wd3 : the data to write
	Outputs:
 	- rd1 and rd2 provide the requested registers value
	Params:
	- REGNUM: number of registers
	- DATA_WIDTH: width of each register
	- ADRESSWIDTH: size of the addresses
**/
module scalarRegFile #(parameter DATA_WIDTH = 19, parameter REGNUM = 16, parameter ADDRESSWIDTH = 4)
	(input logic clk,
	input logic we3,
	input logic [ADDRESSWIDTH-1:0] ra1, ra2, wa3,
	input logic [DATA_WIDTH-1:0] wd3,
	output logic [DATA_WIDTH-1:0] rd1, rd2);
	
	logic [DATA_WIDTH-1:0] registers[REGNUM-1:0];
		
	always_ff @(posedge clk)
		if (we3) registers[wa3] <= wd3;
	
	always_comb begin
		rd1 = registers[ra1];
		rd2 = registers[ra2];
	end
endmodule
