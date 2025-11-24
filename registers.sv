import risc_v_32i::*;
module registers 
{
    input clk, write_enable;
    input [REG_WIDTH-1 : 0] rs1_addr, rs2_addr, write_addr;
    input [REG_SIZE-1 : 0] write_data,
    output [REG_SIZE-1 : 0] rs1_read, rs2_read;
}

logic [REG_SIZE-1 : 0]register [REG_SIZE-1 : 0];

always(@*) begin
    rs1_read = (rs1_addr == 0) ? 0 : register[rs1_addr];
    rs2_read = (rs2_addr == 0) ? 0 : register[rs2_addr];
end

alwaysff (@posedge clk) begin
    if(write_enable && (write_addr != 0)) 
    begin 
        register[write_addr] = write_data;
    end
end

endmodule
    
