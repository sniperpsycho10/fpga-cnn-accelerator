`timescale 1ns/1ps

module register_file_tb;

reg clk;
reg rst;
reg write_en;
reg [2:0] write_addr;
reg [2:0] read_addr;
reg [7:0] write_data;
wire [7:0] read_data;

register_file uut(
    .clk(clk),
    .rst(rst),
    .write_en(write_en),
    .write_addr(write_addr),
    .read_addr(read_addr),
    .write_data(write_data),
    .read_data(read_data)

);

always #5 clk = ~clk;
initial begin
    $dumpfile("waveforms/register_file.vcd");
    $dumpvars(0, register_file_tb);

    clk = 0;
    rst = 1;

    write_en = 0;

    write_addr = 0;
    read_addr  = 0;

    write_data = 0;

    #10;
    rst = 0;

    #10;
    write_en = 1;
    write_addr = 3'b001;
    write_data = 25;

    #10;
    write_addr = 3'b010;
    write_data = 50;

    #10;
    write_en = 0;

    #10;
    read_addr = 3'b001;

    #10;
    read_addr = 3'b010;

    #20;
    $finish;
end
endmodule