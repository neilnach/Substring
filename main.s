@ARM assembly main for substring 
.section  .data
prompt1: 	.asciz "Enter a string: "
prompt2:	.asciz "Enter the start index: "
prompt3:	.asciz "Enter the end index: "
output1: 	.asciz "The substring of the given string is '%s'\n" 
format:		.asciz "%s"
formatInt:	.asciz "%d"
string:		.space 100
int1: 		.space 100
int2: 		.space 100
.section .text
.global	  main
main: 
	ldr r0, =prompt1	@load prompt1 into first argument
	bl printf		@printf(prompt1)

	ldr r0, =format		@load format into r0	
	ldr r1, =string		@scan for the first string
	bl scanf

	ldr r0, =prompt2 	@load prompt2 into the first argument
	bl printf 		@printf(prompt2)

	ldr r0, =formatInt 	@load formatInt into r0
	ldr r1, =int1		@load int1 into r1
	bl scanf		@scan for start index

	ldr r0, =prompt3        @load prompt3 into the first argument
        bl printf               @printf(prompt3)

        ldr r0, =formatInt	@load formatInt into r0
        ldr r1, =int2		@load int2 into r1
        bl scanf                @scan for end index

	ldr r0, =string		@load r0 with the in_string
	ldr r1, =int1 		@load r1 with start_index
	ldr r1, [r1] 		@dereferencing
	ldr r2, =int2		@load r2 with end_index
	ldr r2, [r2] 		@dereferencing
	
	bl sub_string		@call substring in C
	mov r1, r0		@moving output of substring to register one
	ldr r0, =output1	@load register one with output1
	bl printf		@print output

	mov r0, $0
	mov r7, $1      @exit syscall
   	svc $0          @wake kernel
   	.end

	
