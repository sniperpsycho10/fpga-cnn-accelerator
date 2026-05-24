`timescale 1ns/1ps

module scalable_max_pool_tb;

parameter DATA_WIDTH = 32;

reg clk;
reg rst;
reg signed [DATA_WIDTH-1:0] a;
reg signed [DATA_WIDTH-1:0] b;
reg signed [DATA_WIDTH-1:0] c;
reg signed [DATA_WIDTH-1:0] d;
wire signed [DATA_WIDTH-1:0] max_out;

scalable_max_pool #(
    .DATA_WIDTH(DATA_WIDTH)
) uut (
    .clk(clk),
    .rst(rst),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .max_out(max_out)
);

always #5 clk = ~clk;
initial begin
    $dumpfile("waveforms/scalable_max_pool.vcd");
    $dumpvars(0, scalable_max_pool_tb);

    clk = 0;
    rst = 1;

    a = 0;
    b = 0;
    c = 0;
    d = 0;

    #10;
    rst = 0;

    #10;
    a = 10;
    b = 25;
    c = 7;
    d = 15;

    #10;
    a = -5;
    b = -2;
    c = -10;
    d = -1;

    #10;
    a = 100;
    b = 50;
    c = 75;
    d = 125;

    #30;
    $finish;
end
endmodule