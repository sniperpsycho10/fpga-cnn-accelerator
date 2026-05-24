module cnn_pipeline_handshake(
    input clk,
    input rst,
    input [7:0] pixel_in,
    input ready_in,
    output valid_out,
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
wire stage1_valid;
wire stage1_ready;
wire signed [31:0] stage1_data;
wire stage2_valid;
wire stage2_ready;
wire signed [31:0] stage2_data;

assign stage1_valid = 1'b1;

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

handshake_stage #(32) hs1(
    .clk(clk),
    .rst(rst),
    .valid_in(stage1_valid),
    .ready_out(stage1_ready),
    .data_in(conv_out),
    .valid_out(stage2_valid),
    .ready_in(stage2_ready),
    .data_out(stage2_data)
);

relu relu_unit(
    .clk(clk),
    .rst(rst),
    .data_in(stage2_data),
    .data_out(final_out)
);

assign valid_out = stage2_valid;
assign stage2_ready = ready_in;

endmodule