//verilog code to find the 2's compliment of the number
module fsm(input clk,rst,input x ,output reg y);
  reg  ps,ns;
  parameter S0 = 1'b0;
  parameter S1 = 1'b1;
  
  always@(posedge clk)begin
    if(rst)
      ps<=S0;
    else
      ps<=ns;
  end
  
  always@(*)begin
    case(ps)
      S0 : begin
        if(x == 0)begin
          ns = S0;
          y = 1'b0;
        end
        else begin
          ns = S1;
          y = 1'b1;
        end
      end
      S1 : begin
        if(x == 0)begin
          ns = S1;
          y = 1'b1;
        end
        else begin
          ns = S1;
          y = 1'b0;
        end
      end
    endcase
  end
endmodule
  
