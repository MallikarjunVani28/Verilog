module full_adder(input a,b,c,output sum,carry);
assign sum = a ^ b ^ c;
assign carry = a&b|b&c|a&c;
endmodule

module rca(input [3:0] a,b ,input cin,output [3:0]sum,output carry);
  wire c1,c2,c3;
  full_adder in1 (a[0],b[0],cin,sum[0],c1);
  full_adder in2 (a[1],b[1],c1,sum[1],c2);
  full_adder in3 (a[2],b[2],c2,sum[2],c3);
  full_adder in4 (a[3],b[3],c3,sum[3],carry);
endmodule
