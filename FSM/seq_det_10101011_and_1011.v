//Write a Verilog RTL code for a sequence detector that detects the sequence “10101011 & 1011” from the input data stream with MSB detected first & output toggles after detecting the sequence. The initial output should be ‘0’. Verify using a task-based testbench.

module fsm(input clk,rst,input x,output reg  y);
  parameter S0 = 4'b0000;
  parameter S1 = 4'b0001;
  parameter S2 = 4'b0010;
  parameter S3 = 4'b0011;
  parameter S4 = 4'b0100;
  parameter S5 = 4'b0101;
  parameter S6 = 4'b0110;
  parameter S7 = 4'b0111;
  parameter S8 = 4'b1000;
  
  reg [3:0] ps,ns;
  
  always @(posedge clk)begin
    if(rst)
      ps <= S0;
    else
      ps <= ns;
  end
  
  always@(*)begin
    case(ps)
      4'b0000 : ns = x?S1:S0;
      4'b0001 : ns = x?S1:S2;
      4'b0010 : ns = x?S3:S0;
      4'b0011 : ns = x?S1:S4;
      4'b0100 : ns = x?S5:S0;
      4'b0101 : ns = x?S1:S6;
      4'b0110 : ns = x?S7:S0;
      4'b0111 : ns = x?S8:S6;
      4'b1000 : ns = x?S1:S2;
      default :ns = S0 ;
    endcase
  end
  always@(posedge clk)begin
    if(rst)
      y<=0;
    
    else if(ps == S3 && x == 1'b1)
       y <= ~y;
    else if(ps == S7 && x == 1'b1)
      y <= ~y;
  end
endmodule
  
  module tb;
  reg clk,rst;
  reg x;
  wire y;
  
  fsm dut(clk,rst,x,y);
  
  always #5 clk = ~clk;
  
  task initialize;
    {clk,rst,x}=0;
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
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
  
  task finish;
    begin
    #300;
    $finish;
    end
  endtask
  
  initial begin
    initialize;
    rst_dut;
    stimulus(1);
    stimulus(0);
    stimulus(1);
    stimulus(0);
    stimulus(1);
    stimulus(0);
    stimulus(1);
    stimulus(1);
    stimulus(0);
    stimulus(1);
    stimulus(1);
    finish;
  end
endmodule


