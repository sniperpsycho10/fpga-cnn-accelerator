`timescale 1ns/1ps

module line_buffer_tb;
reg clk;
reg rst;
reg [7:0] pixel_in;
wire [7:0] row1_out;
wire [7:0] row2_out;
wire [7:0] row3_out;

line_buffer uut(
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
    $dumpfile("waveforms/line_buffer.vcd");
    $dumpvars(0, line_buffer_tb);

    clk = 0;
    rst = 1;
    pixel_in = 0;

    #10;
    rst = 0;

    for(i = 1; i <= 15; i = i + 1) begin
        #10;
        pixel_in = i;
    end
    #50;
    $finish;
end
endmodule