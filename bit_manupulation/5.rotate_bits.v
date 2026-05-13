//write a verilog code for Rotate bits left/right by 1 position.
module rotate_bits(input [7:0] data ,output [7:0] rotate_left,rotate_right);
  assign rotate_left = {data[6:0],data[7]};
  assign rotate_right = {data[0],data[7:1]};
  endmodule
