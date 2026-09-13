// Write RTL code for a 10-bit Ripple carry Adder using Full adder instances by implementing the “generate loop” construct. 
module full_adder(input a,b,cin,output sum, carry);
  assign sum = a^b^cin;
 assign carry = a&b|b&cin|a&cin;
endmodule
module rca(input [9:0]a,input [9:0]b,input cin,output [9:0] sum,output cout);
  wire [10:0] carry;
  assign carry[0] = cin;
  genvar i;
  generate
    for(i=0;i<10;i=i+1)
      begin
        full_adder(a[i],b[i],carry[i],sum[i],carry[i+1]);
      end
    endgenerate
  assign cout = carry[10];
  
endmodule
