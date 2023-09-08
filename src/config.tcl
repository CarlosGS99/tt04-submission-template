# User config
set ::env(DESIGN_NAME) multi_4bits

# Change if needed
set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]
set ::env(BASE_SDC_FILE) "./designs/multi_4bits/src/multi_4bits.sdc"
# Fill this
set ::env(CLOCK_PERIOD) "10"
set ::env(CLOCK_PORT) "io_clk"

set ::env(CLOCK_NET) "io_clk"
set ::env(SYNTH_MAX_FANOUT) "12"
set ::env(PL_RANDOM_INITIAL_PLACEMENT) "1"
set ::env(FP_CORE_UTIL) "75"
set ::env(FP_SIZING) "absolute"
set ::env(DIE_AREA) "0 0 80 100"
set ::env(PL_TARGET_DENSYTY) "0.5"
set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}

