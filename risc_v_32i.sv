package risc_v_32i;

//iverilog -g2012 -o my_simulation_executable risc_v_32I.sv alu.sv comparator.sv

parameter REG_SIZE = 32;
parameter REG_WIDTH = 5;

parameter IMM_SEL_LENGTH = 3;

typedef enum logic[(IMM_SEL_LENGTH-1):0] {
    IMM_B_TYPE,
    IMM_S_TYPE,
    IMM_U_TYPE,
    IMM_I_TYPE,
    IMM_J_TYPE,
    IMM_UNKNOWN_TYPE
} imm_select_e;

parameter ALU_SEL_LEN = 4;

typedef enum logic [(ALU_SEL_LEN-1):0] {
    OP_ADD,
    OP_SUB,
    OP_AND,
    OP_OR,
    OP_XOR,
    OP_LSL,
    OP_LSR,
    OP_UNKNOWN
} alu_select_e;

parameter BRANCH_SEL_LENGTH = 3;

typedef enum logic [(BRANCH_SEL_LENGTH - 1):0] {
    OP_BEQ,
    OP_BNE,
    OP_BGE,
    OP_BLT,
    OP_BGEU,
    OP_BLTU,
    OP_BUNKNOWN
} comp_select_e;

parameter RD_MUX_SEL_LEN = 3;

typedef enum logic [(RD_MUX_SEL_LEN-1):0] {
    RD_MUX_DMEM,
    RD_MUX_ALU,
    RD_MUX_BCU,
    RD_MUX_IMM,
    RD_MUX_PC_IN,
    RD_MUX_N_A
} write_data_select_e;

parameter LOAD_STORE_TYPE_LEN = 4;

typedef enum logic [LOAD_STORE_TYPE_LEN-1:0]
{
    L_W,
    L_H,
    L_HU,
    L_B,
    L_BU,
    S_W,
    S_H,
    S_B,
    LS_N_A
} load_store_type_e;

endpackage