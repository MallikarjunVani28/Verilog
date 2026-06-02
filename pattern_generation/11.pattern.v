/*
1
2 3
4 5 6
7 8 9 10
*/
module pattern;
  integer num = 1;
  integer i,j;
  initial begin
    for(i=0;i<5;i=i+1)begin
      for(j=0;j<i;j=j+1)begin
        $write("%d",num);
        num = num+1;
      end
      $write("\n");
    end
  end
    endmodule
