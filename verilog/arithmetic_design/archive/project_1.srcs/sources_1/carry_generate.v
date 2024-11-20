// Verilog code for 4-bit carry generate
(* DONT_TOUCH = "true" *)
module carry_generate(
    input  [3:0] X, // 4-bit input
    input  [3:0] Y, // 4-bit input
    output [3:0] G  // 4-bit output carry generate
);
    
    // --- enter your code here
    assign G[0] = X[0] & Y[0];
    assign G[1] = X[1] & Y[1];
    assign G[2] = X[2] & Y[2];
    assign G[3] = X[3] & Y[3];
    
    // --- end your code here
endmodule
