module inverted_triangle;
  integer i,j;
  initial begin
    for(i= 5;i>0;i=i-1)begin
      for (j = 0;j<i;j=j+1)begin
        $write("* ");
      end
      $write("\n");
    end
  end
endmodule
