`timescale 1ns/1ps

module scalable_sliding_window_tb;

parameter DATA_WIDTH = 8;
parameter LINE_LENGTH = 8;

reg clk;
reg rst;
reg [DATA_WIDTH-1:0] pixel_in;
wire [DATA_WIDTH-1:0] w00;
wire [DATA_WIDTH-1:0] w01;
wire [DATA_WIDTH-1:0] w02;
wire [DATA_WIDTH-1:0] w10;
wire [DATA_WIDTH-1:0] w11;
wire [DATA_WIDTH-1:0] w12;
wire [DATA_WIDTH-1:0] w20;
wire [DATA_WIDTH-1:0] w21;
wire [DATA_WIDTH-1:0] w22;

scalable_sliding_window #(
    .DATA_WIDTH(DATA_WIDTH),
    .LINE_LENGTH(LINE_LENGTH)
) uut (
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

always #5 clk = ~clk;
integer i;
initial begin
    $dumpfile("waveforms/scalable_sliding_window.vcd");
    $dumpvars(0, scalable_sliding_window_tb);

    clk = 0;
    rst = 1;

    pixel_in = 0;

    #10;
    rst = 0;

    for(i = 1; i <= 25; i = i + 1) begin
        #10;
        pixel_in = i;
    end
    #100;
    $finish;
end
endmodule