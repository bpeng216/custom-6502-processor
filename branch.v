module branch (
input        beq_in,
input        bge_in,
input        ble_in,
input [7:0] data1_in,
input [7:0] data2_in,

output  branch_taken_out)
;

wire int1, int2, int3;

assign int1 = beq_in && (data1_in == data2_in);
assign int2 = ble_in && (data1_in <= data2_in);
assign int3 = bge_in && (data1_in >= data2_in);
assign branch_taken_out = (int1 | int2 | int3);

endmodule // branch_comparator


