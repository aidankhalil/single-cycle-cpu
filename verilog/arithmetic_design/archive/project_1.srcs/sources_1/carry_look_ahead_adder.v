// Verilog code for 4-bit carry look-ahead adder
(* DONT_TOUCH = "true" *)
module carry_look_ahead_adder(
    input  [3:0] X, // 4-bit input
    input  [3:0] Y, // 4-bit input
    input  Cin,     // 1-bit input carry in
    output [3:0] S, // 4-bit output sum
    output Cout     // 1-bit output carry out
);
    
    // --- enter your code here
    wire [3:0] P;
    wire [3:0] G;
    wire [4:0] C;
    carry_propagate cp(X, Y, P);
    carry_generate cg(X, Y, G);
    look_ahead_carry lac(Cin, P, G, C);
    propagated_sum ps(P, C, S);
    assign Cout = C[4];
    
    // --- end your code here
endmodule
