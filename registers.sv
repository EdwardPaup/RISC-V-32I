import risc_v_32i::*;
module registers 
(
    input clk, write_enable,
    input [REG_WIDTH-1 : 0] rs1_addr, rs2_addr, write_addr,
    input [REG_SIZE-1 : 0] write_data,
    output reg [REG_SIZE-1 : 0] rs1_read, rs2_read
);

logic [REG_SIZE-1 : 0]register [31 : 0];

always_comb begin
    if (rs1_addr == 0)
        rs1_read = 0;
    else
        rs1_read = register[rs1_addr];

    if (rs2_addr == 0)
        rs2_read = 0;
    else
        rs2_read = register[rs2_addr];
end

always_ff @(posedge clk) begin
    if(write_enable && (write_addr != 0)) 
    begin 
        register[write_addr] = write_data;
    end
end

endmodule