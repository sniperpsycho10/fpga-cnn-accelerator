module mac_unit(
    input clk,
    input rst,
    input [7:0] a,
    input [7:0] b,
    input [15:0] acc_in,
    output reg [15:0] acc_out
);

always @(posedge clk) begin
    if(rst)
        acc_out <= 0;
    else
        acc_out <= acc_in + (a * b);
end

endmodule