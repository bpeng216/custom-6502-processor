`timescale 1ns/10ps
module FSM_tb();

// Inputs to top_module
//in_clka, in_clkb, in_restart, in_instruction, out_state_main, out_reg
reg  in_clka, in_clkb, in_restart;
reg [7:0] in_instruction, in_mem;
// Outputs from top_module
wire [3:0] out_state_main;
wire [7:0] out_reg;

//clka, clkb, restart, load, store, branch, arithImmediate, arithMemory, done
top_module top (.in_clka(in_clka), 
        .in_clkb(in_clkb), 
        .in_restart(in_restart), 
        .in_instruction (in_instruction),
        .in_mem (in_mem),
        .out_state_main(out_state_main),
        .out_reg(out_reg)
        );

initial
begin

// RESTART(1)
in_restart = 1;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #5;

// LOAD (4)
in_restart = 0;
in_instruction = 8'b10100000;
in_mem = 8'b0;
 #5;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #5;

// Store (4)
in_restart = 0;
in_instruction = 8'b10110000;
 #5;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #5;

// ADDI (4)
in_restart = 0;
in_instruction = 8'b00011111;
#5;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #5;

// ADD (5)
in_instruction = 8'b00001111;
in_mem = 8'b00000001;
 #5;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #5;


// BEQ (6)
in_instruction = 8'b11000000;
 #5;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1; #5;


$dumpfile ("FSM.vcd");
$dumpvars;


$stop;
end

endmodule
