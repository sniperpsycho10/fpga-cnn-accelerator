`timescale 1ns/1ps

module cnn_pipeline_handshake_tb;

reg clk;
reg rst;
reg [7:0] pixel_in;
reg ready_in;
wire valid_out;
wire signed [31:0] final_out;

cnn_pipeline_handshake uut(
    .clk(clk),
    .rst(rst),
    .pixel_in(pixel_in),
    .ready_in(ready_in),
    .valid_out(valid_out),
    .final_out(final_out)
);

always #5 clk = ~clk;
integer i;
initial begin
    $dumpfile("waveforms/cnn_pipeline_handshake.vcd");
    $dumpvars(0, cnn_pipeline_handshake_tb);

    clk = 0;
    rst = 1;

    pixel_in = 0;

    ready_in = 1;

    #10;
    rst = 0;

    for(i = 1; i <= 25; i = i + 1) begin

        #10;
        pixel_in = i;

        if(i == 12)
            ready_in = 0;

        if(i == 16)
            ready_in = 1;
    end
    #100;
    $finish;
end
endmodule