// eventually, you'll need to append to this some way of writing instruction memory via spi slave; 
// for now, you can use initial begin to load instructions in at the start of execution.
module imem #(
    parameter IMEM_SIZE = 4
)(
    input logic [$clog2(IMEM_SIZE)-1:0] pc,
    output logic [7:0] instruction
);

    // 4-deep array of 8-bit instructions
    logic [7:0] imem_reg [0:IMEM_SIZE-1];

    // todo: sample instruction memory with pc

endmodule