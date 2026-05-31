//Generate a clock of 15ns time period clock
module tb;
  reg clk;
  real period = 15;
  
  initial  begin
    clk = 1'b0;
    forever
      #(period/2) clk = ~clk;
    
  end
  initial begin
    #100;
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule
  
