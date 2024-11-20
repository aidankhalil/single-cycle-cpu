.data



.text
	li s0, 0x10010000
	
	li t0, 0x00FFFFFF
	sw t0, 0(s0)
	
	li t0, 0x00FF0000
	sw t0, 4(s0)
	
	li t0, 0x0000FF00
	sw t0, 8(s0)
	
	li t0, 0x000000FF
	sw t0, 12(s0)