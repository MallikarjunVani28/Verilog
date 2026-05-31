//Sequence detector 00/11
module sequance_00_11(input clk,rst,input x,output y);
  parameter S0 = 3'b000;
  parameter S1 = 3'b001;
  parameter S2 = 3'b010;
  parameter S3 = 3'b011;
  parameter S4 = 3'b100;
  
  reg [2:0] ps,ns;
  
  //present state logic
  
  always@(posedge clk)begin
    if(rst)
      ps<=S0;
    else
      ps<=ns;
  end
  
  //next state logic
  
  always@(*)begin
    case(ps)
      S0 : ns = x ? S2 : S1;
      S1 : ns = x ? S2 : S3;
      S2 : ns = x ? S4 : S1;
      S3 : ns = x ? S2 : S3;
      S4 : ns = x ? S4 : S1;
      default : ns  = S0;
    endcase
  end
  
  //output state logic
  
  assign y = (ps == S4 || ps == S3) ? 1'b1 : 1'b0;
endmodule
  
  
    
  
