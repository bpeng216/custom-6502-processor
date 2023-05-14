`define ADD 4'b1111
`define ADDI 4'b0001
`define SUB 4'b0010
`define SUBI 4'b0011
`define AND 4'b0100
`define OR 4'b0101
`define XOR 4'b0110
`define NOT 4'b0111
`define SHIFTL 4'b1000
`define SHIFTR 4'b1001
`define LOAD 4'b1010
`define STORE 4'b1011
`define BEQ 4'b1100
`define BLE 4'b1101
`define BGE 4'b1110
`define NOOP 4'b0000


module decoder (inst_in, branch_out, arithImmediate_out, arithMemory_out,
                add_out, addi_out, sub_out, subi_out, and_out, or_out, xor_out, not_out, shiftl_out, shiftr_out,
                load_out, store_out, beq_out, ble_out, bge_out, noop_out, imme_addr_out, branch_imme_out);
//-----------Input Ports---------------
input [7:0] inst_in;

//-----------Output Ports---------------
output branch_out, arithImmediate_out, arithMemory_out,
       add_out, addi_out, sub_out, subi_out, and_out, or_out, xor_out, not_out, shiftl_out, shiftr_out,
       load_out, store_out, beq_out, ble_out, bge_out, noop_out;
       
output [3:0] imme_addr_out;
output [7:0] branch_imme_out;

//------------Internal Variables--------
wire [3:0] opcode;

//-------------Code Starts Here---------
// Qualify the control signal by clka and clkb for the d1 and d2 and d_out registers

assign opcode = inst_in[7:4];
assign imme_addr_out = inst_in[3:0];

assign branch_out = (opcode == `BEQ | opcode == `BLE | opcode == `BGE);
assign branch_imme_out = inst_in;
assign arithImmediate_out = (opcode == `ADDI | opcode == `SUBI | opcode == `NOT | opcode == `SHIFTL | opcode == `SHIFTR);
assign arithMemory_out = (opcode == `ADD | opcode == `SUB | opcode == `AND | opcode == `OR | opcode == `XOR);



assign add_out = (opcode == `ADD);
assign addi_out = (opcode == `ADDI);
assign sub_out = (opcode == `SUB);
assign subi_out = (opcode == `SUBI);
assign and_out = (opcode == `AND);
assign or_out = (opcode == `OR);
assign xor_out = (opcode == `XOR);
assign not_out = (opcode == `NOT);
assign shiftl_out = (opcode == `SHIFTL);
assign shiftr_out = (opcode == `SHIFTR);
assign load_out = (opcode == `LOAD);
assign store_out = (opcode == `STORE);
assign beq_out = (opcode == `BEQ);
assign ble_out = (opcode == `BLE);
assign bge_out = (opcode == `BGE);
assign noop_out = (opcode == `NOOP);




endmodule //End Of Module dp  datapath

