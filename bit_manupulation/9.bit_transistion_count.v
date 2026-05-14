//write a verilog code for bit_transistion_counts like 10101011 transistion = 5!



module bit_transistion_count(input [7:0] a,output reg [3:0] count);
  
  integer i;
  
  reg [7:0] transistion;
  
  
  always@(*)begin
    
    transistion = a ^ (a>>1);
    
    count = 0;
    
    for(i=0;i<8;i=i+1)
      count = count + transistion[i];
  end
endmodule
    
  
  
