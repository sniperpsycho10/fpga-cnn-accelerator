module scalable_convolution_engine #(
    parameter DATA_WIDTH = 8,
    parameter KERNEL_SIZE = 3
)(
    input clk,
    input rst,
    input signed [DATA_WIDTH-1:0] w00,
    input signed [DATA_WIDTH-1:0] w01,
    input signed [DATA_WIDTH-1:0] w02,
    input signed [DATA_WIDTH-1:0] w10,
    input signed [DATA_WIDTH-1:0] w11,
    input signed [DATA_WIDTH-1:0] w12,
    input signed [DATA_WIDTH-1:0] w20,
    input signed [DATA_WIDTH-1:0] w21,
    input signed [DATA_WIDTH-1:0] w22,
    output reg signed [31:0] conv_out
);
parameter signed k00 = 1;
parameter signed k01 = 0;
parameter signed k02 = 1;
parameter signed k10 = 0;
parameter signed k11 = 1;
parameter signed k12 = 0;
parameter signed k20 = 1;
parameter signed k21 = 0;
parameter signed k22 = 1;

always @(posedge clk) begin
    if(rst)
        conv_out <= 0;

    else begin
        conv_out <=
            (w00 * k00) +
            (w01 * k01) +
            (w02 * k02) +
            (w10 * k10) +
            (w11 * k11) +
            (w12 * k12) +
            (w20 * k20) +
            (w21 * k21) +
            (w22 * k22);
    end
end
endmodule