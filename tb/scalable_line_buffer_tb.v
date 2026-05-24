`timescale 1ns/1ps

module scalable_line_buffer_tb;

parameter DATA_WIDTH = 8;
parameter LINE_LENGTH = 8;

reg clk;
reg rst;
reg [DATA_WIDTH-1:0] pixel_in;
wire [DATA_WIDTH-1:0] row1_out;
wire [DATA_WIDTH-1:0] row2_out;
wire [DATA_WIDTH-1:0] row3_out;

scalable_line_buffer #(
    .DATA_WIDTH(DATA_WIDTH),
    .LINE_LENGTH(LINE_LENGTH)
) uut (
    .clk(clk),
    .rst(rst),
    .pixel_in(pixel_in),
    .row1_out(row1_out),
    .row2_out(row2_out),
    .row3_out(row3_out)
);

always #5 clk = ~clk;
integer i;
initial begin
    $dumpfile("waveforms/scalable_line_buffer.vcd");
    $dumpvars(0, scalable_line_buffer_tb);

    clk = 0;
    rst = 1;

    pixel_in = 0;

    #10;
    rst = 0;

    for(i = 1; i <= 20; i = i + 1) begin
        #10;
        pixel_in = i;
    end
    #50;
    $finish;
end
endmodule