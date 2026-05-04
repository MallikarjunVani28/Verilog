module fsm(input clk,rst,x,output y);
  parameter IDLE = 4'b0000;
  parameter S0 = 4'b0001;
  parameter S1 = 4'b0010;
  parameter S00 = 4'b0011;
  parameter S01 = 4'b0100;
  parameter S11 = 4'b0101;
  parameter S001 = 4'b0110;
  parameter S110 = 4'b0111;
  parameter S0011 = 4'b1000;
  
  reg [3:0] ps,ns;
  
  always @(posedge clk)begin
    if(rst)
      ps<=IDLE;
    else
      ps<=ns;
  end
  
  always@(*)begin
    case(ps)
      IDLE :  ns = x?S1:S0;
      S0   :  ns = x?S01:S00;
      S1   :  ns = x?S11 : S01;
      S00  :  ns = x?S001:S00;
      S01  :  ns = x?S110:S001;
      S11  :  ns = x?S11:S110;
      S001 :  ns = x?S0011:S001;
      S110 :  ns = x?S110 : S0011;
      S0011 : ns = S0011;
    endcase
  end
  
  assign y = (ps == S0011)?1'b1:1'b0;
endmodule
  
    //testbench
module tb;
  reg clk ;
  reg rst;
  reg x;
  wire y;
  
  fsm dut(clk,rst,x,y);
  always #5 clk = ~clk;
  
  task initialize;
    {clk,rst,x} = 0;
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
    #200;
    $finish;
    end
  endtask
  
  initial begin
   initialize;
    rst_dut;
    stimulus(0);
    stimulus(1);
    stimulus(0);
    stimulus(1);
    stimulus(1);
    stimulus(0);
    stimulus(1);
    finish;
  end
  
  initial
    $monitor("x  = %b y = %b",x,y);
endmodule
  
