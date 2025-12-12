import risc_v_32i::*;
module Comparator(
    input [REG_SIZE-1 : 0] A, B,
    input [BRANCH_SEL_LENGTH-1 : 0] sel,
    output reg [REG_SIZE-1 : 0] result
);

always_comb begin
    case(sel)
    OP_BEQ: result = A == B ? 1 : 0;
    OP_BGE: result = $signed(A) >= $signed(B) ? 1 : 0;
    OP_BGEU: result = A >= B ? 1 : 0;
    OP_BLT: result = $signed(A) < $signed(B) ? 1 : 0;
    OP_BLTU: result = A < B ? 1 : 0;
    OP_BNE: result = A != B ? 1 : 0;
    OP_BUNKNOWN: result = 0;
    default: result = 0;
    endcase
end
endmodule