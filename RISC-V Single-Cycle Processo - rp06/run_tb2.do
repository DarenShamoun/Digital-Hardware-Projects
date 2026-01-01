vlib work
vmap work

vlog -lint *.sv
vsim -voptargs=+acc work.testbench2

add wave -radix hex /testbench2/clk
add wave -radix hex /testbench2/reset
add wave -radix hex /testbench2/dut/pc
add wave -radix hex /testbench2/dut/instr
add wave -radix hex /testbench2/dut/core/alu_out
add wave -radix hex /testbench2/dut/dmem_write_data
add wave -radix hex /testbench2/dut/dmem_write
add wave -radix hex /testbench2/dut/dmem_read_data

run 300
