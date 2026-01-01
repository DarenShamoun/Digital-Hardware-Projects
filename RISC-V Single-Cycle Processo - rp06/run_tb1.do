vlib work
vmap work

vlog -lint *.sv
vsim -voptargs=+acc work.testbench1

add wave -radix hex /testbench1/clk
add wave -radix hex /testbench1/reset
add wave -radix hex /testbench1/dut/pc
add wave -radix hex /testbench1/dut/instr
add wave -radix hex /testbench1/dut/core/alu_out
add wave -radix hex /testbench1/dut/dmem_write_data
add wave -radix hex /testbench1/dut/dmem_write
add wave -radix hex /testbench1/dut/dmem_read_data

run 300
