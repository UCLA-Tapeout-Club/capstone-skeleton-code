// increment pc every clock cycle, changing which instruction is executed; if you support branch, take that pc instead on branch_taken
module pc #(
    parameter IMEM_SIZE = 4
)(
    input logic clk,
    input logic rst_n,

    input logic branch_taken,
    input logic [$clog2(IMEM_SIZE)-1:0] branch_pc,

    output logic [$clog2(IMEM_SIZE)-1:0] pc_out
);

    // todo: generate sequential logic to increment pc every cycle

endmodule