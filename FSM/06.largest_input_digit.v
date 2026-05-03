//Design a FSM over { 0, 1, 2, 3 } that will output the largest input digit read so far.
//e.g. input : 001032 will produce output: 001133

module fsm(input clk,rst,input [1:0]x,output [1:0]y);
  parameter IDLE = 2'b00;
  parameter S1  = 2'b01;
  parameter S2 = 2'b10;
  parameter S3 = 2'b11;
  
  reg [1:0] ps,ns;
  
  always@(posedge clk)begin
    if(rst)
      ps<=IDLE;
    else
      ps<=ns;
  end
  
  always@(*)begin
    case(ps)
      IDLE : begin
        if(x==2'b01)
          ns = 2'd1;
        else if(x == 2'b10)
         ns = 2'd2;
        else if(x == 2'b11)
          ns = 2'd3;
        else
          ns = IDLE;
      end
          
      S1 :  begin
        if(x==2'b01)
          ns = 2'd1;
        else if(x == 2'b10)
          ns = 2'd2;
        else if(x == 2'b11)
          ns = 2'd3;
        else
          ns = 2'd1;
      end
    S2 :begin
        if(x==2'b01)
          ns = 2'd2;
        else if(x == 2'b10)
          ns = 2'd2;
        else if(x == 2'b11)
          ns = 2'd3;
        else
          ns = 2'd2;
      end
      S3 :begin
        if(x==2'b01)
          ns = 2'd3;
        else if(x == 2'b10)
          ns = 2'd3;
        else if(x == 2'b11)
          ns = 2'd3;
        else
          ns = 2'd3;
      end
      
      default : ns = IDLE;
    endcase
  end
  
  
  assign y = ps;
endmodule


//testbench
module tb;
  reg clk,rst;
  reg [1:0]x;
  wire [1:0]y;
  
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
  
  task stimulus(input [1:0]a);
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
    stimulus(2'b10);
    stimulus(2'b01);
    stimulus(2'b11);
    stimulus(2'b10);
    stimulus(2'b11);
    stimulus(2'b10);
    stimulus(2'b01);
    stimulus(2'b11);
    stimulus(2'b10);
    stimulus(2'b11);
    stimulus(2'b00);
    finish;
  end
endmodule
