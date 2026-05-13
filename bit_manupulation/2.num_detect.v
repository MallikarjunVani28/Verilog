//write a verilog code to Detect whether a number is: power of 2 power of 4 divisible by 3 divisible by 8


module number_detect(input [31:0] n,output power_2,power_4,divisible_by_3,divisible_by_8);
  
  assign power_2 = (n>0) && ((n & (n-1))==0);
  assign power_4 = (n>0) && ((n & (n-1)) ==0) && ((n & 32'h5555_5555) !=0);
  
  assign divisible_by_3 = ( n % 3 == 0);
  
  assign divisible_by_8 = (n & 7 == 0);
  
endmodule


//testbench 
module tb;
  reg [31:0] a;
  wire power_2;
  wire power_4;
  wire divisible_by_3;
  wire divisible_by_8;
  
  number_detect dut(a,power_2,power_4,divisible_by_3,divisible_by_8);
  
  task initialize;
    a = 32'b0;
  endtask
  
  task stimulus(input [31:0] b);
    a = b;
    #10;
    $display("a = %0d power_2 = %b power_4 = %b divisible_by_3 = %b divisible_by_8 = %b",a,power_2,power_4,divisible_by_3,divisible_by_8);
  endtask
  
  initial begin
    initialize;
    stimulus(32'd16);
    stimulus(32'd42);
    stimulus(32'd51);
    stimulus(32'd64);
  end
  
  initial begin
    #200;
    $finish;
  end
endmodule
    
                               
