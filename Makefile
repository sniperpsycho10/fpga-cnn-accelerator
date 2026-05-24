SIM = iverilog

SRC = rtl/scalable_mac_unit.v
TB  = tb/scalable_mac_unit_tb.v

OUT = sim/scalable_mac_unit.out

all:
	$(SIM) -o $(OUT) $(SRC) $(TB)
	vvp $(OUT)

wave:
	gtkwave waveforms/scalable_mac_unit.vcd

clean:
	rm -f sim/*.out
	rm -f waveforms/*.vcd