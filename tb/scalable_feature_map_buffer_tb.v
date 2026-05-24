`timescale 1ns/1ps

module scalable_feature_map_buffer_tb;
parameter DATA_WIDTH = 32;
parameter DEPTH = 16;
parameter ADDR_WIDTH = 4;

reg clk;
reg rst;
reg write_en;
reg read_en;
reg signed [DATA_WIDTH-1:0] data_in;
wire signed [DATA_WIDTH-1:0] data_out;

scalable_feature_map_buffer #(
    .DATA_WIDTH(DATA_WIDTH),
    .DEPTH(DEPTH),
    .ADDR_WIDTH(ADDR_WIDTH)
) uut (
    .clk(clk),
    .rst(rst),
    .write_en(write_en),
    .read_en(read_en),
    .data_in(data_in),
    .data_out(data_out)
);

always #5 clk = ~clk;
initial begin
    $dumpfile("waveforms/scalable_feature_map_buffer.vcd");
    $dumpvars(0, scalable_feature_map_buffer_tb);

    clk = 0;
    rst = 1;

    write_en = 0;
    read_en = 0;

    data_in = 0;

    #10;
    rst = 0;

    #10;
    write_en = 1;
    data_in = 111;

    #10;
    data_in = 222;

    #10;
    data_in = 333;

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