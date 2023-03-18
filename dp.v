//-----------------------------------------------------
// Design Name : dp
// File Name   : dp.v
// Function    : Data path with 4-bit adder and done signal
//-----------------------------------------------------


module dp (clka, clkb, restart, in_load_accu, in_arithMemory, in_imm, reg_in, acc_in, reg_out, acc_out, 
            in_add, in_addi, in_sub, in_subi, in_and, in_or, in_xor, in_not, shiftl, shiftr);
//-----------Input Ports---------------
input clka, clkb, restart, in_load_accu, in_arithMemory, in_imm, 
            in_add, in_addi, in_sub, in_subi, in_and, in_or, in_xor, in_not, shiftl, shiftr;
input [7:0] reg_in;
input [7:0] acc_in; 

//-----------Output Ports---------------
output reg [7:0] reg_out;
output reg [7:0] acc_out;

//------------Internal Variables--------
reg  [7:0] reg_temp;
reg  [7:0] accu_temp;

//-------------Code Starts Here---------
// Qualify the control signal by clka and clkb for the d1 and d2 and d_out registers

always @ (negedge clka)
begin
    if (restart == 1'b1) begin
        reg_temp <= 8'b0;
        accu_temp <= 8'b0;
    end 
    else begin
        if (in_load_accu) begin
            accu_temp <= acc_in;
        end
        
        else if (in_arithMemory) begin
            reg_temp <= reg_in;
        end

        else if(in_add) begin
            accu_temp <= accu_temp + reg_temp;
        end

        else if(in_addi) begin
            accu_temp <= accu_temp + in_imm;
        end

        else if(in_sub) begin
            accu_temp <= accu_temp - reg_temp;
        end
        
        else if (in_subi) begin
            accu_temp <= accu_temp - in_imm;
        end

        else if (in_and) begin
            accu_temp <= accu_temp & reg_temp;
        end    
        
        else if (in_or) begin
            accu_temp <= accu_temp | reg_temp;
        end

        else if (in_xor) begin
            accu_temp <= accu_temp ^ reg_temp;
        end

        else if (in_not) begin
            accu_temp <= ~reg_temp;
        end

        else if (shiftl) begin
            accu_temp <= reg_temp << 1;
        end

        else if (shiftr) begin
            accu_temp <= reg_temp >> 1;
        end 
        else begin
            accu_temp <= accu_temp;
        end
    end


end

always @ (negedge clkb)
begin
    if (restart == 1'b1) begin
        reg_out <= 8'b0;
        acc_out  <= 8'b0;
    end else begin
        reg_out <= reg_temp;
        acc_out <= accu_temp;
    end
end

endmodule //End Of Module dp  datapath
