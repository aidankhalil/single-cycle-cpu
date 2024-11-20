// Verilog code for 4-bit look-ahead carry
(* DONT_TOUCH = "true" *)
module look_ahead_carry(
    input  Cin,       // 1-bit input carry in
    input  [3:0] P,   // 4-bit input carry propagate
    input  [3:0] G,   // 4-bit input carry generate
    output [4:0] C    // 5-bit output carry
);
    
    // --- enter your code here
    assign C[4] = G[3] | (G[2] & P[3]) | (G[1] & P[3] & P[2]) | (G[0] & P[3] & P[2] & P[1]) | (P[3] & P[2] & P[1] & P[0] & Cin);
    assign C[3] = G[2] | (G[1] & P[2]) | (G[0] & P[2] & P[1]) | (P[2] & P[1] & P[0] & Cin);
    assign C[2] = G[1] | (G[0] & P[1]) | (P[1] & P[0] & Cin);
    assign C[1] = G[0] | (P[0] & Cin);
    assign C[0] = Cin;
    // --- end your code here
endmodule
