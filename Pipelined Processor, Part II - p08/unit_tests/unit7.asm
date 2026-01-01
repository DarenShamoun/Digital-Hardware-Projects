addi x1, x0, 25     # R[1] = 25
sw   x1, 96(x0)     # Mem[96] = 25
lw   x1, 96(x0)     # R[1] = Mem[96] = 25
sw   x1, 100(x0)    # Mem[100] = R[1] = 25

nop
nop
nop
nop
nop