//write a verilog code to detect majority and minority 
module majority(input a,b,c,output majority,minority);
  
  assign majority = (a&b) | (b&c) | (c&a);
  
  assign minority = (~a & ~b) | (~b & ~c) | (~c & ~a);
  
endmodule
