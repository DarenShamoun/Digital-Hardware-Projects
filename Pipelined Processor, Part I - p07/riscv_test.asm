main:
    addi x2, x0, 5
    addi x3, x0, 12
    addi zero, zero, 0
    addi zero, zero, 0
    addi x7, x3, -9
    addi zero, zero, 0
    addi zero, zero, 0
    or x4, x7, x2
    addi zero, zero, 0
    addi zero, zero, 0
    and x5, x3, x4
    addi zero, zero, 0
    addi zero, zero, 0
    add x5, x5, x4
    addi zero, zero, 0
    addi zero, zero, 0
    beq x5, x7, end      # shouldn't be taken
    addi zero, zero, 0
    addi zero, zero, 0
    slt x4, x3, x4
    addi zero, zero, 0
    addi zero, zero, 0
    beq x4, x0, around   # should be taken
    addi zero, zero, 0
    addi zero, zero, 0
    addi x5, x0, 0       # shouldn't execute
around:
    slt x4, x7, x2
    addi zero, zero, 0
    addi zero, zero, 0
    add x7, x4, x5
    addi zero, zero, 0
    addi zero, zero, 0
    sub x7, x7, x2
    addi zero, zero, 0
    addi zero, zero, 0
    sw x7, 84(x3)        # [96] = 7
    lw x2, 96(x0)
    addi zero, zero, 0
    addi zero, zero, 0
    add x9, x2, x5
    jal x3, end
    addi zero, zero, 0
    addi zero, zero, 0
    addi x2, x0, 1
    addi zero, zero, 0
    addi zero, zero, 0
end:
    add x2, x2, x9
    addi zero, zero, 0
    addi zero, zero, 0
    sw x2, 0x32(x3)      # [100] = 25
done:
    beq x2, x2, done     # infinite loop