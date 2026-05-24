module scalable_handshake_stage #(
    parameter DATA_WIDTH = 32
)(
    input clk,
    input rst,
    input valid_in,
    output ready_out,
    input [DATA_WIDTH-1:0] data_in,
    output reg valid_out,
    input ready_in,
    output reg [DATA_WIDTH-1:0] data_out
);

assign ready_out = !valid_out || ready_in;

always @(posedge clk) begin
    if(rst) begin
        valid_out <= 0;
        data_out <= 0;
    end

    else begin
        if(ready_out) begin
            valid_out <= valid_in;

            if(valid_in)
                data_out <= data_in;
        end
    end
end
endmodule