module testMemory();
	parameter MEM_SIZE = 1000;
	parameter DATA_INTEGER_WIDTH = 64;
	parameter DATA_WIDTH = 64;
	parameter ADDRESS_WIDTH = 19;
	logic writeEnable, clk;
	logic [ADDRESS_WIDTH-1:0] readAddress, writeAddress;
	logic [DATA_WIDTH-1:0] inputData;
	
	logic [DATA_WIDTH-1:0] outputData;
	
	 memory Memory(writeEnable, clk,readAddress, writeAddress,
			  inputData,outputData);
			  
	always begin
		 clk=~clk; #5;
	end
	
	initial begin
	 clk = 0;
	 
	 readAddress = 2;
	 writeEnable = 0;
	 
	 #10;
	 readAddress = 0;
	 writeEnable = 1;
	 writeAddress = 2;
	 inputData = 64'b0;
	 
	  #10;
	  readAddress = 2;
	 writeEnable = 0;
	 
	 
	 
	 
	end
	
endmodule