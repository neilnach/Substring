@ARM assembly substring program
.section   .data
output:    .space 100 


.section   .text
.global    sub_string

sub_string:
	sub r1, r1, $1		@subtract 1 from the start index
	add r0, r0, r1		@add input string to start index, skipping beggining
	ldr r3, =output 	@loading output into r3
	mov r5, lr		@links back to main
	
	loop:
		
		ldrb r4, [r0], $1	@load the byte into register 4
		strb r4, [r3]		@store into register 3
		add r1, r1, $1		@increment the start counter
		add r3, r3, $1		@increment the register
		cmp r1, r2		@compares start and end indexes
		bne loop		@branch back up to the loop if not equal
		
	
	ldr r0, =output			@load my string
	mov lr, r5			@move link register back
	bx lr 				@branches back to main method

		
	
	 	



