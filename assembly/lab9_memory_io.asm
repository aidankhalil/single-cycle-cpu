.data
 		usfbmp: 	.string 	"C:\\Users\\Sean\\Downloads\\rars\\usflogo.bmp"
				.align 	2
		header:	.space	0x36
				.align	2
		buffer:	.space	0x03
.text
		# your code here
		
		la a0, usfbmp
		li a1, 0
		li a7, 1024 #open file
		ecall
		add s0, x0, a0 #set s0 to file descriptor
		
		
		li a7, 63 #read file
		la a1, header
		li a2, 0x36
		ecall
		
		
		
		
		
		#s2 = 65536
		#s0 = fd
		#s1 = i
		#s4 = 0x1004FFFC
		#s5 = i * 4
		#s3 = s4 - s5
		li s2, 65536 #amount of iterations
		li s4, 0x1004FFFC #0x10010000 + 65535 = start address
		li s1, 0 #loop variable
	loop:
		li a7, 63 #read ecall
		la a1, buffer
		li a2, 3
		add a0, s0, x0
		ecall #read 3 bytes into buffer
		la a1, buffer
		lw t0, 0(a1)
		slli s5, s1, 2 #i * 4
		sub s3, s4, s5 #0x1004FFFC - i * 4
		sw t0, 0(s3)
		addi s1, s1, 1
		bne s1, s2, loop
		
		li a7, 57 #close file
		add a0, x0, s0 #set t0 to file descriptor
		ecall
		
		li a7, 10 #exit
		ecall
