/*A sequential circuit has 2 inputs w1 and w2 and an output z. its function is to compare the
input sequences on the 2 inputs. If w1=w2 during any 4 consecutive clock cycles, the
circuit produces z = 1; otherwise z = 0. Eg. w1 : 0110111000110, w2 : 1110101000111,
z : 0000100001110. Derive a suitable circuit.*/
module fsm(input clk,rst,input w1,w2,output y);
  parameter S0 = 3'b000;
  parameter S1 = 3'b001;
  parameter S2 = 3'b010;
  parameter S3 = 3'b011;
  parameter S4 = 3'b100;
  
  reg [2:0] ps,ns;
  
  wire x;
  assign x = ~(w1 ^ w2);
  
  always@(posedge clk)begin
    if(rst)
      ps<=S0;
    else
      ps<=ns;
  end
  
  always@(*)begin
    case(ps)
      3'b000 : ns = x ? S1 : S0;
      3'b001 : ns = x ? S2 : S0;
      3'b010 : ns = x ? S3 : S0;
      3'b011 : ns = x ? S4 : S0;
      3'b100 : ns = x ? S4 : S0;
      default : ns = S0;
      
    endcase
  end
  assign y = (ps == S4)?1'b1:1'b0;
endmodule

//testbench
module tb;
  reg clk ;
  reg rst;
  reg w1,w2;
  wire y;
  
  fsm dut(clk,rst,w1,w2,y);
  always #5 clk = ~clk;
  
  task initialize;
    {clk,rst,w1,w2} = 0;
  endtask
  
  task rst_dut;
    begin
    rst = 1;
    #10;
    rst = 0;
    end
  endtask
  
  task stimulus(input a,input b);
    begin
      w1 = a;
      w2 = b;
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
    stimulus(0,0);
    stimulus(1,0);
    stimulus(0,1);
    stimulus(1,0);
    stimulus(1,0);
    stimulus(0,1);
    stimulus(1,1);
    stimulus(0,1);
    stimulus(1,0);
    stimulus(0,1);
    stimulus(1,0);
    stimulus(1,0);
    stimulus(0,1);
    stimulus(1,1);
    finish;
  end
  
  initial
    $monitor("  w1= %b w2 = %b y = %b",w1,w2,y);
endmodule
  
