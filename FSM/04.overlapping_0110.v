//Draw the FSM for overlapping 0110

module fsm(input clk,rst,x,output y);
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  parameter S3 = 2'b11;
  
  reg [1:0] ps,ns;
  
  always@(posedge clk )
    begin
      if(rst)
        ps<=S0;
      else
        ps<=ns;
    end
  
  always@(*)begin
    case(ps)
      2'b00 : ns = x?S0:S1;
      2'b01 : ns = x?S2:S1;
      2'b10 : ns = x?S3:S1;
      2'b11 : ns = x?S0:S1;
    endcase
  end
  
  assign  y = (ps == S3 && ns == S1)?1'b1:1'b0;
endmodule

      
