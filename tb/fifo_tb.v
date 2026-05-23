`timescale 1ns/1ps

module fifo_tb;

reg clk;
reg rst;
reg write_en;
reg read_en;
reg [7:0] data_in;
wire [7:0] data_out;
wire full;
wire empty;

fifo uut(
    .clk(clk),
    .rst(rst),
    .write_en(write_en),
    .read_en(read_en),
    .data_in(data_in),
    .data_out(data_out),
    .full(full),
    .empty(empty)
);

always #5 clk = ~clk;
initial begin
    $dumpfile("waveforms/fifo.vcd");
    $dumpvars(0, fifo_tb);

    clk = 0;
    rst = 1;

    write_en = 0;
    read_en  = 0;
    data_in  = 0;
    #10;
    rst = 0;

    #10;
    write_en = 1;
    data_in = 10;

    #10;
    data_in = 20;

    #10;
    data_in = 30;

    #10;
    write_en = 0;

    #10;
    read_en = 1;

    #10;

    #10;

    #10;
    read_en = 0;

    #20;
    $finish;
end
endmodule