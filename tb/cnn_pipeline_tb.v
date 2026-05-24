`timescale 1ns/1ps

module cnn_pipeline_tb;
reg clk;
reg rst;
reg [7:0] pixel_in;
wire signed [31:0] final_out;

cnn_pipeline uut(
    .clk(clk),
    .rst(rst),
    .pixel_in(pixel_in),
    .final_out(final_out)
);

always #5 clk = ~clk;
integer i;
initial begin
    $dumpfile("waveforms/cnn_pipeline.vcd");
    $dumpvars(0, cnn_pipeline_tb);

    clk = 0;
    rst = 1;

    pixel_in = 0;

    #10;
    rst = 0;

    for(i = 1; i <= 25; i = i + 1) begin
        #10;
        pixel_in = i;
    end
    #100;
    $finish;
end
endmodule