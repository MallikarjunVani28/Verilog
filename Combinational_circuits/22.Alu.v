/*Design and implement a behavioral RTL model of an ALU in Verilog withthe following specifications:
Inputs input [3:0] a, b — 4-bit operands input [2:0] cmd — command signal to select ALU operation input oe 
— output enable signalOutput output [7:0] dout — 8-bit ALU outputRequirements Use parameters to define command values for operations.
 Implement arithmetic operations such as:o Addition (+)o Subtraction (-)o Multiplication (*)o Division (/) Use behavioral modelling style.
 Verify all operations using a suitable testbench.*/
module alu(input [3:0] a, b,input [2:0] cmd,input oe,output reg [8:0] dout);
  always@(*)begin
    if(!oe)
      dout = 8'h00;
    else
      begin
    case(cmd)
      3'b000 : dout = a + b;
      3'b001 : dout = a- b;
      3'b010 : dout = a * b;
      3'b011 :begin if(b!=0)
        dout = a / b;
      else
        dout = 8'h00;
      end
      default : dout = 8'h00;
    endcase
      end
  end
endmodule
    
