SIM = iverilog

SRC = rtl/line_buffer.v
TB  = tb/line_buffer_tb.v

OUT = sim/line_buffer.out

all:
	$(SIM) -o $(OUT) $(SRC) $(TB)
	vvp $(OUT)

wave:
	gtkwave waveforms/line_buffer.vcd

clean:
	rm -f sim/*.out
	rm -f waveforms/*.vcd