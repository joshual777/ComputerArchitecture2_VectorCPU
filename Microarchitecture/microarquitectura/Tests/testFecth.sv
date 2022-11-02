module testFecth();
	parameter PC_WIDTH = 19;
	parameter INSTRUCTION_WIDTH = 32;
	//parameter MEMORY_SIZE = 1024;
	logic [PC_WIDTH-1:0] NewPC;
	logic [PC_WIDTH-1:0] PC;
	logic PCSelector, clock, reset, enable;
	logic [INSTRUCTION_WIDTH-1:0] instruction;
	logic  [INSTRUCTION_WIDTH-1:0] OutExpected;
	
	//instructionMemory inst(PC,instruction);

	
	Fetch fetch(NewPC,  PCSelector, clock, reset, enable,
													instruction);


	
	//Creacion de un reloj
	always begin
		 clock=~clock; #5;
	end	
	
	initial begin
	
		reset = 1; #10;
		clock = 0; 
		#5;
		clock = 1; 
		#5;
		reset = 0; #5; //Se resetea los registros
		clock = 0; #5;
		clock = 1; #5;
		clock = 0; 
		#5;
	// Instrucción 1
		NewPC = 18'b10; 
		PCSelector = 1'b1;
		reset = 0;
		enable = 1;
		OutExpected = 32'b00010001100000000000000000010100; #10;


		assert (instruction == OutExpected) 
			$display ($sformatf("============= TEST 1 SUCCESS"));
		else $error($sformatf("=!=!=!=!=!=!== TEST 1 FAIL Result ==!=!=!=!=!=!"));
		
		#10;
		PCSelector = 1'b0;

	end
	
						  
endmodule
