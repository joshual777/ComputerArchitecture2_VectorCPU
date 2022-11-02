
module ALUV #(parameter DATA_WIDTH = 8, 
				parameter LANES = 8,
				parameter SELECTOR_SIZE = 4)
			( 
				 input [SELECTOR_SIZE-1:0] selector,
				 input [LANES-1:0][DATA_WIDTH-1:0] operand1,
				 input [LANES-1:0][DATA_WIDTH-1:0] operand2,
				 output logic [LANES-1:0][DATA_WIDTH-1:0] out);

	integer i;

	//=============SUMADOR - RESTADOR =============
	logic [LANES-1:0] C, V, N;
	logic [LANES-1:0][DATA_WIDTH-1:0] outSumadorRestador ;

	vectorAdderSubstractor #(.DATA_WIDTH(DATA_WIDTH), .LANES(LANES)) vectorAdderSubstractor(
				 .operand1(operand1),
				 .operand2(operand2),
				 .operationMode(selector[0]),
				 .out(outSumadorRestador),
				 .C(C), 
				 .V(V), 
				 .N(N)
			);

	//=============Multiplicador FP=============

	logic [LANES-1:0][DATA_WIDTH-1:0] outMultiplicadorFP ;
	logic [LANES-1:0] CM, VM, NM;

	vectorFPMultiplier #(.WIDTH(DATA_WIDTH), .LANES(LANES)) vectorFPMultiplier( 
				 .operand1(operand1),
				 .operand2(operand2),
				 .out(outMultiplicadorFP),
				 .C(CM), 
				 .V(VM), 
				 .N(NM)
			);	

			
	always_comb begin  
		// Arithmetic output
      case (selector)  
			4'b0100 : begin
				out = outSumadorRestador;
			end
			4'b1100 : begin
				out = outSumadorRestador;
			end
			4'b1101 : begin
				out = outSumadorRestador;
			end
			4'b0101 : begin
				out = outMultiplicadorFP;
			end
			
			default begin
				out = operand1;
			end
      endcase 
	
	
	

   end
	
endmodule
