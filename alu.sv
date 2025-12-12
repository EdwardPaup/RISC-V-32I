import risc_v_32i::*;
module ALU(
    input [ALU_SEL_LEN-1 : 0] sel,
    input [REG_SIZE-1 : 0] A, B,
    output reg [REG_SIZE-1 : 0] result
);

always_comb begin
    case (sel)
        OP_ADD: result = $signed(A) + $signed(B);
        OP_AND: result = A & B;
        OP_LSL: result = A << B;
        OP_LSR: result = A >> B;
        OP_OR: result = A|B;
        OP_SUB:  result = $signed(A)-$signed(B);
        OP_XOR: result = A^B;
        OP_UNKNOWN: result = 0;
        default: result = 0;
    endcase
end
endmodule