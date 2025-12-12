import risc_v_32i::*;
module alu_tb();

reg [REG_SIZE-1:0] A, B;
reg [ALU_SEL_LEN-1:0] ALUControl;
wire [REG_SIZE-1:0] result;
ALU alu_test (
    .A(A),
    .B(B),
    .sel(ALUControl),
    .result(result)
);
initial begin
    //Addition
    A = 10; B = 17; ALUControl = OP_ADD;
    #1 $display("%d",result);

    //Subtraction
    A = 25; B = 7; ALUControl = OP_SUB;
    #1 $display("%d",result);

    //AND
    A = 4'b1100; B = 4'b1010; ALUControl = OP_AND;
    #1 $display("%b",result);

    //OR
    A = 4'b1100; B = 4'b1010; ALUControl = OP_OR;
    #1 $display("%b",result);

    //XOR
    A = 4'b1100; B = 4'b1010; ALUControl = OP_XOR;
    #1 $display("%b",result);

    //LSL
    A = 4'b0001; B = 2; ALUControl = OP_LSL;
    #1 $display("%b",result);

    //LSR
    A = 4'b0100; B = 2; ALUControl = OP_LSR;
    #1 $display("%b",result);

    $finish;
end

endmodule