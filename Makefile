SIM = iverilog

SRC = rtl/convolution_engine.v
TB  = tb/convolution_engine_tb.v

OUT = sim/convolution_engine.out

all:
	$(SIM) -o $(OUT) $(SRC) $(TB)
	vvp $(OUT)

wave:
	gtkwave waveforms/convolution_engine.vcd

clean:
	rm -f sim/*.out
	rm -f waveforms/*.vcd