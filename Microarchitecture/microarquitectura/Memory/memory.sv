
/*

	Modulo de memoria: Cada elemento de memoria es un vector.

	parameters
	- MEM_SIZE: Tamano de la memoria
	- DATA_INTEGER_WIDTH: Tamano de cada dato
	- ADDRESS_WIDTH: Tamano de las direcciones
	inputs:
	- 
	outputs:
	- 
*/
module memory #(parameter MEM_SIZE = 500, 
					 parameter DATA_INTEGER_WIDTH = 64,
					 parameter DATA_WIDTH = 64, 
					 parameter ADDRESS_WIDTH = 19 )(
			  input writeEnable, clk,
			  input logic [ADDRESS_WIDTH-1:0] readAddress, writeAddress,
			  input logic [DATA_WIDTH-1:0] inputData,
			  output logic [DATA_WIDTH-1:0] outputData
			);

	logic [DATA_INTEGER_WIDTH-1:0] RAM[MEM_SIZE-1:0];
	logic [DATA_WIDTH-1:0] tempOutputData;
	
	initial
		$readmemb("C://Users//abiga//Desktop//ArquiII//ComputerArchitecture2_VectorCPU//Microarchitecture//microarquitectura//Memory//data.txt", RAM);
	
	always_comb begin
		tempOutputData = RAM[readAddress];
		outputData = {tempOutputData[63:56],tempOutputData[55:48],tempOutputData[47:40], tempOutputData[39:32],tempOutputData[31:24],tempOutputData[23:16],tempOutputData[15:8],tempOutputData[7:0]};
	end
	
	always_ff @(posedge clk)
		if (writeEnable) RAM[writeAddress] <= {inputData[63:56],inputData[55:48],inputData[47:40], inputData[39:32], inputData[31:24], inputData[23:16], inputData[15:8], inputData[7:0]};
endmodule 


