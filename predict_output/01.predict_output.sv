module strobe; 
        reg a ; 
        initial 
          begin 
            $monitor($time,"Value of a monitored = %d",a); 
            $strobe($time,"Value of  a strobed = %d",a); 
            a = 0; 
            a <= 1; 
            $display($time,"Value of a displayed = %d",a); 
            #1; 
            a = 1'bx; 
          end 
     endmodule 
