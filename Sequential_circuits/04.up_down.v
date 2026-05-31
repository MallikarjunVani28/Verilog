module up_down(input clk,rst,up_down,output reg [3:0] count);
  always@(posedge clk)begin
    if(rst)begin
      if(up_down)
        count<=4'b0000;
      else
        count<=4'd15;
    end
    else  begin
      if (up_down)begin
      if(count == 4'd14)
      count <= 4'd0;
      else
        count <= count + 2;
      end
        else begin
      
          if(count == 4'd1)
        count<=4'd15;
      else
        count <= count - 2;
    end
  end
    end
endmodule
        
      
      
    
    
      
      
