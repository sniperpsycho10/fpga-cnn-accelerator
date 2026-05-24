module scalable_fifo #(
    parameter DATA_WIDTH = 8,
    parameter DEPTH = 8,
    parameter ADDR_WIDTH = 3
)(
    input clk,
    input rst,
    input write_en,
    input read_en,
    input [DATA_WIDTH-1:0] data_in,
    output reg [DATA_WIDTH-1:0] data_out,
    output full,
    output empty
);

reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];
reg [ADDR_WIDTH:0] write_ptr;
reg [ADDR_WIDTH:0] read_ptr;
integer i;
assign empty = (write_ptr == read_ptr);
assign full =
(
    (write_ptr[ADDR_WIDTH] != read_ptr[ADDR_WIDTH]) &&
    (write_ptr[ADDR_WIDTH-1:0] == read_ptr[ADDR_WIDTH-1:0])
);

always @(posedge clk) begin
    if(rst) begin
        write_ptr <= 0;
        read_ptr <= 0;
        data_out <= 0;
        for(i = 0; i < DEPTH; i = i + 1)
            mem[i] <= 0;
    end

    else begin
        if(write_en && !full) begin
            mem[write_ptr[ADDR_WIDTH-1:0]] <= data_in;
            write_ptr <= write_ptr + 1;
        end

        if(read_en && !empty) begin
            data_out <= mem[read_ptr[ADDR_WIDTH-1:0]];
            read_ptr <= read_ptr + 1;
        end
    end
end
endmodule