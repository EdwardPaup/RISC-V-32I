import risc_v_32i::*;

module instr_mem(
    input [REG_SIZE-1 : 0] instr_addr,
    output [REG_SIZE-1 : 0] instruction,
);

logic [31:0] instructions [32:0];

initial
begin
    $readmemh("instructions.txt",instruction); 
end

always_comb begin
    instruction = instructions[instr_addr];
end
endmodule