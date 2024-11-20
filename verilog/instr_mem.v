`timescale 1ns / 1ps

`define MEM_FILENAME "instructions.mem"

(* DONT_TOUCH = "yes" *)
module InstMem#(
    parameter DATA_WIDTH   = 32,  // number of bits in each memory cell
    parameter ADDRESS_WIDTH = 32, // number of memory cells <= 2^(ADDRESS_WIDTH-2)
    parameter NUM_MEM_CELLS = 64  
)(
    input  [ADDRESS_WIDTH-1:0] addr, // Read address
    output [DATA_WIDTH-1:0] data // Read Data
);

    reg [DATA_WIDTH - 1: 0] inst_mem[0: NUM_MEM_CELLS - 1];
    initial $readmemb(`MEM_FILENAME, inst_mem);
    
    assign data = inst_mem[addr[ADDRESS_WIDTH - 1 : 2]];

endmodule