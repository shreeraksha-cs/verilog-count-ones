module ha(a,b,sum,carry);
input a, b;
output sum, carry;
assign sum = a ^ b;
assign carry = a & b;
endmodule

module count(input [7:0] A, output [3:0] Count);
wire [3:0] sum;
wire [3:0] cout;
reg [3:0] count_ones; 

ha ha_1(A[0], A[1], sum[0], cout[0]);
ha ha_2(A[2], A[3], sum[1], cout[1]);
ha ha_3(A[4], A[5], sum[2], cout[2]);
ha ha_4(A[6], A[7], sum[3], cout[3]);

integer i;
always @(*) begin
    count_ones = 0;
    for (i = 0; i < 4; i = i + 1) begin
        if (sum[i] == 1'b0 && cout[i] == 1'b1)
            count_ones = count_ones + 2;
        else if (sum[i] == 1'b1 && cout[i] == 1'b0)
            count_ones = count_ones + 1;
        else
            count_ones = count_ones + 0;
    end
end

assign Count = count_ones;
endmodule