module scalable_sliding_window #(
    parameter DATA_WIDTH = 8,
    parameter LINE_LENGTH = 8
)(
    input clk,
    input rst,
    input [DATA_WIDTH-1:0] pixel_in,
    output reg [DATA_WIDTH-1:0] w00,
    output reg [DATA_WIDTH-1:0] w01,
    output reg [DATA_WIDTH-1:0] w02,
    output reg [DATA_WIDTH-1:0] w10,
    output reg [DATA_WIDTH-1:0] w11,
    output reg [DATA_WIDTH-1:0] w12,
    output reg [DATA_WIDTH-1:0] w20,
    output reg [DATA_WIDTH-1:0] w21,
    output reg [DATA_WIDTH-1:0] w22
);
reg [DATA_WIDTH-1:0] line1 [0:LINE_LENGTH-1];
reg [DATA_WIDTH-1:0] line2 [0:LINE_LENGTH-1];

integer i;
always @(posedge clk) begin
    if(rst) begin
        for(i = 0; i < LINE_LENGTH; i = i + 1) begin
            line1[i] <= 0;
            line2[i] <= 0;
        end
        w00 <= 0; w01 <= 0; w02 <= 0;
        w10 <= 0; w11 <= 0; w12 <= 0;
        w20 <= 0; w21 <= 0; w22 <= 0;
    end

    else begin

        for(i = LINE_LENGTH-1; i > 0; i = i - 1)
            line1[i] <= line1[i-1];
        line1[0] <= pixel_in;

        for(i = LINE_LENGTH-1; i > 0; i = i - 1)
            line2[i] <= line2[i-1];
        line2[0] <= line1[LINE_LENGTH-1];
        w00 <= w01;
        w01 <= w02;
        w02 <= line2[LINE_LENGTH-1];
        w10 <= w11;
        w11 <= w12;
        w12 <= line1[LINE_LENGTH-1];
        w20 <= w21;
        w21 <= w22;
        w22 <= pixel_in;
    end
end
endmodule