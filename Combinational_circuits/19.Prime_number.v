module prime_number(input [3:0] num,output reg  prime);
  integer i;
  always@(*)begin
    prime = 1;
    if(num<2)
      prime = 0;
    else begin
      for(i=2;i<num;i=i+1)begin
        if(num%i==0)
          prime = 0;
      end
  end
  end
endmodule
  
