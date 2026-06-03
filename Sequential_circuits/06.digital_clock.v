/*
Write an RTL & task-based testbench code for a digital clock in 24-hour formats that counts from 00:00:00 to 23:59:59 and resets back to 00:00:00.
Example hr:min:sec
*/
module digital_clock(input clk,rst,output reg [4:0]hr,output reg [5:0] mins,secs);
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        begin
          hr<=0;
          mins<=0;
          secs<=0;
        end
      else
        begin
          if(secs == 59)begin
            secs<=0;
            
            if(mins == 59)begin
              mins<=0;
              
              if(hr == 23)begin
                hr<=0;
              end
                else
                  hr<=hr+1;
            end
              
              else
                mins<=mins+1;
            end
            else
              secs <= secs +1;
          end
        
    end
      endmodule
              
     
