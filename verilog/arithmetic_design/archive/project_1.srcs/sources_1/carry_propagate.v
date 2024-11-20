// Verilog code for 4-bit carry propagate
(* DONT_TOUCH = "true" *)
module carry_propagate(
    input  [3:0] X, // 4-bit input
    input  [3:0] Y, // 4-bit input
    output [3:0] P  // 4-bit output carry propagate
);
    
    // --- enter your code here
    assign P[0] = X[0] ^ Y[0];
    assign P[1] = X[1] ^ Y[1];
    assign P[2] = X[2] ^ Y[2];
    assign P[3] = X[3] ^ Y[3];
    
    // --- end your code here
endmodule
