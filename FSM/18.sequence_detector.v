/*
Write a Verilog RTL code to detect how many times the sequence 1101 has occurred in a 32-bit input, ensuring:

1.Overlapping is not allowed.
2.No FSM is used.
3.Verify using a task-based testbench.
*/
module seq_detector(input [31:0]data,output reg [3:0] y);
  integer i;
  always@(*)begin
    y = 0;
    for(i=0;i<=28;i=i+1)begin
      if(data[i +:4] == 4'b1101)begin
        y = y+1;
        i = i+3;
      end
    end
  end
endmodule
      
      
