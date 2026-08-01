//write a simulation code to find the happy number
module happy_number;
  integer num;
  integer temp;
  integer digit;
  integer sum;
  integer i;
  
  initial begin
    num = 19;
    
    temp = num;
    for(i = 0;i<20;i = i+1)begin
      sum = 0;
      while(temp>0)begin
        digit = temp % 10;
        sum = sum + (digit*digit);
        temp = temp / 10;
      end
      if(sum == 1)begin
        $display("Happy number = %d",num);
        $finish;
      end
      temp = sum;
      
     
    end
     $display("%d is not a happy number",num);
  end
    endmodule
        
        
