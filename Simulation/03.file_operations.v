/* Write a Verilog TB to read the test vectors from a file "data_in.txt" and display the even 
parity of each test vector into an output file called "data_out.txt".  */
/*data_in.txt: 
10101010 
11111111 
11110000 
00001111 
00000000 
11111111 
11001100 
00110011 */
module tb;
integer fd1,fd2;
reg [7:0] data;
reg parity;
integer i;
initial begin
fd1 = $fopen("data_in.txt","r");
fd2 = $fopen("data_out.txt","w");
for(i = 0;i<8;i=i+1)begin
$fscanf(fd1,"%b",data);
parity = ^data;
$fdisplay(fd2 , "b" , parity);
end
$fclose(fd1);
$fclose(fd2);
end
endmodule
