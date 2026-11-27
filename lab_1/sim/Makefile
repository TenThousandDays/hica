SRC_PATH=../rtl

.PHONY: all synth sim wave clean

all: synth sim wave

# Create design & testbench
synth:
	mkdir -p work
	iverilog -g2012 -o work/tb_xps $(SRC_PATH)/xps.sv $(SRC_PATH)/p_box.sv $(SRC_PATH)/s_box.sv $(SRC_PATH)/xor4.sv tb_xps.sv

# Launch sim
sim:
	./work/tb_xps

# Open waveform
wave:
	gtkwave ./work/wave.vcd \
		--rcvar 'fontname_signals Monospace 20' \
        --rcvar 'fontname_waves Monospace 20' \
        --rcvar 'scale_to_time_dimension n'

# Delete all artifacts
clean:
	rm -rf work
