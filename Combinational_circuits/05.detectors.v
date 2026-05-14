//Design circuit to output:1 if exactly two 1s present , 1 if odd number of 1s ,1 if input is prime number (0–15)
module detectors(input [3:0] a,output two_ones,odd_ones,output reg prime);
  wire [2:0] count;
  
  assign count = a[0]+a[1]+a[2]+a[3];
  
  assign two_ones = (count == 2);
  assign odd_ones = ^a;
  
  always@(*)begin
    case(a)
      4'd1,
      4'd2,
      4'd3,
      4'd5,4'd7,4'd11,4'd13: prime = 1'b1;
      default : prime = 1'b0;
    endcase
  end
endmodule
