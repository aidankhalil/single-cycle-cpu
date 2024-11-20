// Verilog code for 4-bit ripple-carry adder
(* DONT_TOUCH = "true" *)
module ripple_carry_adder(
    input  [3:0] X, // 4-bit input
    input  [3:0] Y, // 4-bit input
    input  Cin,     // 1-bit input carry in
    output [3:0] S, // 4-bit output sum
    output Cout     // 1-bit output carry out
);
    
    wire [2:0] C;
    
    // --- enter your code here
    fulladder f0(X[0], Y[0], Cin, S[0], C[0]);
    fulladder f1(X[1], Y[1], C[0], S[1], C[1]);
    fulladder f2(X[2], Y[2], C[1], S[2], C[2]);
    fulladder f3(X[3], Y[3], C[2], S[3], Cout);
    
    // --- end your code here
endmodule
