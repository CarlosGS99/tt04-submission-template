// Description: 4 bit Shift/Add Unsigned Binary Multiplier

module tt_um_carlosgs99_multi_4bits (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

wire rst = !rst_n;                  //Positive logic reset
parameter bits = 4;

wire [bits-1:0] A;  //Input A
wire [bits-1:0] B;  //Input B
reg [bits*2-1:0] P;  //Output (product)

assign A = ui_in[3:0];              //Assign inputs A & B
assign B = ui_in[7:4];

assign uo_out[7:0] = 8'd0;          //No 7-segment display used
assign uio_oe[7:0] = 8'b1111_1111;  //All bidirectional paths used as outputs

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

always @(posedge clk, posedge rst) begin
    if (rst) begin
        P <= 0;
    end else begin
        P <= PF;
    end
end

assign uio_out[7:0] = P;

endmodule
