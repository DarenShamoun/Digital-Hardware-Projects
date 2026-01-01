main:
		lui   x1, 0xABCDE		# x1 = 0xABCDE000
		addi  x2, x0, 0x7FF		# x2 = 0x000007FE
		add   x3, x2, x2		# x3 = 0x000007FF + 0x000007FF = 0x00000FFE
		addi  x3, x3, 1			# x3 = 0x000007FF + 1 = 0x00000FFF
		xori  x4, x3 -1			# x4 = 0x00000FFF ^ 0xFFFFFFFF = 0xFFFFF000
		and   x5, x1, x4		# x5 = 0xABCDE000 & 0xFFFFF000 = 0xABCDE000
		xor   x6, x5, x0		# x6 = 0xABCDE000 ^ 0 = 0xABCDE000
		bne   x1, x6, done		# shouldn't be taken
		beq   x1, x6, around	# should be taken
		addi  x5, x5, 1			# shouldn't happen
around:
		addi  x7, x0, 1			# x7 = 1
		bne   x7, x0, end		# should be taken
		addi  x5, x5, 1			# shouldn't happen
end:
		sw   x5, 42(x0)			# [42] = 0xABCDE000
done:
		beq   x0, x0, done		# infinite loop
