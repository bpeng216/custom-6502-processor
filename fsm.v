//-----------------------------------------------
// File Name   : 2 Phase Clock fsm_using_function.v  0 - 3 - 1 - 2
// with count hold input and odd output
//-----------------------------------------------
module fsm (clka, clkb, restart, inst_available, start,
  load, store, branch, arithImmediate, arithMemory, noop,
  read_en, write_en, pc_en, state, load_dp_out, execute_en, inst_mem_en);
//-------------Input Ports-----------------------
input wire  clka, clkb, restart, load, store, branch, arithImmediate, arithMemory, noop, inst_available, start;
//-------------Output Ports----------------------
output reg read_en, write_en, pc_en, execute_en, inst_mem_en;
output state[3:0], load_dp_out;
//——————Internal Constants--------------------
parameter SIZE = 4;
parameter IDLE  = 4'b0000, Instruction_fetch = 4'b0001, Decode = 4'b0010,  Instruction_fetch_2 = 4'b0011,
          Decode_2 = 4'b0100,  Branch = 4'b0101, Store = 4'b0110, Load = 4'b0111, Load_ALU = 4'b1000,
            Execute = 4'b1001, Program_count = 4'b1010, Program_count_2 = 4'b1011, 
            Instruction_wait = 4'b1100, Instruction_write = 4'b1101;
//-------------Internal Variables---------------------
reg   [SIZE-1:0]          state        ;// Seq part of the FSM
wire  [SIZE-1:0]          temp_state   ;// Internal state reg
reg   [SIZE-1:0]          next_state   ;// combo part of FSM
reg load_dp_out;
//----------Code startes Here------------------
assign temp_state = fsm_function(state, load, store, branch, arithImmediate, arithMemory, noop, inst_available, start);
//----------Function for Combo Logic-----------
function [SIZE-1:0] fsm_function;
  input  [SIZE-1:0] state;
  input load;
  input store;
  input branch;
  input arithImmediate, arithMemory, noop, inst_available, start;
case(state)
   Instruction_wait: begin
          if (inst_available) begin
            fsm_function = Instruction_write;
          end
          else if(start) begin
            fsm_function = IDLE;
          end
          else begin
            fsm_function = Instruction_wait;
          end
   end
   Instruction_write: begin
          if (inst_available) begin
            fsm_function = Instruction_write;
          end
          else begin
            fsm_function = Instruction_wait;
          end
   end
   IDLE: begin
            fsm_function = Program_count;
         end
   Program_count: begin
            fsm_function = Instruction_fetch;
         end
   Instruction_fetch: begin
            fsm_function = Decode;
         end
   Decode: begin
          if(store) begin
            fsm_function = Store;
          end
          else if(load) begin
            fsm_function = Load;
          end
          else if(branch) begin
            fsm_function = Program_count_2;
          end
          // LOAD_ALU: any operation involving one data from memory and one from accumulator (2 operators)
          else if(arithMemory) begin
            fsm_function = Load_ALU;
          end
          else if (arithImmediate) begin
            fsm_function = Execute;
          end
          else if (noop) begin
            fsm_function = Instruction_wait;
          end  
          else begin
            fsm_function = Decode;
          end
   end
   Program_count_2: begin
        fsm_function = Instruction_fetch_2;
   end
   Instruction_fetch_2: begin
            fsm_function = Branch;
            end
  //  Decode_2: 
  //           fsm_function = Branch;
   Branch:
            fsm_function = IDLE;
   Store:
            fsm_function = IDLE;
   Load:
            fsm_function = IDLE;
   Load_ALU:
            fsm_function = Execute;
   Execute:
            fsm_function = IDLE;
   default : fsm_function = IDLE;
  endcase
endfunction
//----------Seq Logic-----------------------------
always @ (negedge clka)
begin : FSM_SEQ
  if (restart == 1'b1) begin
    next_state <= Instruction_wait;
  end else begin
    next_state <= temp_state;
  end
end
//----------Output Logic————————
always @ (negedge clkb)
begin : OUTPUT_LOGIC
  state <= next_state;
  if (restart) begin
    load_dp_out <= 0;
    read_en <= 0;
    write_en <= 0;
    pc_en <= 0;
    execute_en <= 0;
    inst_mem_en <= 0;
  end
  else begin

  if (state == Instruction_write) begin
    inst_mem_en <= 1;
  end else begin
    inst_mem_en <= 0;
  end

  if (state == Load) begin
    load_dp_out <= 1;
  end 
  else begin
    load_dp_out <= 0;
  end

  if(state == Load | Load_ALU | Branch) begin //LOAD from memory,LOAD into ALU (for 2 operator operations), and branch all require data from memory
    read_en <= 1;
  end
  else begin
    read_en <= 0;
  end

  if(state == Store) begin 
    write_en <= 1;
  end
  else begin
    write_en <= 0;
  end

  if(state == Program_count || state == Program_count_2) begin
    pc_en <=1;
  end
  else begin
    pc_en <= 0;
  end
  
  if((state == Decode && arithImmediate) || (state == Load_ALU)) begin
    execute_en <= 1;
  end
  else begin
    execute_en <= 0;
  end

  end
end // End Of Block OUTPUT_LOGIC
endmodule // End of Module twoP_FSM
