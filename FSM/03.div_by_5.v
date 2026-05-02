//Design a FSM with input as a bit stream, and o/p which goes 1 whenever the number received so far is divisible by 5



module divisible_by_5(input clk,rst,x,output y);
  parameter S0 = 3'b000;
  parameter S1 = 3'b001;
  parameter S2 = 3'b010;
  parameter S3 = 3'b011;
  parameter S4 = 3'b100;
  
  reg [2:0] ps ,ns;
  
  always @(posedge clk)begin
    if(rst)
      ps<=S0;
    else
      ps<=ns;
  end
  always@(x,ps)begin
    case(ps)
      3'b000 : ns = x?S1:S0;
      3'b001 : ns = x?S3:S1;
      3'b010 : ns = x?S0:S4;
      3'b011 : ns = x?S2:S1;
      3'b100 : ns = x?S4:S0;
      default : ;
    endcase
  end
  assign y = (ps == S0)?1'b1:1'b0;
endmodule
    


module tb;
  reg clk ;
  reg rst;
  reg x;
  wire y;
  
  divisible_by_5 dut(clk,rst,x,y);
  
  always #5 clk = ~clk;
  
  task initialize;
    {clk,rst,x}= 0;
  endtask
  
  task rst_dut;
    begin
    rst = 1;
    #10;
    rst = 0;
    end
  endtask
  
  task stimulus(input a);
    begin
      x = a;
      #10;
    end
  endtask
  
  task finish;
    begin
      #200;
      $finish;
    end
  endtask
  
  initial begin
     initialize;
    rst_dut;
   
    stimulus(1);
    stimulus(0);
    stimulus(1);
    stimulus(1);
    stimulus(0);
    stimulus(1);
    stimulus(1);
    stimulus(0);
    stimulus(0);
    stimulus(1);
    finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
              
  initial 
    
    $monitor("x = %b y = %b ",x,y);
endmodule
