`timescale 1ns / 1ps

/**
 * Module: data_mem
 * 
 * The simplified data memory model for the processor.
 */
module data_mem(
	input 		  clka, 
	input		  clkb,
	input 		  restart, // synchronous reset
	
	input		  read_enable_in, // read enable
	input 		  write_enable_in, // write enable
	input [7:0] 	  wdata_in, // write data
	input [3:0] 	  addr_in, // address
	
	output reg [7:0]  data_out // read data
);
	

 	reg [7: 0] DATA_MEM[15:0]; // 16 byte memory
   	
	
	integer i;
	always @(negedge clka) begin
		if (restart) begin
			//Initialize all values to 0
		   for (i=0; i < 16; i = i+1) begin
		      DATA_MEM[i] <= 8'b00000000;
		   end
		end 
		
		else if (write_enable_in) begin
		   DATA_MEM[addr_in[3:0]] <= wdata_in;
		end
	end


	always @(negedge clkb) begin
		if (restart) begin
			data_out = 8'b00000000;
		end
		else if (read_enable_in) begin
	    	data_out =  DATA_MEM[addr_in[3:0]];
		end
		else begin
			data_out = 8'b0;
		end
	
	end	   
endmodule
