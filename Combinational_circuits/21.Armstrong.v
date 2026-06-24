module armstrong(input [7:0] num,output reg armstrong);
  integer sum,temp,rem;
  
  always@(*)begin
    temp = num;
    sum = 0;
    
    while(temp != 0)begin
      rem  = temp%10;
      sum  = sum + rem*rem*rem;
      temp = temp/10;
      
    end
    
    armstrong = (sum == num);
  end
endmodule
