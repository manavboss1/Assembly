	area rst, data, readonly
	export __Vectors
__Vectors
	dcd 0x10001000
	dcd Reset_Handler
	align
	area prog, code, readonly
	export Reset_Handler
	entry
Reset_Handler
	; load data into sram cause sram is initially empty
	ldr r0, =src
	ldr r1, =dst
	ldr r2, len
loop_load
	sub r2, #1
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r2, #0
	bgt loop_load
main
	; main code
	ldr r0, =dst
	ldr r1, =dst+sh*sizeof_int
	ldr r2, len
	mov r11, #sizeof_int
	mul r3, r2, r11
	add r0, r3
	add r1, r3
loop
	sub r2, #1
	ldr r3, [r0, #-sizeof_int]!
	str r3, [r1, #-sizeof_int]!
	cmp r2, #0
	bgt loop
stop
	b stop
sh equ 3
sizeof_int equ 4
len dcd 5
src dcd 0x1,0x2,0x3,0x4,0x5
	area dat, DATA, readwrite
dst dcd 0x0
	end
	
