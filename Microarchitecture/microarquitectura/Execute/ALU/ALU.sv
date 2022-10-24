module ALU #(parameter WIDTH = 18)(  
    input [WIDTH-1:0] A,
	 input [WIDTH-1:0] B,
	 input [2:0] sel,
    output logic [WIDTH-1:0] Out,
	 output logic N,
	 output logic Z,
	 output logic V,
	 output logic C 
);



	logic [WIDTH-1:0] OutSumador;
	logic CSumador,VSumador;
	
	logic [WIDTH-1:0] OutResta;
	logic CResta,VResta;
	
	logic [WIDTH-1:0] outMultiplicador;
	logic CMultiplicador,VMultiplicador;
	
	logic [WIDTH-1:0] outDivider;
	logic CDivider,VDivider;

	Adder_Substractor #(.WIDTH( WIDTH )) Sumador(A,B,OutSumador,0,CSumador,VSumador);
	Adder_Substractor #(.WIDTH( WIDTH )) Restador(A,B,OutResta,1,CResta,VResta);
	multiplicador #(.n( WIDTH )) Multiplicador ( A, B,outMultiplicador,CMultiplicador,VMultiplicador);
	divisor #(.n( WIDTH )) Divisor(A, B, outDivider, CDivider,VDivider);
 													 

	always_comb begin  
	
      case (sel)  
			3'b100 : begin
				Out = OutSumador;
				C <= CSumador;
				V <= VSumador;
				
			end
			3'b101 : begin
				Out = OutResta;
				C <= CResta;
				V <= VResta;

			end
			3'b111 : begin
				Out = outMultiplicador;
				C <= CMultiplicador;
				V <= VMultiplicador;

			end
			3'b110 : begin
				Out = outDivider;
				C <= CDivider;
				V <= VDivider;

			end
			default : begin
				Out = A;
				C <= 0;
				V <= 0;
				
			end
      endcase 
	
		N <= Out[WIDTH-1];
		Z <= ~|Out;
		
   end
	
endmodule