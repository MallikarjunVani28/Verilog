module hollow_square;
  integer i,j;
  initial begin
    for(i=0;i<5;i=i+1)begin
      for(j=0;j<5;j=j+1)begin
        if(i == 0 || i == 4 || j == 0 || j == 4)
          $write("* ");
        else
          $write("  ");
      end
      $write("\n");
    end
  end
endmodule
