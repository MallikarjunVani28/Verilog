module tb;
  integer i,j,k;
  initial begin
    for(i=4;i>=0;i=i-1)begin
      for(j=0;j<5-i-1;j=j+1)
        $write("  ");
      for(k=0;k<2*i-1;k=k+1)
        $write("* ");
      $write("\n");
    end
  end
endmodule
