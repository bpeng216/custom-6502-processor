
module program_counter (
		input		clka,
		input		clkb,
		input 	    restart,
		input 		pc_en,
		
		input 	      branch_taken_in,
		input [7:0]   branch_immediate_in, 	

		output reg [7:0] pc_out
		);

   reg [7:0] PC;  // Program Counter
   reg branch_taken1;
   reg branch_taken2; 
   reg branch_taken3; 
   reg branch_taken4;  

	always @(negedge clka) begin
		if (restart) begin
			PC <= 8'hFF;
			branch_taken1 <= 0;
			branch_taken2 <= 0;
		end

		else begin
			branch_taken1 <= branch_taken_in;
			branch_taken2 <= branch_taken1;
			branch_taken3 <= branch_taken2;
			branch_taken4 <= branch_taken3;

			if (pc_en) begin

				if (branch_taken4) begin
					PC <= branch_immediate_in;
				end 
				else begin	
					PC <= PC + 1;
				end
			end

			else begin
				PC <= PC;
			end
		end 
	end

	always @(negedge clkb) begin
		pc_out <= PC;
	end

endmodule



