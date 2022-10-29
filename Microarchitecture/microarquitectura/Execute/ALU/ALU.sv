module ALU #(parameter WIDTH = 19)(  
    input [WIDTH-1:0] A,
	 input [WIDTH-1:0] B,
	 input [3:0] sel,
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

	Adder_Substractor #(.WIDTH( WIDTH )) Sumador(A,B,OutSumador,sel[0],CSumador,VSumador);
	multiplicador #(.n( WIDTH )) Multiplicador ( A, B,outMultiplicador,CMultiplicador,VMultiplicador);
	divisor #(.n( WIDTH )) Divisor(A, B, outDivider, CDivider,VDivider);
 													 

	always_comb begin  
	
      case (sel)
			4'b0010 : begin
				Out = B;
				C <= 0;
				V <= 0;

			end
			4'b0100 : begin
				Out = OutSumador;
				C <= CSumador;
				V <= VSumador;
				
			end
			4'b0101 : begin
				Out = OutSumador;
				C <= CSumador;
				V <= VSumador;

			end
			4'b0111 : begin
				Out = outMultiplicador;
				C <= CMultiplicador;
				V <= VMultiplicador;

			end
			4'b0110 : begin
				Out = outDivider;
				C <= CDivider;
				V <= VDivider;

			end
			4'b1111 : begin
				Out = A;
				C <= 0;
				V <= 0;

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