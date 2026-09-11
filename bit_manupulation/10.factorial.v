//write a verilog to find the factorial of the number
module factorial (
    input  [7:0]  num,
    output reg [31:0] fact
);

    integer i;

    always @(*) begin
        fact = 1;

        for (i = 1; i <= num; i = i + 1) begin
            fact = fact * i;
        end
    end

endmodule
