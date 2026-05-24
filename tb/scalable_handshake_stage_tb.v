`timescale 1ns/1ps

module scalable_handshake_stage_tb;

parameter DATA_WIDTH = 32;

reg clk;
reg rst;
reg valid_in;
wire ready_out;
reg [DATA_WIDTH-1:0] data_in;
wire valid_out;
reg ready_in;
wire [DATA_WIDTH-1:0] data_out;

scalable_handshake_stage #(
    .DATA_WIDTH(DATA_WIDTH)
) uut (
    .clk(clk),
    .rst(rst),
    .valid_in(valid_in),
    .ready_out(ready_out),
    .data_in(data_in),
    .valid_out(valid_out),
    .ready_in(ready_in),
    .data_out(data_out)
);

always #5 clk = ~clk;
initial begin
    $dumpfile("waveforms/scalable_handshake_stage.vcd");
    $dumpvars(0, scalable_handshake_stage_tb);

    clk = 0;
    rst = 1;

    valid_in = 0;
    ready_in = 0;

    data_in = 0;

    #10;
    rst = 0;

    #10;
    valid_in = 1;
    ready_in = 1;
    data_in = 32'h00000064;

    #10;
    data_in = 32'h000000C8;

    #10;
    ready_in = 0;
    data_in = 32'h0000012C;

    #20;
    ready_in = 1;

    #30;
    $finish;
end
endmodule