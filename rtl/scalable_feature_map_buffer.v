module scalable_feature_map_buffer #(
    parameter DATA_WIDTH = 32,
    parameter DEPTH = 16,
    parameter ADDR_WIDTH = 4
)(
    input clk,
    input rst,
    input write_en,
    input read_en,
    input signed [DATA_WIDTH-1:0] data_in,
    output reg signed [DATA_WIDTH-1:0] data_out
);

reg signed [DATA_WIDTH-1:0] mem [0:DEPTH-1];
reg [ADDR_WIDTH-1:0] write_ptr;
reg [ADDR_WIDTH-1:0] read_ptr;

integer i;
always @(posedge clk) begin

    if(rst) begin
        write_ptr <= 0;
        read_ptr <= 0;
        data_out <= 0;
        for(i = 0; i < DEPTH; i = i + 1)
            mem[i] <= 0;
    end

    else begin

        if(write_en) begin
            mem[write_ptr] <= data_in;
            write_ptr <= write_ptr + 1;
        end

        if(read_en) begin

            data_out <= mem[read_ptr];
            read_ptr <= read_ptr + 1;
        end
    end
end
endmodule