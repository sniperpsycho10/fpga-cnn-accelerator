module scalable_cnn_pipeline #(
    parameter DATA_WIDTH = 8,
    parameter LINE_LENGTH = 8
)(
    input clk,
    input rst,
    input [DATA_WIDTH-1:0] pixel_in,
    input ready_in,
    output valid_out,
    output signed [31:0] final_out
);

wire [DATA_WIDTH-1:0] w00;
wire [DATA_WIDTH-1:0] w01;
wire [DATA_WIDTH-1:0] w02;
wire [DATA_WIDTH-1:0] w10;
wire [DATA_WIDTH-1:0] w11;
wire [DATA_WIDTH-1:0] w12;
wire [DATA_WIDTH-1:0] w20;
wire [DATA_WIDTH-1:0] w21;
wire [DATA_WIDTH-1:0] w22;
wire signed [31:0] conv_out;
wire stage_valid;
wire stage_ready;
wire signed [31:0] stage_data;

assign stage_valid = 1'b1;

scalable_sliding_window #(
    .DATA_WIDTH(DATA_WIDTH),
    .LINE_LENGTH(LINE_LENGTH)
) sw (
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

scalable_convolution_engine #(
    .DATA_WIDTH(DATA_WIDTH)
) conv (
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

scalable_handshake_stage #(
    .DATA_WIDTH(32)
) hs (
    .clk(clk),
    .rst(rst),
    .valid_in(stage_valid),
    .ready_out(stage_ready),
    .data_in(conv_out),
    .valid_out(valid_out),
    .ready_in(ready_in),
    .data_out(stage_data)
);

scalable_relu #(
    .DATA_WIDTH(32)
) relu (
    .clk(clk),
    .rst(rst),
    .data_in(stage_data),
    .data_out(final_out)
);
endmodule