//write a verilog code Detect if all odd bits are 1,Detect if all even bits are 0.
module detect_odd_even_bits__01(input [7:0]a,output odd_ones,even_zeros);
  assign odd_ones = ((a & (8'hAA)) == 8'hAA);
  assign even_zeros =   ((a & (8'h55)) == 8'h55);
endmodule
