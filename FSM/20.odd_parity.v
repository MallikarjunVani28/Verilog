//Write RTL code to design an odd parity detector for a 4-bit data using task construct. 

module odd_parity(input [3:0] a,output reg parity);
  task cal_parity;
    input [3:0]a;
    output parity;
  integer count;
  integer i;
    begin
      count = 0;
    for(i=0;i<4;i=i+1)begin
      if(a[i] == 1'b1)
        count = count+1'b1;
      else
        count = count;
    end
    if(count%2==1)
      parity = 1'b1;
    else
      parity = 1'b0;
    end
  endtask
  
  always@(*)begin
    cal_parity(a,parity);
  end
endmodule
  
