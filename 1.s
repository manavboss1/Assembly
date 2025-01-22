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
	ldr r0, =V1
	ldr r1, =V2
	ldr r2, len
loop
	sub r2, #1
	ldr r3, [r0], #4
	str r3, [r1], #4
	cmp r2, #0
	bgt loop
stop
	b stop
len dcd 5
V1 dcd 0x1,0x2,0x3,0x4,0x5
	area dat, data, readwrite
V2 dcd 0x0
	end
