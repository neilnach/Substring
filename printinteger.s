@ARM Assembly program to print hexadecimal

.section    .text
	ones: .word 0xFFFFFFFF
.global	    printx
.global	    printd
printx:
	push {lr}
	mov r2, $0		@initialize r2 to 0
	

loop:
	and r1, r0, $0xF	@convert number to hexadecimal and store in r1
	push {r1}		@push r1 onto the stack
	lsr r0, r0, $4		@shift r0 four bits
	cmp r0, $0		@cmp r0 to value 0 
	add r2, r2, $1		@increment the counter
	bne loop		@leave the loop if it does equal 0		
	
next:
	pop {r0}		@pop value
	cmp r0, $10		@compare the counter to 0
	blt less 		@if its less than
	bgt greater		@if its greater than
	beq greater		@if its equal too

less:
	add r0, r0, $48		@add 48
	b loop2

greater:
	add r0, r0, $55		@add 55 to r0

loop2:
	push {r2}
	bl putchar
	pop {r2}		@print character
	sub r2, r2, $1		@subtract one from r2
	cmp r2, $0		@compare r2 to 0
	bne next		@leave the loop if the value is equal to  	
	
	pop {lr}
	bx lr

printd:
	push {lr}		@branch to negative
	cmp r0, $0
	blt negative
p1:
	mov r3, $0		@if its positive
	mov r6, $10
	b loop3
negative:
	push {r0}		@push onto stack
	mov r0, $45		@offset of 45
	bl putchar
	pop {r0}		
	ldr r1, ones		@load ones
	sub r0, r0, $1			
	eor r0, r0, r1		@xor
	b p1			@branch back
loop3:
	mov r1, r0
	push {r1}
	bl u_divide_by_10
	pop {r1}
	push {r0}
	mul r0, r0, r6
	sub r2, r1, r0
	pop {r0}
	push {r2}
	add r3, r3, $1		@add remainder to value
	cmp r0, $0		@check counter
	bne loop3
loop4:
	pop {r0}
	add r0, r0, $48		@offset of 48
	push {r3}
	bl putchar
	pop {r3}
	sub r3, r3, $1		
	cmp r3, $0
	bne loop4
	pop {lr}
	bx lr

u_divide_by_10:
	ldr r1, .lu_magic_number_10	@divide by 10 every time
	umull r1, r2, r1, r0
	mov r0, r2, LSR #3
	bx lr
	.align 4
	.lu_magic_number_10: .word 0xcccccccd
