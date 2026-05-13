//write a verilog code to Count:number of 1s ,leading zeros ,trailing zeros ,parity bits


module count(input [7:0] data, output reg [3:0] ones,leading_zeros,trailing_zeros,output even_parity,odd_parity);
  integer i;
  
  
  //count number of ones
  
  always@(*)begin
    ones = 0;
     leading_zeros = 0;
    trailing_zeros = 0;
    
    for(i = 0;i < 8;i = i+1)begin
      if(data[i] == 1'b1)
        ones = ones + 1'b1;
      else
        ones = ones;
    end
    
    //count number of leading_zeros 
    
    for(i = 7; i >= 0;i=i-1)
     begin
       if(data[i] == 0)
         leading_zeros = leading_zeros+1;
       else
      i = -1;
     end
    
    //count number of trialing zeros
    
    for(i = 0;i<8;i=i+1)
    begin
      if(data[i] == 1'b0)
        trailing_zeros = trailing_zeros + 1'b1;
      else
        i = 8;
    end
  end
    
    //even parity
    
    assign even_parity = ~(^data);
    
    //odd parity
  assign odd_parity = (^data);
    
 
    
 endmodule
        
    
    
  
    
