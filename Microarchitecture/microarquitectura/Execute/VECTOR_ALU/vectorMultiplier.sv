module vectorMultiplier #(parameter DATA_WIDTH = 8, parameter LANES = 8)( 
				 input [LANES-1:0][DATA_WIDTH-1:0] operand1,
				 input [LANES-1:0][DATA_WIDTH-1:0] operand2,
				 output logic [LANES-1:0][DATA_WIDTH-1:0] out
			);
			
			
	 multiplicador #(.n( WIDTH )) Multiplicador (operand1[0],operand2[0],out[0],
	 C[0],V[0]);
	 
	 multiplicador #(.n( WIDTH )) Multiplicador (operand1[1],operand2[1],out[1],
	 C[1],V[1]);
	 
	 multiplicador #(.n( WIDTH )) Multiplicador (operand1[2],operand2[2],out[2],
	 C[2],V[2]);
	 
	 multiplicador #(.n( WIDTH )) Multiplicador (operand1[3],operand2[3],out[3],
	 C[3],V[3]);
	 
	 multiplicador #(.n( WIDTH )) Multiplicador (operand1[4],operand2[4],out[4],
	 C[4],V[4]);
	 
	 multiplicador #(.n( WIDTH )) Multiplicador (operand1[5],operand2[5],out[5],
	 C[5],V[5]);
	 
	 multiplicador #(.n( WIDTH )) Multiplicador (operand1[6],operand2[6],out[6],
	 C[6],V[6]);
	 
	 multiplicador #(.n( WIDTH )) Multiplicador (operand1[7],operand2[7],out[7],
	 C[7],V[7]);


	
endmodule 