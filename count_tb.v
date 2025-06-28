`timescale 1ns / 1ps

module count_tb;
    reg [7:0] data_in;       
    wire [3:0] count_out;    

    count count_1(data_in, count_out);

    initial begin 
        $dumpfile("count_ones_tb.vcd");
        $dumpvars(0, count_tb);

        $monitor("Time = %0t | data_in = %b | count_out = %d", $time, data_in, count_out);

	
        #0    data_in = 8'b00000000;   
        #10   data_in = 8'b00000001;   
        #10   data_in = 8'b11111111;   
        #10   data_in = 8'b10101010;   
        #10   data_in = 8'b11001100;   
        #10   data_in = 8'b10000001;  
        #10   data_in = 8'b00110110; 
	#10
		  

        $finish;
    end
endmodule