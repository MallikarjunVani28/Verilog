//mux 8:1 using 2 4:1 muxes and 1 2:1 mux
module mux_4to1(input [3:0]i,input [1:0]sel,output reg y);
  always@(*)begin
    case(sel)
      2'b00 : y = i[0];
      2'b01 : y = i[1];
      2'b10 : y = i[2];
      2'b11 : y = i[3];
      default : y = 1'b0;
    endcase
  end
endmodule

module mux_2to1(input a,b,input sel,output y);
  assign y = sel?b:a;
endmodule

module mux_8to1(input [7:0]i,input [2:0] sel,output y);
  wire w1,w2;
  mux_4to1 in1(i[3:0],sel[1:0],w1);
  mux_4to1 in2(i[7:4],sel[1:0],w2);
  mux_2to1 in3(w1,w2,sel[2],y);
endmodule
  
