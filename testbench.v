`timescale 1ns/10ps
module testbench();

// Inputs to top_module
//in_clka, in_clkb, in_restart, in_instruction, out_state_main, out_reg
reg  in_clka, in_clkb, in_restart, inst_available, start;
reg [7:0] instruction;
// Outputs from top_module
wire [3:0] out_state_main;
// wire [7:0] out_reg;
wire [7:0] acc;
// wire [7:0] instruction_out;
// wire [7:0] instruction_addr;

//module top_module (clka_in, clkb_in, restart_in, instruction_in, inst_available, start,
// state_main_out, reg_out, acc);
top_module top (.clka_in(in_clka), 
        .clkb_in(in_clkb), 
        .restart_in(in_restart), 
        .instruction_in(instruction),
        .inst_available(inst_available),
        .start(start),
        .state_main_out(out_state_main), 
        // .reg_out(out_reg), 
        // .instruction (instruction_out),
        // .instruction_addr (instruction_addr),
        .acc(acc)
);

initial
begin

// RESTART(1)
in_restart = 1;
start = 0;
instruction = 8'b00000000;
inst_available = 0;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_restart = 0;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

// Write fibonacci program to instruction memory
inst_available = 1;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

//STORE 143 in memory
instruction = 8'b00011000;             //ADDI 1110
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
instruction = 8'b10000100;             //SHIFTL 4
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
instruction = 8'b00011111;             //ADDI 11
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
instruction = 8'b10110010;             //STORE #2
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
//CLEAR ACCUMULATOR
instruction = 8'b10011000;             //SHIFTR 8
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
//FIBONACCI
instruction = 8'b00010001;             //ADDI 1
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
instruction = 8'b10110000;             //STORE #0
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
instruction = 8'b10110001;             //STORE #1
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
instruction = 8'b11110000;             // ADD #0
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
instruction = 8'b10110000;             // STORE to #0
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
instruction = 8'b11110001;            // ADD #1
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
instruction = 8'b10110001;            // STORE to #1
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;


//BRANCH
inst_available = 0;
instruction = 8'b11010010;            //BLE #2
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
instruction = 8'b00001000;            //ADDR 8
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

//END FIBONACCI PROGRAM



// Start program
start = 1;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
start = 0;


in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;


// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;



// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;

// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
// 8 cycles
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;
in_clka = 0; in_clkb = 0; #10;in_clka = 1; in_clkb = 0; #10;in_clka = 0; in_clkb = 0; #10;in_clka = 0; in_clkb = 1;  #10;



$dumpfile ("FSM.vcd");
$dumpvars;


$stop;
end

endmodule
