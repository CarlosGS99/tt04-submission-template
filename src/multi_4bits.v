`default_nettype none
// Description: 4 bit Shift/Add Unsigned Binary Multiplier

module tt_um_carlosgs99_multi_4bits (
    inout        rst,
    inout        clk,
    inout        ena,
    input  [3:0] io_A,
    input  [3:0] io_B,

    output [7:0] io_Product
);

parameter bits = 4;

//wire clk = io_clk;
//wire rst = io_rst;
wire [bits-1:0] A = io_A;  
wire [bits-1:0] B = io_B;

reg [bits*2-1:0] Product;
assign io_Product = Product;


wire [bits:0] PP1;
wire [bits:0] PP2;
wire [bits:0] PP3;
wire [bits:0] PP4;

wire [bits+1:0] PP1_2;
wire [bits+1:0] PP3_4;

wire [bits*2-1:0] PF;

assign PP1[0] = A[0] & B[0];
assign PP1[1] = A[1] & B[0];
assign PP1[2] = A[2] & B[0];
assign PP1[3] = A[3] & B[0];
assign PP1[4] = 0;

assign PP2[0] = 0;
assign PP2[1] = A[0] & B[1];
assign PP2[2] = A[1] & B[1];
assign PP2[3] = A[2] & B[1];
assign PP2[4] = A[3] & B[1];

assign PP3[0] = A[0] & B[2];
assign PP3[1] = A[1] & B[2];
assign PP3[2] = A[2] & B[2];
assign PP3[3] = A[3] & B[2];
assign PP3[4] = 0;

assign PP4[0] = 0;
assign PP4[1] = A[0] & B[3];
assign PP4[2] = A[1] & B[3];
assign PP4[3] = A[2] & B[3];
assign PP4[4] = A[3] & B[3];

assign PP1_2 = PP1 + PP2;
assign PP3_4 = PP3 + PP4;

assign PF = (PP3_4 << 2) + (PP1_2);

    always @(posedge clk, posedge rst, posedge ena) begin
    if (rst) begin
        Product <= 0;
    end else begin
        Product <= PF;
    end
end

endmodule
