`timescale 1ns/1ps

module scalable_mac_unit_tb;

parameter DATA_WIDTH = 8;
parameter ACC_WIDTH = 32;

reg clk;
reg rst;

reg signed [DATA_WIDTH-1:0] a;
reg signed [DATA_WIDTH-1:0] b;

reg signed [ACC_WIDTH-1:0] acc_in;

wire signed [ACC_WIDTH-1:0] acc_out;

scalable_mac_unit #(

    .DATA_WIDTH(DATA_WIDTH),
    .ACC_WIDTH(ACC_WIDTH)

) uut (

    .clk(clk),
    .rst(rst),

    .a(a),
    .b(b),

    .acc_in(acc_in),

    .acc_out(acc_out)

);

always #5 clk = ~clk;

initial begin

    $dumpfile("waveforms/scalable_mac_unit.vcd");
    $dumpvars(0, scalable_mac_unit_tb);

    clk = 0;
    rst = 1;

    a = 0;
    b = 0;
    acc_in = 0;

    #10;
    rst = 0;

    // Test 1
    #10;
    a = 4;
    b = 5;
    acc_in = 10;

    // Test 2
    #10;
    a = -3;
    b = 6;
    acc_in = 20;

    // Test 3
    #10;
    a = 7;
    b = -2;
    acc_in = 15;

    #30;

    $finish;

end

endmodule