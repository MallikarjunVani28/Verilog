//design full adder using decoder
module decoder(input a,b,c,output reg [7:0] y);
  always@(*)begin
    case({a,b,c})
      3'b000 : y = 8'b0000_0001;
      3'b001 : y = 8'b0000_0010;
      3'b010 : y = 8'b0000_0100;
      3'b011 : y = 8'b0000_1000;
      3'b100 : y = 8'b0001_0000;
      3'b101 : y = 8'b0010_0000;
      3'b110 : y = 8'b0100_0000;
      3'b111 : y = 8'b1000_0000;
    endcase
  end
endmodule

module full_adder(input a,b,cin,output sum,carry);
  wire [7:0] y ;
  
  decoder dut(a,b,cin,y);
  
  assign sum = y[1] | y[2] | y[4] | y[7];
  
  assign carry = y[3] | y[5] | y[6] | y[7];
  
endmodule
  
  
  
  
