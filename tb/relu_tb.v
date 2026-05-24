`timescale 1ns/1ps

module relu_tb;

reg clk;
reg rst;
reg signed [31:0] data_in;
wire signed [31:0] data_out;

relu uut(
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .data_out(data_out)
);

always #5 clk = ~clk;
initial begin
    $dumpfile("waveforms/relu.vcd");
    $dumpvars(0, relu_tb);
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
    data_in = 50;

    #30;
    $finish;
end
endmodule