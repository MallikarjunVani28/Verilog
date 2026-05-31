// Write Verilog Behavioral code for generating an infinite sequence of numeric patterns 5-7-5-7.......................... using the "forever" loop
module pattern_5_7;
  reg a;
  
  initial begin
     a = 0;
    
    forever begin
      if(a == 0)
        $display("5");
      else
        $display("7");
      
      a=~a;
      #10;
    end
  end
endmodule

//using for loop
module pattern_5_7;

integer i;

initial begin
    for(i = 0; ; i = i + 1) begin
        if(i % 2 == 0)
            $display("5");
        else
            $display("7");

        #10;
    end
end

endmodule
