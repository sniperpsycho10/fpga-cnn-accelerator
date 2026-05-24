module cnn_pipeline(
    input clk,
    input rst,
    input [7:0] pixel_in,
    output signed [31:0] final_out
);

wire [7:0] w00;
wire [7:0] w01;
wire [7:0] w02;
wire [7:0] w10;
wire [7:0] w11;
wire [7:0] w12;
wire [7:0] w20;
wire [7:0] w21;
wire [7:0] w22;
wire signed [31:0] conv_out;

sliding_window sw(
    .clk(clk),
    .rst(rst),
    .pixel_in(pixel_in),
    .w00(w00),
    .w01(w01),
    .w02(w02),
    .w10(w10),
    .w11(w11),
    .w12(w12),
    .w20(w20),
    .w21(w21),
    .w22(w22)
);

convolution_engine conv(
    .clk(clk),
    .rst(rst),
    .w00(w00),
    .w01(w01),
    .w02(w02),
    .w10(w10),
    .w11(w11),
    .w12(w12),
    .w20(w20),
    .w21(w21),
    .w22(w22),
    .conv_out(conv_out)
);

relu relu_unit(
    .clk(clk),
    .rst(rst),
    .data_in(conv_out),
    .data_out(final_out)
);
endmodule