// Verilog code for 4-bit propagated sum
(* DONT_TOUCH = "true" *)
module propagated_sum(
    input  [3:0] P, // 4-bit input carry propagate
    input  [3:0] C, // 4-bit input carry (4 LSB)
    output [3:0] S  // 4-bit output sum
);
    
    // --- enter your code here
    assign S[0] = P[0] ^ C[0];
    assign S[1] = P[1] ^ C[1];
    assign S[2] = P[2] ^ C[2];
    assign S[3] = P[3] ^ C[3];
    
    // --- end your code here
endmodule
