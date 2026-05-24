module streaming_max_pool(
    input clk,
    input rst,
    input valid_in,
    input signed [31:0] d0,
    input signed [31:0] d1,
    input signed [31:0] d2,
    input signed [31:0] d3,
    output reg valid_out,
    output reg signed [31:0] pool_out
);

reg signed [31:0] max1;
reg signed [31:0] max2;

always @(posedge clk) begin
    if(rst) begin
        pool_out <= 0;
        valid_out <= 0;
    end

    else begin
        if(valid_in) begin

            if(d0 > d1)
                max1 = d0;
            else
                max1 = d1;

            if(d2 > d3)
                max2 = d2;
            else
                max2 = d3;

            if(max1 > max2)
                pool_out <= max1;
            else
                pool_out <= max2;
            valid_out <= 1;
        end

        else begin
            valid_out <= 0;
        end
    end
end
endmodule