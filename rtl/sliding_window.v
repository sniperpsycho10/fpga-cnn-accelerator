module sliding_window(
    input clk,
    input rst,
    input [7:0] pixel_in,
    output reg [7:0] w00,
    output reg [7:0] w01,
    output reg [7:0] w02,
    output reg [7:0] w10,
    output reg [7:0] w11,
    output reg [7:0] w12,
    output reg [7:0] w20,
    output reg [7:0] w21,
    output reg [7:0] w22
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
        w00 <= 0; w01 <= 0; w02 <= 0;
        w10 <= 0; w11 <= 0; w12 <= 0;
        w20 <= 0; w21 <= 0; w22 <= 0;
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

        w00 <= w01;
        w01 <= w02;
        w02 <= line2[4];

        w10 <= w11;
        w11 <= w12;
        w12 <= line1[4];

        w20 <= w21;
        w21 <= w22;
        w22 <= pixel_in;
    end
end
endmodule