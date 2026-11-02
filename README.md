# Capstone Skeleton Code

Disclaimer: I had Claude generate the README based on some things I need it to explain, skeleton code was handwritten however. 

Skeleton SystemVerilog for a simple 8-bit, single-cycle processor. Each module in `rtl/` has its ports laid out and `todo` comments marking what you need to fill in. You design the ISA and finish the logic.

## Files

| File | Description |
| --- | --- |
| `rtl/alu.sv` | ALU. Picks an operation based on `op`; `zero` output is for branching. |
| `rtl/ctrl_unit.sv` | Decodes an 8-bit instruction into control signals (`reg_write`, `mem_write`, `mem_to_reg`, `branch`, `alu_op`, `alu_src`). |
| `rtl/rf.sv` | Register file. Two read ports (`rs1`, `rs2`) and one write port. |
| `rtl/pc.sv` | Program counter. Increments every cycle, or jumps to `branch_pc` when a branch is taken. |
| `rtl/imem.sv` | Instruction memory, indexed by the PC. |
| `rtl/dmem.sv` | Data memory for loads and stores. |
| `rtl/datapath.sv` | Top level. Instantiate and wire up the modules above. |

## Recommended order

1. **Design your ISA.** Decide which instructions you need, the instruction format, and how many registers you have.
2. **Fill in the individual modules** (`alu`, `rf`, `pc`, `imem`, `dmem`, `ctrl_unit`).
3. **Write the datapath** (`datapath.sv`): instantiate the modules and add any muxing you need (e.g. picking between a register and an immediate for the ALU's second input).
4. **Add the SPI slave** (see below). Get the datapath working before starting on this.

## Notes

### Parameter, Bit-Widths Mutable

The sizes in the skeleton (`RF_SIZE`, `IMEM_SIZE`, `DMEM_SIZE`, the 3-bit ALU op, etc.) are placeholders. While designing your ISA, play around with different sizes, then pick one and update the code to match. For example, if your ISA only needs four ALU operations, the ALU op can go from 3 bits down to 2. Remember to change the width everywhere the signal appears (`alu.sv`, `ctrl_unit.sv`, `datapath.sv`).

### Data Memory, Branching Optional

Depending on what you want your ISA to do, you may not need loads/stores or branches:

- **No loads/stores:** remove `dmem.sv`, plus the `mem_write` and `mem_to_reg` control signals.
- **No branching:** remove the `branch` control signal, the ALU's `zero` output, and the `branch_taken` / `branch_pc` inputs to the PC.

### SPI Slave (not) Included

This skeleton does not include the SPI slave. You'll add it after the datapath works, and we'll provide skeleton code later.

### Instruction Memory Changes in the Future

For now, load instructions into `imem.sv` with an `initial begin` block. Eventually you'll have to edit `imem.sv` so instructions can be written into it through the SPI slave.

### Reset

All sequential modules use an active-low reset, `rst_n`. An asynchronous active-low reset (`always_ff @(posedge clk or negedge rst_n)`) is fine to use.