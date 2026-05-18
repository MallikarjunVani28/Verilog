//write RTL code that the 4 bit output should be toggle for every 30 clk cycles
module toggle(input clk,rst,output reg [3:0]clk_out);
  reg [4:0] count;
  always@(posedge clk)begin
    if(rst)begin
      count<=0;
      clk_out<=0;
    end
    else if(count == 4'd29)begin
      count<=0;
      clk_out<=~clk_out;
    end
    else 
      begin
        count <= count+1'b1;
        clk_out <= clk_out;
      end
  end
endmodule
    
      
