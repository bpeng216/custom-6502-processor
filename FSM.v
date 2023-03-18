//-----------------------------------------------
// File Name   : 2 Phase Clock fsm_using_function.v  0 - 3 - 1 - 2
// with count hold input and odd output
//-----------------------------------------------
module FSM (clka, clkb, restart, load, store, branch, arithImmediate, arithMemory, state, load_dp_out);
//-------------Input Ports-----------------------
input   clka, clkb, restart, load, store, branch, arithImmediate, arithMemory;
//-------------Output Ports----------------------
output state[3:0], load_dp_out;
//-------------Input ports Data Type-------------
wire    clka, clkb, restart, load, store, branch, arithImmediate, arithMemory, done;
//——————Internal Constants--------------------
parameter SIZE = 4;
parameter IDLE  = 4'b0000, Instruction_fetch = 4'b0001, Decode = 4'b0010,  Instruction_fetch_2 = 4'b0011,
            Decode_2 = 4'b0100, Branch = 4'b0101, Store = 4'b0110, Load = 4'b0111, Load_ALU = 4'b1000,
            Execute = 4'b1001;
//-------------Internal Variables---------------------
reg   [SIZE-1:0]          state        ;// Seq part of the FSM
wire   [SIZE-1:0]          temp_state   ;// Internal state reg
reg   [SIZE-1:0]          next_state   ;// combo part of FSM
reg load_dp_out;
//----------Code startes Here------------------
assign temp_state = fsm_function(state);
//----------Function for Combo Logic-----------
function [SIZE-1:0] fsm_function;
  input  [SIZE-1:0] state;
case(state)
   IDLE: begin
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
            fsm_function = Instruction_fetch_2;
          end
          else if(arithMemory) begin
            fsm_function = Load_ALU;
          end
          else if (arithImmediate) begin
            fsm_function = Execute;
          end
   end
   Instruction_fetch_2: begin
            fsm_function = Decode_2;
            end
   Decode_2: 
            fsm_function = Branch;
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
    next_state <= IDLE;
  end else begin
    next_state <= temp_state;
  end
end
//----------Output Logic————————
always @ (negedge clkb)
begin : OUTPUT_LOGIC
  state <= next_state;
  if (state != IDLE) begin
    load_dp_out <= 1;
  end
end // End Of Block OUTPUT_LOGIC
endmodule // End of Module twoP_FSM
