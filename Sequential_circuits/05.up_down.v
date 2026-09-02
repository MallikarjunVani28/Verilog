/*Write a Verilog code for a  clock divider circuit that toggles its output only when the parity of a 4-bit up-down counter is odd and the most
significant bit (MSB) is high. 
Additionally, the direction (up/down) of the counter should be controlled by an input signal. 
Include synchronous reset.Verify the Verilog code using taskbased testbench.
Input: clock,reset,direction;
Output : out; */
module up_down_counter(input clk,rst,direction,output reg out);
  reg [3:0] count;
  always@(posedge clk)begin
   if(rst)
   count <= 4'b0000;
    else if(direction)
      count <= count+1;
    else
 count <= count -1;
  end
  always@(posedge clk)begin
    if(rst)
      out<=0;
    else if(^count && count[3])
      out <= ~out;
    else 
      out <= out;
      end
    endmodule


