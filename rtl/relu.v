module relu(
    input clk,
    input rst,
    input signed [31:0] data_in,
    output reg signed [31:0] data_out
);

always @(posedge clk) begin
    if(rst)
        data_out <= 0;

    else begin
        if(data_in < 0)
            data_out <= 0;
        else
            data_out <= data_in;
    end
end
endmodule