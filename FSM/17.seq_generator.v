//Write RTL code to design a sequence generator which will generate the sequence :  (first bit )0,0,1,0,1,1 and repeat (dont use FSM) 
module seq_generator(input clk,rst,output reg y);
  reg [2:0] count;
  always@(posedge clk)begin
    if(rst)
      count<=0;
    else if(count == 5)
      count<=1'b0;
    else
      count<=count+1'b1;
  end
  always@(*)begin
    case(count)
      0 : y = 1'b0;
      1 : y = 1'b0;
      2 : y = 1'b1;
      3 : y = 1'b0;
      4 : y = 1'b1;
      5 : y = 1'b1;
      default : y = 1'b0;
    endcase
  end
endmodule
      
      
