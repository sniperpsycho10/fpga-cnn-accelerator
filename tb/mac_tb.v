`timescale 1ns/1ps

module mac_tb;

reg clk;
reg rst;
reg [7:0] a;
reg [7:0] b;
reg [15:0] acc_in;

wire [15:0] acc_out;

mac_unit uut(
    .clk(clk),
    .rst(rst),
    .a(a),
    .b(b),
    .acc_in(acc_in),
    .acc_out(acc_out)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("waveforms/mac.vcd");
    $dumpvars(0, mac_tb);

    clk = 0;
    rst = 1;

    #10;
    rst = 0;

    a = 4;
    b = 5;
    acc_in = 10;

    #20;

    $finish;
end

endmodule