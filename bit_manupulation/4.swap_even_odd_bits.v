//write a verilog code for Swap odd and even bits.
module swap_bits(input [7:0] data ,output [7:0] out);
  wire [7:0] even_bits,odd_bits;
  
  assign even_bits = data & 8'h55;
  assign odd_bits = data & 8'haa;
  
  assign out = (even_bits >>1 )|(odd_bits<<1);
endmodule
