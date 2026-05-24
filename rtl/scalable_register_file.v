module scalable_register_file #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 8,
    parameter ADDR_WIDTH = 3
)(
    input clk,
    input rst,
    input write_en,
    input [ADDR_WIDTH-1:0] write_addr,
    input [ADDR_WIDTH-1:0] read_addr,
    input [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out
);
reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];
integer i;

always @(posedge clk) begin
    if(rst) begin
        data_out <= 0;
        for(i = 0; i < DEPTH; i = i + 1)
            mem[i] <= 0;
    end

    else begin
        if(write_en)
            mem[write_addr] <= data_in;

        data_out <= mem[read_addr];
    end
end
endmodule