module palindrome(input [3:0] num,output reg pal);
  reg [7:0] temp,rev,rem;
  always@(*)begin
    temp = num;
    rev = 0;
    while(temp != 0)begin
      rem = temp%10;
      rev = rev * 10 + rem;
      temp = temp/10;
    end
    pal = (rev == num);
  end
endmodule
