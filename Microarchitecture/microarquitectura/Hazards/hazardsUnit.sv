/*
	hazardsUnit
	Inputs:
	-
	Outputs:
	-
*/

		
module hazardsUnit #(parameter ADDRESSWIDTH = 4)
	(input logic writeEnableScalarWBWB, writeEnableScalarWBM, writeEnableVectorWBWB, writeEnableVectorWBM, resultSelectorWBE, takeBranchE,
	input logic isScalarOutputED, isScalarReg1ED, isScalarReg2ED,
	isScalarOutputEM, isScalarReg1EM, isScalarReg2EM,
	isScalarOutputEE, isScalarReg1EE, isScalarReg2EE,
	isScalarOutputEWB, isScalarReg1EWB, isScalarReg2EWB,
	input logic [ADDRESSWIDTH-1:0] writeAddressM, writeAddressWB, writeAddressE,
	reg1ReadAddressE, reg2ReadAddressE, reg1ReadAddressD, reg2ReadAddressD,
	output logic [1:0] data1ScalarForwardSelectorE, data2ScalarForwardSelectorE,
	output logic [1:0] data1VectorForwardSelectorE, data2VectorForwardSelectorE,
	output logic stallF, stallD, flushE, flushD);
	
	logic LDRstall;
	logic Match_12D_E_Scalar;
	logic Match_12D_E_Vector;
	
	always_comb begin
		// Forwarding
		
		// Scalar forwarding
		data1ScalarForwardSelectorE = 2'b00;
		data2ScalarForwardSelectorE = 2'b00;
		if(writeEnableScalarWBWB) begin 
			if (reg1ReadAddressE == writeAddressWB && isScalarReg1EE && isScalarOutputEWB) begin
				data1ScalarForwardSelectorE = 2'b01;
			end
			if (reg2ReadAddressE == writeAddressWB && isScalarReg2EE && isScalarOutputEWB) begin
				data2ScalarForwardSelectorE = 2'b01;
			end
		end 
		
		if(writeEnableScalarWBM) begin 
			if(reg1ReadAddressE == writeAddressM && isScalarReg1EE && isScalarOutputEM) begin
			data1ScalarForwardSelectorE = 2'b10;
			end 
			if (reg2ReadAddressE == writeAddressM && isScalarReg2EE && isScalarOutputEM) begin
			data2ScalarForwardSelectorE = 2'b10;
			end
		end 
		
		// Vector forwarding
		data1VectorForwardSelectorE = 2'b00;
		data2VectorForwardSelectorE = 2'b00;
		if(writeEnableVectorWBWB) begin 
			if (reg1ReadAddressE == writeAddressWB && !isScalarReg1EE && !isScalarOutputEWB) begin
				data1VectorForwardSelectorE = 2'b01;
			end
			if (reg2ReadAddressE == writeAddressWB && !isScalarReg2EE && !isScalarOutputEWB) begin
				data2VectorForwardSelectorE = 2'b01;
			end
		end 
		
		if(writeEnableVectorWBM) begin 
			if(reg1ReadAddressE == writeAddressM && !isScalarReg1EE && !isScalarOutputEM) begin
			data1VectorForwardSelectorE = 2'b10;
			end 
			if (reg2ReadAddressE == writeAddressM && !isScalarReg2EE && !isScalarOutputEM) begin
			data2VectorForwardSelectorE = 2'b10;
			end
		end 
		
		
		// Stalls on Load and Branching
		
		Match_12D_E_Scalar = (reg1ReadAddressD == writeAddressE && isScalarReg1ED && isScalarOutputEE) 
									|| (reg2ReadAddressD == writeAddressE && isScalarReg2ED && isScalarOutputEE);
		
		Match_12D_E_Vector = (reg1ReadAddressD == writeAddressE && !isScalarReg1ED && !isScalarOutputEE) 
								    || (reg2ReadAddressD == writeAddressE && !isScalarReg2ED && !isScalarOutputEE);

		LDRstall = (Match_12D_E_Scalar || Match_12D_E_Vector) && resultSelectorWBE;
		
		stallD = LDRstall;
		stallF = LDRstall;
		flushE = LDRstall || takeBranchE;
		flushD = takeBranchE;
	end
	
endmodule