`timescale 1ns/1ps

module scalable_convolution_engine_tb;

parameter DATA_WIDTH = 8;

reg clk;
reg rst;
reg signed [DATA_WIDTH-1:0] w00;
reg signed [DATA_WIDTH-1:0] w01;
reg signed [DATA_WIDTH-1:0] w02;
reg signed [DATA_WIDTH-1:0] w10;
reg signed [DATA_WIDTH-1:0] w11;
reg signed [DATA_WIDTH-1:0] w12;
reg signed [DATA_WIDTH-1:0] w20;
reg signed [DATA_WIDTH-1:0] w21;
reg signed [DATA_WIDTH-1:0] w22;
wire signed [31:0] conv_out;

scalable_convolution_engine #(
    .DATA_WIDTH(DATA_WIDTH)
) uut (
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

always #5 clk = ~clk;
initial begin
    $dumpfile("waveforms/scalable_convolution_engine.vcd");
    $dumpvars(0, scalable_convolution_engine_tb);

    clk = 0;
    rst = 1;

    #10;
    rst = 0;

    w00 = 1;  w01 = 2;  w02 = 3;
    w10 = 4;  w11 = 5;  w12 = 6;
    w20 = 7;  w21 = 8;  w22 = 9;

    #20;

    $finish;
end
endmodule