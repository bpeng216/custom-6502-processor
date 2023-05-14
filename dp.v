//-----------------------------------------------------
// Design Name : dp
// File Name   : dp.v
// Function    : Data path with 4-bit adder and done signal
//-----------------------------------------------------


module dp (clka, clkb, restart, in_load_accu, in_arithMemory, execute_en_in, in_imm, reg_in, acc_in, acc_out, 
            in_add, in_addi, in_sub, in_subi, in_and, in_or, in_xor, in_not, shiftl, shiftr);
//-----------Input Ports---------------
input clka, clkb, restart, in_load_accu, in_arithMemory, execute_en_in, 
            in_add, in_addi, in_sub, in_subi, in_and, in_or, in_xor, in_not, shiftl, shiftr;
input [3:0] in_imm;
input [7:0] reg_in;
input [7:0] acc_in; 

//-----------Output Ports---------------
// output reg [7:0] reg_out;
output reg [7:0] acc_out;

//------------Internal Variables--------
reg  [7:0] reg_temp;
reg  [7:0] accu_temp;

//-------------Code Starts Here---------
// Qualify the control signal by clka and clkb for the d1 and d2 and d_out registers
// reg_temp is the data from immediate or from data memory
// accu_temp is the register for accumulator

always @ (negedge clka)
begin
    if (restart == 1'b1) begin
        reg_temp <= 8'b0;
        accu_temp <= 8'b0;
    end 
    else begin
        // when not idle, always load the content of accumulator to the register
        if (in_load_accu) begin
            accu_temp <= acc_in;
        end
        else begin
            accu_temp <= accu_temp;
        end
        
        if (in_arithMemory) begin
            reg_temp <= reg_in;
        end
        if(execute_en_in) begin
            if(in_add) begin
                accu_temp <= accu_temp + reg_temp;
            end

            if(in_addi) begin
                accu_temp <= accu_temp + in_imm;
            end

            if(in_sub) begin
                accu_temp <= accu_temp - reg_temp;
            end
            
            if (in_subi) begin
                accu_temp <= accu_temp - in_imm;
            end

            if (in_and) begin
                accu_temp <= accu_temp & reg_temp;
            end    
            
            if (in_or) begin
                accu_temp <= accu_temp | reg_temp;
            end

            if (in_xor) begin
                accu_temp <= accu_temp ^ reg_temp;
            end

            if (in_not) begin
                accu_temp <= ~reg_temp;
            end

            if (shiftl) begin
                accu_temp <= accu_temp << in_imm;
            end

            if (shiftr) begin
                accu_temp <= accu_temp >> in_imm;
            end 
        end
    end


end

always @ (negedge clkb)
begin
    if (restart == 1'b1) begin
        // reg_out <= 8'b0;
        acc_out  <= 8'b0;
    end else begin
        // reg_out <= reg_temp;
        acc_out <= accu_temp;
    end
end

endmodule //End Of Module dp  datapath
