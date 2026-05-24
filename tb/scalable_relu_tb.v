`timescale 1ns/1ps

module scalable_relu_tb;

parameter DATA_WIDTH = 32;

reg clk;
reg rst;
reg signed [DATA_WIDTH-1:0] data_in;
wire signed [DATA_WIDTH-1:0] data_out;

scalable_relu #(
    .DATA_WIDTH(DATA_WIDTH)
) uut (
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .data_out(data_out)
);

always #5 clk = ~clk;
initial begin
    $dumpfile("waveforms/scalable_relu.vcd");
    $dumpvars(0, scalable_relu_tb);

    clk = 0;
    rst = 1;

    data_in = 0;

    #10;
    rst = 0;

    #10;
    data_in = 25;

    #10;
    data_in = -10;

    #10;
    data_in = 100;

    #30;
    $finish;
end
endmodule