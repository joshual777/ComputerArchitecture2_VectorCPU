/**
	Instruction Memory Module 
	Parameters:
	- PC_WIDTH: size of PC
	- INSTRUCTION_WIDTH: size of instructions
	- MEMORY_SIZE: memory size
	Inputs:
	- PC: current pc
	Outputs:
 	- instruction: fetched instruction
**/
module instructionMemory #(parameter PC_WIDTH = 19, parameter MEMORY_SIZE = 1024, parameter INSTRUCTION_WIDTH = 32)
								 (input logic [PC_WIDTH-1:0] PC,
								  output logic [INSTRUCTION_WIDTH-1:0] instruction
								  );

	
	logic [INSTRUCTION_WIDTH-1:0] memory[MEMORY_SIZE-1:0];
	
	
	initial begin
		$readmemb("C://Users//abiga//Desktop//ArquiII//ComputerArchitecture2_VectorCPU//Microarchitecture//microarquitectura//Fetch//compiledInstructions.txt",memory);
	end
	
	
	assign instruction = memory[PC];
	
	

endmodule 
