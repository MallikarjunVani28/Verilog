module hcf(input [7:0] a,b ,output reg [7:0] hcf);
  reg [7:0] x,y;
  always@(*)begin
    x = a;
    y = b;
    while(y!=0)begin
    if(x>y)
      x=x-y;
    else
      y=y-x;
  end
  hcf = x;
  end
endmodule
