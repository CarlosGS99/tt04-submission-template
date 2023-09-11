// Description: Combinational Testbench.

`timescale 1 ns / 100 ps
`include "multi_4bits.v"

module multi_4bits_tb
(); // Definition of Input/Output signals
    reg clk_tb;
    reg rst_tb;
    reg [7:0] inputs_tb;

    wire [7:0] product_tb;

//Module instantiation
tt_um_carlosgs99_multi_4bits dut(
        .rst_n(rst_tb),
        .clk(clk_tb),
        .ui_in(inputs_tb),
        .uio_out(product_tb)
    );

reg [3:0] A_tb = 4'b0000;
reg [3:0] B_tb = 4'b0000;

//Variables of Output file, iterations and time
integer write_data;
integer i;
integer j;
time t;

//Clock signal, 100 MHz, duty cycle 50%
always #5 clk_tb = ~clk_tb;

//Reset sequence
initial begin
    clk_tb = 0; rst_tb = 0; #10;
                rst_tb = 1; #10;
end

//Input signal stimuli
initial begin
    write_data = $fopen("multi_4bits_tb_output.txt","w");    //Output files configuration
    $dumpfile("multi_4bits_tb.vcd");
    $dumpvars(0,multi_4bits_tb);

    $timeformat(-9,2," ns",10); // Time format

    //Simulate all input combinations
for (i=0; i<16; i=i+1) begin
    for (j=0; j<16; j=j+1) begin
        A_tb = i;
        B_tb = j;
        inputs_tb = {B_tb, A_tb};
        #100; t = $time;
        $fdisplay(write_data, "Tiempo: %t\trst = %b A = %d\tB = %d\tP = %d",t,rst_tb,A_tb,B_tb,product_tb);
    end
end
    
    //Close output file
    $fclose(write_data);

    //Finish simulation
    $display("Test completed");
    $finish;
end

endmodule