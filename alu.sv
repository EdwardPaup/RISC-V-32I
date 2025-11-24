import risc_v_32i::*;

module ALU(
    input [(REG_SIZE-1):0] A, B,
    input [(ALU_SEL_LEN-1):0] ALUControl,
    output reg [(REG_SIZE-1):0] result
);

always @(*) 
begin
  case(ALUControl)
    OP_AND: result = A & B;         
    OP_OR: result = A | B;         
    OP_ADD: result = A + B;         
    OP_SUB: result = A - B;         
    OP_XOR: result = A ^ B;         
    OP_LSL: result = A << B[REG_WIDTH-1:0];   
    OP_LSR: result = A >> B[REG_WIDTH-1:0];   
    default: result = 0;
  endcase
end
endmodule