// generate control signals based on instruction
module ctrl_unit (
    input logic [7:0] insn,
    output logic reg_write,         // write back to rf (0 for branch, store, etc.)
    output logic mem_write,         // write to mem (can remove if you don't have ld/st support)
    output logic mem_to_reg,        // perform load (write to rf from memory)
    output logic branch,            // perform branch (can remove if you don't have branch support)
    output logic [2:0] alu_op,      // ALU operation (e.g. 000 -> add, 001 -> sub, etc.)
    output logic alu_src            // immediate or second source register as ALU input
);

endmodule