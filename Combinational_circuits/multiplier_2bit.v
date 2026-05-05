//Design a Circuit which performs Multiplication of two 2 bit numbers using Half Adders and Logic Gates.
module HA(input a,b,output sum,carry);
  assign sum = a^b;
  assign carry = a & b;
endmodule

module multiplier_2bit(input [1:0]a,b,output p1,p2,p3,p4);
  
  wire x1,x2,x3;
  wire c1;
  
  assign p1 = a[0] & b[0];
  assign x1 = a[1] & b[0];
  assign x2 = a[0] & b[1];
  assign x3 = a[1] & b[1];
  
  HA in1(x1,x2,p2,c1);
  HA in2(c1,x3,p3,p4);
  
endmodule
