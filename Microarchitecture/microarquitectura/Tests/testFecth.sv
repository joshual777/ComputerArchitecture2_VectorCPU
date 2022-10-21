module testFetch();
	logic [PC_WIDTH-1:0] NewPC;
	logic PCSelector, clock, reset, enable;
	logic [INSTRUCTION_WIDTH-1:0] instruction;
	logic  [INSTRUCTION_WIDTH-1:0] OutExpected;
	
	Fetch fetch(NewPC,  PCSelector, clock, reset, enable,instruction);


	
	//Creacion de un reloj
	always begin
		 clock=~clock; #5;
	end	
	
	initial begin
	
		reset = 1; #1; reset = 0; #4; //Se resetea los registros
		clk = 0; #5;
	// Instrucción 1
		NewPC = 32'b0; 
		PCSelector = 1'b0;
		reset = 0;
		enable = 0;
		OutExpected = 32'b011000000000000000000000000000; #10;


		assert (instruction == OutExpected) 
			$display ($sformatf("============= TEST 1 SUCCESS"));
		else $error($sformatf("=!=!=!=!=!=!== TEST 1 FAIL Result ==!=!=!=!=!=!"));
		
		#50;

	end
	
						  
endmodule
