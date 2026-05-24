SIM = iverilog

SRC = rtl/sliding_window.v \
       rtl/convolution_engine.v \
       rtl/relu.v \
       rtl/cnn_pipeline.v

TB = tb/cnn_pipeline_tb.v

OUT = sim/cnn_pipeline.out

all:
	$(SIM) -o $(OUT) $(SRC) $(TB)
	vvp $(OUT)

wave:
	gtkwave waveforms/cnn_pipeline.vcd

clean:
	rm -f sim/*.out
	rm -f waveforms/*.vcd