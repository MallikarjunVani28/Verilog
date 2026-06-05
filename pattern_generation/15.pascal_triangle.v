module tb;
  integer i,j;
  integer num;
  initial begin
    for(i=0;i<5;i=i+1)begin
      for(j=0;j<5-i-1;j=j+1)
        $write(" ");
      num = 1;
      for(j=0;j<=i;j=j+1)begin
        $write("%0d ",num);
      num = num*(i-j)/(j+1);
      end
      $write("\n");
    end
  end
endmodule
  
