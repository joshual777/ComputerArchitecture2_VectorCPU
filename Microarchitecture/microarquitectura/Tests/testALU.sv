module testALU();
	parameter WIDTH = 19;
	logic [WIDTH-1:0] A;
	logic [WIDTH-1:0] B;
	logic [3:0] sel;
   logic [WIDTH-1:0] Out;
	
	logic [WIDTH-1:0] OutExpected;
	logic C, Z,V, N, CExpected,ZExpected,VExpected,NExpected;
	
	ALU #(.WIDTH(WIDTH)) ALU
	(	.A(A),
		.B(B),
		.sel(sel),
		.Out(Out),
		.N(N),
		.Z(Z),
		.V(V),
		.C(C)
		);
		
	initial begin
		
		sel = 4'b100;
		
		
		A = 19'b011;
		B = 19'b01;
		OutExpected=19'b100;
		ZExpected=0;
		VExpected=0;
		NExpected=0;
		CExpected=0;
		
		#10
		
		assert (Out == OutExpected && CExpected == C && ZExpected == Z && VExpected == V && NExpected == N) 
			$display ($sformatf("============= TEST SUM SUCCESS A = %b, B = %b =============", A, B));
		else $error($sformatf("=!=!=!=!=!=!== TEST SUM FAIL A = %b, B = %b. Result = %b =!=!=!=!=!=!", A, B, Out));
		
		sel = 4'b101;
		A = 18'b111;
		B = 18'b110;
		OutExpected = 18'b1;
		ZExpected=0;
		VExpected=0;
		NExpected=0;
		CExpected=1;
		
		#10
		
		assert (Out == OutExpected && CExpected == C && ZExpected == Z && VExpected == V && NExpected == N) 
			$display ($sformatf("============= TEST SUBS SUCCESS A = %b, B = %b =============", A, B));
		else $error($sformatf("=!=!=!=!=!=!== TEST SUBS FAIL A = %b, B = %b. Result = %b =!=!=!=!=!=!", A, B, Out));
		
		sel = 4'b111;
		A = 19'b0011;
		B = 19'b10;
		OutExpected = 18'b110;
		ZExpected=0;
		VExpected=0;
		NExpected=0;
		CExpected=0;
		
		#10
		
		assert (Out == OutExpected && CExpected == C && ZExpected == Z && VExpected == V && NExpected == N) 
			$display ($sformatf("============= TEST DIV SUCCESS A = %b, B = %b =============", A, B));
		else $error($sformatf("=!=!=!=!=!=!== TEST DIV FAIL A = %b, B = %b. Result = %b =!=!=!=!=!=!", A, B, Out));
		
		sel = 4'b110;
		A = 19'b100;
		B = 19'b10;
		OutExpected = 18'b10;
		ZExpected=0;
		VExpected=0;
		NExpected=0;
		CExpected=0;
		
		#10
		
		assert (Out == OutExpected && CExpected == C && ZExpected == Z && VExpected == V && NExpected == N) 
			$display ($sformatf("============= TEST MULT SUCCESS A = %b, B = %b =============", A, B));
		else $error($sformatf("=!=!=!=!=!=!== TEST MULT FAIL A = %b, B = %b. Result = %b =!=!=!=!=!=!", A, B, Out));
		
	end

endmodule