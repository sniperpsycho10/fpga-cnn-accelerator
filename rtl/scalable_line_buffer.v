module scalable_line_buffer #(
    parameter DATA_WIDTH = 8,
    parameter LINE_LENGTH = 8
)(
    input clk,
    input rst,
    input [DATA_WIDTH-1:0] pixel_in,
    output reg [DATA_WIDTH-1:0] row1_out,
    output reg [DATA_WIDTH-1:0] row2_out,
    output reg [DATA_WIDTH-1:0] row3_out
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
        row1_out <= 0;
        row2_out <= 0;
        row3_out <= 0;
    end

    else begin
        for(i = LINE_LENGTH-1; i > 0; i = i - 1)
            line1[i] <= line1[i-1];

        line1[0] <= pixel_in;

        for(i = LINE_LENGTH-1; i > 0; i = i - 1)
            line2[i] <= line2[i-1];

        line2[0] <= line1[LINE_LENGTH-1];

        row1_out <= pixel_in;
        row2_out <= line1[LINE_LENGTH-1];
        row3_out <= line2[LINE_LENGTH-1];
    end
end
endmodule