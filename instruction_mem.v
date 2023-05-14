`timescale 1ns / 1ps

 /**
 * Module: instruction_mem
 * 
 * The instruction memory model for the processor.
 * 
 */

module instruction_mem(
   input clka,
   input clkb,
   input inst_en,
   input [7:0] instruction_in,
	input [7:0] pc_in,
   input restart,
	output reg [7:0]  instruction_out
   );

   reg [5:0] counter;

   reg [7:0] INST_MEM[32:0]; // 16 byte memory
   	
	
	integer i;
	always @(negedge clka) begin
      if (restart) begin
         counter <= 6'b000000;
         //Initialize all values to 0
		   for (i =0; i < 32; i = i+1) begin
		      INST_MEM[i] <= 8'b00000000;
		   end
      end
      
		
		else if (inst_en) begin
		   INST_MEM[counter] <= instruction_in;
         counter <= counter + 1;
		end
	end

   // assign instruction_out = INST_MEM[pc_in[5:0]];
	always @(pc_in) begin
		if (restart) begin
			instruction_out = 8'b00000000;
		end
		else begin
			instruction_out =  INST_MEM[pc_in[4:0]];
		end
	
	end	   
endmodule

