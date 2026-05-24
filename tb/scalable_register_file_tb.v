`timescale 1ns/1ps

module scalable_register_file_tb;

parameter DATA_WIDTH = 8;
parameter DEPTH = 8;
parameter ADDR_WIDTH = 3;

reg clk;
reg rst;
reg write_en;
reg [ADDR_WIDTH-1:0] write_addr;
reg [ADDR_WIDTH-1:0] read_addr;
reg [DATA_WIDTH-1:0] data_in;
wire [DATA_WIDTH-1:0] data_out;

scalable_register_file #(
    .DATA_WIDTH(DATA_WIDTH),
    .DEPTH(DEPTH),
    .ADDR_WIDTH(ADDR_WIDTH)
) uut (
    .clk(clk),
    .rst(rst),
    .write_en(write_en),
    .write_addr(write_addr),
    .read_addr(read_addr),
    .data_in(data_in),
    .data_out(data_out)
);

always #5 clk = ~clk;
initial begin
    $dumpfile("waveforms/scalable_register_file.vcd");
    $dumpvars(0, scalable_register_file_tb);

    clk = 0;
    rst = 1;

    write_en = 0;

    write_addr = 0;
    read_addr = 0;

    data_in = 0;

    #10;
    rst = 0;

    #10;
    write_en = 1;

    write_addr = 0;
    data_in = 55;

    #10;
    write_addr = 1;
    data_in = 99;

    #10;
    write_addr = 2;
    data_in = 123;

    #10;
    write_en = 0;

    #10;
    read_addr = 0;

    #10;
    read_addr = 1;

    #10;
    read_addr = 2;

    #30;
    $finish;
end
endmodule