module alu (
    // based on your ISA, you may not have 3 bits for op -- ensure you tune the bit values
    input logic [2:0] op,
    input logic [7:0] src_1,
    input logic [7:0] src_2,

    output logic [7:0] dst_val,
    output logic zero // useful for branching -- you can remove this if you are not implementing branching
);

    // todo: generate a case statement based on op

endmodule