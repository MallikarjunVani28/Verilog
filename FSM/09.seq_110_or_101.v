/*Derive a single input and single output Moore-type FSM that produces an output of 1 if in
the input sequence it detects either 110 or 101 patterns. Overlapping sequence should be
detected.*/

module fsm(input clk,rst,x,output y);
  parameter S0 = 3'b000;
  parameter S1 = 3'b001;
  parameter S2 = 3'b010;
  parameter S3 = 3'b011;
  parameter S4 = 3'b100;
  parameter S5 = 3'b101;
  
  reg [2:0] ps,ns;
  
  always@(posedge clk)begin
    if(rst)
      ps<=0;
    else
      ps<=ns;
  end
  
  always@(*)begin
    case(ps)
       3'b000 : ns = x?S1:S0;
      3'b001 : ns = x?S2:S3;
      3'b010 : ns = x?S2:S4;
      3'b011 : ns = x?S5:S0;
      3'b100 : ns = x?S4:S0;
      3'b101 : ns = x?S2:S3;
      default : ns = S0;
    endcase
  end
  
  assign y = (ps == S5 || ps == S4)?1'b1:1'b0;
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
  
