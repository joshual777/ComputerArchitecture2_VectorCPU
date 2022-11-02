module testDecode();
	parameter DATA_WIDTH = 19;
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
	logic [DATA_WIDTH-1:0] ereg1ScalarContent, ereg2ScalarContent, einmediate;
	logic [VECTOR_SIZE-1:0][WIDTH-1:0] reg1VectorContent, reg2VectorContent;
	logic [VECTOR_SIZE-1:0][WIDTH-1:0] ereg1VectorContent, ereg2VectorContent;
	logic [ADDRESS_WIDTH-1:0] regDestinationAddress, reg1Address, reg2Address;
	logic [ADDRESS_WIDTH-1:0] eregDestinationAddress, ereg1Address, ereg2Address;
	logic [OPCODE_WIDTH-1:0] opcode;
	logic [OPCODE_WIDTH-1:0] eopcode;
	
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
	 eopcode = 5'b00010;
	 eregDestinationAddress = 0;
	 einmediate = 19'b11;
	 
	 instruction = 32'b00010000000000000000000000000011;
	 
	 assert (opcode == eopcode && regDestinationAddress == eregDestinationAddress && inmediate == einmediate) 
			$display ($sformatf("============= TEST 1 SUCCESS  ============="));
		else $error($sformatf("=!=!=!=!=!=!== TEST 1 FAIL=!=!=!=!=!=!"));
	 #10;
	 
	 
	  writeEnableScalar = 1;
	 writeEnableVector = 0;
	 writeAddress = 0;
	 writeScalarData = 2;
	 instruction = 32'b00101000100010101000000000000000;
	  eopcode = 00101;
	 eregDestinationAddress = 1;
	 ereg1Address=1;
	 ereg2Address=5;
	 assert (opcode == eopcode && regDestinationAddress== eregDestinationAddress && reg1Address == ereg1Address) 
			$display ($sformatf("============= TEST 1 SUCCESS  ============="));
		else $error($sformatf("=!=!=!=!=!=!== TEST 1 FAIL=!=!=!=!=!=!"));
	 
	  #10;
	 
	  writeEnableScalar = 0;
	 writeEnableVector = 1;
	 writeAddress = 0;
	 writeScalarData = 2;
	 instruction = 32'b0001000000000000000000000000010;
	 
	 writeVectorData[0] = 8'b1;
		writeVectorData[1] = 8'b1110;
		writeVectorData[2] = 8'b11111;
		writeVectorData[3] = 8'b100;
		writeVectorData[4] = 8'b11111111;
		writeVectorData[5] = 8'b101;
		writeVectorData[6] = 8'b101;
		writeVectorData[7] = 8'b101;

	
	
	end
	
endmodule
	