/* Write synthesizable RTL code for a 8-bit left shift SISO register such that shifting 
happens for the first 4 clock cycles within every 8 clock cycles.(Reset is active high, 
synchronous reset). For the rest 4 clock cycles shifter acts like a buffer. */
module siso(input clk,rst,sin,output sout);
  reg [2:0] count;
  reg [7:0] temp;
  always@(posedge clk)begin
    if(rst)begin
      temp<=0;
      count<=0;
    end
    else if(count < 3'd4)
      temp <= {sin,temp[7:1]};
    else
      temp <= temp;
    count <= count+1'b1;
  end
  assign sout = temp[7];
endmodule
    
    
