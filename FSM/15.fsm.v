/*Design a Moore-type Finite State Machine that acts as a 1-bit parity checker (or a toggle controller). 
The FSM should behave as follows:Reset: Upon an asynchronous reset (rst), the machine enters state S0 with an output of 0.
Transitions:If the input is 0, the machine remains in its current state.If the input is 1, the machine toggles its state
(transitions from S0 to S1, or from S1 to S0).Outputs:In state S0, the output is 0 (indicating an even number of '1's received).
In state S1, the output is 1 (indicating an odd number of '1's received).*/

module fsm(input clk,rst,x,output y);
  parameter S0 = 1'b0;
  parameter S1 = 1'b1;
  
  reg   ps,ns;
  
  always@(posedge clk)begin
    if(rst)
      ps <= S0;
    else
      ps <= ns;
  end
  always@(*)begin
    case(ps)
      S0 : ns = x ? S1 : S0;
      S1 : ns = x ? S0 : S1;
    endcase
  end
  
  assign y = (ps == S1 ) ? 1'b1 : 1'b0;
endmodule
      
    
    
