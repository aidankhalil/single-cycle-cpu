// Verilog code for 1-bit full adder
(* DONT_TOUCH = "true" *)
module fulladder(
    input  X,   // 1-bit input
    input  Y,   // 1-bit input
    input  Cin, // 1-bit input carry in
    output S,   // 1-bit output sum
    output Cout // 1-bit output carry out
);
    
    // --- enter your code here
    assign Cout = ((X ^ Y) & Cin) | (X & Y);
    assign S = Cin ^ (X ^ Y);
    
    
    // --- end your code here
endmodule

