module hours_glass;
  integer i,j,k;
  initial begin
    for(i=4;i>=0;i=i-1)begin
      for(j=0;j<4-i;j=j+1)
        $write("  ");
      for(k=0;k<2*i+1;k=k+1)
        $write("* ");
      $write("\n");
    end
    for(i=0;i<5;i=i+1)begin
      for(j=0;j<4-i;j=j+1)
        $write("  ");
      for(k=0;k<2*i+1;k=k+1)
        $write("* ");
      $write("\n");
    end
  end
endmodule
          
        
        
