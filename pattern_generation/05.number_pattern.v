module number_pattern;
  integer i,j;
  initial begin
    for(i = 1; i<7;i = i+1)begin
      for(j = 1;j<=i;j=j+1)begin
       
        $write("%d",i);
      end
      $write("\n");
    end
  end
endmodule
    
