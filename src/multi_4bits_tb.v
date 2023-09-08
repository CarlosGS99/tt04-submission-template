// Description: Combinational Testbench.

`timescale 1 ns / 100 ps
`include "multi_4bits.v"

module tt_um_carlosgs99_multi_4bits_tb # (parameter bits = 4)
(); // Definition of Input/Output signals
    reg rst;
    reg clk;
    reg [bits-1:0] A;
    reg [bits-1:0] B;

    output wire [bits*2-1:0] P;

//Module instantiation
    multi_4bits dut(
        .A(A), 
        .B(B), 
        .clk(clk),
        .rst(rst),  
        .Product_o(P)
    );

//Variables of Output file, iterations and time
integer write_data;
integer i;
integer j;
time t;

//Clock signal, 100 MHz, duty cycle 50%
always #5 clk = ~clk;

//Reset sequence
initial begin
    clk = 0; rst = 1; #10;
             rst = 0; #10;
end

//Input signal stimuli
initial begin
    write_data = $fopen("multi_4bits_tb_output.txt","w");    //Output files configuration
    $dumpfile("multi_4bits_tb.vcd");
    $dumpvars(0,tt_um_carlosgs99_multi_4bits_tb);

    $timeformat(-9,2," ns",10); // Time format

    //Simulate all input combinations
for (i=0; i<16; i=i+1) begin
    for (j=0; j<16; j=j+1) begin
        A = i;
        B = j;
        #100; t = $time;
        $fdisplay(write_data, "Tiempo: %t\tA = %d\tB = %d\tP = %d",t,A,B,P);
    end
end
    
    //Close output file
    $fclose(write_data);

    //Finish simulation
    $display("Test completed");
    $finish;
end

endmodule
