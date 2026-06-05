module right_alligned_triangle;
  integer i,j,k;

  initial begin
    for(i=0;i<5;i=i+1)begin
      for(j=0;j<4-i;j=j+1)
      
          $write("  ");
      for(k=0;k<i;k=k+1)
        $write("* ");
      
       
      
      $write("\n");
    end
  end
endmodule
