
module top_module (clka_in, clkb_in, restart_in, instruction_in, inst_available, start,
 state_main_out, acc);

//-------------Input Ports-----------------------------
input wire  clka_in, clkb_in, restart_in, inst_available, start;
input wire [7:0] instruction_in;
//-------------Output Ports----------------------------
output wire [3:0] state_main_out; 
output wire [7:0] acc;
// wire [7:0] reg_out;
wire [7:0] instruction;
wire [7:0] instruction_addr;

wire [3:0] imme_addr;

//ctrl signal output from decoder input to FSM
wire load, store, branch, arithImmediate, arithMemory;
//ctrl signal outputs from FSM to other modules
wire load_dp, read_en, pc_en, write_en, execute_en, inst_mem_en;

//ctrl signal output from decoder, input to ALU
wire add_dp, addi_dp, sub_dp, subi_dp, and_dp, or_dp, xor_dp, not_dp, shiftl_dp, shiftr_dp;

//ctrl signal output from decoder, input to branch module
wire bge, ble, beq;


//noop signal output from decoder, input to other modules
wire noop;

//data output from data memory, input to alu
wire [7:0] mem;

//ctrl signal output from branch module, input to program counter
wire branch_taken;

//address of instruction output from program counter, input to instruction memory

wire [7:0] branch_imme;


//----------Code startes Here------------------------

fsm f1 (.clka (clka_in),
        .clkb (clkb_in),
        .restart (restart_in),
        .inst_available (inst_available),
        .start (start),
        .load (load),
        .store (store),
        .branch (branch),
        .arithImmediate (arithImmediate),
        .arithMemory (arithMemory),
        .noop (noop),
        .state(state_main_out),
        .load_dp_out (load_dp),
        .read_en (read_en),
        .pc_en(pc_en),
        .write_en (write_en),
        .execute_en(execute_en),
        .inst_mem_en (inst_mem_en)
        );

decoder d1 (.inst_in(instruction), 
        .branch_out(branch), 
        .arithImmediate_out(arithImmediate), 
        .arithMemory_out(arithMemory),
        .add_out(add_dp), 
        .addi_out (addi_dp),
        .sub_out(sub_dp), 
        .subi_out(subi_dp),
        .and_out(and_dp), 
        .or_out(or_dp), 
        .xor_out(xor_dp), 
        .not_out(not_dp), 
        .shiftl_out(shiftl_dp), 
        .shiftr_out(shiftr_dp),
        .load_out(load),
        .store_out(store), 
        .beq_out(beq), 
        .ble_out(ble), 
        .bge_out(bge), 
        .noop_out(noop), 
        .imme_addr_out(imme_addr),
        .branch_imme_out(branch_imme)
        );

dp dp1 (.clka(clka_in), 
        .clkb(clkb_in), 
        .restart(restart_in), 
        .in_load_accu(load_dp), 
        .in_arithMemory(arithMemory), 
        .execute_en_in(execute_en),
        .in_imm(imme_addr), 
        .reg_in(mem), 
        .acc_in(mem), 
        // .reg_out(reg_out),
        .acc_out(acc), 
        .in_add(add_dp), 
        .in_addi(addi_dp), 
        .in_sub(sub_dp), 
        .in_subi(subi_dp), 
        .in_and(and_dp), 
        .in_or(or_dp), 
        .in_xor(xor_dp), 
        .in_not(not_dp), 
        .shiftl(shiftl_dp), 
        .shiftr(shiftr_dp)
        );


branch br1 (
        .beq_in(beq),
        .bge_in(bge),
        .ble_in(ble),
        .data1_in(acc),
        .data2_in(mem),

        .branch_taken_out(branch_taken)
);

program_counter pc1 (
	.clka(clka_in),
	.clkb(clkb_in),
	.restart(restart_in),
	.branch_taken_in(branch_taken),
	.branch_immediate_in(branch_imme), 
        .pc_en(pc_en),	

	.pc_out(instruction_addr)
	);

instruction_mem im1 (
	.clka(clka_in), 
	.clkb(clkb_in),
        .instruction_in(instruction_in),
        .inst_en (inst_mem_en),
        .restart(restart_in),
        .pc_in(instruction_addr),
        .instruction_out(instruction)
);

data_mem dm1 (
	.clka(clka_in), 
	.clkb(clkb_in),
	.restart(restart_in), // synchronous reset
	
	.read_enable_in(read_en), // read enable
	.write_enable_in(write_en), // write enable
	.wdata_in(acc), // write data
	.addr_in(imme_addr), // address
	
	.data_out(mem) // read data
);

endmodule // End of Module top_module
                                    
