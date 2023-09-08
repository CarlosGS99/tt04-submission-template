`include "multi_4bits.v"

module tt_um_carlosgs99_multi_4bits (
    input wire [3:0]  A,
    input wire [3:0]  B,
    input wire        clk,
    input wire        rst,
    output wire [7:0] P
);

    multi_4bits multiplier(
        .A(A), 
        .B(B), 
        .rst(rst), 
        .clk(clk), 
        .Product_o(P));
endmodule