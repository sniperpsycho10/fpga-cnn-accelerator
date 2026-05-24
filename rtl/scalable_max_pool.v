module scalable_max_pool #(
    parameter DATA_WIDTH = 32
)(
    input clk,
    input rst,
    input signed [DATA_WIDTH-1:0] a,
    input signed [DATA_WIDTH-1:0] b,
    input signed [DATA_WIDTH-1:0] c,
    input signed [DATA_WIDTH-1:0] d,
    output reg signed [DATA_WIDTH-1:0] max_out
);

reg signed [DATA_WIDTH-1:0] max1;
reg signed [DATA_WIDTH-1:0] max2;

always @(posedge clk) begin
    if(rst)
        max_out <= 0;

    else begin
        if(a > b)
            max1 = a;
        else
            max1 = b;

        if(c > d)
            max2 = c;
        else
            max2 = d;

        if(max1 > max2)
            max_out <= max1;
        else
            max_out <= max2;
    end
end
endmodule