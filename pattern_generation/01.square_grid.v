module square_pattern;
  integer i,j;
  initial begin
    for(i= 0;i<5;i=i+1)begin
      for (j = 0;j<5;j=j+1)begin
        $write("* ");
      end
      $write("\n");
    end
  end
endmodule
