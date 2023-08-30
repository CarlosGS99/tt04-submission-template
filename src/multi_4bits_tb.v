// Description: Combinational Testbench.

`timescale 1ns / 100 ps
`include "multi_4bits.v"

module multi_4bits_tb # (parameter bits = 4)
(); // Definition of Input/Output signals
    reg [bits-1:0] A;
    reg [bits-1:0] B;
    //reg clk;
    wire [bits*2-1:0] Product; 

//Module instantiation
    tt_um_multi_4bits #(bits) dut(
	//.clk(clk),
        .A(A),
        .B(B),
        .Product(Product)
    );

//Clk signal
//always #(5) clk = ~clk;

//Variables of Output file, iterations and time
integer write_data;
integer i;
integer j;

time t;

//Input signal stimuli
initial begin
    write_data = $fopen("multi_4bits_tb_output.txt","w");    //Output files configuration
    $dumpfile("multi_4bits_tb.vcd");
    $dumpvars(0,multi_4bits_tb);

    $timeformat(-9,2," ns",10); // Time format

    //Simulate all input combinations
for (i=0; i<16; i=i+1) begin
    for (j=0; j<16; j=j+1) begin
        A = i;
        B = j;
        #100; t = $time;
        $fdisplay(write_data, "Tiempo: %t\tA = %d\tB = %d\tP = %d",t,A,B,Product);
    end
end
    //Close output file
    $fclose(write_data);

    //Finish simulation
    $display("Test completed");

end

endmodule
