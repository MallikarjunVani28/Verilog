
// write a verilog code for lift controller with 2 floors
module lift_controller(input clk,rst,input req0,req1,output reg motor_up,motor_down);
  
  parameter F0 = 2'b00;
  parameter UP = 2'b01;
  parameter F1 = 2'b10;
  parameter DOWN = 2'b11;
  
  reg [1:0] ps,ns;
  
  always@(posedge clk or posedge rst)begin
    if(rst)
      ps <= F0;
    else
      ps <= ns;
  end
  
  always@(*)begin
    case(ps)
      F0 : begin 
        if(req1)
          ns = UP;
        else
          ns = F0;
      end
      
      UP : ns = F1;
      
      F1 : begin
        if(req0)
          ns = DOWN;
        else
          ns = F1;
      end
      
      DOWN : ns = F0;
    endcase
  end
  
  always@(*)begin
    motor_up = (ps == UP);
    motor_down = (ps == DOWN);
  end
endmodule
      
