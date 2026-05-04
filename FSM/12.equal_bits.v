/*Design a FSM over {0, 1} that will output 1 if the first bit and the current bit of the input
string are equal, 0 otherwise. e.g. input : 010011 will produce output: 101100*/
module fsm(input clk,rst,x,output y);
  parameter IDLE = 3'b000;
  parameter S0 = 3'b001;
  parameter S1 = 3'b010;
  parameter S2 = 3'b011;
  parameter S3 = 3'b100;
  
  reg [2:0] ps,ns;
  
  always@(posedge clk)begin
    if(rst)
      ps<=0;
    else
      ps <= ns;
  end
  
  always @(*)begin
    case(ps)
     IDLE : ns = x ?S1:S0;
      S0  : ns = x?S2:S0;
      S1 : ns = x?S1:S3;
      S2 : ns = x?S2:S0;
      S3 : ns = x?S1:S3;
    endcase
  end
  assign y = (ps==S0 || ps == S1)?1'b1:1'b0;
endmodule
  
  
      //testbbench
module tb;
  reg clk,rst;
  reg x;
  wire y;
  
  fsm  dut(clk,rst,x,y);
  
  always #5 clk = ~clk;
  
  task initialize;
    begin
      {clk,rst,x} = 0;
    end
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
    initialize;
    rst_dut;
    stimulus(1);
    stimulus(0);
    stimulus(1);
    stimulus(1);
    stimulus(1);
    stimulus(1);
    stimulus(0);
    stimulus(1);
    stimulus(1);
    stimulus(0);
    stimulus(1);
    finish;
  end
  
  task finish;
    begin
    #200;
    $finish;
    end
  endtask
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end
endmodule
    
    
    
