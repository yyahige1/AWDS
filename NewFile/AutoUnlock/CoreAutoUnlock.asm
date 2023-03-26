;coreautounlock.asm
;Auto-unlocks a bunch of features.

AutoUnlockFunction:
	stmfd	r13!,{r0-r4}
	;Hook Destroyer, only runs one
	ldr	r0,=Custom_LoadFile_End
	ldr	r1,=Custom_LoadFile
	ldr	r2,[r0]
	str	r2,[r1]
	ldr	r2,[r0,0x4]
	str	r2,[r1,0x4]
	
	;Normal Code
	ldr	r0,=0x022A7F50
	ldrb	r1,[r0]
	orr	r1,0x85		;Force Ranks Unlocked
	strb	r1,[r0]
	ldr	r1,=0x0FFFFFFF	;COs Unlocked
	str	r1,[r0,0x2C]
	ldr	r0,=0x02290750
	mov	r3,0x1
	ldr	r4,=0x2710
AutoUnlockFunctionExperienceLoop:
	mov	r2,0x1C		;Ranks up CO to 10
	mul	r2,r2,r3
	ldr	r1,[r0,r2]
	mov	r1,r1,lsl 0xD
	mov	r1,r1,asr 0xD
	cmp	r1,r4
	ldrlt	r1,[r0,r2]
	movlt	r1,r1,asr 0x13
	movlt	r1,r1,lsl 0x13
	addlt	r1,r1,r4
	strlt	r1,[r0,r2]
	add	r3,1
	cmp	r3,0x1B
	blt	AutoUnlockFunctionExperienceLoop	
	
	
	ldmfd	r13!,{r0-r4}
	ldmfd	r13!,{r4,r14}
	bx	r14
	.pool
