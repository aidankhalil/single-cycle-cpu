module cu_testbench();
  //Inputs
  reg [6:0] opcode;
  //Output
  wire ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, Jalr;
  wire [1:0] ALUOp;
  
  
  cu u0(opcode, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, Jalr, ALUOp);
  
  initial begin
    $monitor("%b\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%d\t%b", opcode, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, Jump, Jalr, ALUOp);
    
    //Test 1: R-type
    #5 opcode = 7'b0110011;
    
    //Test 2: Load
    #5 opcode = 7'b0000011;
    
    //Test 3: Jalr
    #5 opcode = 7'b1100111;
    
    //Test 4: I-type
    #5 opcode = 7'b0010011;
    
    //Test 5: S-type
    #5 opcode = 7'b0100011;
    
    //Test 6: B-type
    #5 opcode = 7'b1100011;
    
    //Test 7: J-type
    #5 opcode = 7'b1101111;
    
  end
  
endmodule