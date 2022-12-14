module condunit #(parameter OPCODEWIDTH = 5)
	(input logic [OPCODEWIDTH-1:0] opcodeE,
	input logic N, Z, V, C,
	output logic takeBranchE
	);
		
	always_comb
		case(opcodeE)
			5'b01011: takeBranchE = Z; // EQ
			5'b01110: takeBranchE = 1'b1; // JUMP
			default: takeBranchE = 1'b0; // 0
		endcase
	
endmodule 
					