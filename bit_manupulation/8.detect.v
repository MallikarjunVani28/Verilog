//write a verilog code to Detect whether input contains:consecutive 1s , alternating bits , palindrome bit pattern

module detect(input [3:0] a,output consecutive_ones,alternative_bits,palindrome);
  
  wire [3:0] temp;
  
  assign consecutive_ones = |(a & (a>>1));
  
  assign temp = (a ^ (a>>1));
  
  
  assign alternative_bits = &temp;
  
  assign palindrome = ((a[3] == a[0]) && (a[2] == a[1]));
endmodule
