// register file -- you read two source registers at the start, then write back a dest reg
// you may have to tune the input sizes based on the number of registers you have
module rf #(
    parameter RF_SIZE = 4
)(
    input logic clk,
    input logic rst_n,

    input logic [$clog2(RF_SIZE)-1:0] rs1,
    input logic [$clog2(RF_SIZE)-1:0] rs2,

    output logic [7:0] rs1_val,
    output logic [7:0] rs2_val,

    input logic [$clog2(RF_SIZE)-1:0] dst_reg,
    input logic [7:0] wr_data,
    input logic wr_enable
);

    logic [7:0] reg_file [0:RF_SIZE-1];

endmodule