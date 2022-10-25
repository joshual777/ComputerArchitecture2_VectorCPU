module testAluV();

	parameter DATA_WIDTH = 8;
	parameter LANES = 8;
	parameter SELECTOR_SIZE = 4;
	
		
	logic [SELECTOR_SIZE-1:0] selector;
	logic [LANES-1:0][DATA_WIDTH-1:0] operand1;
	logic [LANES-1:0][DATA_WIDTH-1:0] operand2;
	logic [LANES-1:0][DATA_WIDTH-1:0] out;
	
	logic [LANES-1:0][DATA_WIDTH-1:0] expected_out;
	
	ALUV #(.DATA_WIDTH(DATA_WIDTH),
			 .LANES(LANES), 
			 .SELECTOR_SIZE(SELECTOR_SIZE)) ALUV
			 (	.selector(selector),
				.operand1(operand1),
				.operand2(operand2),
				.out(out)
		);
		
	initial begin
		$display ("=============ALU V SUM=============");
		
		selector = 4'b0100;
		
		operand1[0] = 8'b1;
		operand1[1] = 8'b100;
		operand1[2] = 8'b10;
		operand1[3] = 8'b101;
		operand1[4] = 8'b11111111;
		operand1[5] = 8'b101;
		operand1[6] = 8'b0;
		operand1[7] = 8'b101;
		
		operand2[0] = 8'b1;
		operand2[1] = 8'b101;
		operand2[2] = 8'b100;
		operand2[3] = 8'b110;
		operand2[4] = 8'b1111;
		operand2[5] = 8'b1000;
		operand2[6] = 8'b1000;
		operand2[7] = 8'b10;
				
		expected_out[0] = 8'b10;
		expected_out[1] = 8'b1001;
		expected_out[2] = 8'b110;
		expected_out[3] = 8'b1011;
		expected_out[4] = 8'b1110;
		expected_out[5] = 8'b1101;
		expected_out[6] = 8'b1000;
		expected_out[7] = 8'b111;
		
		#10;
		
		assert (out == expected_out) 
			$display ($sformatf("============= TEST SUM SUCCESS ============="));
		else $error($sformatf("=!=!=!=!=!=!== TEST SUM FAIL =!=!=!=!=!=!"));
		
		$display ("=============ALU V SUB=============");
		
		selector = 4'b1101;
		
		operand1[0] = 8'b1;
		operand1[1] = 8'b1110;
		operand1[2] = 8'b11111;
		operand1[3] = 8'b100;
		operand1[4] = 8'b11111111;
		operand1[5] = 8'b101;
		operand1[6] = 8'b101;
		operand1[7] = 8'b101;

		
		operand2[0] = 8'b1;
		operand2[1] = 8'b10;
		operand2[2] = 8'b1110;
		operand2[3] = 8'b110;
		operand2[4] = 8'b1111;
		operand2[5] = 8'b1000;
		operand2[6] = 8'b1000;
		operand2[7] = 8'b1000;
		
		
		expected_out[0] = 8'b0;
		expected_out[1] = 8'b1100;
		expected_out[2] = 8'b10001;
		expected_out[3] = 8'b11111110;
		expected_out[4] = 8'b11110000;
		expected_out[5] = 8'b11111101;
		expected_out[6] = 8'b11111101;
		expected_out[7] = 8'b11111101;
		
		#10;
		
		assert (out == expected_out) 
			$display ($sformatf("============= TEST SUB SUCCESS ============="));
		else $error($sformatf("=!=!=!=!=!=!== TEST SUB FAIL =!=!=!=!=!=!"));
		
		$display ("=============ALU V MUL=============");
		
		selector = 4'b0101;
		
		operand1[0] = 8'b1;
		operand1[1] = 8'b1110;
		operand1[2] = 8'b1;
		operand1[3] = 8'b100;
		operand1[4] = 8'b0;
		operand1[5] = 8'b10;
		operand1[6] = 8'b10;
		operand1[7] = 8'b101;
		
		operand2[0] = 8'b1;
		operand2[1] = 8'b10;
		operand2[2] = 8'b1110;
		operand2[3] = 8'b0;
		operand2[4] = 8'b1111;
		operand2[5] = 8'b10;
		operand2[6] = 8'b11;
		operand2[7] = 8'b1;
	
		
		expected_out[0] = 8'b1;
		expected_out[1] = 8'b11100;
		expected_out[2] = 8'b1110;
		expected_out[3] = 8'b0;
		expected_out[4] = 8'b0;
		expected_out[5] = 8'b100;
		expected_out[6] = 8'b110;
		expected_out[7] = 8'b101;
		
		#10;
		
		assert (out == expected_out) 
			$display ($sformatf("============= TEST MUL SUCCESS ============="));
		else $error($sformatf("=!=!=!=!=!=!== TEST MUL FAIL =!=!=!=!=!=!"));
		
	end

endmodule
