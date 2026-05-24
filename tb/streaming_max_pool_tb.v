`timescale 1ns/1ps

module streaming_max_pool_tb;

reg clk;
reg rst;
reg valid_in;
reg signed [31:0] d0;
reg signed [31:0] d1;
reg signed [31:0] d2;
reg signed [31:0] d3;
wire valid_out;
wire signed [31:0] pool_out;

streaming_max_pool uut(
    .clk(clk),
    .rst(rst),
    .valid_in(valid_in),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .valid_out(valid_out),
    .pool_out(pool_out)
);

always #5 clk = ~clk;
initial begin
    $dumpfile("waveforms/streaming_max_pool.vcd");
    $dumpvars(0, streaming_max_pool_tb);
    clk = 0;
    rst = 1;

    valid_in = 0;

    d0 = 0;
    d1 = 0;
    d2 = 0;
    d3 = 0;

    #10;
    rst = 0;

    #10;
    valid_in = 1;

    d0 = 10;
    d1 = 25;
    d2 = 7;
    d3 = 15;

    #10;

    d0 = 100;
    d1 = 50;
    d2 = 75;
    d3 = 125;

    #10;

    d0 = -5;
    d1 = -2;
    d2 = -10;
    d3 = -1;

    #10;
    valid_in = 0;

    #30;

    $finish;
end
endmodule