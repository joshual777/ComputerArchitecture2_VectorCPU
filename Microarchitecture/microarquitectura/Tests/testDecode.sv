module testDecode();
	parameter DATA_WIDTH = 18;
	parameter VECTOR_SIZE = 8;
	parameter SCALAR_REGNUM = 16;
	parameter VECTOR_REGNUM = 16;
	parameter ADDRESS_WIDTH = 4;
	parameter OPCODE_WIDTH = 5;
	parameter INSTRUCTION_WIDTH = 32;
	parameter WIDTH = 8;
	
	logic clock, reset, writeEnableScalar, writeEnableVector;
	logic [ADDRESS_WIDTH-1:0] writeAddress;
	logic [DATA_WIDTH-1:0] writeScalarData;
	logic [VECTOR_SIZE-1:0][WIDTH-1:0] writeVectorData;
	logic [INSTRUCTION_WIDTH-1:0] instruction;
	logic [DATA_WIDTH-1:0] reg1ScalarContent, reg2ScalarContent, inmediate;
	logic [VECTOR_SIZE-1:0][WIDTH-1:0] reg1VectorContent, reg2VectorContent;
	logic [ADDRESS_WIDTH-1:0] regDestinationAddress, reg1Address, reg2Address;
	logic [OPCODE_WIDTH-1:0] opcode;
	
	Decode decode(clock, reset, writeEnableScalar, writeEnableVector,
	 writeAddress,writeScalarData, writeVectorData,instruction, reg1ScalarContent, reg2ScalarContent, inmediate,
	 reg1VectorContent, reg2VectorContent,regDestinationAddress, reg1Address, reg2Address, opcode
	 );
		//Creacion de un reloj
	always begin
		 clock=~clock; #5;
	end	
	
	initial begin
	 reset = 0;
	 clock = 0;
	 
	 writeEnableScalar = 1;
	 writeEnableVector = 0;
	 writeAddress = 0;
	 writeScalarData = 3;
	 writeVectorData = 0;
	 instruction = 32'b0001000000000000000000000000011;
	 #10;
	 
	  writeEnableScalar = 1;
	 writeEnableVector = 0;
	 writeAddress = 0;
	 writeScalarData = 2;
	 writeVectorData = 0;
	 instruction = 32'b0001000000000000000000000000010;
	
	
	end
	
endmodule
	