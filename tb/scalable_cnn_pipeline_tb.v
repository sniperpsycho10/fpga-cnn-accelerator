`timescale 1ns/1ps

module scalable_cnn_pipeline_tb;

parameter DATA_WIDTH = 8;
parameter LINE_LENGTH = 8;

reg clk;
reg rst;

reg [DATA_WIDTH-1:0] pixel_in;

reg ready_in;

wire valid_out;

wire signed [31:0] final_out;

scalable_cnn_pipeline #(

    .DATA_WIDTH(DATA_WIDTH),
    .LINE_LENGTH(LINE_LENGTH)

) uut (

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

    $dumpfile("waveforms/scalable_cnn_pipeline.vcd");
    $dumpvars(0, scalable_cnn_pipeline_tb);

    clk = 0;
    rst = 1;

    pixel_in = 0;

    ready_in = 1;

    #10;
    rst = 0;

    for(i = 1; i <= 25; i = i + 1) begin

        #10;
        pixel_in = i;

        // Stall
        if(i == 12)
            ready_in = 0;

        // Resume
        if(i == 16)
            ready_in = 1;

    end

    #100;

    $finish;

end

endmodule