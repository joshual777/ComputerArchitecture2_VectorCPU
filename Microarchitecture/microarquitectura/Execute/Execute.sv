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

module Execute #(parameter DATA_WIDTH = 19, parameter WIDTH = 8,
					 parameter VECTOR_SIZE = 8)
	(input logic [DATA_WIDTH-1:0] scalarData1, scalarData2, scalarInmediate,
	 input logic [VECTOR_SIZE-1:0][WIDTH-1:0] vectorOperand1, vectorOperand2,
	 input [3:0] aluControl,
	 input useInmediate,
	 input useScalarAlu,
	 input isScalarReg2,
	 output logic [WIDTH*VECTOR_SIZE-1:0] out,
	 output logic [WIDTH*VECTOR_SIZE-1:0] dataToWrite,
	 output logic N, Z, V, C
	 );		
	
	logic [VECTOR_SIZE-1:0][WIDTH-1:0] vectorOut, vectorData2Final;
	logic [DATA_WIDTH-1:0] scalarOut,scalarData2Final;
	
	
	mux2  #(.WIDTH(DATA_WIDTH)) inmediateMux(scalarData2, 
				scalarInmediate, useInmediate, scalarData2Final);
	
	
	mux2 #(.WIDTH(WIDTH*VECTOR_SIZE)) vectorData2ScalarMux(.d0(vectorOperand2
), 
	.d1({scalarData2Final[7:0],scalarData2Final[7:0], scalarData2Final[7:0], scalarData2Final[7:0],
	scalarData2Final[7:0], scalarData2Final[7:0], scalarData2Final[7:0], scalarData2Final[7:0]}), 
	.s(isScalarReg2), 
	.y(vectorData2Final));		
	
	ALUV #(.DATA_WIDTH(WIDTH), 
			 .LANES(VECTOR_SIZE)) ALUV
			( 
				 .selector(aluControl),
				 .operand1(vectorOperand1),
				 .operand2(vectorData2Final),
				 .out(vectorOut));
			
	ALU #(.WIDTH(DATA_WIDTH)) ALU( 
		 .A(scalarData1),
		 .B(scalarData2Final),
		 .sel(aluControl),
		 .Out(scalarOut),
		 .N(N),
		 .Z(Z),
		 .V(V),
		 .C(C) );
		 
		
	mux2 #(WIDTH*VECTOR_SIZE) executeOutputMux(
	.d0(vectorOut), 
	.d1({{DATA_WIDTH*(VECTOR_SIZE-1){1'b0}}, scalarOut}),  
	.s(useScalarAlu), .y(out));		
	assign dataToWrite = {out[7],out[6],out[5], out[4], out[3], out[2],out[1], out[0]}; 
endmodule


