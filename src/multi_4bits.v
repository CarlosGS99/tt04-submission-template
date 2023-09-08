// Description: 4 bit Shift/Add Unsigned Binary Multiplier

module tt_um_carlosgs99 # (parameter bits = 4)(
    input               rst,
    input               clk,
    input [bits-1:0]    A,
    input [bits-1:0]    B,

    output reg [bits*2-1:0] Product_o
);

wire [bits:0] PP1;
wire [bits:0] PP2;
wire [bits:0] PP3;
wire [bits:0] PP4;

wire [bits+1:0] PP1_2;
wire [bits+1:0] PP3_4;

wire [bits*2-1:0] Product;

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

assign Product = (PP3_4 << 2) + (PP1_2);

always @(posedge clk, posedge rst) begin
    if (rst) begin
        Product_o <= 0;
    end else begin
        Product_o <= Product;
    end
end

endmodule
