//write a simulation code to count the number of one's in the 32 bit data
module tb;
  reg [31:0] a;
  integer i;
  integer  count;
  initial begin
    a = 32'hfffaaaff;
    count = 0;
    for(i = 0;i<32;i=i+1)begin
      count = count + a[i];
    end
    $display("count = %d",count);
  end
endmodule
