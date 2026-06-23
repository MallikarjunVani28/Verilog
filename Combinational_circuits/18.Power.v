module power(input [3:0] a,b,output reg [31:0] result);
  integer i;
  always@(*)begin
    result = 1;
    for(i=0;i<b;i=i+1)begin
      result = result * a;
    end
  end
endmodule
