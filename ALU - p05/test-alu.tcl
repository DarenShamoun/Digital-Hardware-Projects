# create work directory and map work library to that directory
vlib work
vmap work

# compile files, with linting enabled to provide better warning messages
vlog -lint *.sv

# load testbench into simulator
vsim -voptargs=+acc work.testbench

# add all of the important signals to our waveform
add wave -position end -hex -label a /testbench/a
add wave -position end -hex -label b /testbench/b
add wave -position end -hex -label y /testbench/y
add wave -position end -hex -label f /testbench/f
add wave -position end -hex -label zero /testbench/zero
add wave -position end -hex -label carry /testbench/carry
add wave -position end -hex -label overflow /testbench/overflow

# run the testbench to completion
run -all
