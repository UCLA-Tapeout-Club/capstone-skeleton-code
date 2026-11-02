// you can remove if you don't plan to support ld/st
module dmem #(
    parameter DMEM_SIZE = 4
)(
    input logic clk,
    input logic rst_n,

    input logic [7:0] st_data,
    input logic [$clog2(DMEM_SIZE)-1:0] st_address,
    input logic mem_write,

    input logic [$clog2(DMEM_SIZE)-1:0] ld_addr,
    output logic [7:0] ld_data
);

    // 4-deep data memory of 8-bit data
    logic [7:0] dmem_reg [0:DMEM_SIZE-1];

    // todo: handle ld/st instructions if you plan to impl them

endmodule