//Find largest among: 2 numbers ,4 numbers without using relational operators.
module max_num(input [7:0] a,b,c,d,output [7:0] max);
  wire [7:0] max_1;
  wire [7:0] max_2;
  wire [7:0]diff1;
  wire [7:0]diff2;
  wire [7:0] diff3;
  
  assign diff1 = a-b;
  assign diff2 = c - d;
  assign diff3 = max_1 - max_2;
  
  assign max_1 = diff1[7]?b:a;
  assign max_2 = diff2[7]?d:c;
  
  assign max = diff3[7]?max_2:max_1;
endmodule
