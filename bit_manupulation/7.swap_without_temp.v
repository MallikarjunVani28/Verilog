//write a verilog code to swap the numbers without temp register
module swap_without_temp;
  reg [3:0] a,b;
  
  initial begin
    a = 4'd10;
    b = 4'd12;
    
    $display("before swaping a = %d b = %d ",a,b);
    
    a = a^b;
    b = a^b;
    a = a^b;
    #10;
    
    $display("after swaping a = %d b = %d",a,b);
    
    #100;
    $finish;
    
  end
endmodule
