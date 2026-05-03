//Write the RTL for counting the number of times 1011 has occurred in a 32 bit sequence
module fsm(input clk,rst,x,valid,output reg [5:0] count,output reg done);
  parameter S0 = 2'b00;
  parameter S1 = 2'b01;
  parameter S2 = 2'b10;
  parameter S3 = 2'b11;
  
  reg [1:0] ps,ns;
  
  reg [5:0] bit_count;
  wire detect;
  
  always@(posedge clk)begin
    if(rst)
      ps<=S0;
    else if(valid)
      ps <= ns;
  end
  
  always@(*)begin
    case(ps)
      S0: ns = x?S1:S0;
      S1 : ns = x?S1:S2;
      S2 : ns = x?S3:S0;
      S3 : ns = x?S1:S2;
      default : ns = S0;
    endcase
  end
  
  assign detect = (ps == S3 && x == 1);
  
  always@(posedge clk)
    begin
      if(rst)
        bit_count <= 0;
      else if(valid)
        bit_count <= bit_count +1'b1;
      end
  
  always@(posedge clk)
    begin
      if(rst)
        count <= 0;
      else if(valid && detect)
        count <= count +1'b1;
    end
  
  always@(posedge clk)begin
    if(rst)
      done <= 0;
    else if(bit_count == 31 && valid)
      done <= 1;
  end
endmodule

//testbench
module tb;

  reg clk, rst;
  reg x;
  reg valid;

  wire [5:0] count;
  wire done;

  // DUT
  fsm dut (
    .clk(clk),
    .rst(rst),
    .x(x),
    .valid(valid),
    .count(count),
    .done(done)
  );

  // Clock generation (10ns period)
  always #5 clk = ~clk;

  // Task to send 32-bit sequence (MSB first)
  task send_sequence(input [31:0] data);
    integer i;
    begin
      for (i = 31; i >= 0; i = i - 1) begin
        @(posedge clk);
        valid = 1;
        x = data[i];
      end
      @(posedge clk);
      valid = 0;
    end
  endtask

  initial begin
  
    clk = 0;
    rst = 1;
    valid = 0;
    x = 0;

    
    #10 rst = 0;

  
    send_sequence(32'b10110110101101101011011010110110);

   
    wait(done);

  
    $display("Final Count = %0d", count);

    #20;
    $finish;
  end


  initial begin
    $monitor("time=%0t x=%b count=%0d done=%b",
              $time, x, count, done);
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,tb);
  end

endmodule
      
  
      
  
