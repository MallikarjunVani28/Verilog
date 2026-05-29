module x_pattern;
  integer i,j;
  initial begin
    for(i = 0; i<5;i = i+1)begin
      for(j = 0;j<5;j=j+1)begin
        if( (i == j) ||(i+j == 4))
          $write("*");
      
        else
          $write(" ");
      end
    
      $write("\n");
    end
  end
endmodule
    
