module register_file(
    input clk,
    input rst,
    input write_en,
    input [2:0] write_addr,
    input [2:0] read_addr,
    input [7:0] write_data,
    output reg [7:0] read_data

);

reg [7:0] mem [0:7];
integer i;
always @(posedge clk) begin
    if(rst) begin
        for(i = 0; i < 8; i = i + 1)
            mem[i] <= 0;
        read_data <= 0;
    end

    else begin
        if(write_en)
            mem[write_addr] <= write_data;
        read_data <= mem[read_addr];
    end
end
endmodule