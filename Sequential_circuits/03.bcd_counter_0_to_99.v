//.BCD counter counts from 00 to 99 and repeat
module bcd_counter(input clk,rst,output reg [3:0]q1,q2);
  always@(posedge clk)begin
    if(rst)
      q1 <= 1'b0;
    else if(q1 == 4'b1001)
      q1 <= 1'b0;
    else
      q1 <= q1 + 1'b1;
  end
  
  always@(posedge clk)begin
    if(rst)
      q2 <= 0;
    
    
    else if(q2 == 4'b1001 && q1 == 4'b1001)
      q2 <= 4'b0000;
     else if(q1 == 4'b1001 )
      q2<= q2+1'b1;
   
      end
endmodule
      
    
    
      
