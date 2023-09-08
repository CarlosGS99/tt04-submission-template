// Description: Combinational Testbench.

`timescale 1 ns / 100 ps
`include "multi_4bits.v"

module multi_4bits_tb
( // Definition of Input/Output signals
    inout rst,
    inout clk,
    input [3:0] A,
    input [3:0] B,

    output [7:0] P
);

initial begin   //Output files configuration
    $dumpfile ("multi_4bits_tb.vcd");
    $dumpvars (0, multi_4bits_tb);
    #1;
end

// Connect via wires inputs and outputs to their respective signals
wire rst_tb = rst;
wire clk_tb = clk;
wire [3:0] A_tb = A; 
wire [3:0] B_tb = B;
wire [7:0] result;
assign P = result; 

//Module instantiation
    tt_um_carlosgs99_multi_4bits dut(
        `ifdef GL_TEST
            .vccd1( 1'b1),
            .vssd1( 1'b0),
        `endif
            .io_A(A_tb), 
            .io_B(B_tb), 
            .clk(clk_tb),
            .rst(rst_tb),  
            .io_Product(result)
    );

endmodule
