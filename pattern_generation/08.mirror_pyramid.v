module mirror_pyramid;
  integer i,j;
  initial begin
    for(i=0;i<5;i=i+1)begin
      for(j = 0;j<5;j=j+1)begin
        if((i==0 && j == 2) || (i==1 && (j ==1 || j == 2 || j == 3)) || (i==3 && (j ==1 || j == 2 || j == 3)) || (i==4 && j==2)|| i==2)
          $write("* ");
        else
          $write("  ");
      end
      $write("\n");
    end
  end
    endmodule
           
