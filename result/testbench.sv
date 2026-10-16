// Code your testbench here
// or browse Examples
module test_four_bit_RCA_RCS;
  
  reg [3:0] A;
  reg [3:0] B;
  reg sub;
  wire [3:0] S;
  wire Cout;
  
  four_bit_RCA_RCS test (.A(A), .B(B), .sub(sub), .S(S), .Cout(Cout));
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, test_four_bit_RCA_RCS);
    A = 0;
    B = 0;
    sub = 0;
    #10;
    
    A = 1;
    B = 1; 
    sub = 0;
    #10;
    
    A = 9;
    B = 3; 
    sub = 1;
    #10;
    
    A = 3;
    B = -2; 
    sub = 0;
    #10;
    
    A = 3;
    B = -2; 
    sub = 1;
    #10;
    
    A = 8;
    B = 9;
    sub = 0;
    #10;

  end
endmodule