`timescale 1ns/1ps

module scalable_fifo_tb;

parameter DATA_WIDTH = 8;
parameter DEPTH = 8;
parameter ADDR_WIDTH = 3;

reg clk;
reg rst;
reg write_en;
reg read_en;
reg [DATA_WIDTH-1:0] data_in;
wire [DATA_WIDTH-1:0] data_out;
wire full;
wire empty;

scalable_fifo #(
    .DATA_WIDTH(DATA_WIDTH),
    .DEPTH(DEPTH),
    .ADDR_WIDTH(ADDR_WIDTH)
) uut (
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
    $dumpfile("waveforms/scalable_fifo.vcd");
    $dumpvars(0, scalable_fifo_tb);
    clk = 0;
    rst = 1;

    write_en = 0;
    read_en = 0;

    data_in = 0;

    #10;
    rst = 0;

    #10;
    write_en = 1;
    data_in = 11;

    #10;
    data_in = 22;

    #10;
    data_in = 33;

    #10;
    write_en = 0;

    #10;
    read_en = 1;

    #30;
    read_en = 0;

    #30;
    $finish;
end
endmodule