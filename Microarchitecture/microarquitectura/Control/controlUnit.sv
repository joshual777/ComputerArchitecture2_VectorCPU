
module controlUnit #(parameter OPCODE_WIDTH = 5)
	(	input logic [OPCODE_WIDTH-1:0] opcodeD,
		output logic useScalarAluED, isScalarOutputED, isScalarReg1ED, isScalarReg2ED,
	   output logic resultSelectorWBD,
	   output logic writeEnableScalarWBD,
	   output logic writeEnableVectorWBD, 
	   output logic writeToMemoryEnableMD,
	   output logic useInmediateED,
	   output logic [3:0] aluControlED,
	   output logic outFlagMD
		);
					
	always@(opcodeD) begin 
		
		case(opcodeD) //MOV
		5'b10:begin
         useScalarAluED = 1'b1;
         isScalarOutputED = 1'b1;
         isScalarReg1ED = 1'b0;
         isScalarReg2ED = 1'b0;
         resultSelectorWBD = 1'b0;
         writeEnableScalarWBD = 1'b1;
         writeEnableVectorWBD = 1'b0;
         writeToMemoryEnableMD = 1'b0;
         useInmediateED = 1'b1;
         aluControlED = 4'b10;
         outFlagMD = 1'b0;

     end
	  5'b100:begin //ADD
			useScalarAluED = 1'b1;
         isScalarOutputED = 1'b1;
         isScalarReg1ED = 1'b1;
         isScalarReg2ED = 1'b1;
         resultSelectorWBD = 1'b0;
         writeEnableScalarWBD = 1'b1;
         writeEnableVectorWBD = 1'b0;
         writeToMemoryEnableMD = 1'b0;
         useInmediateED = 1'b0;
         aluControlED = 4'b100;
         outFlagMD = 1'b0;

			
	  end
	   5'b101:begin //SUB
			useScalarAluED = 1'b1;
         isScalarOutputED = 1'b1;
         isScalarReg1ED = 1'b1;
         isScalarReg2ED = 1'b1;
         resultSelectorWBD = 1'b0;
         writeEnableScalarWBD = 1'b1;
         writeEnableVectorWBD = 1'b0;
         writeToMemoryEnableMD = 1'b0;
         useInmediateED = 1'b0;
         aluControlED = 4'b101;
         outFlagMD = 1'b0;

			
	  end
		5'b110:begin //DIV
			useScalarAluED = 1'b1;
         isScalarOutputED = 1'b1;
         isScalarReg1ED = 1'b1;
         isScalarReg2ED = 1'b0;
         resultSelectorWBD = 1'b0;
         writeEnableScalarWBD = 1'b1;
         writeEnableVectorWBD = 1'b0;
         writeToMemoryEnableMD = 1'b0;
         useInmediateED = 1'b1;
         aluControlED = 4'b110;
         outFlagMD = 1'b0;
			
	  end
	  5'b111:begin //MUL
			useScalarAluED = 1'b1;
         isScalarOutputED = 1'b1;
         isScalarReg1ED = 1'b1;
         isScalarReg2ED = 1'b0;
         resultSelectorWBD = 1'b0;
         writeEnableScalarWBD = 1'b1;
         writeEnableVectorWBD = 1'b0;
         writeToMemoryEnableMD = 1'b0;
         useInmediateED = 1'b1;
         aluControlED = 4'b111;
         outFlagMD = 1'b0;
			
	  end
	  5'b01110:begin //JUMP
			useScalarAluED = 1'b1;
         isScalarOutputED = 1'b0;
         isScalarReg1ED = 1'b0;
         isScalarReg2ED = 1'b0;
         resultSelectorWBD = 1'b0;
         writeEnableScalarWBD = 1'b0;
         writeEnableVectorWBD = 1'b0;
         writeToMemoryEnableMD = 1'b0;
         useInmediateED = 1'b1;
         aluControlED = 4'b0010;
         outFlagMD = 1'b0;

	  end
	  5'b1011:begin //BE
		useScalarAluED = 1'b1;
         isScalarOutputED = 1'b0;
         isScalarReg1ED = 1'b0;
         isScalarReg2ED = 1'b0;
         resultSelectorWBD = 1'b0;
         writeEnableScalarWBD = 1'b0;
         writeEnableVectorWBD = 1'b0;
         writeToMemoryEnableMD = 1'b0;
         useInmediateED = 1'b1;
         aluControlED = 4'b0010;
         outFlagMD = 1'b0;
			
	  end
	  
	  5'b1010:begin //CMP
		   useScalarAluED = 1'b1;
         isScalarOutputED = 1'b1;
         isScalarReg1ED = 1'b1;
         isScalarReg2ED = 1'b0;
         resultSelectorWBD = 1'b0;
         writeEnableScalarWBD = 1'b0;
         writeEnableVectorWBD = 1'b0;
         writeToMemoryEnableMD = 1'b0;
         useInmediateED = 1'b1;
         aluControlED = 4'b0101;
         outFlagMD = 1'b0;

			
	  end
	  
	  5'b10100:begin //VSADD
			useScalarAluED = 1'b0;
         isScalarOutputED = 1'b0;
         isScalarReg1ED = 1'b0;
         isScalarReg2ED = 1'b1;
         resultSelectorWBD = 1'b0;
         writeEnableScalarWBD = 1'b0;
         writeEnableVectorWBD = 1'b1;
         writeToMemoryEnableMD = 1'b0;
         useInmediateED = 1'b0;
			aluControlED = 4'b0100;
         outFlagMD = 1'b0;

	  end
	  
	  5'b11100:begin //VADD
			useScalarAluED = 1'b0;
         isScalarOutputED = 1'b0;
         isScalarReg1ED = 1'b0;
         isScalarReg2ED = 1'b0;
         resultSelectorWBD = 1'b0;
         writeEnableScalarWBD = 1'b0;
         writeEnableVectorWBD = 1'b1;
         writeToMemoryEnableMD = 1'b0;
         useInmediateED = 1'b0;
			aluControlED = 4'b0100;
         outFlagMD = 1'b0;

			
	  end
	  
	  5'b11101:begin //VSSUB
		  useScalarAluED = 1'b0;
         isScalarOutputED = 1'b0;
         isScalarReg1ED = 1'b0;
         isScalarReg2ED = 1'b1;
         resultSelectorWBD = 1'b0;
         writeEnableScalarWBD = 1'b0;
         writeEnableVectorWBD = 1'b1;
         writeToMemoryEnableMD = 1'b0;
         useInmediateED = 1'b0;
			aluControlED = 4'b1101;
         outFlagMD = 1'b0;
			
	  end
	  
	  5'b1011:begin //VSMUL
	  
			useScalarAluED = 1'b0;
         isScalarOutputED = 1'b0;
         isScalarReg1ED = 1'b0;
         isScalarReg2ED = 1'b1;
         resultSelectorWBD = 1'b0;
         writeEnableScalarWBD = 1'b0;
         writeEnableVectorWBD = 1'b1;
         writeToMemoryEnableMD = 1'b0;
         useInmediateED = 1'b0;
         aluControlED = 4'b010;
         outFlagMD = 1'b0;

			
	  end
	  5'b10001:begin //VSTR
		useScalarAluED = 1'b1;
         isScalarOutputED = 1'b0;
         isScalarReg1ED = 1'b1;
         isScalarReg2ED = 1'b0;
         resultSelectorWBD = 1'b0;
         writeEnableScalarWBD = 1'b0;
         writeEnableVectorWBD = 1'b0;
         writeToMemoryEnableMD = 1'b1;
         useInmediateED = 1'b0;
         aluControlED = 4'b1111;
         outFlagMD = 1'b1;

			
	  end
	  5'b10000:begin //VLDR
			 useScalarAluED = 1'b1;
         isScalarOutputED = 1'b0;
         isScalarReg1ED = 1'b1;
         isScalarReg2ED = 1'b0;
         resultSelectorWBD = 1'b1;
         writeEnableScalarWBD = 1'b0;
         writeEnableVectorWBD = 1'b1;
         writeToMemoryEnableMD = 1'b0;
         useInmediateED = 1'b0;
         aluControlED = 4'b1111;
         outFlagMD = 1'b0;

			
	  end
  
			default: begin 
				useScalarAluED = 1'b0; 
				isScalarOutputED = 1'b0;  
				isScalarReg1ED = 1'b0;  
				isScalarReg2ED = 1'b0; 
				resultSelectorWBD = 1'b0;
				writeEnableScalarWBD = 1'b0;
				writeEnableVectorWBD = 1'b0;
				writeToMemoryEnableMD = 1'b0;
				useInmediateED = 1'b0;
				aluControlED = 4'b0;
				outFlagMD = 1'b0;
			end
		endcase
	
	end
	
endmodule 