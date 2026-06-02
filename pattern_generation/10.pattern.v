//Write an verilog simulation code to generate an unique pattern i.e 82,86,90,94,98 & repeat.
module pattern_generator;
  integer num;
  
  initial begin
    forever begin
    for(num=82;num<=98;num=num+4)begin
      $display("%0d",num);
      #10;
    end
    end
  end
endmodule
