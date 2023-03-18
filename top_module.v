
module top_module (in_clka, in_clkb, in_restart, in_instruction, in_mem, out_state_main, out_reg);
//-------------Input Ports-----------------------------
input   in_clka, in_clkb, in_restart;
input [7:0] in_instruction, in_mem;
//-------------Output Ports----------------------------
output [3:0] out_state_main; 
output out_reg;
//-------------Input ports Data Type-------------------
wire   in_clka, in_clkb, in_restart, in_load;
//-------------Output Ports Data Type------------------
wire   [3:0] out_state_main;
wire [7:0] out_reg;

wire inst_in, branch_out, arithImmediate_out, arithMemory_out,
        add_out, addi_out, sub_out, subi_out, and_out, or_out, xor_out, not_out, shiftl_out, shiftr_out,
        load_out, store_out, beq_out, ble_out, bge_out, reset_out, imme_addr_out, in_imm, reg_out, accu_out;

//----------Code startes Here------------------------

//clka, clkb, restart, load, store, branch, 
// arithImmediate, arithMemory, state, load_dp_out
FSM f1 (.clka (in_clka),
           .clkb (in_clkb),
           .restart (in_restart),
           .load (in_load),
           .store (in_store),
           .branch (in_branch),
           .arithImmediate (in_arithImmediate),
           .arithMemory (in_arithMemory),
           .state(out_state_main),
           .load_dp_out (load_dp_out)
          );

Decoder d1 (.inst_in(in_instruction), 
            .branch_out(in_branch), 
            .arithImmediate_out(in_arithImmediate), 
            .arithMemory_out(in_arithMemory),
            .add_out(add_out), 
            .addi_out (addi_out),
            .sub_out(sub_out), 
            .subi_out(subi_out),
            .and_out(and_out), 
            .or_out(or_out), 
            .xor_out(xor_out), 
            .not_out(not_out), 
            .shiftl_out(shiftl_out), 
            .shiftr_out(shiftr_out),
            .load_out(in_load),
            .store_out(in_store), 
            .beq_out(beq_out), 
            .ble_out(ble_out), 
            .bge_out(bge_out), 
            .reset_out(reset_out), 
            .imme_addr_out(imme_addr_out)
            );



dp dp1 (.clka(in_clka), 
        .clkb(in_clkb), 
        .restart(in_restart), 
        .in_load_accu(load_dp_out), 
        .in_arithMemory(in_arithMemory), 
        .in_imm(imme_addr_out), 
        .reg_in(in_mem), 
        .acc_in(imme_addr_out), 
        .reg_out(reg_out),
        .acc_out(acc_out), 
        .in_add(add_out), 
        .in_addi(addi_out), 
        .in_sub(sub_out), 
        .in_subi(subi_out), 
        .in_and(and_out), 
        .in_or(or_out), 
        .in_xor(xor_out), 
        .in_not(not_out), 
        .shiftl(shiftl_out), 
        .shiftr(shiftr_out)
        );

endmodule // End of Module top_module
                                    
