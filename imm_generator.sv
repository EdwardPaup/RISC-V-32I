import risc_v_32i::*;

module imm_gen(
    input [REG_SIZE-1 : 0] instruction,
    input [IMM_SEL_LENGTH-1:0] selector,
    output [REG_SIZE-1 : 0] imm_val
);

always_comb begin
    case(selector) 
        IMM_B_TYPE: imm_val = $signed({instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0});
        IMM_S_TYPE: imm_val = $signed({instruction[31:25], instruction[11:7]});
        IMM_U_TYPE: imm_val = {instruction[31:12], 12'b0};
        IMM_I_TYPE: imm_val = $signed({instruction[31:20]});
        IMM_J_TYPE: imm_val = $signed({instruction[31], instruction[19:12], instruction[20], instruction[30:21], 1'b0});
        IMM_UNKNOWN_TYPE: imm_val = 32'b0;
    endcase
end
endmodule
