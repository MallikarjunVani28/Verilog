//Write a Verilog simulation code to count in the given 32-bit input how many times the sequence '10' is repeated.

module tb;
  reg [31:0] data;
  integer   count;
  integer i;
  
  initial begin
    data = 32'b010_1010_1010_1010_1010_1011_1100_1111;
    count = 0;
 

    for(i=0;i<31;i=i+1)begin
      if(data[i+1] == 1'b1 && data[i] ==1'b0)
        count = count+1;
    end
    $display("data = %b",data);
    $display("no.10 occurrences %d",count);
    $finish;
  end
endmodule
  
    
