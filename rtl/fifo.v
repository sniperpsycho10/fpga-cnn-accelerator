module fifo #(parameter DEPTH = 8)(
    input clk,
    input rst,
    input write_en,
    input read_en,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output full,
    output empty
);

reg [7:0] mem [0:DEPTH-1];
reg [2:0] write_ptr;
reg [2:0] read_ptr;
reg [3:0] count;
assign full  = (count == DEPTH);
assign empty = (count == 0);

always @(posedge clk) begin
    if(rst) begin
        write_ptr <= 0;
        read_ptr  <= 0;
        count     <= 0;
        data_out  <= 0;
    end

    else begin
        if(write_en && !full) begin
            mem[write_ptr] <= data_in;
            write_ptr <= write_ptr + 1;
            count <= count + 1;
        end
        if(read_en && !empty) begin
            data_out <= mem[read_ptr];
            read_ptr <= read_ptr + 1;
            count <= count - 1;
        end
    end
end
endmodule