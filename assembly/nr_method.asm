.data
	threshold: .double 0.00001

.text
	
	#li t0, 4205		# load a value
	#fcvt.s.w fa0, t0
	#jal prntFloat		# print it to be sure the conersion worke
	#jal prntNewLine
	
	# complete 2a, 2b, and 2c
	li t0, 6587		# load a value
	fcvt.s.w fa0, t0
	jal prntFloat
	jal prntNewLine
	
	fsqrt.s fa0, fa0
	jal prntFloat
	jal prntNewLine
	fmul.s fa0, fa0, fa0
	jal prntFloat
	jal prntNewLine
	
	# complete 2d (repeating 2a, 2b, and 2c, except with double precision
	li t0, 6587		# load a value
	fcvt.d.w fa0, t0
	jal prntDouble
	jal prntNewLine
	
	fsqrt.d fa0, fa0
	jal prntDouble
	jal prntNewLine
	fmul.d fa0, fa0, fa0
	jal prntDouble
	jal prntNewLine
	
	# now test Newton-Raphson method

	#li t0, 9		# number n iterations
	li t1, 6587		# number X you want sqrt
	li t2, 2		# load constant 2
	li t3, 10		# load constant 10
	
	# perform conversions for t1, t2, t3, and store results in ft0, ft2, and ft4
	fcvt.d.w ft0, t1
	fcvt.d.w ft2, t2
	fcvt.d.w ft4, t3
	#add a0, t0, x0 #set a0 to iterations
	fcvt.d.w ft5, x0
	fadd.d fa0, ft0, ft5
	fadd.d fa1, ft2, ft5
	fadd.d fa2, ft4, ft5
	
	jal NewtonRoots		# get sqrt(N) in n iterations

	fmv.d fa0, fa0	# move the function result to fa0, and print the result
	jal prntNewLine
	jal prntDouble
	
	jal exit
		
		
#Netwton Roots original function with iterations as argument
#NewtonRoots:
#	
#	# set up the initial conditions by checking if the input is > 10
#	# follow the instructions for the initial guess in the assignment
#	li t0, 10
#	fcvt.d.w ft0, t0
#	flt.d t0, fa0, ft0#if fa0 < 10
#	beq t0, x0, false#if fa0 >= 10
#	fdiv.d ft0, fa0, fa1
#	add t0, a0, x0#i = iterations
#	j NewtonRootsLoop
#false:
#	fdiv.d ft0, fa0, fa2
#NewtonRootsLoop:
#	# perform the actual N-R method computation
#	fmul.d ft2, ft0, ft0#x^2
#	fsub.d ft2, ft2,  fa0#x^2 - n
#	li t5, 2
#	fcvt.d.w ft4, t5 
#	fmul.d ft3, ft0, ft4#2x
#	fdiv.d ft2, ft2, ft3#ft2 / 2x
#	fsub.d ft0, ft0, ft2#x = x - ft2
#	addi t0, t0, 1#i++
#	blt t0, a0, NewtonRootsLoop
#loop_end:
#	fmv.d fa0, ft0
#	jr ra		

NewtonRoots:
	
	# set up the initial conditions by checking if the input is > 10
	# follow the instructions for the initial guess in the assignment
	la t6, threshold
	fld ft7, 0(t6)
	li t0, 10
	fcvt.d.w ft0, t0
	flt.d t0, fa0, ft0#if fa0 < 10
	beq t0, x0, false#if fa0 >= 10
	fdiv.d ft0, fa0, fa1
	j NewtonRootsLoop
false:
	fdiv.d ft0, fa0, fa2
NewtonRootsLoop:
	# perform the actual N-R method computation
	fmv.d ft5, ft0#ft5 = old x
	fmul.d ft2, ft0, ft0#x^2
	fsub.d ft2, ft2, fa0#x^2 - n
	li t5, 2
	fcvt.d.w ft4, t5 
	fmul.d ft3, ft0, ft4#2x
	fdiv.d ft2, ft2, ft3#ft2 / 2x
	fsub.d ft0, ft0, ft2#x = x - ft2
	fsub.d ft6, ft5, ft0#ft6 = old - new
	fabs.d ft6, ft6
	flt.d t0, ft6, ft7#difference < 0.00001
	beq t0, x0, NewtonRootsLoop
loop_end:
	fmv.d fa0, ft0
	jr ra

# helper functions

# prints a float and newline, assuming float already moved to fa0
prntFloat:
	li a7, 2
	ecall
	li a0, '\n'
	li a7, 11
	ecall
	jr ra

# prints a double and newline, assuming double already moved to fa0
prntDouble:
	li a7, 3
	ecall
	li a0, '\n'
	li a7, 11
	ecall
	jr ra
	
prntNewLine:
	li a0, '\n'
	li a7, 11
	ecall
	jr ra

exit:
	li a7, 10
	ecall
