`timescale 1ns/1ps

module max_pool_tb;

reg clk;
reg rst;
reg signed [31:0] a;
reg signed [31:0] b;
reg signed [31:0] c;
reg signed [31:0] d;
wire signed [31:0] max_out;

max_pool uut(
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
    $dumpfile("waveforms/max_pool.vcd");
    $dumpvars(0, max_pool_tb);
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
    c = -20;
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