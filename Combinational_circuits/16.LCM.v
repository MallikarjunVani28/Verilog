module lcf(input [7:0] a,b ,output reg [15:0] lcm);
  reg [7:0] x,y;
  reg [7:0] hcf;
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
    
    
    lcm = (a*b)/hcf;
  end
endmodule
