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
; reverse array YASSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS
	ldr r0, =dst
	ldr r1, =dst
	ldr r2, len
	mov r12, #4
	mul r11, r2, r12
	add r1, r11
	mov r12, #2
	sdiv r2,  r12
loop
	sub r2, #1
	ldr r3, [r0]
	ldr r4, [r1, #-4]!
	mov r12, r3
	mov r3, r4
	mov r4, r12
	str r3, [r0], #4
	str r4, [r1]
	cmp r2, #0
	bgt loop
stop
	b stop
len dcd 10
src dcd 0x1,0x2,0x3,0x4,0x5,0x6,0x7,0x8,0x9,0xA
	area dat, data, readwrite
dst dcd 0
	end
