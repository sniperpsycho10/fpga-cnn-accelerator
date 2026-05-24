module scalable_relu #(
    parameter DATA_WIDTH = 32
)(
    input clk,
    input rst,
    input signed [DATA_WIDTH-1:0] data_in,
    output reg signed [DATA_WIDTH-1:0] data_out
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