module max_pool(
    input clk,
    input rst,
    input signed [31:0] a,
    input signed [31:0] b,
    input signed [31:0] c,
    input signed [31:0] d,
    output reg signed [31:0] max_out
);

reg signed [31:0] max1;
reg signed [31:0] max2;
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