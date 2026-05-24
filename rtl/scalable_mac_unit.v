module scalable_mac_unit #(
    parameter DATA_WIDTH = 8,
    parameter ACC_WIDTH = 32
)(
    input clk,
    input rst,
    input signed [DATA_WIDTH-1:0] a,
    input signed [DATA_WIDTH-1:0] b,
    input signed [ACC_WIDTH-1:0] acc_in,
    output reg signed [ACC_WIDTH-1:0] acc_out
);

always @(posedge clk) begin
    if(rst)
        acc_out <= 0;

    else begin
        acc_out <= acc_in + (a * b);
    end
end
endmodule