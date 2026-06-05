module tb;
  integer i,j;
  integer num;
  initial begin
    for(i=0;i<5;i=i+1)begin
      for(j=0;j<i;j=j+1)begin
        if((i+j)%2==0)
          $write("1 ");
        else
          $write("0 ");
      end
      $write("\n");
    end
  end
endmodule
        
