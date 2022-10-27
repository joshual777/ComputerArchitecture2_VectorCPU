module testExecute();
	parameter DATA_WIDTH = 19;
	parameter WIDTH = 8;
	parameter VECTOR_SIZE = 8; 

	logic [DATA_WIDTH-1:0] scalarData1, scalarData2, scalarInmediate;
	logic [VECTOR_SIZE-1:0][WIDTH-1:0] vectorOperand1, vectorOperand2;
	logic [3:0] aluControl;
	logic useInmediate;
	logic useScalarAlu;
	logic isScalarReg2;
	
	logic [63:0] out;
	logic [63:0] outExpected;
	logic [63:0] dataToWrite;
	logic N, Z, V, C;
	
	Execute excExecute(scalarData1, scalarData2, scalarInmediate,
	 vectorOperand1, vectorOperand2,aluControl,useInmediate,
	 useScalarAlu,isScalarReg2,out,dataToWrite, N, Z, V, C);	
	 
	initial begin
	$display ("=============ADD TEST=============");

	scalarData1 = 19'b011;
	scalarData2 = 19'b01;
	scalarInmediate = 19'b10;
	vectorOperand1[0] = 8'b1;
	vectorOperand1[1] = 8'b100;
	vectorOperand1[2] = 8'b10;
	vectorOperand1[3] = 8'b101;
	vectorOperand1[4] = 8'b11;
	vectorOperand1[5] = 8'b101;
	vectorOperand1[6] = 8'b0;
	vectorOperand1[7] = 8'b101;
	aluControl = 4'b100;
	useInmediate = 0;
	useScalarAlu = 1;
	isScalarReg2 = 1;
	outExpected = 64'b100;
	
	#10

	assert (out == outExpected ) 
			$display ($sformatf("============= TEST ADD SUCCESS  ============="));
		else $error($sformatf("=!=!=!=!=!=!== TEST ADD FAIL=!=!=!=!=!=!"));
		
	$display ("=============SUB TEST=============");

	scalarData1 = 19'b011;
	scalarData2 = 19'b01;
	scalarInmediate = 19'b10;
	vectorOperand1[0] = 8'b1;
	vectorOperand1[1] = 8'b100;
	vectorOperand1[2] = 8'b10;
	vectorOperand1[3] = 8'b101;
	vectorOperand1[4] = 8'b11;
	vectorOperand1[5] = 8'b101;
	vectorOperand1[6] = 8'b0;
	vectorOperand1[7] = 8'b101;
	aluControl = 4'b101;
	useInmediate = 0;
	useScalarAlu = 1;
	isScalarReg2 = 1;
	outExpected = 64'b10;
	
	#10

	assert (out == outExpected ) 
			$display ($sformatf("============= TEST SUB SUCCESS  ============="));
		else $error($sformatf("=!=!=!=!=!=!== TEST SUB FAIL=!=!=!=!=!=!"));
		
	$display ("=============DIV TEST=============");

	scalarData1 = 19'b0110;
	scalarData2 = 19'b010;
	scalarInmediate = 19'b10;
	vectorOperand1[0] = 8'b1;
	vectorOperand1[1] = 8'b100;
	vectorOperand1[2] = 8'b10;
	vectorOperand1[3] = 8'b101;
	vectorOperand1[4] = 8'b11;
	vectorOperand1[5] = 8'b101;
	vectorOperand1[6] = 8'b0;
	vectorOperand1[7] = 8'b101;
	aluControl = 4'b110;
	useInmediate = 0;
	useScalarAlu = 1;
	isScalarReg2 = 1;
	outExpected = 64'b11;
	
	#10

	assert (out == outExpected ) 
			$display ($sformatf("============= TEST DIV SUCCESS  ============="));
		else $error($sformatf("=!=!=!=!=!=!== TEST DIV FAIL=!=!=!=!=!=!"));
		
	$display ("=============MULT TEST=============");

	scalarData1 = 19'b0110;
	scalarData2 = 19'b010;
	scalarInmediate = 19'b10;
	vectorOperand1[0] = 8'b1;
	vectorOperand1[1] = 8'b100;
	vectorOperand1[2] = 8'b10;
	vectorOperand1[3] = 8'b101;
	vectorOperand1[4] = 8'b11;
	vectorOperand1[5] = 8'b101;
	vectorOperand1[6] = 8'b0;
	vectorOperand1[7] = 8'b101;
	aluControl = 4'b111;
	useInmediate = 0;
	useScalarAlu = 1;
	isScalarReg2 = 1;
	outExpected = 64'b1100;
	
	#10

	assert (out == outExpected ) 
			$display ($sformatf("============= TEST MULT SUCCESS  ============="));
		else $error($sformatf("=!=!=!=!=!=!== TEST MULT FAIL=!=!=!=!=!=!"));
	
	$display ("=============VSADD TEST=============");

	scalarData1 = 19'b01;
	scalarData2 = 19'b01;
	scalarInmediate = 19'b10;
	vectorOperand1[0] = 8'b1;
	vectorOperand1[1] = 8'b100;
	vectorOperand1[2] = 8'b10;
	vectorOperand1[3] = 8'b101;
	vectorOperand1[4] = 8'b11;
	vectorOperand1[5] = 8'b101;
	vectorOperand1[6] = 8'b0;
	vectorOperand1[7] = 8'b101;
	aluControl = 4'b100;
	useInmediate = 0;
	useScalarAlu = 0;
	isScalarReg2 = 1;
	outExpected = 64'b000001100000000100000110000001000000011000000011000001010000001000000011;
	
	
	
	#10

	assert (out == outExpected ) 
			$display ($sformatf("============= TEST VSADD SUCCESS  ============="));
		else $error($sformatf("=!=!=!=!=!=!== TEST VSADD FAIL=!=!=!=!=!=!"));
		
		
	$display ("=============VADD TEST=============");

	scalarData1 = 19'b0100;
	scalarData2 = 19'b0100;
	scalarInmediate = 19'b100;
	vectorOperand1[0] = 8'b1;
	vectorOperand1[1] = 8'b100;
	vectorOperand1[2] = 8'b10;
	vectorOperand1[3] = 8'b101;
	vectorOperand1[4] = 8'b11;
	vectorOperand1[5] = 8'b101;
	vectorOperand1[6] = 8'b0;
	vectorOperand1[7] = 8'b101;

	vectorOperand2[0] = 8'b1;
	vectorOperand2[1] = 8'b1;
	vectorOperand2[2] = 8'b1;
	vectorOperand2[3] = 8'b1;
	vectorOperand2[4] = 8'b1;
	vectorOperand2[5] = 8'b1;
	vectorOperand2[6] = 8'b1;
	vectorOperand2[7] = 8'b1;
	aluControl = 4'b1100;
	useInmediate = 0;
	useScalarAlu = 0;
	isScalarReg2 = 0;
	outExpected = 64'b000001100000000100000110000001000000011000000011000001010000001000000011;
	
	
	
	#10

	assert (out == outExpected ) 
			$display ($sformatf("============= TEST VADD SUCCESS  ============="));
		else $error($sformatf("=!=!=!=!=!=!== TEST VADD FAIL=!=!=!=!=!=!"));
	
	
	
	$display ("=============VSSUB TEST=============");

	scalarData1 = 19'b0100;
	scalarData2 = 19'b0100;
	scalarInmediate = 19'b100;
	vectorOperand1[0] = 8'b1;
	vectorOperand1[1] = 8'b100;
	vectorOperand1[2] = 8'b10;
	vectorOperand1[3] = 8'b101;
	vectorOperand1[4] = 8'b11;
	vectorOperand1[5] = 8'b101;
	vectorOperand1[6] = 8'b10;
	vectorOperand1[7] = 8'b101;

	vectorOperand2[0] = 8'b1;
	vectorOperand2[1] = 8'b1;
	vectorOperand2[2] = 8'b1;
	vectorOperand2[3] = 8'b1;
	vectorOperand2[4] = 8'b1;
	vectorOperand2[5] = 8'b1;
	vectorOperand2[6] = 8'b1;
	vectorOperand2[7] = 8'b1;
	aluControl = 4'b1101;
	useInmediate = 0;
	useScalarAlu = 0;
	isScalarReg2 = 0;
	outExpected = 64'b0000010000000001000001000000001000000100000000010000001100000000;
	
	
	
	#10

	assert (out == outExpected ) 
			$display ($sformatf("============= TEST VSSUB SUCCESS  ============="));
		else $error($sformatf("=!=!=!=!=!=!== TEST VSSUB FAIL=!=!=!=!=!=!"));
	
	$display ("=============VSMUL TEST=============");

	scalarData1 = 19'b0100;
	scalarData2 = 19'b010;
	scalarInmediate = 19'b100;
	vectorOperand1[0] = 8'b1;
	vectorOperand1[1] = 8'b100;
	vectorOperand1[2] = 8'b10;
	vectorOperand1[3] = 8'b101;
	vectorOperand1[4] = 8'b11;
	vectorOperand1[5] = 8'b101;
	vectorOperand1[6] = 8'b10;
	vectorOperand1[7] = 8'b101;


	aluControl = 4'b0101;
	useInmediate = 0;
	useScalarAlu = 0;
	isScalarReg2 = 1;
	outExpected = 64'b0000101000000100000010100000011000001010000001000000100000000010;
	
	
	
	#10

	assert (out == outExpected ) 
			$display ($sformatf("============= TEST VSMUL SUCCESS  ============="));
		else $error($sformatf("=!=!=!=!=!=!== TEST VSMUL FAIL=!=!=!=!=!=!"));
	
	
	end
	
endmodule