module testALU();
	parameter WIDTH = 48;
	logic [WIDTH-1:0] A;
	logic [WIDTH-1:0] B;
	logic [2:0] sel;
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
		$display ("=============ALU SUM=============");
		
		sel = 3'b100;
		
		
		A = 18'b1;
		B = 18'b1;
		OutExpected=18'b10;
		ZExpected=0;
		VExpected=0;
		NExpected=0;
		CExpected=0;
		
		#10
		
		assert (Out == OutExpected && CExpected == C && ZExpected == Z && VExpected == V && NExpected == N) 
			$display ($sformatf("============= TEST 1 SUCCESS A = %b, B = %b =============", A, B));
		else $error($sformatf("=!=!=!=!=!=!== TEST 1 FAIL A = %b, B = %b. Result = %b =!=!=!=!=!=!", A, B, Out));
		
		sel = 3'b101;
		A = 18'b111;
		B = 18'b110;
		OutExpected = 18'b1;
		ZExpected=0;
		VExpected=0;
		NExpected=0;
		CExpected=1;
		
		#10
		
		assert (Out == OutExpected && CExpected == C && ZExpected == Z && VExpected == V && NExpected == N) 
			$display ($sformatf("============= TEST 2 SUCCESS A = %b, B = %b =============", A, B));
		else $error($sformatf("=!=!=!=!=!=!== TEST 2 FAIL A = %b, B = %b. Result = %b =!=!=!=!=!=!", A, B, Out));
		
		sel = 3'b111;
		A = 18'b0011;
		B = 18'b10;
		OutExpected = 18'b110;
		ZExpected=0;
		VExpected=0;
		NExpected=0;
		CExpected=0;
		
		#10
		
		assert (Out == OutExpected && CExpected == C && ZExpected == Z && VExpected == V && NExpected == N) 
			$display ($sformatf("============= TEST 3 SUCCESS A = %b, B = %b =============", A, B));
		else $error($sformatf("=!=!=!=!=!=!== TEST 3 FAIL A = %b, B = %b. Result = %b =!=!=!=!=!=!", A, B, Out));
		
		sel = 3'b110;
		A = 18'b100;
		B = 18'b10;
		OutExpected = 18'b10;
		ZExpected=0;
		VExpected=0;
		NExpected=0;
		CExpected=0;
		
		#10
		
		assert (Out == OutExpected && CExpected == C && ZExpected == Z && VExpected == V && NExpected == N) 
			$display ($sformatf("============= TEST 4 SUCCESS A = %b, B = %b =============", A, B));
		else $error($sformatf("=!=!=!=!=!=!== TEST 4 FAIL A = %b, B = %b. Result = %b =!=!=!=!=!=!", A, B, Out));
		
	end

endmodule