module line_buffer(
    input clk,
    input rst,
    input [7:0] pixel_in,
    output reg [7:0] row1_out,
    output reg [7:0] row2_out,
    output reg [7:0] row3_out
);
reg [7:0] line1 [0:4];
reg [7:0] line2 [0:4];
integer i;
always @(posedge clk) begin
    if(rst) begin
        for(i = 0; i < 5; i = i + 1) begin
            line1[i] <= 0;
            line2[i] <= 0;
        end
        row1_out <= 0;
        row2_out <= 0;
        row3_out <= 0;
    end

    else begin
        line1[4] <= line1[3];
        line1[3] <= line1[2];
        line1[2] <= line1[1];
        line1[1] <= line1[0];
        line1[0] <= pixel_in;

        line2[4] <= line2[3];
        line2[3] <= line2[2];
        line2[2] <= line2[1];
        line2[1] <= line2[0];
        line2[0] <= line1[4];

        row1_out <= pixel_in;
        row2_out <= line1[4];
        row3_out <= line2[4];
    end
end
endmodule