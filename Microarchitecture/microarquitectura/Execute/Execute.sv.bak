/*
	Execution Module
	Inputs:
	- scalarData1: dato escalar 1
	- scalarData2: dato escalar 2
	- scalarInmediate: dato escalar inmediato
	- vectorOperand1: dato vectorial 1
	- vectorOperand2: dato vectorial 2
	- aluControl: variable de control, indica la operacion de las alus (un mismo codigo pueden ser operaciones diferentes en cada alu)
	- useInmediate: variable de control, indica si usar inmediato en lugar de dato escalar 2
	- isScalarInstruction: variable de control, indica si tomar el resultado de la alu escalar (1) o la alu vectorial (0)
	
	Outputs:
	- out: salida del execute, es la salida de alguna de las dos alus
	- dataToWrite: dato a escribir en memoria (es el segundo operando )
	- N, Z, V, C: flags de alu escalar
	writeScalar
	Params: 
	- DATA_WIDTH: Ancho de los datos escalares y vectoriales
	- VECTOR_SIZE: Cantidad de datos en los vectores
*/

module Execute #(parameter DATA_WIDTH = 8,
					 parameter VECTOR_SIZE = 8)
	(input logic [DATA_WIDTH-1:0] scalarData1, scalarData2, scalarInmediate,
	 input logic [VECTOR_SIZE-1:0][DATA_WIDTH-1:0] vectorOperand1, vectorOperand2,
	 input [2:0] aluControl,
	 input useInmediate,
	 input useScalarAlu,
	 input isScalarReg2,
	 output logic [DATA_WIDTH*VECTOR_SIZE-1:0] out,
	 output logic [DATA_WIDTH*VECTOR_SIZE-1:0] dataToWrite,
	 output logic N, Z, V, C,
	 output logic [VECTOR_SIZE-1:0] outVectorComparison
	 );		
	
	logic [VECTOR_SIZE-1:0][DATA_WIDTH-1:0] vectorOut;
	logic [DATA_WIDTH-1:0] scalarOut;
	
	mux2  #(DATA_WIDTH) inmediateMux(scalarData2, 
				scalarInmediate, useInmediate, scalarData2Final);
	
	
	mux2 #(DATA_WIDTH*VECTOR_SIZE) vectorData2ScalarMux(.d0(vectorOperand2
), 
	.d1({scalarData2Final,scalarData2Final, scalarData2Final, scalarData2Final, scalarData2Final, scalarData2Final, scalarData2Final, scalarData2Final}), 
	.s(isScalarReg2), 
	.y(vectorData2Final));		
	
	ALUV #(.DATA_WIDTH(DATA_WIDTH), 
			 .LANES(VECTOR_SIZE)) ALUV
			( 
				 .selector(aluControl),
				 .operand1(vectorOperand1),
				 .operand2(vectorData2Final),
				 .out(vectorOut),
				 .outComparison(outVectorComparison));
			
	ALU #(DATA_WIDTH) ALU( 
		 .A(scalarData1),
		 .B(scalarData2Final),
		 .sel(aluControl),
		 .Out(scalarOut),
		 .N(N),
		 .Z(Z),
		 .V(V),
		 .C(C) );
	
	mux2 #(DATA_WIDTH*VECTOR_SIZE) executeOutputMux(
	.d0({vectorOut[7], vectorOut[6], vectorOut[5], vectorOut[4], vectorOut[3], vectorOut[2], vectorOut[1], vectorOut[0]}), 
	.d1({{DATA_WIDTH*(VECTOR_SIZE-1){1'b0}}, scalarOut}), 
	.s(useScalarAlu), .y(out));		
	assign dataToWrite = {vectorOperand2[7],vectorOperand2[6],vectorOperand2[5], vectorOperand2[4], vectorOperand2[3], vectorOperand2[2],vectorOperand2[1], vectorOperand2[0]}; 
endmodule


