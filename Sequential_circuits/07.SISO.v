/*
Write synthesizable RTL code for a n- bit left shift SISO register such that shifting 
happens only for first 2 clock cycles within every four clock cycles. (Reset is active 
high, synchronous reset). For the rest 2 clock cycles shifter holds the last shifted value.
*/

module siso #(parameter N=8)
  (input clk,rst,sin,
   output reg [N-1:0] shift_reg,
   output sout);
  reg [1:0] count;
  
  always@(posedge clk)begin
    if(rst)begin
      count<=0;
      shift_reg <= {N{1'b0}};
    end
    else begin
      if(count <2)
        begin
          shift_reg <= {shift_reg[N-2:0],sin};
        end
      if(count == 3)begin
        count <= 0;
      end
      else
        count <= count+1'b1;
    end
  end
 assign  sout = shift_reg[N-1];
endmodule
      
          
          
      
    
