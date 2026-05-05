//design 8 to 1 mux using 4 2:1 muxes and one 4:1 mux
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
  wire w1,w2,w3,w4;
  mux_2to1 in1(i[0],i[1],sel[0],w1);
  mux_2to1 in2(i[2],i[3],sel[0],w2);
  mux_2to1 in3(i[4],i[5],sel[0],w3);
  mux_2to1 in4(i[6],i[7],sel[0],w4);
  
  mux_4to1 in5({w1,w2,w3,w4},sel[2:1],y);
endmodule
  
