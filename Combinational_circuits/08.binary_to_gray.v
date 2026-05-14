//verilog code for binary to gray conversion
module binary_to_gray #(parameter N = 4)
  (input [N-1:0] binary,output reg [N-1:0] gray);
  
  integer i;
  
  always@(*)begin
    gray[N-1] = binary[N-1];
    for(i = N-2 ; i>=0; i = i-1)
      gray[i] = binary[i+1]^binary[i];
  end
  
endmodule
  
