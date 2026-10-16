// Code your design here
module one_bit_full_adder_b(A, B, Cin, S, Cout);

  input A, B, Cin;
  output S, Cout;
  
  assign S = A ^ B ^ Cin;
  assign Cout = A * B + B * Cin + Cin * A;
  
endmodule

module one_bit_full_adder_s(A, B, Cin, S, Cout);

  input A, B, Cin;
  output S, Cout;
  wire temp1, temp2, temp3, temp4;
  
  xor xor1 (temp1, A, B);
  xor xor2 (S, temp1, Cin);
  and and1 (temp2, A, B);
  and and2 (temp3, B, Cin);
  and and3 (temp4, Cin, A);
  or or1 (Cout, temp2, temp3, temp4);
  
endmodule

module four_bit_RCA(A, B, Cin, S, Cout);

  input [3:0] A, B;
  input Cin;
  output [3:0] S;
  output Cout;
  
  assign S = A ^ B ^ Cin;
  assign Cout = A*B  + B*Cin + Cin*A;
endmodule

module four_bit_RCA_RCS(A, B, sub, S, Cout);

  input [3:0] A, B;
  input sub; 
  output [3:0] S;
  output Cout;

  wire [3:0] B_sel;
  wire c1, c2, c3;
  
    assign B_sel[0] = sub ? ~B[0] : B[0];
    one_bit_full_adder_s fa0 (A[0], B_sel[0], sub, S[0], c1);
    assign B_sel[1] = sub ? ~B[1] : B[1];
    one_bit_full_adder_s fa1 (A[1], B_sel[1], c1,  S[1], c2);
    assign B_sel[2] = sub ? ~B[2] : B[2];
    one_bit_full_adder_s fa2 (A[2], B_sel[2], c2,  S[2], c3);
    assign B_sel[3] = sub ? ~B[3] : B[3];
    one_bit_full_adder_s fa3 (A[3], B_sel[3], c3,  S[3], Cout);

endmodule